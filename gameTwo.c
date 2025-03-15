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

    // Display score and lives in top left
    drawText(1, 18, "SCORE:");
    // Clear
    drawText(9, 18, "   ");
    drawNumber(9, 18, score);

    drawText(1, 19, "LIVES:");
    // Clear
    drawText(9, 19, "   ");
    drawNumber(9, 19, lives);
}