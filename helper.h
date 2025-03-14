#ifndef HELPER_H
#define HELPER_H

// Colliion map
int isPassablePixel(int x, int y, int game);
unsigned char colorAt(int x, int y);
unsigned char colorAt2(int x, int y);

// Collision tiles
unsigned short getTileAtWorld(int worldX, int worldY);
int checkCollisionWorld(int worldX, int worldY);
int checkCollisionDestructableWall(int worldX, int worldY);
int checkCollisionSoftBlock(int worldX, int worldY);
int checkCollisionWin(int worldX, int worldY);
void destroySoftBlockAt(int worldX, int worldY);

// Drawing
void drawText(int tileX, int tileY, char *text);
void drawNumber(int tileX, int tileY, int num);

// Xtra
int checkPlayerEnemyCollision();

#endif