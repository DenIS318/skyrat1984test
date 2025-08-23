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
    git clone "$REPO_URL" .
fi


if ! command -v rustup >/dev/null 2>&1; then
    echo '"rustup" command was not found. Trying to auto-install...'
    curl https://sh.rustup.rs -sSf | sh
    if ! command -v rustup >/dev/null 2>&1; then
        echo 'failed to auto-install rustup, try install manually https://doc.rust-lang.org/stable/cargo/getting-started/installation.html'
        exit 1
    fi
fi

# Copy files from ../RUST/*.* to $TARGET_DIR/src/RUST_1984/
SRC_DIR="$PROJECT_ROOT/RUST"
DEST_DIR="$PROJECT_ROOT/RUST_REMOTE/src/RUST_1984"

mkdir -p "$DEST_DIR"

# Use rsync or cp -r
if command -v rsync >/dev/null 2>&1; then
    rsync -a "$SRC_DIR/" "$DEST_DIR/"
else
    cp -r "$SRC_DIR/"* "$DEST_DIR/"
fi

set +e
has_sudo="$(command -v sudo)"
set -e
set -x

if ! [ -x "$has_sudo" ]; then
    dpkg --add-architecture i386
    apt-get update
    apt-get install zlib1g-dev:i386
else
    sudo dpkg --add-architecture i386
    sudo apt-get update
    sudo apt-get install zlib1g-dev:i386
fi

rustup target add i686-unknown-linux-gnu
cargo build --release --target i686-unknown-linux-gnu
exit 0
