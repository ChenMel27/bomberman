#include "sprites.h"
#include "helper.h"
#include "gba.h"
#include "mode0.h"
#include "sprites.h"
#include "print.h"
#include "bg.h"
#include "tileset.h"
#include "sprite.h"
#include "gameOne.h"
#include <stdlib.h>

#define BOMB_TILE_ROW 0
#define BOMB_TILE_COL 3
#define COLLISION_MAP_WIDTH  512
#define COLLISION_MAP_HEIGHT 256
#define EXPLOSION_TILE_ROW 2
#define EXPLOSION_TILE_COL 4

// Power up = 0 so player can be hurt by own bombs
int playerImmuneToBombs = 0;

// Death timers for enemy = 0 so enemies aren't dying
int enemy1DeathTimer = 0;
int enemy2DeathTimer = 0;
int enemy3DeathTimer = 0;
int enemy4DeathTimer = 0;

extern int lives;
extern OBJ_ATTR shadowOAM[128];
int round = 1;

typedef enum {
    DOWN,
    RIGHT,
    UP,
    LEFT
} DIRECTION;

SPRITE enemy1;
SPRITE enemy2;
SPRITE enemy3;
SPRITE enemy4;
SPRITE player;

BOMB bomb = {0, 0, 0, 0, 0, 5};

void initializePlayer() {
    player.x = 0;
    player.y = 24;
    player.currentFrame = 0;
    player.direction = 0;
    player.oamIndex = 0;
    player.width = 8;
    player.height = 8;
    player.numFrames = 4;
    player.timeUntilNextFrame = 15;
    player.currentFrame = 0;
    player.direction = RIGHT;
}


void initializeEnemies(int fullReset) {
    // If it's a new game reset all enemies active
    if (fullReset) {
        enemy1.active = 1;
        enemy2.active = 1;
        enemy3.active = 1;
        enemy4.active = 1;
    }

    // This check basically hackingly fixes reset when lives are > 0 so that inactive enemies
    // aren't redrawn
    if (enemy1.active) {
        enemy1.x = 104;
        enemy1.y = 104;
        enemy1.currentFrame = 2;
        enemy1.direction = RIGHT;
        enemy1.oamIndex = 1;
        enemy1.width = 8;
        enemy1.height = 8;
        enemy1.numFrames = 4;
        enemy1.timeUntilNextFrame = 15;
    }

    if (enemy2.active) {
        enemy2.x = 136;
        enemy2.y = 24;
        enemy2.currentFrame = 0;
        enemy2.direction = RIGHT;
        enemy2.oamIndex = 2;
        enemy2.width = 8;
        enemy2.height = 8;
        enemy2.numFrames = 4;
        enemy2.timeUntilNextFrame = 15;
    }

    if (enemy3.active) {
        enemy3.x = 24;
        enemy3.y = 136;
        enemy3.currentFrame = 0;
        enemy3.direction = RIGHT;
        enemy3.oamIndex = 3;
        enemy3.width = 8;
        enemy3.height = 8;
        enemy3.numFrames = 3;
        enemy3.timeUntilNextFrame = 4;
        enemy3.xVel = 3;
        enemy3.yVel = 3;
    }

    if (enemy4.active) {
        enemy4.x = 136;
        enemy4.y = 136;
        enemy4.currentFrame = 0;
        enemy4.direction = RIGHT;
        enemy4.oamIndex = 4;
        enemy4.width = 8;
        enemy4.height = 8;
        enemy4.numFrames = 3;
        enemy4.timeUntilNextFrame = 4;
        enemy4.xVel = 3;
        enemy4.yVel = 3;
    }
}



