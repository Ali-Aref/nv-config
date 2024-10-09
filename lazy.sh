#!/bin/bash

# run this script only if you don't have the ~/.local/share/nvim/ directory
# git clone https://github.com/folke/lazy.nvim.git ~/.local/share/nvim/lazy/

# installing lsp
# ts_ls
npm install -g typescript custom-elements-languageserver
# tailwind
npm install -g @tailwindcss/language-server
# vscode language servers
# eslint, jsonls, cssls, html, ...
npm i -g vscode-langservers-extracted