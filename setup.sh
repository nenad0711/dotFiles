#!/usr/bin/env bash
source /usr/local/share/nvm/nvm.sh
nvm install --lts && \
  nvm use --lts && \
  npm install -g diff-so-fancy git-jump &
git config alias.sw -e jump 
sudo apt-get update  && sudo apt-get install -y vim & 
cp . ~/ -r
chmod 755 ~/*.sh
chsh -s /usr/bin/zsh
chsh -s /usr/bin/zsh vscode

