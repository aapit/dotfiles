#!/bin/sh
REPO_DIR=$HOME/.dotfiles
REPO_URL=git@github.com:aapit/dotfiles
[ -d $REPO_DIR ] && echo "${REPO_DIR} already exists.\nExiting..." && exit 1

alias dtf="/usr/bin/git --git-dir=${REPO_DIR} --work-tree=\$HOME"
git clone --bare $REPO_URL $REPO_DIR
dtf checkout
