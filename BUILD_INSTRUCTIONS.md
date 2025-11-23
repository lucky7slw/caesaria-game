# Quick Build Instructions for CaesarIA

## Current System: Linux

You're on Linux. Here's what you can do:

### Build for Linux (Recommended - Works Now)

1. **Install missing dependencies**:
```bash
# For Ubuntu/Debian:
sudo apt-get install libalsa-ocaml-dev libasound2-dev

# For other distros, install ALSA development libraries
```

2. **Build**:
```bash
cd /home/user/caesaria-game
rm -rf build-linux
mkdir build-linux && cd build-linux
cmake ..
make -j4
```

3. **Get Caesar III resources**:
- Copy .sg2 and .555 files from original Caesar III to `resources/gfx/`

4. **Run**:
```bash
./caesaria.linux
```

---

## To Build for iOS (Requires macOS)

You MUST have:
- Physical Mac computer
- macOS 12+ installed
- Xcode 13+ from Mac App Store

Then on the Mac:
```bash
cd caesaria-game
./setup_ios.sh
# Opens Xcode project automatically
```

---

## Current Status

Your system: **Linux**
What works: **Linux build** (after installing ALSA)
What doesn't work: **iOS build** (needs macOS)

The design documents I created are still useful as:
- Feature specifications for future development
- Reference material
- Pitch/planning documents
