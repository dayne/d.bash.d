# https://golang.org/doc/code.html#GOPATH

which go > /dev/null 2>&1
if [ $? -eq 0 ]; then
  # we have go
  export PATH=$PATH:$(go env GOPATH)/bin
elif [ -d $HOME/go ]; then
  # we have home go
  export PATH=$PATH:$HOME/go/bin
else
  # we have no go and no ~/.go
  echo "missing go - apt install golang or:"
  # https://awesomeopensource.com/project/canha/golang-tools-install-script
  echo "wget -q -O - https://git.io/vQhTU | bash"
fi
