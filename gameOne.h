#ifndef GAMEONE_H
#define GAMEONE_H

// Def
#define TILE_SIZE   8
#define MAP_WIDTH   32
#define MAP_HEIGHT  32
#define SPRITE_WIDTH  8
#define SPRITE_HEIGHT 8

extern int score;
extern int lives;
extern int timer;

void updateGameOne();
void drawGameOne();

#endif
