# iOS CMake Toolchain File for CaesarIA
# This file is based on the ios-cmake toolchain by leetal
# Enables cross-compilation for iOS and iPadOS devices and simulators

set(CMAKE_SYSTEM_NAME iOS)
set(CMAKE_SYSTEM_VERSION 1)
set(UNIX TRUE)
set(APPLE TRUE)
set(IOS TRUE)

# Get the Xcode version
execute_process(COMMAND xcodebuild -version
    OUTPUT_VARIABLE XCODE_VERSION
    ERROR_QUIET
    OUTPUT_STRIP_TRAILING_WHITESPACE)
string(REGEX MATCH "Xcode [0-9\\.]+" XCODE_VERSION "${XCODE_VERSION}")
string(REGEX REPLACE "Xcode ([0-9\\.]+)" "\\1" XCODE_VERSION "${XCODE_VERSION}")

# Set deployment target to iOS 13.0 for modern iOS/iPadOS support
set(DEPLOYMENT_TARGET "13.0" CACHE STRING "Minimum iOS/iPadOS version")
set(CMAKE_OSX_DEPLOYMENT_TARGET ${DEPLOYMENT_TARGET} CACHE STRING "Minimum iOS/iPadOS version")

# Platform: OS (device) or SIMULATOR
if(NOT DEFINED PLATFORM)
    set(PLATFORM "OS")
endif()

# Set the architectures based on platform
if(PLATFORM STREQUAL "OS")
    # iOS device (iPhone/iPad)
    set(CMAKE_OSX_ARCHITECTURES "arm64" CACHE STRING "iOS architectures")
    set(CMAKE_SYSTEM_PROCESSOR "arm64")
elseif(PLATFORM STREQUAL "SIMULATOR")
    # iOS Simulator
    set(CMAKE_OSX_ARCHITECTURES "x86_64;arm64" CACHE STRING "iOS Simulator architectures")
    set(CMAKE_SYSTEM_PROCESSOR "x86_64")
elseif(PLATFORM STREQUAL "SIMULATOR64")
    # iOS Simulator (64-bit only)
    set(CMAKE_OSX_ARCHITECTURES "x86_64;arm64" CACHE STRING "iOS Simulator architectures")
    set(CMAKE_SYSTEM_PROCESSOR "x86_64")
endif()

# Set the sysroot for the target platform
if(PLATFORM STREQUAL "OS")
    set(CMAKE_OSX_SYSROOT "iphoneos" CACHE STRING "iOS SDK")
else()
    set(CMAKE_OSX_SYSROOT "iphonesimulator" CACHE STRING "iOS Simulator SDK")
endif()

# Find and set the SDK path
execute_process(
    COMMAND xcodebuild -version -sdk ${CMAKE_OSX_SYSROOT} Path
    OUTPUT_VARIABLE CMAKE_OSX_SYSROOT_PATH
    ERROR_QUIET
    OUTPUT_STRIP_TRAILING_WHITESPACE
)

if(EXISTS ${CMAKE_OSX_SYSROOT_PATH})
    set(CMAKE_OSX_SYSROOT ${CMAKE_OSX_SYSROOT_PATH})
else()
    message(FATAL_ERROR "Could not find iOS SDK at ${CMAKE_OSX_SYSROOT_PATH}")
endif()

# Set compiler flags for iOS
set(CMAKE_C_FLAGS_INIT "-fobjc-arc")
set(CMAKE_CXX_FLAGS_INIT "-fobjc-arc -std=c++11")

# Skip compiler tests (cross-compilation)
set(CMAKE_C_COMPILER_WORKS TRUE)
set(CMAKE_CXX_COMPILER_WORKS TRUE)

# Set the find root path to search for libraries and headers
set(CMAKE_FIND_ROOT_PATH ${CMAKE_OSX_SYSROOT})
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

# iOS specific settings
add_definitions(-DIOS)
add_definitions(-DTARGET_OS_IPHONE)

message(STATUS "iOS Toolchain: Building for ${PLATFORM}")
message(STATUS "iOS Deployment Target: ${CMAKE_OSX_DEPLOYMENT_TARGET}")
message(STATUS "iOS SDK: ${CMAKE_OSX_SYSROOT}")
message(STATUS "iOS Architectures: ${CMAKE_OSX_ARCHITECTURES}")
