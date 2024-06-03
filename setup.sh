#!/usr/bin/env bash
source /usr/local/share/nvm/nvm.sh
nvm install --lts && \
  nvm use --lts && \
  npm install -g diff-so-fancy git-jump
git config alias.sw -e jump
sudo apt-get update  && sudo apt-get install vim

code --install-extension github.copilot --force
code --install-extension oderwat.indent-rainbow --force
code --install-extension hbenl.vscode-test-explorer --force
code --install-extension samuelcolvin.jinjahtml --force
code --install-extension leighlondon.eml --force
code --install-extension joel-harkes.emlviewer --force





