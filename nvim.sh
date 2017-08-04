#!/bin/bash
set -ex

tmp=$(mktemp -d)
url=https://github.com/neovim/neovim

git clone -q --depth 1 --single-branch $url $tmp
cd $tmp
sudo make deps
sudo make -j2 CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX:PATH=$HOME/neovim" CMAKE_BUILD_TYPE=Release
sudo make install
