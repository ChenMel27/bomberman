#include "gba.h"
#include "mode0.h"
#include "sprites.h"
#include "print.h"
#include "bg.h"
#include "tileset.h"
#include "sprite.h"
#include "gameOne.h"
#include "helper.h"
#include "collisionMap.h"

OBJ_ATTR shadowOAM[128];

void initialize();
void updateGameOne();
void drawGameOne();

// State Prototypes
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

// States
enum {START, GAMEONE, GAMETWO, PAUSE, WIN, LOSE};
int state;

int lives;

unsigned short oldButtons;
unsigned short buttons;
SPRITE player;

int main() {
    initialize();

    while (1) {
        oldButtons = buttons;
        buttons = REG_BUTTONS;

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
        DMANow(3, shadowOAM, OAM, 128 * 4);
    }    
}

void initialize() {
    mgba_open();
    REG_DISPCTL = MODE(0) | BG_ENABLE(1) | SPRITE_ENABLE;
    REG_BG1CNT = BG_SCREENBLOCK(20) | BG_CHARBLOCK(0);

    DMANow(3, bgMap, &SCREENBLOCK[20], bgLen / 2);
    DMANow(3, tilesetPal, BG_PALETTE, tilesetPalLen / 2);
    DMANow(3, tilesetTiles, &CHARBLOCK[0], tilesetTilesLen / 2);
    DMANow(3, spriteTiles, &CHARBLOCK[4], spriteTilesLen / 2);
    DMANow(3, spritePal, SPRITE_PAL, 256);

    initializePlayer();
    initializeEnemies();
    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    goToStart();
}

void goToStart() {
    state = START;
}

void start() {
    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGameOne();
    }
}

void goToGameOne() {
    state = GAMEONE;
}

void gameOne() {
    updateGameOne();
    drawGameOne();
    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }
}

void goToGameTwo() {
    state = GAMETWO;
}

void gameTwo() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }
}

void goToPause() {
    state = PAUSE;
}

void pause() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGameOne();
    } else if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }
}

void goToLose() {
    state = LOSE;
}

void lose() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}

void goToWin() {
    state = WIN;
}

void win() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}

inline unsigned char colorAt(int x, int y) {
    return ((unsigned char *)collisionMapBitmap)[(y) * 240 + (x)];
}