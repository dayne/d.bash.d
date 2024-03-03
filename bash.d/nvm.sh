# Node Version Manager
# https://github.com/creationix/nvm
# install via their curl (see their readme)
# manual upgrade:

export NVM_DIR="$HOME/.nvm"

if [ -d $NVM_DIR ]; then
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

  function nvm_manual_upgrade()
  {
    (
    cd "$NVM_DIR"
    git fetch --tags origin
    ctag=`git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
    git checkout $ctag
    ) && \. "$NVM_DIR/nvm.sh"
  }
else 
  if [ ! -f ~/.nvm-ignore ]; then
    echo "missing nvm - install it with: https://github.com/nvm-sh/nvm#install--update-script"
    echo "supress this message by touching ~/.nvm-ignore"
  fi
fi

which npm > /dev/null 2>&1
if [ $? -ne 0 ]; then
  # don't have it
  echo 'npm not installed - install it with nvm
  https://github.com/nvm-sh/nvm#install--update-script
  nvm install --lts  # stable release
  '
fi
