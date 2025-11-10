# CaesarIA iOS Quick Start Guide
## Get CaesarIA Running on Your iPhone/iPad in 30 Minutes

This guide will walk you through every step to build and install CaesarIA on your iOS device.

---

## What You'll Need

### Hardware
- ✅ **Mac computer** (MacBook, iMac, Mac mini, Mac Studio, or Mac Pro)
  - macOS Ventura 13.0 or later recommended
  - At least 8GB RAM (16GB recommended)
  - 10GB free disk space
- ✅ **iPhone or iPad** with iOS 13.0 or later
  - Works on iPhone 8 and newer
  - Works on all iPad models from 2018+
- ✅ **USB cable** to connect your device to your Mac

### Software (We'll Install These)
- Xcode 14.0+ (free from App Store)
- Xcode Command Line Tools (free)
- CMake (free, we'll install via Homebrew)
- Git (usually pre-installed on Mac)

### Account
- ✅ **Apple ID** (free - you already have one!)
  - For personal testing, a free Apple ID is enough
  - No Apple Developer Program ($99/year) needed for personal use

### Game Resources
- ✅ **Original Caesar III game files** (.sg2, .555, .smk, .wav files)
  - You need to own Caesar III
  - Available on Steam or GOG for ~$6

**Estimated Time**: 30-45 minutes for first-time setup

---

## Step 1: Install Xcode (15 minutes)

### 1.1 Download Xcode

1. Open the **App Store** on your Mac
2. Search for **"Xcode"**
3. Click **Get** or **Install** (it's free!)
4. Wait for download (8-12 GB, takes 10-30 minutes depending on internet speed)

**☕ Coffee break time!** This is a large download.

### 1.2 Install Command Line Tools

After Xcode installs:

1. Open **Terminal** (Applications → Utilities → Terminal)
2. Type this command and press Enter:
   ```bash
   xcode-select --install
   ```
3. Click **Install** in the popup window
4. Wait for installation to complete (~5 minutes)

### 1.3 Accept Xcode License

In Terminal, type:
```bash
sudo xcodebuild -license accept
```

Enter your Mac password when prompted (you won't see it as you type - that's normal).

---

## Step 2: Install Homebrew and CMake (5 minutes)

### 2.1 Install Homebrew

Homebrew is a package manager that makes installing software easy.

1. In Terminal, paste this command:
   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```
2. Press Enter and follow the prompts
3. Enter your password when asked
4. Wait for installation (~2-3 minutes)

**Important**: After Homebrew installs, it may show you some commands to run. Copy and run those commands!

### 2.2 Install CMake

In Terminal, type:
```bash
brew install cmake
```

Wait for CMake to install (~2 minutes).

### 2.3 Verify Installation

Check that everything is installed:
```bash
cmake --version
git --version
xcodebuild -version
```

You should see version numbers for all three commands.

---

## Step 3: Get CaesarIA Code (2 minutes)

### 3.1 Clone the Repository

1. Decide where to put CaesarIA. Let's use your Documents folder:
   ```bash
   cd ~/Documents
   ```

2. Clone the updated 2025 repository:
   ```bash
   git clone https://github.com/lucky7slw/caesaria-game.git
   ```

3. Switch to the 2025 branch:
   ```bash
   cd caesaria-game
   git checkout claude/update-2025-compatibility-011CUzZfN9Ss4pRFbcqwPy8E
   ```

### 3.2 Verify You Have the Code

```bash
ls
```

You should see folders like: `source`, `resources`, `cmake`, `INSTALL_IOS`, etc.

---

## Step 4: Prepare Caesar III Resources (5 minutes)

CaesarIA needs the original Caesar III graphics and sounds.

### 4.1 Locate Caesar III Files

**If you have Caesar III on Steam:**

1. Open Steam
2. Right-click **Caesar III** → **Properties**
3. Click **Local Files** → **Browse**
4. Copy the path (usually something like `/Users/YourName/Library/Application Support/Steam/steamapps/common/Caesar 3`)

**If you have Caesar III from GOG:**

Check in `/Applications/Caesar3/` or wherever you installed it.

### 4.2 Copy Resources to CaesarIA

You need to copy these files from Caesar III to CaesarIA:

```bash
# Still in the caesaria-game directory
cd ~/Documents/caesaria-game

# Create resource directories
mkdir -p resources/gfx
mkdir -p resources/smk
mkdir -p resources/audio
```

Now copy the files:

**From Caesar III, copy to CaesarIA:**
- All `.sg2` files → `resources/gfx/`
- All `.555` files → `resources/gfx/`
- All `.smk` files (videos) → `resources/smk/`
- All `.wav` files (sounds) → `resources/audio/`

**Easy way using Terminal:**

Replace `/PATH/TO/CAESAR3` with your actual Caesar III path:

```bash
# Example (adjust the path!):
CAESAR3_PATH="/Users/YourName/Library/Application Support/Steam/steamapps/common/Caesar 3"

# Copy graphics
cp "$CAESAR3_PATH"/*.sg2 resources/gfx/
cp "$CAESAR3_PATH"/*.555 resources/gfx/

# Copy videos
cp "$CAESAR3_PATH"/*.smk resources/smk/

# Copy sounds
cp "$CAESAR3_PATH"/*.wav resources/audio/
```

### 4.3 Verify Resources

```bash
ls resources/gfx/*.sg2
ls resources/smk/*.smk
ls resources/audio/*.wav
```

You should see files listed for each command.

---

## Step 5: Build for iOS (10 minutes)

### 5.1 Create Build Directory

```bash
cd ~/Documents/caesaria-game
mkdir build-ios
cd build-ios
```

### 5.2 Configure with CMake

For **iPhone** (device, not simulator):

```bash
cmake .. \
  -G Xcode \
  -DCMAKE_TOOLCHAIN_FILE=../cmake/Modules/ios.toolchain.cmake \
  -DPLATFORM=OS \
  -DDEPLOYMENT_TARGET=13.0 \
  -DCMAKE_BUILD_TYPE=Release
```

For **iPad** (same command works for both):

```bash
cmake .. \
  -G Xcode \
  -DCMAKE_TOOLCHAIN_FILE=../cmake/Modules/ios.toolchain.cmake \
  -DPLATFORM=OS \
  -DDEPLOYMENT_TARGET=13.0 \
  -DCMAKE_BUILD_TYPE=Release
```

**Wait ~2 minutes** for CMake to configure the project.

### 5.3 Open in Xcode

```bash
open CaesarIA.xcodeproj
```

Xcode will launch with the CaesarIA project open!

---

## Step 6: Configure Code Signing (5 minutes)

This is the most important step for installing on your device.

### 6.1 Add Your Apple ID to Xcode

1. In Xcode, go to **Xcode** menu → **Settings** (or **Preferences** on older macOS)
2. Click **Accounts** tab
3. Click the **+** button (bottom left)
4. Choose **Apple ID**
5. Sign in with your Apple ID
6. Close the Settings window

### 6.2 Select Your Team

1. In Xcode's left sidebar, click the **CaesarIA** project (the blue icon at the top)
2. In the main area, make sure **CaesarIA-game** target is selected
3. Click the **Signing & Capabilities** tab
4. Under **Team**, select your Apple ID (your email)
5. If you see **"Register Device"** - click it!

### 6.3 Fix Bundle Identifier (If Needed)

If you see an error about the bundle identifier:

1. Under **Bundle Identifier**, change it to something unique
2. For example: `com.yourname.caesaria` (use your name)
3. The error should disappear

**Common Issue**: If you see "Failed to create provisioning profile":
- Try changing the Bundle Identifier to something more unique
- Example: `com.johnsmith.caesaria.game`

---

## Step 7: Connect Your iPhone/iPad (2 minutes)

### 7.1 Connect Your Device

1. Plug your iPhone or iPad into your Mac with a USB cable
2. Unlock your device
3. If prompted **"Trust This Computer?"** on your device → Tap **Trust**
4. Enter your device passcode

### 7.2 Select Your Device in Xcode

1. At the top of Xcode, find the device selector (next to the Play/Stop buttons)
2. It might say "Any iOS Device" or show a simulator
3. Click on it
4. Select your actual device (e.g., "John's iPhone")

**Tip**: If your device doesn't appear:
- Make sure it's unlocked
- Try unplugging and re-plugging the cable
- Wait 10 seconds for Xcode to detect it

---

## Step 8: Build and Install! (5 minutes)

### 8.1 Build the App

1. Click the **Play button** (▶️) at the top left of Xcode
   - Or press **⌘R** (Command-R)
2. Xcode will compile the app (~3-5 minutes on first build)
3. You'll see progress at the top: "Building CaesarIA..."

**☕ Another coffee break!**

### 8.2 First Install - Trust Developer

**On your iPhone/iPad**, you'll see the app installed but it won't open yet. You need to trust yourself as a developer:

1. On your device, go to **Settings**
2. Go to **General** → **VPN & Device Management** (or **Profiles & Device Management**)
3. Under **Developer App**, tap your Apple ID
4. Tap **Trust "your@email.com"**
5. Tap **Trust** again to confirm

### 8.3 Launch CaesarIA!

Now on your iPhone/iPad:

1. Find the **CaesarIA** app on your home screen
2. Tap to launch!
3. 🎉 **You're done!**

---

## Step 9: Playing on iOS

### First Launch

1. The game will start with default settings
2. Go to **Settings** to customize:
   - Graphics quality (Auto recommended)
   - Touch controls sensitivity
   - Theme (Light/Dark)
3. Start a new game or load a save

### Touch Controls

- **Tap**: Select buildings/units
- **Drag**: Scroll the map
- **Pinch**: Zoom in/out
- **Two-finger tap**: Context menu (like right-click)
- **Long press**: Building information

### Performance Tips

**iPhone 15 Pro / 14 Pro users:**
- Enable 120Hz in Settings → Graphics → ProMotion

**Older iPhone users (11, 12, 13):**
- Use "Balanced" preset for best experience
- Settings → Graphics → Balanced

**Battery life:**
- Enable "Battery Saver" mode for 2-3x longer gameplay
- Settings → Graphics → Battery Saver

---

## Troubleshooting

### ❌ "Build Failed" Error in Xcode

**Check these:**
1. Make sure you selected your actual device (not simulator)
2. Make sure device is unlocked and trusted
3. Check Bundle Identifier is unique
4. Try: Product → Clean Build Folder (⇧⌘K)
5. Try: Close Xcode, reopen project

### ❌ "No Code Signing Identities Found"

**Fix:**
1. Xcode → Settings → Accounts
2. Make sure your Apple ID is signed in
3. Click your Apple ID → **Download Manual Profiles**
4. Try again

### ❌ "Provisioning profile doesn't include signing certificate"

**Fix:**
1. Select your device in Xcode's device selector
2. Go to Signing & Capabilities
3. Uncheck "Automatically manage signing"
4. Check it again
5. Select your Team again

### ❌ App Crashes on Launch

**Check:**
1. Did you copy Caesar III resources? (Step 4)
2. Check crash logs: Xcode → Window → Devices and Simulators → Your Device → View Device Logs

### ❌ "The application was signed with invalid entitlements"

**Fix:**
1. Make sure you're building for your actual device, not simulator
2. Make sure PLATFORM=OS in CMake command (Step 5.2)

### ❌ Device Not Showing in Xcode

**Fix:**
1. Unplug device, wait 5 seconds, plug back in
2. Unlock device
3. Trust computer again
4. Restart Xcode
5. Check cable is working (try charging)

### ❌ "Unable to install"

**Fix:**
1. Delete existing CaesarIA app from your device
2. Restart your device
3. Build again from Xcode

### ❌ Low FPS / Laggy

**Fix:**
1. Settings → Graphics → Lower quality preset
2. Close other apps
3. Remove case (if device is warm)
4. Restart device

---

## Updating CaesarIA

When there's a new version:

```bash
cd ~/Documents/caesaria-game
git pull origin claude/update-2025-compatibility-011CUzZfN9Ss4pRFbcqwPy8E
cd build-ios
cmake ..
```

Then build again in Xcode (⌘R).

---

## Building for iPad Specifically

The same steps work for iPad! The app automatically adapts:

- **iPad**: Shows sidebar navigation
- **iPad Pro**: Maximum quality settings
- **iPad with Apple Pencil**: Precise building placement

Just make sure your iPad is selected as the build target in Xcode.

---

## Building for iOS Simulator (Testing)

If you want to test in the iOS Simulator (faster for development):

```bash
cd ~/Documents/caesaria-game
mkdir build-ios-simulator
cd build-ios-simulator

cmake .. \
  -G Xcode \
  -DCMAKE_TOOLCHAIN_FILE=../cmake/Modules/ios.toolchain.cmake \
  -DPLATFORM=SIMULATOR \
  -DDEPLOYMENT_TARGET=13.0 \
  -DCMAKE_BUILD_TYPE=Release

open CaesarIA.xcodeproj
```

In Xcode, select an iPhone or iPad simulator from the device menu, then click Play.

**Note**: Simulator is good for testing UI, but won't be as fast as a real device.

---

## Advanced: Building from Command Line

If you prefer command line (no Xcode GUI needed):

```bash
cd ~/Documents/caesaria-game/build-ios

# Build
cmake --build . --config Release

# The .app file will be in:
# build-ios/source/Release-iphoneos/CaesarIA-game.app
```

To install from command line:
```bash
# Install to connected device
ios-deploy --bundle build-ios/source/Release-iphoneos/CaesarIA-game.app
```

(Requires: `brew install ios-deploy`)

---

## Frequently Asked Questions

### Q: Do I need to pay for an Apple Developer account?

**A:** No! A free Apple ID works fine for personal use. The only limitation is your app needs to be re-signed every 7 days (just rebuild in Xcode).

If you pay for Apple Developer ($99/year), apps stay installed for a year.

### Q: Can I put this on the App Store?

**A:** Technically yes, but you'd need:
1. Apple Developer account ($99/year)
2. Caesar III license agreement (complex)
3. Replace all original Caesar III assets

For personal use, side-loading (this guide) is easiest.

### Q: Will this work on my old iPhone 6?

**A:** iPhone 6 runs iOS 12 max, but CaesarIA requires iOS 13+. You need:
- iPhone 8 or newer
- iPad 5th generation (2017) or newer
- iPad mini 5th generation or newer

### Q: How much storage does it use?

**A:** About 500 MB-1 GB installed, depending on resources.

### Q: Can I play offline?

**A:** Yes! CaesarIA doesn't require internet after installation.

### Q: Does this drain my battery?

**A:** Strategy games use more battery than simple apps. Expect:
- iPhone Pro (120Hz): ~2-3 hours
- iPhone standard: ~4-5 hours
- With Battery Saver mode: ~6-8 hours

### Q: Can I transfer saves between my iPhone and iPad?

**A:** Not automatically yet, but you can:
1. Find saves in the app's Documents folder
2. Use Xcode → Window → Devices and Simulators → Download Container
3. Copy save files
4. Upload to other device

---

## Getting Help

If you're stuck:

1. **Check Troubleshooting section** above
2. **Search GitHub issues**: https://github.com/lucky7slw/caesaria-game/issues
3. **Create an issue**: Include:
   - Your macOS version
   - Your iOS device model
   - iOS version
   - Error messages (screenshot helps!)
   - What step you're on

---

## Next Steps

✅ **You're playing CaesarIA on iOS!**

Now what?

1. **Read the guides**:
   - `docs/GAMEPLAY_DEPTH_GUIDE.md` - Strategy tips
   - `docs/UI_GRAPHICS_GUIDE.md` - Visual settings guide

2. **Optimize settings**:
   - Try different graphics presets
   - Find your preferred touch sensitivity
   - Choose Light or Dark theme

3. **Explore the new 2025 features**:
   - Dynamic markets
   - Political intrigue
   - Branching narratives
   - Technology research

4. **Share feedback**:
   - Report bugs on GitHub
   - Suggest improvements
   - Share your cities!

---

**Enjoy building Rome on your iPhone/iPad!** 🏛️📱✨
