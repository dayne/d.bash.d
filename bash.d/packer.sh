#!/usr/bin/bash

if command -v packer > /dev/null ; then
  # got packer
  false
else
function _drc_install_packer() {
  local PACKER_ZIP_URL="https://releases.hashicorp.com/packer/1.10.2/packer_1.10.2_linux_amd64.zip"
  local ZIP_FILE=$(basename $PACKER_ZIP_URL)
  pushd .
  mkdir -p $HOME/.local/share/packer
  cd $HOME/.local/share/packer 
  if [ -f $ZIP_FILE ]; then
    echo "skipping download: $ZIP_FILE exists"
  else
    echo "wget $PACKER_ZIP_URL"
    wget --quiet $PACKER_ZIP_URL
  fi
  if [ $? -eq 0 ]; then
    ZIP_FILE=$(basename $PACKER_ZIP_URL)
    echo "Downloaded $ZIP_FILE success"
    unzip $ZIP_FILE
    cp -l packer $(basename $ZIP_FILE .zip)
    mv packer $HOME/.local/bin
  else
    echo "Download of $PACKER_ZIP_URL failed"
    echo "download and put packer in $HOME/.local/bin"
  fi
  popd .
}
echo "no packer: Fix: _drc_install_packer"
fi
