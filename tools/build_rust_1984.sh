#!/bin/bash

REPO_URL="https://github.com/skyrat1984test/rust-skyrat-1984.git"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
TARGET_DIR="$PROJECT_ROOT/RUST_REMOTE"

# Check if folder exists
if [ -d "$TARGET_DIR" ]; then
    cd "$TARGET_DIR"
    echo "Fetching and force checkout to origin..."
    git fetch origin master
    git checkout -f master
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
        exit 102
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
    apt-get install -y gcc-multilib
    apt-get install -y zlib1g-dev:i386
else
    sudo dpkg --add-architecture i386
    sudo apt-get update
    sudo apt-get -y install gcc-multilib
    sudo apt-get -y install zlib1g-dev:i386
fi

export PKG_CONFIG_ALLOW_CROSS=1
cd $TARGET_DIR

rustup target add i686-unknown-linux-gnu
cargo build --release --target i686-unknown-linux-gnu

if [ ! $? -eq 0 ]; then
  echo "Failed to build original rust"
  exit 104
fi

cd $SRC_DIR

rustup target add i686-unknown-linux-gnu
cargo build --release --target i686-unknown-linux-gnu

if [ ! $? -eq 0 ]; then
  echo "Failed to build modular rust 1984"
  exit 105
fi

exec 200>"$PROJECT_ROOT/librust_g.so"
if ! flock -n 200; then
  echo "librust_g.so is currently locked. Trying to kill dreamdaemon."
  pkill dreamdaemon
fi

if command -v rsync >/dev/null 2>&1; then
    rsync -a --mkpath "$TARGET_DIR/target/i686-unknown-linux-gnu/release/librust_g.so" "$PROJECT_ROOT/"
else
    cp -f "$TARGET_DIR/RUST_REMOTE/target/i686-unknown-linux-gnu/release/librust_g.so" "$PROJECT_ROOT/librust_g.so"
fi

if [ ! $? -eq 0 ]; then
  echo "Failed to copy original librust_g.so"
  exit 106
fi

cd $PROJECT_ROOT

if command -v rsync >/dev/null 2>&1; then
    rsync -a --mkpath "$SRC_DIR/target/i686-unknown-linux-gnu/release/librust_1984.so" "$PROJECT_ROOT/"
else
    cp -f "$SRC_DIR/RUST_REMOTE/target/i686-unknown-linux-gnu/release/librust_1984.so" "$PROJECT_ROOT/librust_1984.so"
fi

if [ ! $? -eq 0 ]; then
  echo "Failed to copy librust_1984.so"
  exit 107
fi

cd $PROJECT_ROOT
chmod +x librust_1984.so

exit 0
