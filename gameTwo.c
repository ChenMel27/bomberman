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
    drawText(10, 10, "Score:");
    drawNumber(60, 10, score);
    drawText(10, 20, "Lives:");
    drawNumber(60, 20, lives);
}
