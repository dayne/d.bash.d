
# d.bash.d entry for .bashrc
# cat d.bashrc.sh >> ~/.bashrc
if [ -d $HOME/.bash.d ]; then
  for I in $HOME/.bash.d/*.sh; do
    source $I
  done
  if [[ ${OSTYPE//[0-9.]/} == 'darwin' ]]; then
    for I in  $HOME/.bash.d/*.sh.mac; do
      source $I
    done
  fi
  if [ -f $HOME/.bash.d/$HOSTNAME.sh.host ]; then
    source $HOME/.bash.d/$HOSTNAME.sh.host
  fi
fi
