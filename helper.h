#ifndef HELPER_H
#define HELPER_H

// --- Collision Map Helpers ---
int isPassablePixel(int x, int y, int game);
unsigned char colorAt(int x, int y);

// --- Tile-based Collision Functions (for bomb explosion, etc.) ---
unsigned short getTileAtWorld(int worldX, int worldY);
int checkCollisionWorld(int worldX, int worldY);
int checkCollisionDestructableWall(int worldX, int worldY);
int checkCollisionSoftBlock(int worldX, int worldY);
int checkCollisionWin(int worldX, int worldY);
void destroySoftBlockAt(int worldX, int worldY);

#endif // HELPER_H