void updatePlayer() {
    // Calculate sprite corners of player.
    int leftX   = player.x;
    int rightX  = player.x + player.width - 1;
    int topY    = player.y;
    int bottomY = player.y + player.height - 1;
    
    // COLLISION MAP IMPLEMENTATION FOR PLAYER
    // Down movement
    if (BUTTON_HELD(BUTTON_DOWN)) {
        if (player.y + player.height < COLLISION_MAP_HEIGHT && 
            isPassablePixel(leftX, bottomY + 1, round) &&
            isPassablePixel(rightX, bottomY + 1, round)) {
            player.y++;
        }
        player.direction = DOWN;
    }
    
    // Up movement
    if (BUTTON_HELD(BUTTON_UP)) {
        if (player.y > 0 &&
            isPassablePixel(leftX, topY - 1, round) &&
            isPassablePixel(rightX, topY - 1, round)) {
            player.y--;
        }
        player.direction = UP;
    }
    
    // Right movement
    if (BUTTON_HELD(BUTTON_RIGHT)) {
        if (player.x + player.width < COLLISION_MAP_WIDTH &&
            isPassablePixel(rightX + 1, topY, round) &&
            isPassablePixel(rightX + 1, bottomY, round)) {
            player.x++;
        }
        player.direction = RIGHT;
    }
    
    // Left movement
    if (BUTTON_HELD(BUTTON_LEFT)) {
        if (player.x > 0 &&
            isPassablePixel(leftX - 1, topY, round) &&
            isPassablePixel(leftX - 1, bottomY, round)) {
            player.x--;
        }
        player.direction = LEFT;
    }
    
    // Placing bombs
    if (BUTTON_PRESSED(BUTTON_SELECT) && !bomb.active) {
        // Set it where player is (behind)
        bomb.x = (player.x / TILE_SIZE) * TILE_SIZE;
        bomb.y = (player.y / TILE_SIZE) * TILE_SIZE;
        // 60 frames currently
        bomb.timer = 60;
        bomb.active = 1;
    }

    // If player hits LSHOULDER their bomb immunity power up is activated for THAT game
    if (BUTTON_PRESSED(BUTTON_LSHOULDER)) {
        playerImmuneToBombs = 1;
    }

}


