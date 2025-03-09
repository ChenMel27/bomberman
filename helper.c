#include "gba.h"
#include "mode0.h"
#include "sprites.h"
#include "print.h"
#include "bg.h"
#include "tileset.h"
#include "sprite.h"
#include "gameOne.h"

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
    // Convert the world coordinates to tile coordinates.
    int tileX = worldX / TILE_SIZE;
    int tileY = worldY / TILE_SIZE;

    // Ensure the coordinates are within the map bounds.
    if (tileX < 0 || tileX >= MAP_WIDTH || tileY < 0 || tileY >= MAP_HEIGHT) {
        return;
    }

    // Calculate the index in the background map.
    int tileIndex = tileY * MAP_WIDTH + tileX;

    // Check if the tile is a soft block (tile ID 0x0004).
    if (bgMap[tileIndex] == 0x0004) {
        // Replace the soft block with a floor tile (tile ID 0x0000).
        bgMap[tileIndex] = 0x0000;
    }
}
