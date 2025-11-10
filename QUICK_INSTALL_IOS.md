# CaesarIA iOS - Copy & Paste Instructions
## Get it running in 30 minutes

---

## STEP 1: Install Xcode (one-time setup)

**Open App Store on your Mac → Search "Xcode" → Click Install (it's free, ~12GB)**

After Xcode installs, open **Terminal** and paste this:

```bash
xcode-select --install
```

Click Install when prompted. Then paste this:

```bash
sudo xcodebuild -license accept
```

Enter your Mac password when prompted.

---

## STEP 2: Install Homebrew & CMake (one-time setup)

Paste this in Terminal:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Follow the prompts. **Important**: After it installs, it will show you 2-3 commands to run. Copy and paste those too!

Then install CMake:

```bash
brew install cmake
```

---

## STEP 3: Get CaesarIA Code

Paste these commands:

```bash
cd ~/Documents
git clone https://github.com/lucky7slw/caesaria-game.git
cd caesaria-game
git checkout claude/update-2025-compatibility-011CUzZfN9Ss4pRFbcqwPy8E
```

---

## STEP 4: Copy Caesar III Resources

Create folders:

```bash
mkdir -p resources/gfx
mkdir -p resources/smk
mkdir -p resources/audio
```

**Now manually copy these files from your Caesar III game folder:**

Find Caesar III (if you have it on Steam, right-click game → Properties → Local Files → Browse)

**Copy to CaesarIA:**
- All `*.sg2` files → `~/Documents/caesaria-game/resources/gfx/`
- All `*.555` files → `~/Documents/caesaria-game/resources/gfx/`
- All `*.smk` files → `~/Documents/caesaria-game/resources/smk/`
- All `*.wav` files → `~/Documents/caesaria-game/resources/audio/`

**OR use these commands (replace the path with yours):**

```bash
# Replace this path with your Caesar III location!
CAESAR3="/Users/YOURNAME/Library/Application Support/Steam/steamapps/common/Caesar 3"

cp "$CAESAR3"/*.sg2 ~/Documents/caesaria-game/resources/gfx/
cp "$CAESAR3"/*.555 ~/Documents/caesaria-game/resources/gfx/
cp "$CAESAR3"/*.smk ~/Documents/caesaria-game/resources/smk/
cp "$CAESAR3"/*.wav ~/Documents/caesaria-game/resources/audio/
```

---

## STEP 5: Build for iOS

Paste these commands:

```bash
cd ~/Documents/caesaria-game
mkdir build-ios
cd build-ios

cmake .. \
  -G Xcode \
  -DCMAKE_TOOLCHAIN_FILE=../cmake/Modules/ios.toolchain.cmake \
  -DPLATFORM=OS \
  -DDEPLOYMENT_TARGET=13.0 \
  -DCMAKE_BUILD_TYPE=Release

open CaesarIA.xcodeproj
```

**Xcode will open!**

---

## STEP 6: Configure Signing in Xcode

**In Xcode:**

1. Menu bar → **Xcode** → **Settings** (or Preferences)
2. Click **Accounts** tab
3. Click **+** button → Choose **Apple ID**
4. Sign in with your Apple ID
5. Close Settings

**In the main Xcode window:**

1. Click the blue **CaesarIA** icon in the left sidebar
2. Make sure **CaesarIA-game** target is selected (middle pane)
3. Click **Signing & Capabilities** tab
4. Under **Team**: Select your Apple ID
5. Under **Bundle Identifier**: Change to something unique like `com.yourname.caesaria`

Any errors should disappear now!

---

## STEP 7: Connect Your iPhone/iPad

1. **Plug your device into your Mac** with a USB cable
2. **Unlock your device**
3. **Trust this computer** (tap Trust on your device if prompted)

**In Xcode (top center):**

1. Find the device selector (says "Any iOS Device" or shows a simulator)
2. Click it
3. Select **your actual device** (e.g., "John's iPhone")

---

## STEP 8: Build & Install!

**In Xcode, click the Play button ▶️** at the top left (or press **⌘R**)

Wait ~3-5 minutes for the build to complete...

---

## STEP 9: Trust Developer on Your Device

**On your iPhone/iPad:**

1. Go to **Settings**
2. **General** → **VPN & Device Management** (or **Profiles & Device Management**)
3. Under **Developer App**, tap **your Apple ID email**
4. Tap **Trust**
5. Tap **Trust** again

---

## STEP 10: Launch CaesarIA!

**On your iPhone/iPad home screen:**

Find the **CaesarIA** app and tap it!

🎉 **Done!**

---

## Touch Controls

- **Tap** = Select
- **Drag** = Scroll map
- **Pinch** = Zoom
- **Long press** = Building info
- **Two-finger tap** = Context menu

---

## Troubleshooting

### Build Failed?
```bash
# In Xcode menu: Product → Clean Build Folder
# Then click Play ▶️ again
```

### Device Not Showing?
- Unplug device, wait 5 seconds, plug back in
- Make sure device is unlocked
- Restart Xcode

### "No Code Signing Identities"?
- Xcode → Settings → Accounts
- Make sure your Apple ID is signed in
- Click your Apple ID → Download Manual Profiles

### App Won't Open?
- Did you do Step 9? (Trust developer on device)
- Settings → General → Device Management → Trust

### Performance Issues?
In CaesarIA app: Settings → Graphics → Balanced

---

## Quick Commands Summary

```bash
# One-time setup
xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install cmake

# Get code
cd ~/Documents
git clone https://github.com/lucky7slw/caesaria-game.git
cd caesaria-game
git checkout claude/update-2025-compatibility-011CUzZfN9Ss4pRFbcqwPy8E

# Prepare resources
mkdir -p resources/gfx resources/smk resources/audio
# Copy Caesar III files here!

# Build
mkdir build-ios
cd build-ios
cmake .. -G Xcode -DCMAKE_TOOLCHAIN_FILE=../cmake/Modules/ios.toolchain.cmake -DPLATFORM=OS -DDEPLOYMENT_TARGET=13.0 -DCMAKE_BUILD_TYPE=Release
open CaesarIA.xcodeproj

# Configure signing in Xcode, connect device, click Play ▶️
# Trust developer on device
# Launch app!
```

---

## Rebuild Later

Already set up? Just do this:

```bash
cd ~/Documents/caesaria-game/build-ios
open CaesarIA.xcodeproj
```

Click Play ▶️ in Xcode!

---

**That's it! Enjoy CaesarIA on iOS!** 🏛️📱