void updateEnemies() {
    // Time for animating enemies
    static int changeTimer = 0;
    changeTimer++;

    // ENEMY 1: 
    // Type 2: Moves randomly in that the enemy frequently changes directions (from up/down to left/right and vice versa).
    // Its movement pattern is not affected by the player.
    // If not dying, normal movement:
    if (enemy1.active && enemy1DeathTimer == 0) {
        if (changeTimer % 30 == 0) {
            if (enemy1.direction == LEFT || enemy1.direction == RIGHT)
                enemy1.direction = (rand() % 2) ? UP : DOWN;
            else
                enemy1.direction = (rand() % 2) ? LEFT : RIGHT;
        }
        if (enemy1.direction == DOWN) {
            if (isPassablePixel(enemy1.x, enemy1.y + enemy1.height, round) &&
                isPassablePixel(enemy1.x + enemy1.width - 1, enemy1.y + enemy1.height, round)
                && enemy1.y + enemy1.width < 160) {
                enemy1.y++;
            }
        } else if (enemy1.direction == UP) {
            if (isPassablePixel(enemy1.x, enemy1.y - 1, round) &&
                isPassablePixel(enemy1.x + enemy1.width - 1, enemy1.y - 1, round) && enemy1.y > 0) {
                enemy1.y--;
            }
        } else if (enemy1.direction == RIGHT) {
            if (isPassablePixel(enemy1.x + enemy1.width, enemy1.y, round) &&
                isPassablePixel(enemy1.x + enemy1.width, enemy1.y + enemy1.height - 1, round)
                && enemy1.x + enemy1.width < 240) {
                enemy1.x++;
            }
        } else if (enemy1.direction == LEFT) {
            if (isPassablePixel(enemy1.x - 1, enemy1.y, round) &&
                isPassablePixel(enemy1.x - 1, enemy1.y + enemy1.height - 1, round)
                && enemy1.x > 0) {
                enemy1.x--;
            }
        }
    }

    // ENEMY 2: 
    // Type 2: Moves randomly in that the enemy frequently changes directions (from up/down to left/right and vice versa).
    // Its movement pattern is not affected by the player.
    // If not dying, normal movement:
    if (enemy2.active && enemy2DeathTimer == 0) {
        if (changeTimer % 30 == 0) {
            if (enemy2.direction == LEFT || enemy2.direction == RIGHT)
                enemy2.direction = (rand() % 2) ? UP : DOWN;
            else
                enemy2.direction = (rand() % 2) ? LEFT : RIGHT;
        }
        if (enemy2.direction == DOWN) {
            if (isPassablePixel(enemy2.x, enemy2.y + enemy2.height, round) &&
                isPassablePixel(enemy2.x + enemy2.width - 1, enemy2.y + enemy2.height, round)
                && enemy1.y + enemy1.width < 160) {
                enemy2.y++;
            }
        } else if (enemy2.direction == UP) {
            if (isPassablePixel(enemy2.x, enemy2.y - 1, round) &&
                isPassablePixel(enemy2.x + enemy2.width - 1, enemy2.y - 1, round)
                && enemy1.y > 0) {
                enemy2.y--;
            }
        } else if (enemy2.direction == RIGHT) {
            if (isPassablePixel(enemy2.x + enemy2.width, enemy2.y, round) &&
                isPassablePixel(enemy2.x + enemy2.width, enemy2.y + enemy2.height - 1, round)
                && enemy1.x + enemy1.height < 240) {
                enemy2.x++;
            }
        } else if (enemy2.direction == LEFT) {
            if (isPassablePixel(enemy2.x - 1, enemy2.y, round) &&
                isPassablePixel(enemy2.x - 1, enemy2.y + enemy2.height - 1, round)
                && enemy2.x > 0) {
                enemy2.x--;
            }
        }
    }

    static int enemyDelayCounter = 0;
    enemyDelayCounter++;
    if (enemyDelayCounter >= 3) {
        enemyDelayCounter = 0;
        // ENEMY 3: 
        // Type 4: Moves similarly to Type 2, but can travel through soft blocks.
        // Its movement pattern is not affected by the player.
        // If not dying, normal movement:
        if (enemy3.active && enemy3DeathTimer == 0) {
            if (player.x > enemy3.x)
                enemy3.x++;
            else if (player.x < enemy3.x)
                enemy3.x--;
            if (player.y > enemy3.y)
                enemy3.y++;
            else if (player.y < enemy3.y)
                enemy3.y--;
        }
        // ENEMY 4: 
        // Type 4: Moves similarly to Type 2, but can travel through soft blocks.
        // Its movement pattern is not affected by the player.
        // If not dying, normal movement:
        if (enemy4.active && enemy4DeathTimer == 0) {
            if (player.x > enemy4.x)
                enemy4.x++;
            else if (player.x < enemy4.x)
                enemy4.x--;
            if (player.y > enemy4.y)
                enemy4.y++;
            else if (player.y < enemy4.y)
                enemy4.y--;
        }
    }

    // Death timers for animation ALL ENEMIES, once 0, then inactivate / hide sprite
    if (enemy1DeathTimer > 0) {
        enemy1DeathTimer--;
        if (enemy1DeathTimer == 0) {
            enemy1.active = 0;
            shadowOAM[enemy1.oamIndex].attr0 = ATTR0_HIDE;
        }
    }
    if (enemy2DeathTimer > 0) {
        enemy2DeathTimer--;
        if (enemy2DeathTimer == 0) {
            enemy2.active = 0;
            shadowOAM[enemy2.oamIndex].attr0 = ATTR0_HIDE;
        }
    }
    if (enemy3DeathTimer > 0) {
        enemy3DeathTimer--;
        if (enemy3DeathTimer == 0) {
            enemy3.active = 0;
            shadowOAM[enemy3.oamIndex].attr0 = ATTR0_HIDE;
        }
    }
    if (enemy4DeathTimer > 0) {
        enemy4DeathTimer--;
        if (enemy4DeathTimer == 0) {
            enemy4.active = 0;
            shadowOAM[enemy4.oamIndex].attr0 = ATTR0_HIDE;
        }
    }
}

