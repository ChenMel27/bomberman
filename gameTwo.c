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

    // Check if player collides with any active enemy
    if (checkPlayerEnemyCollision()) {
        lives--;  // Decrease lives
        if (lives <= 0) {
            goToLose();  // Transition to Lose screen
        } else {
            initializePlayer();  // Respawn player
            initializeEnemies(0);
        }
    }

    if (winCondition()) {
        goToWin();
    }
}

void drawGameTwo() {
    drawEnemies();
    drawPlayer();
    drawBomb();

    drawText(2, 2, "SCORE:");
    drawText(17, 2, "   ");  // Clear space for new score
    drawNumber(9, 2, score);

    drawText(2, 4, "LIVES:");
    drawText(17, 4, "   ");  // Clear space for new lives count
    drawNumber(9, 4, lives);
}