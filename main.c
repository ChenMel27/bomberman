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
    REG_BG0CNT = BG_SCREENBLOCK(28) | BG_CHARBLOCK(1) | BG_SIZE_SMALL;  // Use BG0 for text

    // Load backgrounds
    DMANow(3, bgMap, &SCREENBLOCK[20], bgLen / 2);
    DMANow(3, tilesetPal, BG_PALETTE, tilesetPalLen / 2);
    DMANow(3, tilesetTiles, &CHARBLOCK[0], tilesetTilesLen / 2);

    // Load font tiles into CHARBLOCK 1
    DMANow(3, fontTiles, &CHARBLOCK[1], fontTilesLen / 2);
    DMANow(3, fontPal, BG_PALETTE + 16, fontPalLen / 2);  // Use a different palette bank

    // Load sprites
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
    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGameOne();
    }
}

void goToGameOne() {
    state = GAMEONE;
    DMANow(3, bgMap, &SCREENBLOCK[20], bgLen / 2);
    initializeEnemies(1);
    initializePlayer();
    lives = 3;  // Reset lives at start of level
    round = 1;
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
    DMANow(3, bg2Map, &SCREENBLOCK[20], bg2Len / 2);

    score = 0;
    lives = 3;
    playerImmuneToBombs = 0;  // Reset power-ups when changing levels
    round = 2;
    initializeEnemies(1);
    initializePlayer();
    state = GAMETWO;
}




void gameTwo() {
    updateGameTwo();
        // Clear any leftover score/lives text before drawing new UI
        drawText(2, 2, "          ");  // Erase old score from game one
        drawText(2, 4, "          ");  // Erase old lives from game one
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
    // Load lose screen background
    DMANow(3, loserMap, &SCREENBLOCK[20], loserLen / 2);
    
    // Hide all sprites
    hideSprites();
    
    // Clear Score and Lives text
    drawText(2, 2, "          ");  // Erase score text
    drawText(2, 4, "          ");  // Erase lives text

    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4); // Update OAM after hiding sprites

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}


void goToWin() {
    state = WIN;
}

void win() {
    // Load lose screen background
    DMANow(3, winnerMap, &SCREENBLOCK[20], winnerLen / 2);
    
    // Hide all sprites
    hideSprites();
        
    // Clear Score and Lives text
    drawText(2, 2, "          ");  // Erase score text
    drawText(2, 4, "          ");  // Erase lives text
    
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4); // Update OAM after hiding sprites
    
    if (BUTTON_PRESSED(BUTTON_START)) {
            goToStart();
    }
}