void updateBomb() {
    if (bomb.active) {
        if (bomb.timer > 0) {
            bomb.timer--;
            if (bomb.timer == 0) {
            // Bomb dropped:
                // BOMB is visible for 20 frames
                bomb.explosionTimer = 20;
                handleExplosion(bomb.x, bomb.y);
            }
        } else if (bomb.explosionTimer > 0) {
            bomb.explosionTimer--;
            if (bomb.explosionTimer == 0) {
                // Clear explosion sprites from OAM
                shadowOAM[bomb.oamIndex].attr0 = ATTR0_HIDE;
                shadowOAM[6].attr0 = ATTR0_HIDE;
                shadowOAM[7].attr0 = ATTR0_HIDE;
                shadowOAM[8].attr0 = ATTR0_HIDE;
                shadowOAM[9].attr0 = ATTR0_HIDE;
                bomb.active = 0;
            }
        }
    }
}

void drawEnemies() {
    // Enemy 1:
    if (enemy1.active) {
        int tileRow = 2;
        int tileCol = 2;

        if (enemy1DeathTimer > 0) {
            tileCol = 1;
            // 15 frame animation when death
            tileRow = (enemy1DeathTimer > 15) ? 0 : 1;
        } else {
            tileRow = enemy1.currentFrame % 2;
        }
        shadowOAM[enemy1.oamIndex].attr0 = ATTR0_Y(enemy1.y) | ATTR0_SQUARE | ATTR0_REGULAR;
        shadowOAM[enemy1.oamIndex].attr1 = ATTR1_X(enemy1.x) | ATTR1_TINY;
        if (enemy1.direction == RIGHT)
            shadowOAM[enemy1.oamIndex].attr1 |= ATTR1_HFLIP;
        shadowOAM[enemy1.oamIndex].attr2 = ATTR2_TILEID(tileRow, tileCol) | ATTR2_PALROW(0);
    } else {
        shadowOAM[enemy1.oamIndex].attr0 = ATTR0_HIDE;
    }

    // Enemy 2:
    if (enemy2.active) {
        int tileRow = 2;
        int tileCol = 2;
        if (enemy2DeathTimer > 0) {
            tileCol = 1;
            tileRow = (enemy2DeathTimer > 15) ? 0 : 1;
        } else {
            tileRow = enemy2.currentFrame % 2;
        }
        shadowOAM[enemy2.oamIndex].attr0 = ATTR0_Y(enemy2.y) | ATTR0_SQUARE | ATTR0_REGULAR;
        shadowOAM[enemy2.oamIndex].attr1 = ATTR1_X(enemy2.x) | ATTR1_TINY;
        if (enemy2.direction == RIGHT)
            shadowOAM[enemy2.oamIndex].attr1 |= ATTR1_HFLIP;
        shadowOAM[enemy2.oamIndex].attr2 = ATTR2_TILEID(tileRow, tileCol) | ATTR2_PALROW(0);
    } else {
        shadowOAM[enemy2.oamIndex].attr0 = ATTR0_HIDE;
    }

    // Enemy 3:
    if (enemy3.active) {
        int tileRow = 2;
        int tileCol = 2;
        if (enemy3DeathTimer > 0) {
            tileCol = 1;
            tileRow = (enemy3DeathTimer > 15) ? 2 : 3;
        } else {
            tileRow = (enemy3.currentFrame % 2) + 2;
        }
        shadowOAM[enemy3.oamIndex].attr0 = ATTR0_Y(enemy3.y) | ATTR0_SQUARE | ATTR0_REGULAR;
        shadowOAM[enemy3.oamIndex].attr1 = ATTR1_X(enemy3.x) | ATTR1_TINY;
        if (enemy3.direction == RIGHT)
            shadowOAM[enemy3.oamIndex].attr1 |= ATTR1_HFLIP;
        shadowOAM[enemy3.oamIndex].attr2 = ATTR2_TILEID(tileRow, tileCol) | ATTR2_PALROW(0);
    } else {
        shadowOAM[enemy3.oamIndex].attr0 = ATTR0_HIDE;
    }

    // Enemy 4:
    if (enemy4.active) {
        int tileRow = 2;
        int tileCol = 2;
        if (enemy4DeathTimer > 0) {
            tileCol = 1;
            tileRow = (enemy4DeathTimer > 15) ? 2 : 3;
        } else {
            tileRow = (enemy4.currentFrame % 2) + 2;
        }
        shadowOAM[enemy4.oamIndex].attr0 = ATTR0_Y(enemy4.y) | ATTR0_SQUARE | ATTR0_REGULAR;
        shadowOAM[enemy4.oamIndex].attr1 = ATTR1_X(enemy4.x) | ATTR1_TINY;
        if (enemy4.direction == RIGHT)
            shadowOAM[enemy4.oamIndex].attr1 |= ATTR1_HFLIP;
        shadowOAM[enemy4.oamIndex].attr2 = ATTR2_TILEID(tileRow, tileCol) | ATTR2_PALROW(0);
    } else {
        shadowOAM[enemy4.oamIndex].attr0 = ATTR0_HIDE;
    }
}

