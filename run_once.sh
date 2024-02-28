#!/usr/bin/env bash
source /usr/local/share/nvm/nvm.sh
nvm install --lts && \
  nvm use --lts && \
  npm install -g diff-so-fancy git-jump
git config alias.sw -e jump
sudo apt-get update  && sudo apt-get install vim




