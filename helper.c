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

//-------------------------------
// New Collision Map Helpers
//-------------------------------

#define COLLISION_MAP_WIDTH  512
#define COLLISION_MAP_HEIGHT 256
extern int round;

// Macro to compute an offset in a linear array.
#define OFFSET(x, y, width) ((y) * (width) + (x))

// Returns the 8-bit pixel (palette index) at (x, y) in the collision map.
inline unsigned char colorAt(int x, int y) {
    return ((unsigned char *)collisionMapBitmap)[OFFSET(x, y, COLLISION_MAP_WIDTH)];
}

inline unsigned char colorAt2(int x, int y) {
    return ((unsigned char *)collisionMap2Bitmap)[OFFSET(x, y, COLLISION_MAP_WIDTH)];
}

// Returns nonzero if the pixel at (x, y) is passable (i.e. not blocked).
int isPassablePixel(int x, int y, int game) {
    if (game == 1) {
        if(x < 0 || x >= COLLISION_MAP_WIDTH || y < 0 || y >= COLLISION_MAP_HEIGHT)
        return 0;  // Out-of-bounds is not passable.
        return (colorAt(x, y) != 0 && colorAt(x, y) != 1);
    } else if (game == 2) {
        if(x < 0 || x >= COLLISION_MAP_WIDTH || y < 0 || y >= COLLISION_MAP_HEIGHT)
        return 0;  // Out-of-bounds is not passable.
        return (colorAt2(x, y) != 0 && colorAt2(x, y) != 1);
    }
}


//---------------------------------------------------------------------
// [Original tile-based collision functions remain here for bomb logic]
//---------------------------------------------------------------------

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

unsigned short getTileAtWorld(int worldX, int worldY) {
    int tileX = worldX / TILE_SIZE;
    int tileY = worldY / TILE_SIZE;
    if (tileX < 0 || tileX >= MAP_WIDTH || tileY < 0 || tileY >= MAP_HEIGHT) {
        return 0xFFFF;
    }
    int tileIndex = tileY * MAP_WIDTH + tileX;
    if (round == 1) {
        return bgMap[tileIndex];
    } else {  // round == 2
        return bg2Map[tileIndex];
    }
}


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

int checkCollisionWin(int worldX, int worldY) {
    int enemiesGone = (enemy1.active == 0 && enemy2.active == 0
        && enemy3.active == 0 && enemy4.active == 0) ? 1 : 0;
    return enemiesGone & ((getTileAtWorld(worldX, worldY) == 0x0002) ||
           (getTileAtWorld(worldX + SPRITE_WIDTH - 1, worldY) == 0x0002) ||
           (getTileAtWorld(worldX, worldY + SPRITE_HEIGHT - 1) == 0x0002) ||
           (getTileAtWorld(worldX + SPRITE_WIDTH - 1, worldY + SPRITE_HEIGHT - 1) == 0x0002));
}

void destroySoftBlockAt(int worldX, int worldY) {
    int tileX = worldX / TILE_SIZE;
    int tileY = worldY / TILE_SIZE;
    if (tileX < 0 || tileX >= MAP_WIDTH || tileY < 0 || tileY >= MAP_HEIGHT) {
        return;
    }
    int tileIndex = tileY * MAP_WIDTH + tileX;
    if (round == 1) {
        if (bgMap[tileIndex] == 0x0003) {
            bgMap[tileIndex] = 0x0000;
            DMANow(3, bgMap, &SCREENBLOCK[20], bgLen / 2);
            int startX = tileX * TILE_SIZE;
            int startY = tileY * TILE_SIZE;
            for (int y = 0; y < TILE_SIZE; y++) {
                for (int x = 0; x < TILE_SIZE; x++) {
                    int pixelX = startX + x;
                    int pixelY = startY + y;
                    ((unsigned char *)collisionMapBitmap)[OFFSET(pixelX, pixelY, COLLISION_MAP_WIDTH)] = 3;
                }
            }
        }
    } else {  // round == 2
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
    int index = tileY * 32 + tileX;  // Convert (x,y) to tilemap index

    while (*text) {
        char c = *text;
        int tileIndex = 0;

        // Numbers (0-9)
        if (c >= '0' && c <= '9') {
            tileIndex = c - '0' + 15;  
        }
        // Uppercase letters (A-Z)
        else if (c >= 'A' && c <= 'Z') {
            tileIndex = c - 'A' + 32;
        }
        // Lowercase letters (a-z)
        else if (c >= 'a' && c <= 'z') {
            tileIndex = c - 'a' + 58;
        }
        // Special characters
        else if (c == ':') {
            tileIndex = 26; 
        }
        else if (c == '@') {
            tileIndex = 31;
        }
        else if (c == '?') {
            tileIndex = 30;
        }
        else {
            tileIndex = 0;  // Default to a blank tile
        }

        // Ensure the font uses **palette 0**
        SCREENBLOCK[28].tilemap[index] = tileIndex | (1 << 12);  // Palette Bank 0
        text++;
        index++;
    }
}


void drawNumber(int tileX, int tileY, int num) {
    char buffer[10];  
    sprintf(buffer, "%d", num);  // Convert number to string
    drawText(tileX, tileY, buffer);
}

int checkPlayerEnemyCollision() {
    if (enemy1.active && collision(player.x, player.y, player.width, player.height, 
                                   enemy1.x, enemy1.y, enemy1.width, enemy1.height)) {
        return 1;
    }
    if (enemy2.active && collision(player.x, player.y, player.width, player.height, 
                                   enemy2.x, enemy2.y, enemy2.width, enemy2.height)) {
        return 1;
    }
    if (enemy3.active && collision(player.x, player.y, player.width, player.height, 
                                   enemy3.x, enemy3.y, enemy3.width, enemy3.height)) {
        return 1;
    }
    if (enemy4.active && collision(player.x, player.y, player.width, player.height, 
                                   enemy4.x, enemy4.y, enemy4.width, enemy4.height)) {
        return 1;
    }
    return 0;
}
