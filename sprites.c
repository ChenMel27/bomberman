#include "sprites.h"

#include "gba.h"
#include "mode0.h"
#include "sprites.h"
#include "print.h"
#include "bg.h"
#include "tileset.h"
#include "sprite.h"
#include "gameOne.h"
#include <stdlib.h>  // for rand()

#define BOMB_TILE_ROW 2
#define BOMB_TILE_COL 8

#define EXPLOSION_TILE_ROW 3
#define EXPLOSION_TILE_COL 8


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

BOMB bomb = {0, 0, 0, 0, 0, 5};  // Assuming oamIndex 5 is reserved for the bomb sprite

void initializePlayer() {
    player.x = 0;
    player.y = 24;
    player.currentFrame = 0;
    player.direction = 0;
    player.oamIndex = 0;
    player.width = 32;
    player.height = 32;
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
    enemy1.direction = RIGHT;  // Start moving right
    enemy1.oamIndex = 1;
    enemy1.width = 8;
    enemy1.height = 8;
    enemy1.numFrames = 4;
    enemy1.timeUntilNextFrame = 15;

    enemy2.x = 136;
    enemy2.y = 24;
    enemy2.currentFrame = 0;
    enemy2.direction = RIGHT;
    enemy2.oamIndex = 2;
    enemy2.width = 8;
    enemy2.height = 8;
    enemy2.numFrames = 4;
    enemy2.timeUntilNextFrame = 15;

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

    // Seed the random number generator.
    srand(0);
}

void updateEnemies() {
    // Timer to control when to change direction for enemy1 and enemy2.
    static int changeTimer = 0;
    changeTimer++;

    // Every 30 frames, change enemy1 and enemy2 movement axis.
    if (changeTimer % 30 == 0) {
        // For enemy1: if moving horizontally, switch to vertical; otherwise switch to horizontal.
        if (enemy1.direction == LEFT || enemy1.direction == RIGHT) {
            enemy1.direction = (rand() % 2) ? UP : DOWN;
        } else {
            enemy1.direction = (rand() % 2) ? LEFT : RIGHT;
        }

        // For enemy2: if moving horizontally, switch to vertical; otherwise switch to horizontal.
        if (enemy2.direction == LEFT || enemy2.direction == RIGHT) {
            enemy2.direction = (rand() % 2) ? UP : DOWN;
        } else {
            enemy2.direction = (rand() % 2) ? LEFT : RIGHT;
        }
    }

    // Update enemy1 movement
    if (enemy1.direction == DOWN) {
        if (!checkCollisionWorld(enemy1.x, enemy1.y + 1) &&
            !checkCollisionDestructableWall(enemy1.x, enemy1.y + 1)) {
            enemy1.y++;
        }
    } else if (enemy1.direction == UP) {
        if (!checkCollisionWorld(enemy1.x, enemy1.y - 1) &&
            !checkCollisionDestructableWall(enemy1.x, enemy1.y - 1)) {
            enemy1.y--;
        }
    } else if (enemy1.direction == RIGHT) {
        if (!checkCollisionWorld(enemy1.x + 1, enemy1.y) &&
            !checkCollisionDestructableWall(enemy1.x + 1, enemy1.y)) {
            enemy1.x++;
        }
    } else if (enemy1.direction == LEFT) {
        if (!checkCollisionWorld(enemy1.x - 1, enemy1.y) &&
            !checkCollisionDestructableWall(enemy1.x - 1, enemy1.y)) {
            enemy1.x--;
        }
    }

    // Update enemy2 movement
    if (enemy2.direction == DOWN) {
        if (!checkCollisionWorld(enemy2.x, enemy2.y + 1) &&
            !checkCollisionDestructableWall(enemy2.x, enemy2.y + 1)) {
            enemy2.y++;
        }
    } else if (enemy2.direction == UP) {
        if (!checkCollisionWorld(enemy2.x, enemy2.y - 1) &&
            !checkCollisionDestructableWall(enemy2.x, enemy2.y - 1)) {
            enemy2.y--;
        }
    } else if (enemy2.direction == RIGHT) {
        if (!checkCollisionWorld(enemy2.x + 1, enemy2.y) &&
            !checkCollisionDestructableWall(enemy2.x + 1, enemy2.y)) {
            enemy2.x++;
        }
    } else if (enemy2.direction == LEFT) {
        if (!checkCollisionWorld(enemy2.x - 1, enemy2.y) &&
            !checkCollisionDestructableWall(enemy2.x - 1, enemy2.y)) {
            enemy2.x--;
        }
    }

    // Add a frame delay for enemy3 and enemy4 movement.
    // They will only update their positions every 3 frames.
    static int enemyDelayCounter = 0;
    enemyDelayCounter++;
    if (enemyDelayCounter >= 3) {
        enemyDelayCounter = 0;
        // Enemy3 movement: move one pixel toward the player's position.
        if (player.x > enemy3.x) {
            enemy3.x++;
        } else if (player.x < enemy3.x) {
            enemy3.x--;
        }
        if (player.y > enemy3.y) {
            enemy3.y++;
        } else if (player.y < enemy3.y) {
            enemy3.y--;
        }

        // Enemy4 movement: move one pixel toward the player's position.
        if (player.x > enemy4.x) {
            enemy4.x++;
        } else if (player.x < enemy4.x) {
            enemy4.x--;
        }
        if (player.y > enemy4.y) {
            enemy4.y++;
        } else if (player.y < enemy4.y) {
            enemy4.y--;
        }
    }
}

