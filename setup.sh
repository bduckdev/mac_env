#!/bin/zsh

xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install ansible git
git clone <your-playbook-repo>
cd <your-playbook-repo>
ansible-playbook local.yml --ask-become-pass
