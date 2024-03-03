command -v yarn > /dev/null
if [ ! $? -eq 0 ]; then
  echo "missing YARN"
  echo "FIX this by: sudo npm install --global yarn"
fi
