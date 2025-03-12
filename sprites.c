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
#include <stdlib.h>  // for rand()

#define BOMB_TILE_ROW 0
#define BOMB_TILE_COL 3
#define COLLISION_MAP_WIDTH  512
#define COLLISION_MAP_HEIGHT 256
#define EXPLOSION_TILE_ROW 2
#define EXPLOSION_TILE_COL 4

extern int lives;
extern OBJ_ATTR shadowOAM[128];

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

void initializeEnemies() {
    // Initialize enemy1 attributes
    enemy1.x = 104;
    enemy1.y = 104;
    enemy1.currentFrame = 0;
    enemy1.direction = RIGHT;
    enemy1.oamIndex = 1;
    enemy1.width = 8;
    enemy1.height = 8;
    enemy1.numFrames = 4;
    enemy1.timeUntilNextFrame = 15;
    enemy1.active = 1;

    enemy2.x = 136;
    enemy2.y = 24;
    enemy2.currentFrame = 0;
    enemy2.direction = RIGHT;
    enemy2.oamIndex = 2;
    enemy2.width = 8;
    enemy2.height = 8;
    enemy2.numFrames = 4;
    enemy2.timeUntilNextFrame = 15;
    enemy2.active = 1;

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
    enemy3.active = 1;

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
    enemy4.active = 1;

    // Seed the random number generator.
    srand(0);
}

void updatePlayer() {
    // Calculate the four corners of the player sprite.
    int leftX   = player.x;
    int rightX  = player.x + player.width - 1;
    int topY    = player.y;
    int bottomY = player.y + player.height - 1;
    
    // Move DOWN.
    if (BUTTON_HELD(BUTTON_DOWN)) {
        if (player.y + player.height < COLLISION_MAP_HEIGHT &&  // Use COLLISION_MAP_HEIGHT instead of 160
            isPassablePixel(leftX, bottomY + 1) &&
            isPassablePixel(rightX, bottomY + 1)) {
            player.y++;
        }
        player.direction = DOWN;
    }
    
    // Move UP.
    if (BUTTON_HELD(BUTTON_UP)) {
        if (player.y > 0 &&
            isPassablePixel(leftX, topY - 1) &&
            isPassablePixel(rightX, topY - 1)) {
            player.y--;
        }
        player.direction = UP;
    }
    
    // Move RIGHT.
    if (BUTTON_HELD(BUTTON_RIGHT)) {
        if (player.x + player.width < COLLISION_MAP_WIDTH &&  // Use COLLISION_MAP_WIDTH instead of 240
            isPassablePixel(rightX + 1, topY) &&
            isPassablePixel(rightX + 1, bottomY)) {
            player.x++;
        }
        player.direction = RIGHT;
    }
    
    // Move LEFT.
    if (BUTTON_HELD(BUTTON_LEFT)) {
        if (player.x > 0 &&
            isPassablePixel(leftX - 1, topY) &&
            isPassablePixel(leftX - 1, bottomY)) {
            player.x--;
        }
        player.direction = LEFT;
    }
    
    // Bomb placement remains unchanged.
    if (BUTTON_PRESSED(BUTTON_SELECT) && !bomb.active) {
        bomb.x = (player.x / TILE_SIZE) * TILE_SIZE;
        bomb.y = (player.y / TILE_SIZE) * TILE_SIZE;
        bomb.timer = 60; // 60 frames before explosion.
        bomb.active = 1;
    }
}


