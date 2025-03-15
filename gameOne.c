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

    // Lose condition for enemy and player collision
    if (checkPlayerEnemyCollision()) {
        // Decrement lives
        lives--;
        // If lives reaches 0, then go to losing game state
        if (lives <= 0) {
            goToLose();
        } else {
            // If lives is not 0, then reset the game, but stay at level 1
            // Player goes back to original spot 
            initializePlayer();
            // ONLY reset ACTIVE enemies
            initializeEnemies(0);
        }
    }

    // If player hits all enemies and reaches exit, go to next level
    if (winCondition()) {
        goToGameTwo();
    }
}

void drawGameOne() {
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