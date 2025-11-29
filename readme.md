# Block Planner (WIP)

A small browser-based block mosaic editor built in Godot.

**Live Demo:** https://webbiscuit.github.io/block-planner/  

## Overview

Block Planner is a lightweight tool for building simple 2D block mosaics.  
Click to place coloured studs, switch colours via the palette, and experiment with patterns or pixel-style designs.

## Controls

- **Left-click:** place a stud  
- **Right-click:** erase  
- **Click a palette button:** change colour

## Deployment

The exported Web build is placed in the `docs/` folder and served via GitHub Pages:

https://webbiscuit.github.io/block-planner/

To update the live version:

```
Export Project → Web → docs/
git add docs
git commit -m "Update web build"
git push
```
