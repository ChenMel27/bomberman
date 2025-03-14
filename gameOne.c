#include "gba.h"
#include "mode0.h"
#include "sprites.h"
#include "print.h"
#include "bg.h"
#include "tileset.h"
#include "sprite.h"
#include "gameOne.h"
#include "helper.h"

void updateGameOne() {
    updatePlayer();
    updateEnemies();
    updateBomb();

    if (checkPlayerEnemyCollision()) {
        lives--;  // Decrease lives
        if (lives <= 0) {
            goToLose();  // Transition to Game Two instead of Lose screen
        } else {
            initializePlayer();  // Respawn player
            initializeEnemies(0);  // Only reset active enemies
        }
    }

    if (winCondition()) {
        goToGameTwo();
    }
}



void drawGameOne() {
    drawEnemies();
    drawPlayer();
    drawBomb();  // Updated for multiple bombs

    drawText(2, 2, "SCORE:");
    drawText(9, 2, "   ");  // Clear space for new score
    drawNumber(9, 2, score);

    drawText(2, 4, "LIVES:");
    drawText(9, 4, "   ");  // Clear space for new lives count
    drawNumber(9, 4, lives);
}





void drawSpriteNumber(int x, int y, int num) {
    char buffer[10];
    sprintf(buffer, "%d", num);
    
    int i = 0;
    while (buffer[i] != '\0') {
        int tileIndex = buffer[i] - '0';  // Convert character to sprite tile index
        
        shadowOAM[100 + i].attr0 = ATTR0_Y(y) | ATTR0_SQUARE;
        shadowOAM[100 + i].attr1 = ATTR1_X(x + (i * 8));  // Offset each digit by 8px
        shadowOAM[100 + i].attr2 = ATTR2_TILEID(tileIndex, 0) | ATTR2_PALROW(0);
        
        i++;
    }
}
