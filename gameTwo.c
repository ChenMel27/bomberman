#include "gba.h"
#include "mode0.h"
#include "sprites.h"
#include "print.h"
#include "bg.h"
#include "tileset.h"
#include "sprite.h"
#include "gameOne.h"
#include "helper.h"

void updateGameTwo() {
    updatePlayer();
    updateEnemies();
    updateBomb();

    // Check collision between player and active enemy
    if (checkPlayerEnemyCollision()) {
        // Decrease lives
        lives--;
        // If player runs out of lives, go to lose game state
        if (lives <= 0) {
            goToLose();
        } else {
            // Else continue to reset like game one
            initializePlayer();  // Respawn player
            initializeEnemies(0);
        }
    }

    // If they beat this level, then transition to win state (2 / 2 levels)
    if (winCondition()) {
        goToWin();
    }
}

// Duplicate function in game one
void drawGameTwo() {
    drawEnemies();
    drawPlayer();
    drawBomb();

    drawText(2, 2, "SCORE:");
    drawText(17, 2, "   ");
    drawNumber(9, 2, score);

    drawText(2, 4, "LIVES:");
    drawText(17, 4, "   ");
    drawNumber(9, 4, lives);
}