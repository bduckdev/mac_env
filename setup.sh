#!/bin/zsh

xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install ansible git
git clone git@github.com:bduckdev/mac_env.git
cd mac_env
ansible-playbook local.yml --ask-become-pass
