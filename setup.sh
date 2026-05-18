#!/bin/zsh

xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install ansible git
git clone git@github.com:bduckdev/mac_env.git
cd mac_env
ansible-playbook ./ansible/playbook.yml --ask-become-pass