//-------------------------------
// Updated Enemy Movement
//-------------------------------
void updateEnemies() {
    static int changeTimer = 0;
    changeTimer++;
    
    // Every 30 frames, randomly change direction for enemy1 and enemy2.
    if (changeTimer % 30 == 0) {
        if (enemy1.direction == LEFT || enemy1.direction == RIGHT)
            enemy1.direction = (rand() % 2) ? UP : DOWN;
        else
            enemy1.direction = (rand() % 2) ? LEFT : RIGHT;
        
        if (enemy2.direction == LEFT || enemy2.direction == RIGHT)
            enemy2.direction = (rand() % 2) ? UP : DOWN;
        else
            enemy2.direction = (rand() % 2) ? LEFT : RIGHT;
    }
    
    // Update enemy1 using collision map checks.
    int e1_left   = enemy1.x;
    int e1_right  = enemy1.x + enemy1.width - 1;
    int e1_top    = enemy1.y;
    int e1_bottom = enemy1.y + enemy1.height - 1;
    
    if (enemy1.direction == DOWN) {
        if (isPassablePixel(e1_left, e1_bottom + 1) &&
            isPassablePixel(e1_right, e1_bottom + 1))
            enemy1.y++;
    } else if (enemy1.direction == UP) {
        if (isPassablePixel(e1_left, e1_top - 1) &&
            isPassablePixel(e1_right, e1_top - 1))
            enemy1.y--;
    } else if (enemy1.direction == RIGHT) {
        if (isPassablePixel(e1_right + 1, e1_top) &&
            isPassablePixel(e1_right + 1, e1_bottom))
            enemy1.x++;
    } else if (enemy1.direction == LEFT) {
        if (isPassablePixel(e1_left - 1, e1_top) &&
            isPassablePixel(e1_left - 1, e1_bottom))
            enemy1.x--;
    }
    
    // Update enemy2 using similar logic.
    int e2_left   = enemy2.x;
    int e2_right  = enemy2.x + enemy2.width - 1;
    int e2_top    = enemy2.y;
    int e2_bottom = enemy2.y + enemy2.height - 1;
    
    if (enemy2.direction == DOWN) {
        if (isPassablePixel(e2_left, e2_bottom + 1) &&
            isPassablePixel(e2_right, e2_bottom + 1))
            enemy2.y++;
    } else if (enemy2.direction == UP) {
        if (isPassablePixel(e2_left, e2_top - 1) &&
            isPassablePixel(e2_right, e2_top - 1))
            enemy2.y--;
    } else if (enemy2.direction == RIGHT) {
        if (isPassablePixel(e2_right + 1, e2_top) &&
            isPassablePixel(e2_right + 1, e2_bottom))
            enemy2.x++;
    } else if (enemy2.direction == LEFT) {
        if (isPassablePixel(e2_left - 1, e2_top) &&
            isPassablePixel(e2_left - 1, e2_bottom))
            enemy2.x--;
    }
    
    // Update enemy3 and enemy4 (they move toward the player).
    static int enemyDelayCounter = 0;
    enemyDelayCounter++;
    if (enemyDelayCounter >= 3) {
        enemyDelayCounter = 0;
        // Enemy3: Horizontal movement toward player.
        if (player.x > enemy3.x) {
            int e3_right = enemy3.x + enemy3.width - 1;
            /* if (isPassablePixel(e3_right + 1, enemy3.y) &&
                isPassablePixel(e3_right + 1, enemy3.y + enemy3.height - 1)) */
                enemy3.x++;
        } else if (player.x < enemy3.x) {
            /* if (isPassablePixel(enemy3.x - 1, enemy3.y) &&
                isPassablePixel(enemy3.x - 1, enemy3.y + enemy3.height - 1)) */
                enemy3.x--;
        }
        // Enemy3: Vertical movement.
        if (player.y > enemy3.y) {
            int e3_bottom = enemy3.y + enemy3.height - 1;
            /* if (isPassablePixel(enemy3.x, e3_bottom + 1) &&
                isPassablePixel(enemy3.x + enemy3.width - 1, e3_bottom + 1)) */
                enemy3.y++;
        } else if (player.y < enemy3.y) {
            /* if (isPassablePixel(enemy3.x, enemy3.y - 1) &&
                isPassablePixel(enemy3.x + enemy3.width - 1, enemy3.y - 1)) */
                enemy3.y--;
        }
        
        // Enemy4: Horizontal movement.
        if (player.x > enemy4.x) {
            int e4_right = enemy4.x + enemy4.width - 1;
            /* if (isPassablePixel(e4_right + 1, enemy4.y) &&
                isPassablePixel(e4_right + 1, enemy4.y + enemy4.height - 1)) */
                enemy4.x++;
        } else if (player.x < enemy4.x) {
            /* if (isPassablePixel(enemy4.x - 1, enemy4.y) &&
                isPassablePixel(enemy4.x - 1, enemy4.y + enemy4.height - 1)) */
                enemy4.x--;
        }
        // Enemy4: Vertical movement.
        if (player.y > enemy4.y) {
            int e4_bottom = enemy4.y + enemy4.height - 1;
            /* if (isPassablePixel(enemy4.x, e4_bottom + 1) &&
                isPassablePixel(enemy4.x + enemy4.width - 1, e4_bottom + 1)) */
                enemy4.y++;
        } else if (player.y < enemy4.y) {
            /* if (isPassablePixel(enemy4.x, enemy4.y - 1) &&
                isPassablePixel(enemy4.x + enemy4.width - 1, enemy4.y - 1)) */
                enemy4.y--;
        }
    }
}

