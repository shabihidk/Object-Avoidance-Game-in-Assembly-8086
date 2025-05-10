# Object Avoidance Game – Design Document

## Overview
A simple object avoidance game written in x86 Assembly, running in text mode.

## Data Structures
- **Player:** 16x11 matrix, drawn at a variable offset.
- **Obstacles:** 8 rows of 80 columns, shift left every few ticks.
- **Score:** Incremented every tick survived.

## Core Logic
- Player moves up/down using Shift and Space.
- Obstacles shift left, new ones appear from the right.
- Collision detection checks for overlap between player and obstacles.

## Interrupts
- **Timer ISR:** Shifts obstacles, updates score, redraws.
- **Keyboard ISR:** Handles player movement and quit key.

## Build & Run
See [README.md](../README.md).
