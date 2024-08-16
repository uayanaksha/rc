#!/bin/bash

cp "./.vimrc" $HOME
cp -r "./.vim/" $HOME
vim -c ":PlugInstall" &
