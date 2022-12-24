#!/bin/sh
echo "Updating elixir-ls..."
cd ~/.elixir-ls
git pull
mix deps.get
MIX_ENV=prod mix compile
echo "Generating Release..."
MIX_ENV=prod mix elixir_ls.release -o release
echo "Copying files..."
rm -rf ~/.config/coc/extensions/node_modules/coc-elixir/els-release/*
cp release/* ~/.config/coc/extensions/node_modules/coc-elixir/els-release
echo "Done"
