if [ $commands[gphotos-uploader-cli] ]; then
  source <(gphotos-uploader-cli completion $(basename ${SHELL}))
fi
