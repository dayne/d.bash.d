
function install_bashit() {
  if [ ! -d $HOME/.bash_it ]; then
    git clone -depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
    if [ $? -eq 0 ]; then
      ~/.bash_it/install.sh 
    else
      echo "FAILED: git clone -depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it"
    fi
  fi
}


if [ ! -d $HOME/.bash_it ]; then
  echo "MISSING: bash_it.  Fix by running: install_bashit"
else
  unset -f install_bashit
fi