void updateBomb() {
    if (bomb.active) {
        if (bomb.timer > 0) {
            bomb.timer--;
            if (bomb.timer == 0) {
                // Bomb detonates: start explosion and set it to be visible for 20 frames.
                bomb.explosionTimer = 20;
                handleExplosion(bomb.x, bomb.y);
            }
        } else if (bomb.explosionTimer > 0) {
            bomb.explosionTimer--;
            if (bomb.explosionTimer == 0) {
                // Clear explosion sprites from OAM.
                shadowOAM[bomb.oamIndex].attr0 = ATTR0_HIDE;
                shadowOAM[6].attr0 = ATTR0_HIDE;
                shadowOAM[7].attr0 = ATTR0_HIDE;
                shadowOAM[8].attr0 = ATTR0_HIDE;
                shadowOAM[9].attr0 = ATTR0_HIDE;
                // End the bomb's active state.
                bomb.active = 0;
            }
        }
    }
}

// Updated drawEnemies() now only draws enemies that are active.
void drawEnemies() {
    if (enemy1.active) {
        shadowOAM[enemy1.oamIndex].attr0 = ATTR0_Y(enemy1.y) | ATTR0_SQUARE | ATTR0_REGULAR;
        shadowOAM[enemy1.oamIndex].attr1 = ATTR1_X(enemy1.x) | ATTR1_TINY;
        shadowOAM[enemy1.oamIndex].attr2 = ATTR2_TILEID(13, 0) | ATTR2_PALROW(0);
    } else {
        shadowOAM[enemy1.oamIndex].attr0 = ATTR0_HIDE;
    }
    
    if (enemy2.active) {
        shadowOAM[enemy2.oamIndex].attr0 = ATTR0_Y(enemy2.y) | ATTR0_SQUARE | ATTR0_REGULAR;
        shadowOAM[enemy2.oamIndex].attr1 = ATTR1_X(enemy2.x) | ATTR1_TINY;
        shadowOAM[enemy2.oamIndex].attr2 = ATTR2_TILEID(13, 0) | ATTR2_PALROW(0);
    } else {
        shadowOAM[enemy2.oamIndex].attr0 = ATTR0_HIDE;
    }
    
    if (enemy3.active) {
        shadowOAM[enemy3.oamIndex].attr0 = ATTR0_Y(enemy3.y) | ATTR0_SQUARE | ATTR0_REGULAR;
        shadowOAM[enemy3.oamIndex].attr1 = ATTR1_X(enemy3.x) | ATTR1_TINY;
        shadowOAM[enemy3.oamIndex].attr2 = ATTR2_TILEID(14, 0) | ATTR2_PALROW(0);
    } else {
        shadowOAM[enemy3.oamIndex].attr0 = ATTR0_HIDE;
    }
    
    if (enemy4.active) {
        shadowOAM[enemy4.oamIndex].attr0 = ATTR0_Y(enemy4.y) | ATTR0_SQUARE | ATTR0_REGULAR;
        shadowOAM[enemy4.oamIndex].attr1 = ATTR1_X(enemy4.x) | ATTR1_TINY;
        shadowOAM[enemy4.oamIndex].attr2 = ATTR2_TILEID(14, 0) | ATTR2_PALROW(0);
    } else {
        shadowOAM[enemy4.oamIndex].attr0 = ATTR0_HIDE;
    }
}

