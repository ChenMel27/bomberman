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

    // Display timer, score, and lives (using row 17 for timer)
    drawText(1, 17, "TIME:");
    drawText(7, 17, "   ");         // Clear previous timer value
    drawNumber(7, 17, timer);

    drawText(1, 18, "SCORE:");
    drawText(9, 18, "   ");         // Clear previous score value
    drawNumber(9, 18, score);

    drawText(1, 19, "LIVES:");
    drawText(9, 19, "   ");         // Clear previous lives value
    drawNumber(9, 19, lives);
}
