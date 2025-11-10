#!/bin/bash
# CaesarIA iOS Automated Setup Script
# This script does EVERYTHING for you automatically

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}╔════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║   CaesarIA iOS Automated Setup        ║${NC}"
echo -e "${BLUE}║   2025 Edition                         ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════╝${NC}"
echo ""

# Function to print status
print_status() {
    echo -e "${GREEN}✓${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

print_info() {
    echo -e "${BLUE}ℹ${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

# Check if running on macOS
if [[ "$OSTYPE" != "darwin"* ]]; then
    print_error "This script must be run on macOS"
    exit 1
fi

print_status "Running on macOS"

# ========================================
# STEP 1: Check Xcode Installation
# ========================================
echo ""
echo -e "${BLUE}[1/7] Checking Xcode...${NC}"

if ! command -v xcodebuild &> /dev/null; then
    print_error "Xcode is not installed"
    print_info "Please install Xcode from the App Store first"
    print_info "After installing, run this script again"
    exit 1
fi

print_status "Xcode is installed"

# Check Command Line Tools
if ! xcode-select -p &> /dev/null; then
    print_info "Installing Xcode Command Line Tools..."
    xcode-select --install
    print_warning "Please complete the installation in the popup, then run this script again"
    exit 0
fi

print_status "Xcode Command Line Tools are installed"

# Accept license if needed
if ! /usr/bin/xcrun --version &> /dev/null; then
    print_info "Accepting Xcode license (requires sudo)..."
    sudo xcodebuild -license accept
fi

# ========================================
# STEP 2: Check/Install Homebrew
# ========================================
echo ""
echo -e "${BLUE}[2/7] Checking Homebrew...${NC}"

if ! command -v brew &> /dev/null; then
    print_info "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Add Homebrew to PATH for Apple Silicon Macs
    if [[ -f "/opt/homebrew/bin/brew" ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi

    print_status "Homebrew installed"
else
    print_status "Homebrew is installed"
fi

# ========================================
# STEP 3: Check/Install CMake
# ========================================
echo ""
echo -e "${BLUE}[3/7] Checking CMake...${NC}"

if ! command -v cmake &> /dev/null; then
    print_info "Installing CMake..."
    brew install cmake
    print_status "CMake installed"
else
    print_status "CMake is installed ($(cmake --version | head -n1))"
fi

# ========================================
# STEP 4: Find Caesar III Resources
# ========================================
echo ""
echo -e "${BLUE}[4/7] Searching for Caesar III resources...${NC}"

CAESAR3_PATH=""

# Common Caesar III locations
SEARCH_PATHS=(
    "$HOME/Library/Application Support/Steam/steamapps/common/Caesar 3"
    "$HOME/Library/Application Support/Steam/steamapps/common/Caesar3"
    "$HOME/Library/Application Support/GOG.com/Caesar 3"
    "/Applications/Caesar 3"
    "/Applications/Caesar3"
    "$HOME/Games/Caesar 3"
    "$HOME/Games/Caesar3"
)

# Search for Caesar III
for path in "${SEARCH_PATHS[@]}"; do
    if [[ -d "$path" ]]; then
        # Check if it has the required files
        if ls "$path"/*.sg2 &> /dev/null; then
            CAESAR3_PATH="$path"
            print_status "Found Caesar III at: $path"
            break
        fi
    fi
done

# If not found, ask user
if [[ -z "$CAESAR3_PATH" ]]; then
    print_warning "Caesar III not found automatically"
    echo ""
    echo "Please enter the path to your Caesar III installation:"
    echo "(Drag the Caesar III folder into this Terminal window)"
    read -p "Path: " CAESAR3_PATH

    # Remove quotes and trim
    CAESAR3_PATH="${CAESAR3_PATH%\"}"
    CAESAR3_PATH="${CAESAR3_PATH#\"}"
    CAESAR3_PATH=$(echo "$CAESAR3_PATH" | xargs)

    if [[ ! -d "$CAESAR3_PATH" ]]; then
        print_error "Directory not found: $CAESAR3_PATH"
        exit 1
    fi

    if ! ls "$CAESAR3_PATH"/*.sg2 &> /dev/null; then
        print_error "No Caesar III .sg2 files found in that directory"
        exit 1
    fi
fi

print_status "Using Caesar III from: $CAESAR3_PATH"

# ========================================
# STEP 5: Copy Resources
# ========================================
echo ""
echo -e "${BLUE}[5/7] Copying Caesar III resources...${NC}"

# Get script directory (where CaesarIA is)
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$SCRIPT_DIR"

# Create resource directories
mkdir -p resources/gfx
mkdir -p resources/smk
mkdir -p resources/audio

# Count files
SG2_COUNT=$(ls "$CAESAR3_PATH"/*.sg2 2>/dev/null | wc -l)
F555_COUNT=$(ls "$CAESAR3_PATH"/*.555 2>/dev/null | wc -l)
SMK_COUNT=$(ls "$CAESAR3_PATH"/*.smk 2>/dev/null | wc -l)
WAV_COUNT=$(ls "$CAESAR3_PATH"/*.wav 2>/dev/null | wc -l)

print_info "Copying graphics files (.sg2, .555)..."
if [[ $SG2_COUNT -gt 0 ]]; then
    cp "$CAESAR3_PATH"/*.sg2 resources/gfx/ 2>/dev/null || true
    print_status "Copied $SG2_COUNT .sg2 files"
fi

if [[ $F555_COUNT -gt 0 ]]; then
    cp "$CAESAR3_PATH"/*.555 resources/gfx/ 2>/dev/null || true
    print_status "Copied $F555_COUNT .555 files"
fi

print_info "Copying video files (.smk)..."
if [[ $SMK_COUNT -gt 0 ]]; then
    cp "$CAESAR3_PATH"/*.smk resources/smk/ 2>/dev/null || true
    print_status "Copied $SMK_COUNT .smk files"
else
    print_warning "No video files found (optional)"
fi

print_info "Copying audio files (.wav)..."
if [[ $WAV_COUNT -gt 0 ]]; then
    cp "$CAESAR3_PATH"/*.wav resources/audio/ 2>/dev/null || true
    print_status "Copied $WAV_COUNT .wav files"
else
    print_warning "No audio files found (optional)"
fi

# Verify critical files
REQUIRED_GFX=$(ls resources/gfx/*.sg2 2>/dev/null | wc -l)
if [[ $REQUIRED_GFX -lt 1 ]]; then
    print_error "Failed to copy required graphics files"
    exit 1
fi

print_status "All resources copied successfully!"

# ========================================
# STEP 6: Configure Build
# ========================================
echo ""
echo -e "${BLUE}[6/7] Configuring iOS build...${NC}"

# Create build directory
BUILD_DIR="$SCRIPT_DIR/build-ios"
if [[ -d "$BUILD_DIR" ]]; then
    print_info "Removing old build directory..."
    rm -rf "$BUILD_DIR"
fi

mkdir -p "$BUILD_DIR"
cd "$BUILD_DIR"

print_info "Running CMake configuration..."

cmake .. \
    -G Xcode \
    -DCMAKE_TOOLCHAIN_FILE=../cmake/Modules/ios.toolchain.cmake \
    -DPLATFORM=OS \
    -DDEPLOYMENT_TARGET=13.0 \
    -DCMAKE_BUILD_TYPE=Release

if [[ $? -eq 0 ]]; then
    print_status "CMake configuration successful!"
else
    print_error "CMake configuration failed"
    exit 1
fi

# ========================================
# STEP 7: Open Xcode
# ========================================
echo ""
echo -e "${BLUE}[7/7] Opening Xcode...${NC}"

XCODE_PROJECT="$BUILD_DIR/CaesarIA.xcodeproj"

if [[ -d "$XCODE_PROJECT" ]]; then
    print_status "Opening Xcode project..."
    open "$XCODE_PROJECT"

    echo ""
    echo -e "${GREEN}╔════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}║   Setup Complete! 🎉                  ║${NC}"
    echo -e "${GREEN}╚════════════════════════════════════════╝${NC}"
    echo ""
    echo -e "${BLUE}Next steps in Xcode:${NC}"
    echo ""
    echo "1. Go to Xcode → Settings → Accounts"
    echo "   - Add your Apple ID if not already added"
    echo ""
    echo "2. Select the CaesarIA project (blue icon on left)"
    echo "   - Click 'Signing & Capabilities' tab"
    echo "   - Under 'Team': Select your Apple ID"
    echo "   - Change 'Bundle Identifier' to: com.yourname.caesaria"
    echo ""
    echo "3. Plug in your iPhone/iPad with USB cable"
    echo "   - Unlock device and trust computer"
    echo "   - Select your device from the dropdown (top of Xcode)"
    echo ""
    echo "4. Click the Play button ▶️  (or press ⌘R)"
    echo "   - Wait ~3-5 minutes for build"
    echo ""
    echo "5. On your device: Settings → General → Device Management"
    echo "   - Trust your Apple ID"
    echo ""
    echo "6. Launch CaesarIA on your device!"
    echo ""
    echo -e "${YELLOW}Tip: See QUICK_INSTALL_IOS.md for detailed instructions${NC}"
    echo ""

else
    print_error "Xcode project not found!"
    exit 1
fi