void updatePlayer() {
    // Move DOWN.
    if (BUTTON_HELD(BUTTON_DOWN)) {
        if (player.y < (MAP_HEIGHT * TILE_SIZE) - player.height) {
            if (!checkCollisionWorld(player.x, player.y + 1) &&
                !checkCollisionDestructableWall(player.x, player.y + 1)) {
                ++player.y;                   

            }
        }
        player.direction = DOWN;
    }

    // Move UP.
    if (BUTTON_HELD(BUTTON_UP)) {
        if (player.y > 0) {
            if (!checkCollisionWorld(player.x, player.y - 1) &&
                !checkCollisionDestructableWall(player.x, player.y - 1)) {
                --player.y;                   

            }
        }
        player.direction = UP;
    }

    // Move RIGHT.
    if (BUTTON_HELD(BUTTON_RIGHT)) {
        if (player.x < (MAP_WIDTH * TILE_SIZE - player.width)) {
            if (!checkCollisionWorld(player.x + 1, player.y) &&
                !checkCollisionDestructableWall(player.x + 1, player.y)) {
                ++player.x;
            }
        }
        player.direction = RIGHT;
    }

    // Move LEFT.
    if (BUTTON_HELD(BUTTON_LEFT)) {
        if (player.x > 0) {
            if (!checkCollisionWorld(player.x - 1, player.y) &&
                !checkCollisionDestructableWall(player.x - 1, player.y)) {
                --player.x;
            }
        }
        player.direction = LEFT;
    }

    // Inside your updatePlayer() or main game loop:
    if(BUTTON_PRESSED(BUTTON_A) && !bomb.active) {
        // Snap the bomb to the tile grid based on player's position
        bomb.x = (player.x / TILE_SIZE) * TILE_SIZE;
        bomb.y = (player.y / TILE_SIZE) * TILE_SIZE;
        bomb.timer = 60;          // For example, wait 60 frames before explosion
        bomb.active = 1;
    }

}

void updateBomb() {
    if (bomb.active) {
        if (bomb.timer > 0) {
            bomb.timer--;
            if (bomb.timer == 0) {
                // Bomb detonates: start explosion
                bomb.explosionTimer = 15;  // Explosion visible for 15 frames
                // Handle collision effects (damage enemies/soft blocks, hurt player)
                handleExplosion(bomb.x, bomb.y);
            }
        } else if (bomb.explosionTimer > 0) {
            bomb.explosionTimer--;
            if (bomb.explosionTimer == 0) {
                // End explosion and remove bomb from the game
                bomb.active = 0;
            }
        }
    }
}


