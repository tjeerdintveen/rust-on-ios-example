# From the Mobile System Design Substack.
# By Tjeerd in 't Veen
# @tjeerdintveen
# tjeerd@mobilesystemdesign.com
# www.mobilesystemdesign.com

#!/bin/bash
set -e # Exit on error

echo "Building Rust library for iOS..."

cd switzerland

# Build all targets in parallel for efficiency
echo "Building for all targets..."

# Build for host (Mac) in debug mode. Faster, only needed for UniFFI API inspection
cargo build &

# Build for iOS targets in release mode. These go into the actual app
cargo build --release --target=aarch64-apple-ios &
cargo build --release --target=aarch64-apple-ios-sim &

# Wait for all builds to complete
wait

echo "Generating Swift bindings..."

# Generate Swift bindings
cargo run --bin uniffi-bindgen generate \
      --library ./target/debug/libswitzerland.dylib \
      --language swift \
      --out-dir ./bindings

echo "Preparing XCFramework..."

# Rename modulemap for Xcode
mv bindings/switzerlandFFI.modulemap bindings/module.modulemap

# Remove old framework
rm -rf ios/Switzerland.xcframework

# Create XCFramework
xcodebuild -create-xcframework \
           -library ./target/aarch64-apple-ios-sim/release/libswitzerland.a -headers ./bindings \
           -library ./target/aarch64-apple-ios/release/libswitzerland.a -headers ./bindings \
           -output "ios/Switzerland.xcframework"

echo "Copying files to Swift package..."

# # Copy files to Swift package
cp -r ios/Switzerland.xcframework ../swiftzerland/
cp bindings/switzerland.swift ../swiftzerland/Sources/Switzerland/

cd -

echo "iOS files generated successfully!"
echo "XCFramework: switzerland/ios/Switzerland.xcframework" 
echo "Swift bindings: switzerland/bindings/switzerland.swift"
echo "Files copied to swiftzerland/ package"
