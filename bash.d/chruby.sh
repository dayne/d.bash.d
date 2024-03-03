#!/usr/bin/bash

CT_CHRUBY_INSTALL_DIR="$HOME/.local/share/chruby"

function ct-install-chruby() {
  pushd .  > /dev/null
  echo $PATH | grep ".local/bin" > /dev/null 
  if [ ! $? -eq 0 ]; then
    echo "Warning: $HOME/.local/bin not in PATH. Not attempting chruby install"
    exit 1
  fi

  if [ ! -d $CT_CHRUBY_INSTALL_DIR ]; then
    mkdir -p $CT_CHRUBY_INSTALL_DIR
  fi

  cd $CT_CHRUBY_INSTALL_DIR

  CHRUBY_VERSION="0.3.9"
  # wget or clone? how to pick latest version? 
  CHRUBY_URL="https://github.com/postmodern/chruby/releases/download/v${CHRUBY_VERSION}/chruby-${CHRUBY_VERSION}.tar.gz"
  wget --quiet -O chruby-${CHRUBY_VERSION}.tar.gz  $CHRUBY_URL
  if [ ! $? -eq 0 ]; then
    echo "Failed to download chruby: $CHRUBY_URL"
    exit 1
  fi

  tar -xzvf chruby-${CHRUBY_VERSION}.tar.gz
  if [ ! $? -eq 0 ]; then
    echo "Failed to tar xvfz chruby-${CHRUBY_VERSION}"
    exit 1
  fi

  cd chruby-${CHRUBY_VERSION}
  if [ ! $? -eq 0 ]; then
    echo "failed to enter chruby-${CHRUBY_VERSION}"
    exit 1
  fi
  PREFIX="$HOME/.local" make install
  if [ ! $? -eq 0 ]; then
    echo "Failed to install chruby: PREFIX=$HOME/.local make install"
    exit 1
  fi

  setup-chruby

  popd > /dev/null
}

function ct-check_for-chruby() {
  if [ ! -f $CT_CHRUBY_INSTALL_DIR/chruby.sh ]; then
    echo "Warning: Missing chruby.  Fix this with: ct-install-chruby"
    return 1
  fi

  source $HOME/.local/share/chruby/chruby.sh
  source $HOME/.local/share/chruby/auto.sh

  unset CT_CHRUBY_INSTALL_DIR # clean up name space
}

function ct-install-ruby-install() {
  echo "FUNKY FUN TIMES"
  # https://github.com/postmodern/ruby-install
  # TODO: deps: bash, grep, wget, md5sum, sha1sum, tar, bzip2, xz, patch, gcc/clang
  pushd . > /dev/null
  if [ ! -d $HOME/.local/share/ruby-install ]; then
    mkdir $HOME/.local/share/ruby-install
  fi
  cd $HOME/.local/share/ruby-install
  wget https://github.com/postmodern/ruby-install/releases/download/v0.9.3/ruby-install-0.9.3.tar.gz
  tar -xzvf ruby-install-0.9.3.tar.gz
  cd ruby-install-0.9.3/
  PREFIX="$HOME/.local" make install
  if [ $? -eq 0 ]; then
    echo "ruby-install-0.9.3 installed"
  else
    echo "SAD: ruby-install-0.9.3 failed to install"
  fi

  popd > /dev/null
}

function ct-check_for-ruby-install() {
  command -v ruby-install > /dev/null 2>&1
  if [ ! $? -eq 0 ]; then
    echo "Missing ruby-install: FIX: ct-install-ruby-install"
  else
    #unset ct-install-ruby-install
    true
  fi
}

ct-check_for-ruby-install
#unset ct-check_for-ruby-install

ct-check_for-chruby
#unset ct-check_for-chruby
