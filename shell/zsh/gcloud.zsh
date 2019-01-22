[ -d /opt/google-cloud-sdk ] && export GOOGLE_CLOUD_SDK_HOME="/opt/google-cloud-sdk"
[ -d /usr/share/google-cloud-sdk ] && export GOOGLE_CLOUD_SDK_HOME="/usr/share/google-cloud-sdk"

if [[ -d $GOOGLE_CLOUD_SDK_HOME ]]
then
  [ -f ${GOOGLE_CLOUD_SDK_HOME}/completion.zsh.inc ] && . "${GOOGLE_CLOUD_SDK_HOME}/completion.zsh.inc"
fi
