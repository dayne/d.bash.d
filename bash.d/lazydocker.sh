#!/usr/bin/bash

if command -v docker > /dev/null 2>&1; then
  if ! command -v lazydocker > /dev/null 2>&1; then
    echo "NOTe: Docker installed but Lazy Docker is not: setting up alias: install_lazy_docker"
    alias install_lazy_docker="curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash"
  fi
fi