void drawPlayer() {
    int tileIndex = 0;
    switch(player.direction) {
        case DOWN:  tileIndex = 0; break;
        case UP:    tileIndex = 2; break;
        case RIGHT: tileIndex = 4; break;
        case LEFT:  tileIndex = 6; break;
    }
    shadowOAM[player.oamIndex].attr0 = ATTR0_Y(player.y) | ATTR0_SQUARE;
    shadowOAM[player.oamIndex].attr1 = ATTR1_X(player.x);
    shadowOAM[player.oamIndex].attr2 = ATTR2_TILEID(tileIndex, 0) | ATTR2_PALROW(0);
}

void drawBomb() {
    if (bomb.active) {
        if (bomb.timer > 0) {
            // Draw bomb sprite.
            shadowOAM[bomb.oamIndex].attr0 = ATTR0_Y(bomb.y) | ATTR0_SQUARE | ATTR0_REGULAR;
            shadowOAM[bomb.oamIndex].attr1 = ATTR1_X(bomb.x);
            shadowOAM[bomb.oamIndex].attr2 = ATTR2_TILEID(BOMB_TILE_ROW, BOMB_TILE_COL) | ATTR2_PALROW(0);
        } else if (bomb.explosionTimer > 0) {
            // Draw center explosion.
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
    if (collision(enemy1.x, enemy1.y, enemy1.width, enemy1.height,
                  player.x, player.y, player.width, player.height) ||
        collision(enemy2.x, enemy2.y, enemy2.width, enemy2.height,
                  player.x, player.y, player.width, player.height) ||
        collision(enemy3.x, enemy3.y, enemy3.width, enemy3.height,
                  player.x, player.y, player.width, player.height) ||
        collision(enemy4.x, enemy4.y, enemy4.width, enemy4.height,
                  player.x, player.y, player.width, player.height))
    {
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

// Updated handleExplosion() marks enemies as inactive and hides their sprites.
void handleExplosion(int bx, int by) {
    // Define explosion area: center, left, right, up, and down.
    int explosionTiles[5][2] = {
        {bx, by},
        {bx - TILE_SIZE, by},
        {bx + TILE_SIZE, by},
        {bx, by - TILE_SIZE},
        {bx, by + TILE_SIZE}
    };

    for (int i = 0; i < 5; i++) {
        int ex = explosionTiles[i][0];
        int ey = explosionTiles[i][1];

        // Check collision with enemy1.
        if (enemy1.active && collision(ex, ey, TILE_SIZE, TILE_SIZE, enemy1.x, enemy1.y, enemy1.width, enemy1.height)) {
            enemy1.active = 0;
            shadowOAM[enemy1.oamIndex].attr0 = ATTR0_HIDE;
        }
        
        // Check collision with enemy2.
        if (enemy2.active && collision(ex, ey, TILE_SIZE, TILE_SIZE, enemy2.x, enemy2.y, enemy2.width, enemy2.height)) {
            enemy2.active = 0;
            shadowOAM[enemy2.oamIndex].attr0 = ATTR0_HIDE;
        }
        
        // Check collision with enemy3.
        if (enemy3.active && collision(ex, ey, TILE_SIZE, TILE_SIZE, enemy3.x, enemy3.y, enemy3.width, enemy3.height)) {
            enemy3.active = 0;
            shadowOAM[enemy3.oamIndex].attr0 = ATTR0_HIDE;
        }
        
        // Check collision with enemy4.
        if (enemy4.active && collision(ex, ey, TILE_SIZE, TILE_SIZE, enemy4.x, enemy4.y, enemy4.width, enemy4.height)) {
            enemy4.active = 0;
            shadowOAM[enemy4.oamIndex].attr0 = ATTR0_HIDE;
        }
        
        // Check for soft block collision and destroy if necessary.
        if (checkCollisionDestructableWall(ex, ey)) {
            destroySoftBlockAt(ex, ey);
        }
        
        // Optionally: Check if the player is hit by the explosion.
        if (collision(ex, ey, TILE_SIZE, TILE_SIZE, player.x, player.y, player.width, player.height)) {
            // Implement player damage or loss condition.
        }
    }
}

// Hides all sprites in the shadowOAM; must DMA shadowOAM into OAM after calling this function.
void hideSprites() {
    for (int i = 0; i < 128; i++) {
        shadowOAM[i].attr0 = ATTR0_HIDE;
    }
}
