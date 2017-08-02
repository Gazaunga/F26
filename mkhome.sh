#!/bin/bash

def create {
mkdir -pv
}
create src
create build
create .local/bin
touch ~/.bash_profile
echo "PATH=$HOME/local/bin:$PATH" >> .bash_profile
