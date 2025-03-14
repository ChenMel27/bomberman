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
#include "bg2.h"
#include "font.h"
#include "loser.h"
#include "winner.h"
#include "start.h"

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

// States
enum {START, GAMEONE, GAMETWO, PAUSE, WIN, LOSE};
int state;

// Score and lives trackers
int score = 0;
int lives = 3;

int paused = 0;

unsigned short oldButtons;
unsigned short buttons;

SPRITE player;
extern int round;

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
    REG_DISPCTL = MODE(0) | BG_ENABLE(1) | SPRITE_ENABLE | BG_ENABLE(0);

    REG_BG1CNT = BG_SCREENBLOCK(20) | BG_CHARBLOCK(0);
    // BG0 for drawing text
    REG_BG0CNT = BG_SCREENBLOCK(28) | BG_CHARBLOCK(1) | BG_SIZE_SMALL;

    // BG
    DMANow(3, bgMap, &SCREENBLOCK[20], bgLen / 2);
    DMANow(3, tilesetPal, BG_PALETTE, tilesetPalLen / 2);
    DMANow(3, tilesetTiles, &CHARBLOCK[0], tilesetTilesLen / 2);

    // Font
    DMANow(3, fontTiles, &CHARBLOCK[1], fontTilesLen / 2);
        // Dif palette
    DMANow(3, fontPal, BG_PALETTE + 16, fontPalLen / 2);

    // Sprites
    DMANow(3, spriteTiles, &CHARBLOCK[4], spriteTilesLen / 2);
    DMANow(3, spritePal, SPRITE_PAL, 256);

    initializePlayer();
    initializeEnemies(1);
    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);
    goToStart();
}

void goToStart() {
    state = START;
}

void start() {
    // Start screen
    DMANow(3, startMap, &SCREENBLOCK[20], startLen / 2);

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGameOne();
    }
}

void goToGameOne() {
    state = GAMEONE;

    // First map
    DMANow(3, bgMap, &SCREENBLOCK[20], bgLen / 2);

    if (paused == 0) {
        // Full initialization of enemies
        initializeEnemies(1);
        initializePlayer();
        lives = 3;
        round = 1;
    }
}


void gameOne() {
    updateGameOne();
    drawGameOne();
    waitForVBlank();

    // Pause
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }
}

void goToGameTwo() {
    // Second map
    DMANow(3, bg2Map, &SCREENBLOCK[20], bg2Len / 2);

    if (paused == 0) {
        score = 0;
        lives = 3;
        round = 2;

        // Reset power-up
        playerImmuneToBombs = 0;
        
        // Full reset of enemies
        initializeEnemies(1);
        initializePlayer();
    }
    state = GAMETWO;
}




void gameTwo() {
    updateGameTwo();
    // Clear leftover text
    drawText(2, 2, "          ");
    drawText(2, 4, "          ");
    drawGameTwo();
    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }
}

void goToPause() {
    state = PAUSE;
}

void pause() {
    paused = 1;
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        if (round == 1) {
            goToGameOne();
        } else {
            goToGameTwo();
        }
        paused = 0;
    } else if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }
}

void goToLose() {
    state = LOSE;
}

void lose() {
    // Show lose screen
    DMANow(3, loserMap, &SCREENBLOCK[20], loserLen / 2);
    
    // Hide sprites
    hideSprites();
    
    // Hide text
    drawText(2, 2, "           ");
    drawText(2, 4, "           ");

    // Update OAM after hide sprites
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}


void goToWin() {
    state = WIN;
}

void win() {
    // Show win map
    DMANow(3, winnerMap, &SCREENBLOCK[20], winnerLen / 2);
    
    // Hide sprites
    hideSprites();
        
    // Hide text
    drawText(2, 2, "           ");
    drawText(2, 4, "           ");
    
    // Upd. OAM
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);
    
    if (BUTTON_PRESSED(BUTTON_START)) {
            goToStart();
    }
}