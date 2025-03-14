# **Bomberman GBA Clone**

## **📌 Project Overview**
This is a **Game Boy Advance (GBA) Bomberman-style game**, where the player navigates through multiple levels, strategically placing bombs to defeat enemies and uncover the hidden exit. The game is built using **C, Mode 0 for tilemaps, and GBA sprite handling**.

## **🛠️ Requirements**
The following features and mechanics are implemented in the game:

### **1️⃣ Player (Bomberman) Mechanics**
- The player can move **left, right, up, and down** using the D-pad.
- The player is an **animated sprite** with different frames for movement in each direction.
- Losing a life respawns the player at their original location.
- The player sprite is custom-designed.

### **2️⃣ Bomb Mechanics**
- The player can place bombs using the **A button**.
- The bomb has a **visual representation** and detonates after a set timer.
- **Explosion range** covers four adjacent tiles (left, right, top, bottom).
- Bomb explosions **kill enemies** and destroy soft blocks.
- **Only one bomb can exist at a time** unless power-ups are enabled.
- **Player is immune to their own bombs** if they collect the appropriate power-up.

### **3️⃣ Enemy Mechanics**
- At least **four enemies per level**, each with different movement behaviors.
- Each enemy has **animated movement** (2 frames per direction).
- Defeated enemies **play a death animation** before disappearing.
- Different enemy types include:
  1. Moves back and forth, changing direction near the player.
  2. Moves randomly and frequently changes direction.
  3. Moves randomly but pursues the player when close.
  4. Moves randomly but **can pass through soft blocks**.
  5. Slow-moving but **can pass through both soft and hard blocks**.
- **If an enemy touches the player, they lose a life**.

### **4️⃣ Power-Up Mechanics**
- At least **one power-up per level**.
- Power-ups **only last for the current level**.
- Power-up types include:
  - **Player is immune to their own bomb blasts**.

### **5️⃣ Exit Mechanics**
- Each level has **one hidden exit**, placed under a soft block.
- **Exit unlocks only after all enemies are defeated**.

### **6️⃣ Score System**
- Score is displayed **on-screen**.
- Score increases **when the player defeats an enemy**.
- Score **carries over** between levels.

### **7️⃣ Lives System**
- The player starts with **3 lives per level**.
- Losing all lives **results in a Game Over**.
- If hit by an enemy or bomb explosion, **lives decrease**.

### **8️⃣ Sprite Transparency**
- **Transparency** is used for sprites to blend correctly into the game environment.

### **9️⃣ Level Design**
- The game consists of **at least two levels** with unique layouts.
- Each level contains:
  - **Hard blocks** (indestructible).
  - **At least 5 soft blocks**, which can be destroyed by bombs.
  - **Enemies and a hidden exit**.
- Levels use **Mode 0 tilemaps** for optimized performance.

### **🔟 State Machine Implementation**
The game features a **finite state machine** with the following states:
- **Start Screen**: Displays before gameplay begins.
- **Game One**: First level.
- **Game Two**: Second level.
- **Pause Screen**: Allows the player to resume or quit.
- **Win Screen**: Player wins after completing both levels.
- **Lose Screen**: Player loses all lives.

#### **✅ Win Condition**
- The player **defeats all enemies** and reaches the **exit** in both levels.

#### **❌ Lose Condition**
- The player **loses all lives**.

### **1️⃣1️⃣ Tilemap Usage**
- The game uses **tilemaps and tilesets** for efficient rendering.
- Tilemaps define **level structure**, while the tileset contains **block designs**.

### **1️⃣2️⃣ Collision Detection**
- A **collision map** is used to detect player, enemy, and object collisions.
- The game ensures **smooth movement** while preventing movement through walls.

---

## **🚀 How It Works**
### **Game Structure**
1. **The player starts at the beginning of the level**.
2. **The goal is to defeat all enemies and uncover the exit**.
3. **The player places bombs** to destroy soft blocks and enemies.
4. **Once all enemies are defeated, the exit becomes accessible**.
5. **The player moves to the next level upon reaching the exit**.
6. **If the player loses all lives, they go to the Game Over screen**.
