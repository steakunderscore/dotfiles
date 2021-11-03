function tmp() {
  tmp="${tmp:=$(mktemp -d)}"

  if [ "${PWD}" != "${tmp}" ]
  then
    cd "${tmp}"
  fi
}

function untmp() {
  if [ -z ${tmp+x} ]
  then
    return
  fi

  if [[ "${PWD}" == "${tmp}" ]]
  then
    cd "${HOME}"
  fi

  rm -rf "${tmp}"

  unset tmp
}
