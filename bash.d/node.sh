command -v node > /dev/null
if [ ! $? -eq 0 ]; then
  echo "Warning: node missing"
  echo "ubuntu fix: https://github.com/nodesource/distributions"
  echo "##########################################################################"
  echo "   curl -fsSL https://deb.nodesource.com/setup_21.x | sudo -E bash - &&\\"
  echo "   sudo apt-get install -y nodejs"
  echo "##########################################################################"
else
  #TODO ensure nodeversion is creater than 20
  true
fi
