#!/bin/bash

echo "==== $0 ===="
date
id
pwd
uname -a
env


# Update package list and install necessary packages
apt-get update
apt-get install -y llvm-12 llvm-12-dev llvm-12-tools clang-12
ln -sf /usr/bin/llc-12 /usr/bin/llc
ln -sf /usr/bin/opt-12 /usr/bin/opt

# ghcup: Please ensure the following distro packages are installed before continuing (you can exit ghcup and return at any time): build-essential curl libffi-dev libffi8 libgmp-dev libgmp10 libncurses-dev libncurses5 libtinfo5 pkg-config
# https://github.com/haskell/ghcup-www/blob/6ea0d7169a580e237d7096289f297d53bdbcf0f1/docs/install.md?plain=1#L43
# https://github.com/haskell/ghcup-hs/issues/421
apt-get install -y build-essential curl libffi-dev libffi8 libgmp-dev libgmp10 libncurses-dev libncurses5 libtinfo5 pkg-config

# bug: https://github.com/haskell/ghcup-www/blob/6ea0d7169a580e237d7096289f297d53bdbcf0f1/docs/about.md?plain=1#L216
apt-get install -y libnuma-dev

# Clean up
apt-get clean
rm -rf /var/lib/apt/lists/*