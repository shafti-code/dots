#!/bin/bash
rm -rf ~/.zshrc 
rm -rf ~/.config/ghostty/config
rm -rf ~/.config/git
rm -rf ~/.config/tmux

ln -s ~/dots/.zshrc ~/.zshrc 
ln -s ~/dots/./ghostty/config  ~/.config/ghostty/config
ln -s ~/dots/./git ~/.config/git
ln -s ~/dots/./tmux  ~/.config/tmux
