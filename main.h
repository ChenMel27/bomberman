#ifndef MAIN_H
#define MAIN_H

// States
typedef enum {START, GAMEONE, GAMETWO, PAUSE, WIN, LOSE} STATE;
STATE state;
extern int score;
extern int lives;
extern int timer;
extern int frameCounter;
extern int paused;

void initialize();
void updateGameOne();
void goToStart();
void start();
void goToGameOne();
void gameOne();
void goToGameTwo();
void gameTwo();
void goToPause();
void pause();
void goToLose();
void lose();
void goToWin();
void win();

#endif
