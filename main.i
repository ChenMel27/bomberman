# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
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
# 2 "main.c" 2
# 1 "mode0.h" 1
# 32 "mode0.h"
typedef struct {
 u16 tileimg[8192];
} CB;



typedef struct {
 u16 tilemap[1024];
} SB;
# 3 "main.c" 2
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
# 4 "main.c" 2
# 1 "print.h" 1
# 25 "print.h"
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 1 3 4
# 9 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 1 3 4
# 12 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 1 3 4







# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 1 3 4
# 28 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_newlib_version.h" 1 3 4
# 29 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 2 3 4
# 9 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 2 3 4
# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4

# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int8_t;

typedef unsigned char __uint8_t;
# 55 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int16_t;

typedef short unsigned int __uint16_t;
# 77 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int32_t;

typedef long unsigned int __uint32_t;
# 103 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int64_t;

typedef long long unsigned int __uint64_t;
# 134 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int_least8_t;

typedef unsigned char __uint_least8_t;
# 160 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int_least16_t;

typedef short unsigned int __uint_least16_t;
# 182 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int_least32_t;

typedef long unsigned int __uint_least32_t;
# 200 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int_least64_t;

typedef long long unsigned int __uint_least64_t;
# 214 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __intmax_t;







typedef long long unsigned int __uintmax_t;







typedef int __intptr_t;

typedef unsigned int __uintptr_t;
# 13 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 1 3 4
# 35 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 187 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 14 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 1 3 4
# 20 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 3 4
typedef __int8_t int8_t ;



typedef __uint8_t uint8_t ;







typedef __int16_t int16_t ;



typedef __uint16_t uint16_t ;







typedef __int32_t int32_t ;



typedef __uint32_t uint32_t ;







typedef __int64_t int64_t ;



typedef __uint64_t uint64_t ;






typedef __intmax_t intmax_t;




typedef __uintmax_t uintmax_t;




typedef __intptr_t intptr_t;




typedef __uintptr_t uintptr_t;
# 15 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4






typedef __int_least8_t int_least8_t;
typedef __uint_least8_t uint_least8_t;




typedef __int_least16_t int_least16_t;
typedef __uint_least16_t uint_least16_t;




typedef __int_least32_t int_least32_t;
typedef __uint_least32_t uint_least32_t;




typedef __int_least64_t int_least64_t;
typedef __uint_least64_t uint_least64_t;
# 51 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast8_t;
  typedef unsigned int uint_fast8_t;
# 61 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast16_t;
  typedef unsigned int uint_fast16_t;
# 71 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast32_t;
  typedef unsigned int uint_fast32_t;
# 81 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef long long int int_fast64_t;
  typedef long long unsigned int uint_fast64_t;
# 10 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 2 3 4
# 26 "print.h" 2
# 35 "print.h"

# 35 "print.h"
uint8_t mgba_open(void);
void mgba_printf_level(int level, const char* ptr, ...);
void mgba_printf(const char* string, ...);
void mgba_break(void);
void mgba_close(void);
# 5 "main.c" 2
# 1 "bg.h" 1







extern unsigned short bgMap[2048];
# 6 "main.c" 2
# 1 "tileset.h" 1
# 21 "tileset.h"
extern const unsigned short tilesetTiles[512];


extern const unsigned short tilesetPal[256];
# 7 "main.c" 2
# 1 "sprite.h" 1
# 21 "sprite.h"
extern const unsigned short spriteTiles[16384];


extern const unsigned short spritePal[256];
# 8 "main.c" 2
# 1 "gameOne.h" 1
# 11 "gameOne.h"
extern int score;
extern int lives;


void updateGameOne();
void drawGameOne();
# 9 "main.c" 2
# 1 "helper.h" 1




int isPassablePixel(int x, int y, int game);
unsigned char colorAt(int x, int y);


unsigned short getTileAtWorld(int worldX, int worldY);
int checkCollisionWorld(int worldX, int worldY);
int checkCollisionDestructableWall(int worldX, int worldY);
int checkCollisionSoftBlock(int worldX, int worldY);
int checkCollisionWin(int worldX, int worldY);
void destroySoftBlockAt(int worldX, int worldY);
# 10 "main.c" 2
# 1 "collisionMap.h" 1
# 19 "collisionMap.h"
extern unsigned short collisionMapBitmap[65536] __attribute__((section(".ewram")));
# 11 "main.c" 2
# 1 "bg2.h" 1







