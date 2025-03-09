#ifndef HELPER_H
#define HELPER_H

typedef enum {
    DOWN,
    RIGHT,
    UP,
    LEFT
} DIRECTION;

unsigned short getTileAtWorld(int worldX, int worldY);
int checkCollisionWorld(int worldX, int worldY);
int checkCollisionDestructableWall(int worldX, int worldY);
int checkCollisionSoftBlock(int worldX, int worldY);
int checkCollisionWin(int worldX, int worldY);

#endif