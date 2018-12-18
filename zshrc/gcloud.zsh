export GOOGLE_CLOUD_SDK_HOME="${GOOGLE_CLOUD_SDK_HOME:/opt/google-cloud-sdk}"
if [[ -a $GOOGLE_CLOUD_SDK_HOME ]]
then
  [ -f ${GOOGLE_CLOUD_SDK_HOME}/completion.zsh.inc ] && . "${GOOGLE_CLOUD_SDK_HOME}/completion.zsh.inc"
fi
