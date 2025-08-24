#!/bin/bash

REPO_URL="https://github.com/skyrat1984test/rust-skyrat-1984.git"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
TARGET_DIR="$PROJECT_ROOT/RUST_REMOTE"

# Check if folder exists
if [ -d "$TARGET_DIR" ]; then
    cd "$TARGET_DIR"
    echo "Pulling..."
    git pull
else
    mkdir -p "$TARGET_DIR"
    cd "$TARGET_DIR"
    echo "Cloning remote..."
    git clone $REPO_URL .
fi

cd $PROJECT_ROOT

if ! command -v rustup >/dev/null 2>&1; then
    echo '"rustup" command was not found. Trying to auto-install...'
    curl https://sh.rustup.rs -sSf | sh
    if ! command -v rustup >/dev/null 2>&1; then
        echo 'failed to auto-install rustup, try install manually https://doc.rust-lang.org/stable/cargo/getting-started/installation.html'
        exit 1
    fi
fi

SRC_DIR="$PROJECT_ROOT/RUST"

set +e
has_sudo="$(command -v sudo)"
set -e
set -x

if ! [ -x "$has_sudo" ]; then
    dpkg --add-architecture i386
    apt-get update
    apt-get install gcc-multilib
    apt-get install zlib1g-dev:i386
else
    sudo dpkg --add-architecture i386
    sudo apt-get update
    sudo apt-get install gcc-multilib
    sudo apt-get install zlib1g-dev:i386
fi

cd $SRC_DIR

rustup target add i686-unknown-linux-gnu
export PKG_CONFIG_ALLOW_CROSS=1
cargo build --release --target i686-unknown-linux-gnu

if command -v rsync >/dev/null 2>&1; then
    rsync -a --mkpath "$SRC_DIR/target/i686-unknown-linux-gnu/release/librust-1984.so" "$PROJECT_ROOT/"
else
    cp -f "$SRC_DIR/RUST_REMOTE/target/i686-unknown-linux-gnu/release/librust-1984.so" "$PROJECT_ROOT/librust-1984.so"
fi

cd $PROJECT_ROOT
chmod +x librust-1984.so

exit 0
