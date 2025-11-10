# Getting Caesar III Resource Files

## What You Need

CaesarIA needs **resource files** from the original Caesar III:
- Graphics files (*.sg2, *.555)
- Video files (*.smk)
- Sound files (*.wav)

**Important**: You only need the **data files**, NOT the executable! Files from Windows work perfectly on Mac/iOS.

---

## Option 1: Buy on Mac (Easiest)

### Steam ($5.99)
https://store.steampowered.com/app/517790/Caesar_3/

1. Buy Caesar III on Steam
2. Install on your Mac
3. Files automatically go to:
   ```
   ~/Library/Application Support/Steam/steamapps/common/Caesar 3
   ```
4. Run `./setup_ios.sh` - it finds them automatically!

### GOG.com ($5.99)
https://www.gog.com/game/caesar_3

1. Buy Caesar III on GOG
2. Download Mac version
3. Install
4. Files go to:
   ```
   ~/Library/Application Support/GOG.com/Caesar 3
   ```

**Frequently on sale for ~$2!**

---

## Option 2: Copy from Windows PC

Already have Caesar III on Windows? Just copy the files!

### Step 1: Find Files on Windows

**Steam:**
```
C:\Program Files (x86)\Steam\steamapps\common\Caesar 3
```

**GOG:**
```
C:\GOG Games\Caesar 3
```

Or right-click Caesar III in Steam → Properties → Local Files → Browse

### Step 2: Copy These Files

You need:
- All `*.sg2` files (~153 files, 50MB)
- All `*.555` files (~153 files, 50MB)
- All `*.smk` files (~47 files, 100MB)
- All `*.wav` files (~156 files, 50MB)

**Total: ~250MB**

### Step 3: Transfer to Mac

#### Method A: USB Drive
1. Copy files to USB drive on Windows
2. Plug USB into Mac
3. Copy files from USB to Mac

#### Method B: Cloud Storage
1. Upload to Dropbox/Google Drive/iCloud
2. Download on Mac

#### Method C: Network Share
1. Share folder on Windows PC
2. Access from Mac (Finder → Go → Connect to Server)
3. Copy files

#### Method D: AirDrop (if you have both)
1. Enable AirDrop on both devices
2. Select files on Windows
3. AirDrop to Mac

### Step 4: Tell Setup Script

When running `./setup_ios.sh`, it will ask for the path.

Just **drag the folder** into Terminal when prompted!

---

## Option 3: Download from Your Steam Library Remotely

Have Caesar III on Windows but not with you?

1. Use **Steam Remote Play**
2. Or log into Steam on Mac
3. Download Caesar III for Mac
4. Files automatically appear on Mac

---

## File Locations Reference

### Windows (Steam)
```
C:\Program Files (x86)\Steam\steamapps\common\Caesar 3
```

### Windows (GOG)
```
C:\GOG Games\Caesar 3
```

### Mac (Steam)
```
~/Library/Application Support/Steam/steamapps/common/Caesar 3
```

To open in Finder:
1. Open Finder
2. Press Cmd+Shift+G
3. Paste the path
4. Press Enter

### Mac (GOG)
```
~/Library/Application Support/GOG.com/Caesar 3
```

### Linux (Steam)
```
~/.steam/steam/steamapps/common/Caesar 3
```

---

## Verifying You Have the Right Files

Run this in Terminal (Mac):

```bash
ls /path/to/caesar3/*.sg2 | wc -l
```

Should show: **153** (or close)

```bash
ls /path/to/caesar3/*.555 | wc -l
```

Should show: **153** (or close)

```bash
ls /path/to/caesar3/*.smk | wc -l
```

Should show: **40-50** files

```bash
ls /path/to/caesar3/*.wav | wc -l
```

Should show: **150-160** files

---

## What About Free Alternatives?

### OpenCaesar3 Graphics Project (Not Recommended)
- ⚠️ Incomplete (missing many assets)
- ⚠️ Lower quality
- ⚠️ Not officially supported
- ⚠️ Requires manual setup

**Our recommendation**: Just buy Caesar III. It's $6 (often $2 on sale) and you get:
- ✅ All original graphics
- ✅ All sounds and music
- ✅ All videos
- ✅ Legal and ethical
- ✅ Best experience

---

## Legal Note

Caesar III assets are copyrighted by Activision. CaesarIA is legal because it's a game engine (open source), but the assets must be obtained legally by purchasing the original game.

This is the same model as:
- **OpenRCT2** (RollerCoaster Tycoon 2)
- **OpenMW** (Morrowind)
- **OpenRA** (Command & Conquer)

---

## Frequently Asked Questions

### Can I use my friend's copy?
**No** - Licenses are per-user. Each person should own their copy.

### Do I need to install Caesar III?
**No** - You just need the resource files. You can copy them and uninstall Caesar III if you want.

### Will Windows files work on Mac/iOS?
**Yes!** Resource files are platform-independent. Only the .exe is Windows-specific, and we don't need that.

### Can I delete Caesar III after copying files?
**Yes** - Once files are copied to CaesarIA's resources folder, you can uninstall Caesar III.

### What if I lose the files?
You can re-download Caesar III from Steam/GOG anytime and extract the files again. Your purchase is permanent.

### Do I need all the files?
- **Required**: .sg2 and .555 files (graphics)
- **Recommended**: .smk files (videos for cutscenes)
- **Optional**: .wav files (sound effects - game has fallbacks)

---

## Quick Reference Table

| Platform | Install Location | Size | Notes |
|----------|-----------------|------|-------|
| **Steam (Mac)** | `~/Library/.../Steam/.../Caesar 3` | ~300MB | Auto-detected by script |
| **GOG (Mac)** | `~/Library/.../GOG.com/Caesar 3` | ~300MB | Auto-detected by script |
| **Windows** | `C:\Program Files (x86)\Steam\...` | ~300MB | Copy to USB/cloud |
| **USB Drive** | `/Volumes/[drive name]/...` | ~250MB | Drag folder to Terminal |
| **Network** | `smb://...` or mounted location | ~250MB | Mount then drag to Terminal |

---

## Need Help?

If you're having trouble finding or copying files:

1. Check the [Quick Start Guide](IOS_QUICKSTART_GUIDE.md)
2. Check the [Automatic Setup Guide](../AUTOMATIC_SETUP.md)
3. Open an issue on GitHub with details about:
   - Where you bought Caesar III
   - What platform (Windows/Mac)
   - What you've tried

---

**Bottom line**: Spend $6, get amazing graphics, support the creators! 🏛️
