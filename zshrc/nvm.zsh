if [[ -a ~/.nvm ]]
then
  export NVM_DIR="/home/henry/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
fi
