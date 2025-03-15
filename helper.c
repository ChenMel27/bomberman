#include "gba.h"
#include "mode0.h"
#include "bg.h"
#include "tileset.h"
#include "sprite.h"
#include "gameOne.h"
#include "collisionMap.h"
#include "collisionMap2.h"
#include "sprites.h"
#include "bg2.h"

#define COLLISION_MAP_WIDTH  512
#define COLLISION_MAP_HEIGHT 256
#define TILE_SIZE   8
#define MAP_WIDTH   32
#define MAP_HEIGHT  32
#define SPRITE_WIDTH  8
#define SPRITE_HEIGHT 8

extern SPRITE enemy1;
extern SPRITE enemy2;
extern SPRITE enemy3;
extern SPRITE enemy4;
extern SPRITE player;
extern int round;

// COLLISION MAP HELPERS
// Returns the index of the color at (x, y) for the first level collision map.
inline unsigned char colorAt(int x, int y) {
    return ((unsigned char *)collisionMapBitmap)[OFFSET(x, y, COLLISION_MAP_WIDTH)];
}

// Returns the index of the color at (x, y) for the sencond level collision map.
inline unsigned char colorAt2(int x, int y) {
    return ((unsigned char *)collisionMap2Bitmap)[OFFSET(x, y, COLLISION_MAP_WIDTH)];
}

// Returns 0 if the pixel at (x, y) is NOT passable / is a hard block.
int isPassablePixel(int x, int y, int game) {
    // Use colorAt
    if (game == 1) {
        if(x < 0 || x >= COLLISION_MAP_WIDTH || y < 0 || y >= COLLISION_MAP_HEIGHT) return 0;
        return (colorAt(x, y) != 0 && colorAt(x, y) != 1);
    // Use colorAt2
    } else if (game == 2) {
        if(x < 0 || x >= COLLISION_MAP_WIDTH || y < 0 || y >= COLLISION_MAP_HEIGHT) return 0;
        return (colorAt2(x, y) != 0 && colorAt2(x, y) != 1);
    }
}

// HARDED CODED TILE COLLISION FOR BOMB LOGIC

// Get the tile index from tile map based on world coord.
unsigned short getTileAtWorld(int worldX, int worldY) {
    // Conversion to tile coord.
    int tileX = worldX / TILE_SIZE;
    int tileY = worldY / TILE_SIZE;

    // Invalid / out of bound check
    if (tileX < 0 || tileX >= MAP_WIDTH || tileY < 0 || tileY >= MAP_HEIGHT) {
        return 0xFFFF;
    }

    int tileIndex = tileY * MAP_WIDTH + tileX;

    // Based on game level return associated tile
    if (round == 1) {
        return bgMap[tileIndex];
    } else if (round == 2) {  
        return bg2Map[tileIndex];
    }
}

// Hard coded functions that check collisions based on tile indexes in the tileset
int checkCollisionWorld(int worldX, int worldY) {
    return (getTileAtWorld(worldX, worldY) == 0x0001) ||
           (getTileAtWorld(worldX + SPRITE_WIDTH - 1, worldY) == 0x0001) ||
           (getTileAtWorld(worldX, worldY + SPRITE_HEIGHT - 1) == 0x0001) ||
           (getTileAtWorld(worldX + SPRITE_WIDTH - 1, worldY + SPRITE_HEIGHT - 1) == 0x0001);
}

int checkCollisionDestructableWall(int worldX, int worldY) {
    return (getTileAtWorld(worldX, worldY) == 0x0003) ||
           (getTileAtWorld(worldX + SPRITE_WIDTH - 1, worldY) == 0x0003) ||
           (getTileAtWorld(worldX, worldY + SPRITE_HEIGHT - 1) == 0x0003) ||
           (getTileAtWorld(worldX + SPRITE_WIDTH - 1, worldY + SPRITE_HEIGHT - 1) == 0x0003);
}

int checkCollisionSoftBlock(int worldX, int worldY) {
    return (getTileAtWorld(worldX, worldY) == 0x0004) ||
           (getTileAtWorld(worldX + SPRITE_WIDTH - 1, worldY) == 0x0004) ||
           (getTileAtWorld(worldX, worldY + SPRITE_HEIGHT - 1) == 0x0004) ||
           (getTileAtWorld(worldX + SPRITE_WIDTH - 1, worldY + SPRITE_HEIGHT - 1) == 0x0004);
}