void drawPlayer() {
    int tileIndex = 0;

    // Animating sprite
    switch(player.direction) {
        case DOWN:  tileIndex = 10; break;
        case UP:    tileIndex = 2; break;
        case RIGHT: tileIndex = 11; break;
        case LEFT:  tileIndex = 8; break;
    }
    shadowOAM[player.oamIndex].attr0 = ATTR0_Y(player.y) | ATTR0_SQUARE;
    shadowOAM[player.oamIndex].attr1 = ATTR1_X(player.x);
    shadowOAM[player.oamIndex].attr2 = ATTR2_TILEID(tileIndex, 0) | ATTR2_PALROW(0);
}

void drawBomb() {
    if (bomb.active) {
        if (bomb.timer > 0) {
            // Draw bomb sprite
            shadowOAM[bomb.oamIndex].attr0 = ATTR0_Y(bomb.y) | ATTR0_SQUARE | ATTR0_REGULAR;
            shadowOAM[bomb.oamIndex].attr1 = ATTR1_X(bomb.x);
            shadowOAM[bomb.oamIndex].attr2 = ATTR2_TILEID(BOMB_TILE_ROW, BOMB_TILE_COL) | ATTR2_PALROW(0);
        } else if (bomb.explosionTimer > 0) {
            // Draw center when explode happens
            shadowOAM[bomb.oamIndex].attr0 = ATTR0_Y(bomb.y) | ATTR0_SQUARE | ATTR0_REGULAR;
            shadowOAM[bomb.oamIndex].attr1 = ATTR1_X(bomb.x);
            shadowOAM[bomb.oamIndex].attr2 = ATTR2_TILEID(2, 4) | ATTR2_PALROW(0);
            
            // Left explosion
            if (checkCollisionDestructableWall(bomb.x - TILE_SIZE, bomb.y)) {
                destroySoftBlockAt(bomb.x - TILE_SIZE, bomb.y);
            }
            if (!checkCollisionWorld(bomb.x - TILE_SIZE, bomb.y)) {
                shadowOAM[6].attr0 = ATTR0_Y(bomb.y) | ATTR0_REGULAR;
                shadowOAM[6].attr1 = ATTR1_X(bomb.x - TILE_SIZE);
                shadowOAM[6].attr2 = ATTR2_TILEID(1, 4) | ATTR2_PALROW(0);
            } else {
                shadowOAM[6].attr0 = ATTR0_HIDE;
            }
            
            // Right explosion
            if (checkCollisionDestructableWall(bomb.x + TILE_SIZE, bomb.y)) {
                destroySoftBlockAt(bomb.x + TILE_SIZE, bomb.y);
            }
            if (!checkCollisionWorld(bomb.x + TILE_SIZE, bomb.y)) {
                shadowOAM[7].attr0 = ATTR0_Y(bomb.y) | ATTR0_REGULAR;
                shadowOAM[7].attr1 = ATTR1_X(bomb.x + TILE_SIZE);
                shadowOAM[7].attr2 = ATTR2_TILEID(3, 4) | ATTR2_PALROW(0);
            } else {
                shadowOAM[7].attr0 = ATTR0_HIDE;
            }
            
            // Up explosion
            if (checkCollisionDestructableWall(bomb.x, bomb.y - TILE_SIZE)) {
                destroySoftBlockAt(bomb.x, bomb.y - TILE_SIZE);
            }
            if (!checkCollisionWorld(bomb.x, bomb.y - TILE_SIZE)) {
                shadowOAM[8].attr0 = ATTR0_Y(bomb.y - TILE_SIZE) | ATTR0_REGULAR;
                shadowOAM[8].attr1 = ATTR1_X(bomb.x);
                shadowOAM[8].attr2 = ATTR2_TILEID(2, 3) | ATTR2_PALROW(0);
            } else {
                shadowOAM[8].attr0 = ATTR0_HIDE;
            }
            
            // Down explosion
            if (checkCollisionDestructableWall(bomb.x, bomb.y + TILE_SIZE)) {
                destroySoftBlockAt(bomb.x, bomb.y + TILE_SIZE);
            }
            if (!checkCollisionWorld(bomb.x, bomb.y + TILE_SIZE)) {
                shadowOAM[9].attr0 = ATTR0_Y(bomb.y + TILE_SIZE) | ATTR0_REGULAR;
                shadowOAM[9].attr1 = ATTR1_X(bomb.x);
                shadowOAM[9].attr2 = ATTR2_TILEID(2, 5) | ATTR2_PALROW(0);
            } else {
                shadowOAM[9].attr0 = ATTR0_HIDE;
            }
        }
    }
}

