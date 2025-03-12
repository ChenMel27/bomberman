#include "gba.h"
#include "mode0.h"
#include "bg.h"
#include "tileset.h"
#include "sprite.h"
#include "gameOne.h"
#include "collisionMap.h"

//-------------------------------
// New Collision Map Helpers
//-------------------------------

#define COLLISION_MAP_WIDTH  512
#define COLLISION_MAP_HEIGHT 256


// Macro to compute an offset in a linear array.
#define OFFSET(x, y, width) ((y) * (width) + (x))

// Returns the 8-bit pixel (palette index) at (x, y) in the collision map.
inline unsigned char colorAt(int x, int y) {
    return ((unsigned char *)collisionMapBitmap)[OFFSET(x, y, COLLISION_MAP_WIDTH)];
}

// Returns nonzero if the pixel at (x, y) is passable (i.e. not blocked).
int isPassablePixel(int x, int y) {
    if(x < 0 || x >= COLLISION_MAP_WIDTH || y < 0 || y >= COLLISION_MAP_HEIGHT)
        return 0;  // Out-of-bounds is not passable.
    return (colorAt(x, y) != 0 && colorAt(x, y) != 1);
}


//---------------------------------------------------------------------
// [Original tile-based collision functions remain here for bomb logic]
//---------------------------------------------------------------------

#define TILE_SIZE   8
#define MAP_WIDTH   32
#define MAP_HEIGHT  32
#define SPRITE_WIDTH  8
#define SPRITE_HEIGHT 8

unsigned short getTileAtWorld(int worldX, int worldY) {
    int tileX = worldX / TILE_SIZE;
    int tileY = worldY / TILE_SIZE;
    if (tileX < 0 || tileX >= MAP_WIDTH || tileY < 0 || tileY >= MAP_HEIGHT) {
        return 0xFFFF;
    }
    int tileIndex = tileY * MAP_WIDTH + tileX;
    return bgMap[tileIndex];
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
    return (getTileAtWorld(worldX, worldY) == 0x0000) ||
           (getTileAtWorld(worldX + SPRITE_WIDTH - 1, worldY) == 0x0000) ||
           (getTileAtWorld(worldX, worldY + SPRITE_HEIGHT - 1) == 0x0000) ||
           (getTileAtWorld(worldX + SPRITE_WIDTH - 1, worldY + SPRITE_HEIGHT - 1) == 0x0000);
}

void destroySoftBlockAt(int worldX, int worldY) {
    int tileX = worldX / TILE_SIZE;
    int tileY = worldY / TILE_SIZE;
    if (tileX < 0 || tileX >= MAP_WIDTH || tileY < 0 || tileY >= MAP_HEIGHT) {
        return;
    }
    int tileIndex = tileY * MAP_WIDTH + tileX;
    if (bgMap[tileIndex] == 0x0003) {
        // Update the background tile to show the block is destroyed.
        bgMap[tileIndex] = 0x0000;
        DMANow(3, bgMap, &SCREENBLOCK[20], bgLen / 2);

        // Update the collision map to mark this tile's pixels as passable.
        // Compute the starting pixel coordinates for this tile.
        int startX = tileX * TILE_SIZE;
        int startY = tileY * TILE_SIZE;
        for (int y = 0; y < TILE_SIZE; y++) {
            for (int x = 0; x < TILE_SIZE; x++) {
                int pixelX = startX + x;
                int pixelY = startY + y;
                // Set the collision map pixel to 2 (or any non-0, non-1 value)
                ((unsigned char *)collisionMapBitmap)[OFFSET(pixelX, pixelY, COLLISION_MAP_WIDTH)] = 3;
            }
        }
    }
}
