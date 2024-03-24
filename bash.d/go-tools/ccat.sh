
if command -v go > /dev/null; then
  if ! command -v ccat > /dev/null; then
      echo "missing ccat"
      echo "fix: go get -u github.com/owenthereal/ccat"
  fi
fi
