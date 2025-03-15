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
# 11 "gameOne.h"
extern int score;
extern int lives;
extern int timer;

void updateGameOne();
void drawGameOne();
# 7 "helper.c" 2
# 1 "collisionMap.h" 1
# 20 "collisionMap.h"
extern unsigned short collisionMapBitmap[65536] __attribute__((section(".ewram")));
# 8 "helper.c" 2
# 1 "collisionMap2.h" 1
# 20 "collisionMap2.h"
extern unsigned short collisionMap2Bitmap[65536] __attribute__((section(".ewram")));
# 9 "helper.c" 2
# 1 "sprites.h" 1







extern int playerImmuneToBombs;

void initializeEnemies();
void initializePlayer();
void updateEnemies();
void updatePlayer();
void updateBomb();
void drawEnemies();
void drawPlayer();
int winCondition();
int loseCondition();


typedef struct {
  u16 attr0;
  u16 attr1;
  u16 attr2;
  u16 fill;
} OBJ_ATTR;

typedef struct {
  int x;
  int y;
  int timer;
  int explosionTimer;
  int active;
  int oamIndex;
} BOMB;



extern OBJ_ATTR shadowOAM[128];

struct attr0 {
  u16 regular;
  u16 affine;
  u16 hide;
  u16 double_affine;
  u16 enable_alpha;
  u16 enable_window;
  u16 enable_mosaic;
  u16 fourBpp;
  u16 eightBpp;
  u16 square;
  u16 wide;
  u16 tall;
};

struct attr1 {
  u16 hflip;
  u16 vflip;
  u16 tiny;
  u16 small;
  u16 medium;
  u16 large;
};

struct oam_attrs {
  struct attr0 attr0;
  struct attr1 attr1;
};
# 113 "sprites.h"
void hideSprites();


typedef struct {
    int x;
    int y;
    int xVel;
    int yVel;
    int width;
    int height;
    int active;
    int timeUntilNextFrame;
    int direction;
    int isAnimating;
    int currentFrame;
    int numFrames;
    u8 oamIndex;
} SPRITE;
# 10 "helper.c" 2
# 1 "bg2.h" 1







extern unsigned short bg2Map[2048];
# 11 "helper.c" 2
# 20 "helper.c"
extern SPRITE enemy1;
extern SPRITE enemy2;
extern SPRITE enemy3;
extern SPRITE enemy4;
extern SPRITE player;
extern int round;



inline unsigned char colorAt(int x, int y) {
    return ((unsigned char *)collisionMapBitmap)[((y) * (512) + (x))];
}


inline unsigned char colorAt2(int x, int y) {
    return ((unsigned char *)collisionMap2Bitmap)[((y) * (512) + (x))];
}


int isPassablePixel(int x, int y, int game) {

    if (game == 1) {
        if(x < 0 || x >= 512 || y < 0 || y >= 256) return 0;
        return (colorAt(x, y) != 0 && colorAt(x, y) != 2);

    } else if (game == 2) {
        if(x < 0 || x >= 512 || y < 0 || y >= 256) return 0;
        return (colorAt2(x, y) != 0 && colorAt2(x, y) != 1);
    }
}




unsigned short getTileAtWorld(int worldX, int worldY) {

    int tileX = worldX / 8;
    int tileY = worldY / 8;


    if (tileX < 0 || tileX >= 32 || tileY < 0 || tileY >= 32) {
        return 0xFFFF;
    }

    int tileIndex = tileY * 32 + tileX;


    if (round == 1) {
        return bgMap[tileIndex];
    } else if (round == 2) {
        return bg2Map[tileIndex];
    }
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

    int enemiesGone = (enemy1.active == 0 && enemy2.active == 0
        && enemy3.active == 0 && enemy4.active == 0) ? 1 : 0;

    return enemiesGone & ((getTileAtWorld(worldX, worldY) == 0x0002) ||
           (getTileAtWorld(worldX + 8 - 1, worldY) == 0x0002) ||
           (getTileAtWorld(worldX, worldY + 8 - 1) == 0x0002) ||
           (getTileAtWorld(worldX + 8 - 1, worldY + 8 - 1) == 0x0002));
}


void destroySoftBlockAt(int worldX, int worldY) {
    int tileX = worldX / 8;
    int tileY = worldY / 8;


    if (tileX < 0 || tileX >= 32 || tileY < 0 || tileY >= 32) {
        return;
    }
    int tileIndex = tileY * 32 + tileX;


    if (round == 1) {
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

    } else {
        if (bg2Map[tileIndex] == 0x0003) {
            bg2Map[tileIndex] = 0x0000;
            DMANow(3, bg2Map, &((SB*) 0x6000000)[20], (4096) / 2);
            int startX = tileX * 8;
            int startY = tileY * 8;
            for (int y = 0; y < 8; y++) {
                for (int x = 0; x < 8; x++) {
                    int pixelX = startX + x;
                    int pixelY = startY + y;
                    ((unsigned char *)collisionMap2Bitmap)[((pixelY) * (512) + (pixelX))] = 3;
                }
            }
        }
    }
}

void drawText(int tileX, int tileY, char *text) {

    int index = tileY * 32 + tileX;

    while (*text) {
        char c = *text;
        int tileIndex = 0;


        if (c >= '0' && c <= '9') {
            tileIndex = c - '0' + 15;
        }

        else if (c >= 'A' && c <= 'Z') {
            tileIndex = c - 'A' + 32;
        }

        else if (c >= 'a' && c <= 'z') {
            tileIndex = c - 'a' + 58;
        }

        else if (c == ':') {
            tileIndex = 25;
        }


        ((SB*) 0x6000000)[28].tilemap[index] = tileIndex | (1 << 12);
        text++;
        index++;
    }
}

void drawNumber(int tileX, int tileY, int num) {
    char buffer[10];

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
