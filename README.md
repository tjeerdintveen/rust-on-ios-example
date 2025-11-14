# Rust on iOS Example

A complete example demonstrating how to integrate Rust code into iOS applications using Mozilla's UniFFI for seamless interoperability.

## 📱 What This Demonstrates

This project shows how to:

- Build Rust libraries for iOS targets
- Generate Swift bindings automatically with UniFFI
- Package Rust code as an XCFramework
- Create a Swift Package from the XCFramework
- Integrate everything into a working iOS app

The end result is a seamless process: You update the Rust library, run the ~./build_ios.sh~ script, and you will automagically see the changes in Xcode!

Thanks to Mozilla's UniFFI, you will also access the Rust code using a Swift syntax. E.g. A Rust function called `download_images()` becomes `downloadImages()` in Swift.

## 🏗️ Project Structure

The project consists of three components:

- **`switzerland/`** - Rust library with UniFFI bindings
- **`swiftzerland/`** - Swift Package Manager wrapper
- **`Matterhorn/`** - iOS app demonstrating the integration

## 🚀 Quick Start

1. Clone this repository
2. Run the build script:
   ```bash
   ./build_ios.sh
   ```
3. Open `Matterhorn/Matterhorn.xcodeproj` in Xcode
4. Build and run the iOS app

## Compilation Time

Note that ./build_ios.sh has a `cargo clean`` command. If you run this, compilation will be much slower. But I do advise to run it to get all latest changes in your Rust project.

## 📋 Requirements

- Xcode 15+
- Rust with iOS targets:
  ```bash
  rustup target add aarch64-apple-ios aarch64-apple-ios-sim
  ```
- UniFFI CLI tools (installed via the build script)

## 📖 Learn More

This example accompanies the comprehensive guide and video tutorial:

[**Watch the video and read the complete guide on Substack →**](https://open.substack.com/pub/mobilesystemdesign/p/multiplatform-with-rust-on-ios-2c4?r=rby6v&utm_campaign=post&utm_medium=web&showWelcomeOnShare=true)

## 🔧 Build Process

The `build_ios.sh` script handles:
1. Building Rust library for iOS targets 
2. Generating Swift bindings with UniFFI
3. Creating XCFramework for distribution
4. Copying files to the Swift package 

## 📚 About

Created by **Tjeerd in 't Veen**  
📧 tjeerd@mobilesystemdesign.com  
🌐 [The Mobile System Design book](https://mobilesystemdesign.com/book)  
📰 [The Mobile System Design newsletter](https://mobilesystemdesign.substack.com)
