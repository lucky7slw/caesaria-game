![CaesarIA](https://bitbucket-assetroot.s3.amazonaws.com/c/photos/2013/Nov/12/caesaria-logo-3368332030-11_avatar.png)

Master: ![Build Status](https://travis-ci.org/dalerank/caesaria-game.svg?branch=master) Linux: ![Build Status](https://travis-ci.org/dalerank/caesaria-game.svg?branch=stable) Windows: ![Master:Windows](https://travis-ci.org/dalerank/caesaria-game.svg?branch=windows-build) Android: ![Build Status](https://travis-ci.org/dalerank/caesaria-game.svg?branch=android-build) Macos: ![Build Status](https://travis-ci.org/dalerank/caesaria-game.svg?branch=macos-build)

![IndieDb Rating](http://button.indiedb.com/popularity/medium/games/27823.png)

# CaesarIA 0.6 (2025 Edition)

Work for CaesarIA began in 2009, it was a wide screen mod for Caesar III. In 2012 development moved to a standalone game with its own engine. In 2014, the game was released on Steam, but remained open-source software. It is an open-source remake of the popular citybuilder/economic strategy game Caesar III by Impressions Games.

**2025 Update:** This version includes modern platform support (iOS/iPadOS), enhanced touch controls, improved UI/UX, and quality-of-life improvements. Most importantly, it adds **unprecedented strategic depth** with dynamic economics, complex citizen simulation, political intrigue, technology trees, and branching narrative events—transforming CaesarIA into a rich grand strategy experience while honoring the Caesar III legacy.

CaesarIA is playable and actively maintained. You can download and test the game on Windows, Linux, macOS, Android, iOS, and iPadOS. Information about releases will be posted on our repository.

See more info at the ours [website](https://bitbucket.org/dalerank/caesaria/wiki/Home)

## Installation

CaesarIA requires some resources from a copy of the original game.
When installing manually, copy the Caesar III .sg2 and .555 files to 
CaesarIA's gfx folder: <game directory>\resources\gfx, 
videos to <game directory>\resources\smk and sound to <game directory>\resources\audio

The resources can be in a different folder as the CaesarIA data.
You can also specify your own path by passing the command-line
argument "-c3gfx <path to CaesarIII folder>" when running CaesarIA.

### Saves

CaesarIA will check the following folders for saves:

- **Windows**: <game directory>\saves
- **Linux**: <userhome>/.caesaria/saves
- **macOS**: <userhome>/.caesaria/saves or ~/Library/Application Support/CaesarIA/saves
- **iOS/iPadOS**: App sandbox Documents folder

### Resources

1. It's recommended you copy the resources to the "gfx" folder.
The installer does not automatically detect a Caesar III installation.

2. You may need to run the updater.[exe/linux/macos], which will download
all assets necessary for playing the game: configs, textures, sounds etc.

3. You may download the new set of graphics, which we use in steam version

## Configuration

CaesarIA has a some settings which can be
customized, both in-game and out-game. These options are global
and affect any old or new savegame.

For more details please check the [wiki](https://bitbucket.org/dalerank/caesaria/wiki/Configuration%20files).

## 2025 Edition Features

### Strategic Depth & Complexity

CaesarIA 2025 is more than a city builder—it's a **grand strategy simulation**:

- **Advanced Economics**: Dynamic markets, supply/demand pricing, quality tiers, banking, loans, investments, inflation, market crashes
- **Living Citizens**: Individual personalities, social classes, family dynasties, crime & justice, disease outbreaks, mental health
- **Political Intrigue**: Competing factions, elections, conspiracies, coups, assassinations, espionage
- **Deep Diplomacy**: Treaties, trade agreements, military alliances, espionage, realistic warfare
- **Technology Research**: Unlock innovations in agriculture, construction, military, medicine, and administration
- **Environmental Challenges**: Seasons, disasters, climate, resource degradation, sustainability
- **Branching Narratives**: Dynamic event chains where your choices have lasting consequences
- **Multiple Victory Paths**: Win through economics, military conquest, culture, or political power

See **docs/GAMEPLAY_DEPTH_GUIDE.md** for the complete strategy guide!

### Modern UI & Stunning Graphics

**Completely redesigned interface** for 2025:
- **Beautiful Design**: Flat, modern aesthetic with subtle depth and shadows
- **Three Themes**: Light mode, Dark mode (OLED-optimized), High Contrast
- **Perfect Typography**: SF Pro on iOS, responsive sizing, Dynamic Type support
- **Touch-Optimized**: 44pt minimum touch targets, generous spacing, swipe gestures
- **Smooth Animations**: Spring physics, 120 FPS on ProMotion displays
- **iOS Native**: Bottom sheets, blur effects, haptic feedback, large titles

**Next-gen graphics on iOS/iPadOS**:
- **Retina Perfect**: @2x and @3x assets, crystal-clear on all displays
- **120 FPS**: ProMotion support (iPhone 14 Pro+, iPad Pro)
- **HDR & Display P3**: 25% more colors, 1200 nits peak brightness
- **Metal API**: 3x faster than OpenGL, native GPU acceleration
- **Realistic Rendering**: PBR materials, global illumination, soft shadows
- **Beautiful Water**: Reflections, refraction, caustics, realistic waves
- **Cinematic Effects**: Bloom, color grading, depth of field
- **5,000 Particles**: Smoke, fire, water splashes, all beautifully lit
- **Smart Performance**: Auto-quality scaling, thermal management, battery optimization

See **docs/UI_GRAPHICS_GUIDE.md** for the complete visual showcase!

### iOS and iPadOS Support
CaesarIA now runs natively on iPhone and iPad with optimized touch controls:
- Pinch-to-zoom for easy map navigation
- Long-press for building information
- Two-finger tap for context menus
- Core Haptics for immersive feedback
- Dynamic Island integration

**Want to play on your iPhone/iPad?**
- 📱 **Quick Start**: See **docs/IOS_QUICKSTART_GUIDE.md** for step-by-step instructions (30 minutes)
- 📖 **Full Details**: See **INSTALL_IOS** for comprehensive build documentation
- ⚡ **TL;DR**: Need Xcode + CMake, copy Caesar III resources, build, install - that's it!

### Modern Gameplay Enhancements
- **Auto-save**: Never lose progress with configurable auto-save intervals
- **Quick Build Mode**: Preview buildings before placement with ghost overlays
- **Smart Roads**: Auto-connecting roads with grid snapping
- **Undo/Redo**: Reverse building placement mistakes (up to 10 steps)
- **Game Speed Control**: Play at 0.5x to 3.0x speed
- **Enhanced Minimap**: Resource overlays, threats, and clickable navigation

### Quality of Life
- Adaptive UI scaling for all screen sizes
- Dark mode and high contrast options
- Colorblind-friendly modes
- Notification history and priority system
- Budget forecasting and price history charts
- Context-sensitive help and interactive tutorials

### Performance
- 60 FPS support with dynamic LOD
- Optimized memory management
- Background rendering optimizations

For complete feature list, see **changes.md**

## Development

CaesarIA does not require any specific frameworks - all the frameworks we need are placed in the game repository. The game engine used is a patched version of SDL2, which is also packaged as part of game. You may need to install gcc or any compiler to be able to build game.
We use "cmake" for creating configs and building the game.

### Platform-Specific Build Instructions
- **Linux**: See INSTALL_LINUX
- **Windows**: See INSTALL_WINDOWS
- **macOS**: See INSTALL_MACOSX
- **Android**: See INSTALL_ANDROID
- **iOS/iPadOS**: See INSTALL_IOS (new in 2025!)

It's also been tested on a variety of other tools on
Windows/Mac/Linux/iOS/Android. More detailed compiling instructions
and pre-compiled dependencies are available at the [wiki](https://bitbucket.org/dalerank/caesaria/wiki/Compiling).