// This tile is the winning tile, if they break the destructable block
// that guards these AND all the enemies are inactive, then they hit this block,
// they win that level
int checkCollisionWin(int worldX, int worldY) {
    // Only allow winning if the enemies are inactive
    int enemiesGone = (enemy1.active == 0 && enemy2.active == 0
        && enemy3.active == 0 && enemy4.active == 0) ? 1 : 0;
    // AND they hit the unique exit block
    return enemiesGone & ((getTileAtWorld(worldX, worldY) == 0x0002) ||
           (getTileAtWorld(worldX + SPRITE_WIDTH - 1, worldY) == 0x0002) ||
           (getTileAtWorld(worldX, worldY + SPRITE_HEIGHT - 1) == 0x0002) ||
           (getTileAtWorld(worldX + SPRITE_WIDTH - 1, worldY + SPRITE_HEIGHT - 1) == 0x0002));
}

// Removes the destructable blocks for both the collision map AND hides from drawing in the background map
void destroySoftBlockAt(int worldX, int worldY) {
    int tileX = worldX / TILE_SIZE;
    int tileY = worldY / TILE_SIZE;

    // Bounds
    if (tileX < 0 || tileX >= MAP_WIDTH || tileY < 0 || tileY >= MAP_HEIGHT) {
        return;
    }
    int tileIndex = tileY * MAP_WIDTH + tileX;

    // Set the destructable block to the transparent color (0,0)
    if (round == 1) {
        if (bgMap[tileIndex] == 0x0003) {
            bgMap[tileIndex] = 0x0000;
            // DMA it into the map
            DMANow(3, bgMap, &SCREENBLOCK[20], bgLen / 2);
            int startX = tileX * TILE_SIZE;
            int startY = tileY * TILE_SIZE;
            // Change this in the collision map as well to allow for player movement
            for (int y = 0; y < TILE_SIZE; y++) {
                for (int x = 0; x < TILE_SIZE; x++) {
                    int pixelX = startX + x;
                    int pixelY = startY + y;
                    ((unsigned char *)collisionMapBitmap)[OFFSET(pixelX, pixelY, COLLISION_MAP_WIDTH)] = 3;
                }
            }
        }
    // Do the same using game 2 maps
    } else {
        if (bg2Map[tileIndex] == 0x0003) {
            bg2Map[tileIndex] = 0x0000;
            DMANow(3, bg2Map, &SCREENBLOCK[20], bg2Len / 2);
            int startX = tileX * TILE_SIZE;
            int startY = tileY * TILE_SIZE;
            for (int y = 0; y < TILE_SIZE; y++) {
                for (int x = 0; x < TILE_SIZE; x++) {
                    int pixelX = startX + x;
                    int pixelY = startY + y;
                    ((unsigned char *)collisionMap2Bitmap)[OFFSET(pixelX, pixelY, COLLISION_MAP_WIDTH)] = 3;
                }
            }
        }
    }
}

void drawText(int tileX, int tileY, char *text) {
    // Create tilemap index using the x,y coordinates that I want
    int index = tileY * 32 + tileX;

    while (*text) {
        char c = *text;
        int tileIndex = 0;

        // The font's numbers 0 to 9
        if (c >= '0' && c <= '9') {
            tileIndex = c - '0' + 15;  
        }
        // All the upper case A to Z
        else if (c >= 'A' && c <= 'Z') {
            tileIndex = c - 'A' + 32;
        }
        // Finally the lower case a to z
        else if (c >= 'a' && c <= 'z') {
            tileIndex = c - 'a' + 58;
        }
        // Also, this for the score
        else if (c == ':') {
            tileIndex = 25; 
        }

        // Use the 0th pallette to access the font using bit shift of 12 to align
        SCREENBLOCK[28].tilemap[index] = tileIndex | (1 << 12);  // Palette Bank 0
        text++;
        index++;
    }
}

void drawNumber(int tileX, int tileY, int num) {
    char buffer[10];  
    // Num -> str
    sprintf(buffer, "%d", num);
    drawText(tileX, tileY, buffer);
}

int checkPlayerEnemyCollision() {
    if (enemy1.active && collision(player.x, player.y, player.width, player.height, enemy1.x, enemy1.y, enemy1.width, enemy1.height)) return 1;
    if (enemy2.active && collision(player.x, player.y, player.width, player.height, enemy2.x, enemy2.y, enemy2.width, enemy2.height)) return 1;
    if (enemy3.active && collision(player.x, player.y, player.width, player.height, enemy3.x, enemy3.y, enemy3.width, enemy3.height)) return 1;
    if (enemy4.active && collision(player.x, player.y, player.width, player.height, enemy4.x, enemy4.y, enemy4.width, enemy4.height)) return 1;
    return 0;
}
