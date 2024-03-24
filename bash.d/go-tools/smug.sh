function _drc_install_smug() {
  SMUG_URL="https://github.com/ivaaaan/smug.git"
  SMUG_DIR=${SMUG_DIR:="$HOME/.local/share/smug"}
  if ! command -v go > /dev/null; then
    echo "missing go... unable to install smug" && exit 1
  fi
  if ! command -v git > /dev/null; then
    echo "missing git... unable to install smug" && exit 1
  fi

  if [ ! -d $SMUG_DIR ]; then
    echo "Missing: SMUG_DIR=$SMUG_DIR   ... creating"
    mkdir -p $SMUG_DIR
    pushd .
    cd $SMUG_DIR
    git clone $SMUG_URL .
    go install
    popd
  fi
}

if command -v smug > /dev/null; then
  unset -f _drc_install_smug
else
  echo "smug not installed.  fix: _drc_install_smug"
fi