extern unsigned short bg2Map[2048];
# 12 "main.c" 2
# 1 "font.h" 1
# 21 "font.h"
extern const unsigned short fontTiles[1568];


extern const unsigned short fontPal[256];
# 13 "main.c" 2
# 1 "loser.h" 1







extern const unsigned short loserMap[2048];
# 14 "main.c" 2
# 1 "winner.h" 1







extern const unsigned short winnerMap[2048];
# 15 "main.c" 2
# 1 "start.h" 1







extern const unsigned short startMap[2048];
# 16 "main.c" 2

OBJ_ATTR shadowOAM[128];

void initialize();
void updateGameOne();
void drawGameOne();


void goToStart();
void start();
void goToGameOne();
void gameOne();
void goToGameTwo();
void gameTwo();
void goToPause();
void pause();
void goToLose();
void lose();
void goToWin();
void win();


enum {START, GAMEONE, GAMETWO, PAUSE, WIN, LOSE};
int state;

int score = 0;
int lives = 3;

unsigned short oldButtons;
unsigned short buttons;
SPRITE player;
extern int round;

int main() {
    initialize();

    while (1) {
        oldButtons = buttons;
        buttons = (*(volatile unsigned short *)0x04000130);

        switch(state) {
            case START:
                start();
                break;
            case GAMEONE:
                gameOne();
                break;
            case GAMETWO:
                gameTwo();
                break;
            case WIN:
                win();
                break;
            case PAUSE:
                pause();
                break;
            case LOSE:
                lose();
                break;
        }
        DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);
    }
}

void initialize() {
    mgba_open();
    (*(volatile unsigned short *)0x4000000) = ((0) & 7) | (1 << (8 + (1 % 4))) | (1 << 12) | (1 << (8 + (0 % 4)));

    (*(volatile unsigned short*) 0x400000A) = ((20) << 8) | ((0) << 2);
    (*(volatile unsigned short*) 0x4000008) = ((28) << 8) | ((1) << 2) | (0 << 14);


    DMANow(3, bgMap, &((SB*) 0x6000000)[20], (4096) / 2);
    DMANow(3, tilesetPal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, tilesetTiles, &((CB*) 0x6000000)[0], 1024 / 2);


    DMANow(3, fontTiles, &((CB*) 0x6000000)[1], 3136 / 2);
    DMANow(3, fontPal, ((unsigned short *)0x5000000) + 16, 512 / 2);


    DMANow(3, spriteTiles, &((CB*) 0x6000000)[4], 32768 / 2);
    DMANow(3, spritePal, ((u16 *)0x5000200), 256);

    initializePlayer();
    initializeEnemies(1);
    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);

    goToStart();
}

void goToStart() {
    state = START;
}

void start() {
    waitForVBlank();

    if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
        goToGameOne();
    }
}

void goToGameOne() {
    state = GAMEONE;
    DMANow(3, bgMap, &((SB*) 0x6000000)[20], (4096) / 2);
    initializeEnemies(1);
    initializePlayer();
    lives = 3;
    round = 1;
}


void gameOne() {
    updateGameOne();
    drawGameOne();
    waitForVBlank();

    if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
        goToPause();
    }
}

void goToGameTwo() {
    DMANow(3, bg2Map, &((SB*) 0x6000000)[20], (4096) / 2);

    score = 0;
    lives = 3;
    playerImmuneToBombs = 0;
    round = 2;
    initializeEnemies(1);
    initializePlayer();
    state = GAMETWO;
}




void gameTwo() {
    updateGameTwo();

        drawText(2, 2, "          ");
        drawText(2, 4, "          ");
    drawGameTwo();
    waitForVBlank();

    if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
        goToPause();
    }
}

void goToPause() {
    state = PAUSE;
}

void pause() {
    waitForVBlank();
    if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
        goToGameOne();
    } else if ((!(~(oldButtons) & ((1<<2))) && (~(buttons) & ((1<<2))))) {
        goToStart();
    }
}

void goToLose() {
    state = LOSE;
}

void lose() {

    DMANow(3, loserMap, &((SB*) 0x6000000)[20], (4096) / 2);


    hideSprites();


    drawText(2, 2, "          ");
    drawText(2, 4, "          ");

    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);

    if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
        goToStart();
    }
}


void goToWin() {
    state = WIN;
}

void win() {

    DMANow(3, winnerMap, &((SB*) 0x6000000)[20], (4096) / 2);


    hideSprites();


    drawText(2, 2, "          ");
    drawText(2, 4, "          ");

    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);

    if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
            goToStart();
    }
}