void drawEnemies() {
    shadowOAM[enemy1.oamIndex].attr0 = ATTR0_Y(enemy1.y) | ATTR0_SQUARE | ATTR0_REGULAR;
    shadowOAM[enemy1.oamIndex].attr1 = ATTR1_X(enemy1.x) | ATTR1_TINY;
    shadowOAM[enemy1.oamIndex].attr2 = ATTR2_TILEID(13, 0) | ATTR2_PALROW(0);

    shadowOAM[enemy2.oamIndex].attr0 = ATTR0_Y(enemy2.y) | ATTR0_SQUARE | ATTR0_REGULAR;
    shadowOAM[enemy2.oamIndex].attr1 = ATTR1_X(enemy2.x) | ATTR1_TINY;
    shadowOAM[enemy2.oamIndex].attr2 = ATTR2_TILEID(13, 0) | ATTR2_PALROW(0);

    shadowOAM[enemy3.oamIndex].attr0 = ATTR0_Y(enemy3.y) | ATTR0_SQUARE | ATTR0_REGULAR;
    shadowOAM[enemy3.oamIndex].attr1 = ATTR1_X(enemy3.x) | ATTR1_TINY;
    shadowOAM[enemy3.oamIndex].attr2 = ATTR2_TILEID(14, 0) | ATTR2_PALROW(0);

    shadowOAM[enemy4.oamIndex].attr0 = ATTR0_Y(enemy4.y) | ATTR0_SQUARE | ATTR0_REGULAR;
    shadowOAM[enemy4.oamIndex].attr1 = ATTR1_X(enemy4.x) | ATTR1_TINY;
    shadowOAM[enemy4.oamIndex].attr2 = ATTR2_TILEID(14, 0) | ATTR2_PALROW(0);
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
            // Draw the bomb sprite on the tile
            shadowOAM[bomb.oamIndex].attr0 = ATTR0_Y(bomb.y) | ATTR0_SQUARE;
            shadowOAM[bomb.oamIndex].attr1 = ATTR1_X(bomb.x);
            // Use a bomb tile (assume bombTileRow and bombTileCol are defined)
            shadowOAM[bomb.oamIndex].attr2 = ATTR2_TILEID(BOMB_TILE_ROW, BOMB_TILE_COL) | ATTR2_PALROW(0);
        } else if (bomb.explosionTimer > 0) {
            // Option 1: Change the bomb sprite into an explosion sprite.
            // Option 2: Draw explosion sprites on all 5 affected tiles (using multiple OAM entries).
            // Here’s an example for the center explosion:
            shadowOAM[bomb.oamIndex].attr0 = ATTR0_Y(bomb.y) | ATTR0_SQUARE;
            shadowOAM[bomb.oamIndex].attr1 = ATTR1_X(bomb.x);
            shadowOAM[bomb.oamIndex].attr2 = ATTR2_TILEID(EXPLOSION_TILE_ROW, EXPLOSION_TILE_COL) | ATTR2_PALROW(0);
            
            // For adjacent explosion effects, you could use additional OAM entries:
            // For instance, left explosion using OAM index 6:
            shadowOAM[6].attr0 = ATTR0_Y(bomb.y);
            shadowOAM[6].attr1 = ATTR1_X(bomb.x - TILE_SIZE);
            shadowOAM[6].attr2 = ATTR2_TILEID(EXPLOSION_TILE_ROW, EXPLOSION_TILE_COL) | ATTR2_PALROW(0);
            // Do similarly for right, up, and down.
        }
    }
}


int loseCondition() {
    if (collision(enemy1.x, enemy1.y, enemy1.width, enemy1.y,
        player.x, player.y, player.width, player.height) ||
        collision(enemy2.x, enemy2.y, enemy2.width, enemy2.y,
            player.x, player.y, player.width, player.height) ||
        collision(enemy3.x, enemy3.y, enemy3.width, enemy3.y,
            player.x, player.y, player.width, player.height) ||
        collision(enemy4.x, enemy4.y, enemy4.width, enemy4.y,
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
    return(0);
}

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

        // Check against each enemy:
        if(collision(ex, ey, TILE_SIZE, TILE_SIZE, enemy1.x, enemy1.y, enemy1.width, enemy1.height)) {
            // Remove or "kill" enemy1 (implement killEnemy() accordingly)
            shadowOAM[enemy1.oamIndex].attr0 = ATTR0_HIDE;
        }
        if(collision(ex, ey, TILE_SIZE, TILE_SIZE, enemy2.x, enemy2.y, enemy2.width, enemy2.height)) {
            shadowOAM[enemy2.oamIndex].attr0 = ATTR0_HIDE;
        }
        if(collision(ex, ey, TILE_SIZE, TILE_SIZE, enemy3.x, enemy3.y, enemy3.width, enemy3.height)) {
            shadowOAM[enemy3.oamIndex].attr0 = ATTR0_HIDE;
        }
        if(collision(ex, ey, TILE_SIZE, TILE_SIZE, enemy4.x, enemy4.y, enemy4.width, enemy4.height)) {
            shadowOAM[enemy4.oamIndex].attr0 = ATTR0_HIDE;
        }
        
        // Check for soft block collision (assuming a function or data structure exists):
        if (checkCollisionSoftBlock(ex, ey)) {
            destroySoftBlockAt(ex, ey);
        }
        
        // Check if the player is hit:
        if(collision(ex, ey, TILE_SIZE, TILE_SIZE, player.x, player.y, player.width, player.height)) {
            return 0;
        }
    }
}


// Hides all sprites in the shadowOAM; Must DMA the shadowOAM into the OAM after calling this function
void hideSprites() {
    for (int i = 0; i < 128; i++) {
        shadowOAM[i].attr0 = ATTR0_HIDE;
    }
}


