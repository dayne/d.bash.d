which direnv > /dev/null 2>&1
if [ $? -ne 0 ]; then
  echo "missing direnv.  Fix with: apt install direnv"
  return 1
else
  eval "$(direnv hook bash)"
fi
