# **Bomberman GBA**

## **📌 Project Overview**
This is Melanie Chen's Bomberman-style game.

## **Extra Credit**
- 60 second timer that lasts the entire level and only resets when the round is over (onto the next)

## **Requirements**
The following features are implemented in this version of my Bomberman game:

### **1. Bomberman**
- The player can move **left, right, up, and down** using the pad.
- The player changes frames for movement in each direction.
- Losing a life causes the player to go back to their original location.

### **2. Bomb**
- The player can place bombs using the **A button**.
- The bomb has a **visual representation** and detonates after a set timer.
- **Explosion range** covers four adjacent tiles (left, right, top, bottom).
- Bomb explosions **kill enemies** and destroy soft blocks.
- **Only one bomb can exist at a time** unless power-ups are enabled.
- **Player is immune to their own bombs** if they collect the appropriate power-up.

### **3. Enemy**
- **Four enemies per level** with two different movement behaviors.
- Each enemy is **animated** (2 frames per direction).
- Defeated enemies **play a death animation** before disappearing.
- Two different enemy types include:
  1. Moves randomly and frequently changes direction and **cannot pass through soft blocks**.
  2. Moves randomly but **can pass through soft blocks**.
- If an enemy touches the player, they lose a life.

### **4. Power-Up**
- Power-up type is:
  - **Player is immune to their own bomb blasts**.

### **5. Exit**
- Each level has **a hidden exit** blocked by a soft block.
- Exit unlocks only after all enemies are defeated.

### **6. Scoring**
- Score increases **when the player defeats an enemy**.
- Score carries over between levels.

### **7. Lives**
- The player starts with **3 lives per level**.
- Losing all lives **causes player to lose**.
- If hit by an enemy or player's own bomb explosion, **lives decrease**.

### **8. Levels**
- Two levels with different soft-block layouts.
- Each level contains:
  - Hard blocks (indestructible).
  - At least 5 soft blocks, which are destroyed by bombs.
  - 4 Enemies and one hidden exit.


#### **Win Condition**
- The player defeats all enemies and reaches the exit in both levels.

#### **Lose Condition**
- The player loses all lives.

---

