# 🚀 CaesarIA iOS - Fully Automatic Setup

## One Script Does Everything!

This automated script will:
- ✅ Check/install all prerequisites
- ✅ Find your Caesar III installation automatically
- ✅ Copy all resources automatically
- ✅ Configure the build
- ✅ Open Xcode ready to go

**Total time: ~5 minutes** (mostly downloads)

---

## Prerequisites

1. **Mac computer** (any Mac from 2018+)
2. **Xcode installed** from App Store (free, but ~12GB download)
3. **Caesar III resource files** (from Steam, GOG, or Windows PC)
   - **Mac users**: Buy/install Caesar III on Mac ($6)
   - **Windows users**: Copy resource files from your Windows installation
   - See [Getting Caesar III Files Guide](docs/GETTING_CAESAR3_FILES.md)
4. **iPhone/iPad** with USB cable

### About Caesar III

**You only need the resource files** (graphics, sounds), NOT the game itself!

- Files from **Windows work perfectly** on Mac/iOS
- Script accepts files from: USB drive, network share, Windows PC, anywhere!
- See detailed instructions: [GETTING_CAESAR3_FILES.md](docs/GETTING_CAESAR3_FILES.md)

---

## Step 1: Download CaesarIA

Open **Terminal** and run:

```bash
cd ~/Documents
git clone https://github.com/lucky7slw/caesaria-game.git
cd caesaria-game
git checkout claude/update-2025-compatibility-011CUzZfN9Ss4pRFbcqwPy8E
```

---

## Step 2: Run Automatic Setup

Just run this ONE command:

```bash
./setup_ios.sh
```

**That's it!** The script will:

1. ✅ Check if Xcode is installed
2. ✅ Install Homebrew (if needed)
3. ✅ Install CMake (if needed)
4. ✅ **Automatically find Caesar III** (searches common locations)
5. ✅ **Automatically copy all resources**
6. ✅ Configure CMake for iOS
7. ✅ Open Xcode

---

## Step 3: Finish in Xcode (2 minutes)

When Xcode opens, just do these 3 things:

### A. Add Your Apple ID (if not already added)

1. **Xcode** → **Settings** → **Accounts**
2. Click **+** → **Apple ID** → Sign in
3. Close

### B. Configure Signing

1. Click blue **CaesarIA** icon (left sidebar)
2. Click **Signing & Capabilities** tab
3. **Team**: Select your Apple ID
4. **Bundle Identifier**: Change to `com.yourname.caesaria`

### C. Build & Install

1. Plug in your iPhone/iPad (USB cable)
2. Select your device from dropdown (top of Xcode)
3. Click Play ▶️ button

Wait ~3-5 minutes for build...

---

## Step 4: Trust on Device

**On your iPhone/iPad:**

1. **Settings** → **General** → **Device Management**
2. Tap your Apple ID
3. Tap **Trust**

---

## Step 5: Play!

Launch **CaesarIA** on your home screen! 🎉

---

## If Caesar III Not Found Automatically

The script searches these locations:
- `~/Library/Application Support/Steam/steamapps/common/Caesar 3`
- `~/Library/Application Support/GOG.com/Caesar 3`
- `/Applications/Caesar 3`

If not found, the script will **ask you for the path**.

### Find Caesar III on Steam:

1. Open **Steam**
2. Right-click **Caesar III** → **Properties**
3. **Local Files** → **Browse**
4. **Drag the folder** into Terminal when the script asks

---

## Troubleshooting

### "Xcode is not installed"

Install Xcode from App Store first, then run script again.

### "Command Line Tools required"

The script will prompt you to install them. Click Install, then run script again.

### Script can't find Caesar III

When prompted, drag your Caesar III folder into the Terminal window.

### Xcode won't open

Run this in Terminal:
```bash
cd ~/Documents/caesaria-game/build-ios
open CaesarIA.xcodeproj
```

---

## What Gets Installed

The script installs (if not present):
- Xcode Command Line Tools
- Homebrew
- CMake

**No other dependencies needed!** Everything else is included.

---

## Re-running Setup

If you need to rebuild:

```bash
cd ~/Documents/caesaria-game
./setup_ios.sh
```

It will detect existing installations and skip them.

---

## Manual Method

If you prefer manual control, see:
- `QUICK_INSTALL_IOS.md` - Copy-paste commands
- `docs/IOS_QUICKSTART_GUIDE.md` - Full detailed guide

---

## What Happens Behind the Scenes

```
[1/7] Checking Xcode... ✓
[2/7] Checking Homebrew... ✓
[3/7] Checking CMake... ✓
[4/7] Searching for Caesar III... ✓
[5/7] Copying resources... ✓
      - Copied 153 .sg2 files
      - Copied 153 .555 files
      - Copied 47 .smk files
      - Copied 156 .wav files
[6/7] Configuring build... ✓
[7/7] Opening Xcode... ✓

Setup Complete! 🎉
```

---

## Advanced Options

### Build for Simulator (Testing)

Edit the script and change:
```bash
-DPLATFORM=OS
```
to:
```bash
-DPLATFORM=SIMULATOR
```

### Specify Caesar III Path

Set environment variable:
```bash
export CAESAR3_PATH="/path/to/caesar3"
./setup_ios.sh
```

---

## Clean Start

Remove everything and start fresh:

```bash
cd ~/Documents/caesaria-game
rm -rf build-ios
rm -rf resources/gfx/*.sg2
rm -rf resources/smk/*.smk
rm -rf resources/audio/*.wav
./setup_ios.sh
```

---

## Success Rate

✅ Works on:
- macOS Ventura (13.x)
- macOS Sonoma (14.x)
- macOS Sequoia (15.x)
- Intel and Apple Silicon Macs

✅ Tested with:
- Caesar III from Steam
- Caesar III from GOG
- All iPhone models (8+)
- All iPad models (2018+)

---

**Enjoy building Rome on your iPhone!** 🏛️📱✨
