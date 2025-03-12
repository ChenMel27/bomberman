# 1 "helper.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "helper.c"
# 1 "gba.h" 1




typedef signed char s8;
typedef unsigned char u8;
typedef signed short s16;
typedef unsigned short u16;
typedef signed int s32;
typedef unsigned int u32;
typedef signed long long s64;
typedef unsigned long long u64;






extern volatile unsigned short *videoBuffer;
# 37 "gba.h"
void waitForVBlank();


int collision(int x1, int y1, int width1, int height1, int x2, int y2, int width2, int height2);
# 69 "gba.h"
extern unsigned short oldButtons;
extern unsigned short buttons;




typedef volatile struct {
    volatile void* src;
    volatile void* dest;
    unsigned int ctrl;
} DMAChannel;
# 103 "gba.h"
void DMANow(int channel, volatile void* src, volatile void* dest, unsigned int ctrl);
# 2 "helper.c" 2
# 1 "mode0.h" 1
# 32 "mode0.h"
typedef struct {
 u16 tileimg[8192];
} CB;



typedef struct {
 u16 tilemap[1024];
} SB;
# 3 "helper.c" 2
# 1 "bg.h" 1







extern unsigned short bgMap[2048];
# 4 "helper.c" 2
# 1 "tileset.h" 1
# 21 "tileset.h"
extern const unsigned short tilesetTiles[512];


extern const unsigned short tilesetPal[256];
# 5 "helper.c" 2
# 1 "sprite.h" 1
# 21 "sprite.h"
extern const unsigned short spriteTiles[16384];


extern const unsigned short spritePal[256];
# 6 "helper.c" 2
# 1 "gameOne.h" 1
# 13 "gameOne.h"
void updateGameOne();
void drawGameOne();
# 7 "helper.c" 2
# 1 "collisionMap.h" 1
# 19 "collisionMap.h"
extern unsigned short collisionMapBitmap[65536] __attribute__((section(".ewram")));
# 8 "helper.c" 2
# 21 "helper.c"
inline unsigned char colorAt(int x, int y) {
    return ((unsigned char *)collisionMapBitmap)[((y) * (512) + (x))];
}


int isPassablePixel(int x, int y) {
    if(x < 0 || x >= 512 || y < 0 || y >= 256)
        return 0;
    return (colorAt(x, y) != 0 && colorAt(x, y) != 1);
}
# 43 "helper.c"
unsigned short getTileAtWorld(int worldX, int worldY) {
    int tileX = worldX / 8;
    int tileY = worldY / 8;
    if (tileX < 0 || tileX >= 32 || tileY < 0 || tileY >= 32) {
        return 0xFFFF;
    }
    int tileIndex = tileY * 32 + tileX;
    return bgMap[tileIndex];
}

int checkCollisionWorld(int worldX, int worldY) {
    return (getTileAtWorld(worldX, worldY) == 0x0001) ||
           (getTileAtWorld(worldX + 8 - 1, worldY) == 0x0001) ||
           (getTileAtWorld(worldX, worldY + 8 - 1) == 0x0001) ||
           (getTileAtWorld(worldX + 8 - 1, worldY + 8 - 1) == 0x0001);
}

int checkCollisionDestructableWall(int worldX, int worldY) {
    return (getTileAtWorld(worldX, worldY) == 0x0003) ||
           (getTileAtWorld(worldX + 8 - 1, worldY) == 0x0003) ||
           (getTileAtWorld(worldX, worldY + 8 - 1) == 0x0003) ||
           (getTileAtWorld(worldX + 8 - 1, worldY + 8 - 1) == 0x0003);
}

int checkCollisionSoftBlock(int worldX, int worldY) {
    return (getTileAtWorld(worldX, worldY) == 0x0004) ||
           (getTileAtWorld(worldX + 8 - 1, worldY) == 0x0004) ||
           (getTileAtWorld(worldX, worldY + 8 - 1) == 0x0004) ||
           (getTileAtWorld(worldX + 8 - 1, worldY + 8 - 1) == 0x0004);
}

int checkCollisionWin(int worldX, int worldY) {
    return (getTileAtWorld(worldX, worldY) == 0x0000) ||
           (getTileAtWorld(worldX + 8 - 1, worldY) == 0x0000) ||
           (getTileAtWorld(worldX, worldY + 8 - 1) == 0x0000) ||
           (getTileAtWorld(worldX + 8 - 1, worldY + 8 - 1) == 0x0000);
}

void destroySoftBlockAt(int worldX, int worldY) {
    int tileX = worldX / 8;
    int tileY = worldY / 8;
    if (tileX < 0 || tileX >= 32 || tileY < 0 || tileY >= 32) {
        return;
    }
    int tileIndex = tileY * 32 + tileX;
    if (bgMap[tileIndex] == 0x0003) {

        bgMap[tileIndex] = 0x0000;
        DMANow(3, bgMap, &((SB*) 0x6000000)[20], (4096) / 2);



        int startX = tileX * 8;
        int startY = tileY * 8;
        for (int y = 0; y < 8; y++) {
            for (int x = 0; x < 8; x++) {
                int pixelX = startX + x;
                int pixelY = startY + y;

                ((unsigned char *)collisionMapBitmap)[((pixelY) * (512) + (pixelX))] = 3;
            }
        }
    }
}
