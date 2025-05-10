# Object-Avoidance-Game-in-Assembly-8086

# 🚗 Object Avoidance Game in Assembly Language

[![MIT License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
[![Platform: DOS](https://img.shields.io/badge/platform-DOS-blue.svg)]()
[![Language: x86 Assembly](https://img.shields.io/badge/language-x86%20Assembly-yellow.svg)]()

A retro-style object avoidance game written in x86 Assembly for DOS.  
Move your car up and down to dodge incoming obstacles and survive as long as you can!

---

## 🛠️ Features

- Real-time keyboard controls (Shift: Up, Space: Down, NumLock: Quit)
- Score tracking and color changes at milestones
- Smooth obstacle movement and collision detection
- Runs in DOSBox, QEMU, or real hardware

---

## 🚀 Getting Started

### Prerequisites

- [NASM](https://www.nasm.us/) assembler
- [DOSBox](https://www.dosbox.com/) or [QEMU](https://www.qemu.org/)

### Build

nasm -f bin src/object_avoidance_game.asm -o object_avoidance_game.com

### Run

dosbox object_avoidance_game.com

---

## 🎮 Controls

| Key      | Action         |
|----------|---------------|
| Shift    | Move Up       |
| Spacebar | Move Down     |
| NumLock  | Quit Game     |

---

## 📄 Documentation

- [Game Design](docs/design.md)

---

## 📜 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