int loseCondition() {
    if (collision(enemy1.x, enemy1.y, enemy1.width, enemy1.height, player.x, player.y, player.width, player.height) ||
        collision(enemy2.x, enemy2.y, enemy2.width, enemy2.height, player.x, player.y, player.width, player.height) ||
        collision(enemy3.x, enemy3.y, enemy3.width, enemy3.height, player.x, player.y, player.width, player.height) ||
        collision(enemy4.x, enemy4.y, enemy4.width, enemy4.height, player.x, player.y, player.width, player.height)) {
        
        // Decrement the lives when hit by an enemy
        lives--;
        if (lives <= 0) {
            // If lives run out, go to lose game state
            goToLose();
        } else {
            // Respawn player if lives remain
            initializePlayer(); 
            // Not a full reset of enemies
            initializeEnemies(0);
        }
        return 1;
    }
    return 0;
}


int winCondition() {
    if (checkCollisionWin(player.x, player.y)) {
        return 1;
    }
    return 0;
}

void handleExplosion(int bx, int by) {
    int explosionTiles[5][2] = {
        {bx, by}, {bx - TILE_SIZE, by}, {bx + TILE_SIZE, by},
        {bx, by - TILE_SIZE}, {bx, by + TILE_SIZE}
    };

    for (int i = 0; i < 5; i++) {
        int ex = explosionTiles[i][0];
        int ey = explosionTiles[i][1];

        // Enemy hit by explosion
        if (enemy1.active && enemy1DeathTimer == 0 &&
            collision(ex, ey, TILE_SIZE, TILE_SIZE, enemy1.x, enemy1.y, enemy1.width, enemy1.height)) {
            enemy1DeathTimer = 50;
            score += 100;
        }
        if (enemy2.active && enemy2DeathTimer == 0 &&
            collision(ex, ey, TILE_SIZE, TILE_SIZE, enemy2.x, enemy2.y, enemy2.width, enemy2.height)) {
            enemy2DeathTimer = 50;
            score += 100;
        }
        if (enemy3.active && enemy3DeathTimer == 0 &&
            collision(ex, ey, TILE_SIZE, TILE_SIZE, enemy3.x, enemy3.y, enemy3.width, enemy3.height)) {
            enemy3DeathTimer = 50;
            score += 150;
        }
        if (enemy4.active && enemy4DeathTimer == 0 &&
            collision(ex, ey, TILE_SIZE, TILE_SIZE, enemy4.x, enemy4.y, enemy4.width, enemy4.height)) {
            enemy4DeathTimer = 50;
            score += 150;
        }

        // Player hit by explosion, but only if they are **not** immune
        if (!playerImmuneToBombs && 
            collision(ex, ey, TILE_SIZE, TILE_SIZE, player.x, player.y, player.width, player.height)) {
            lives--;
            if (lives <= 0) {
                goToLose();
            } else {
                initializePlayer();
                initializeEnemies(0);
            }
        }
    }
}




// Hides all sprites in the shadowOAM (*need to DMA into OAM)
void hideSprites() {
    for (int i = 0; i < 128; i++) {
        shadowOAM[i].attr0 = ATTR0_HIDE;
    }
}
