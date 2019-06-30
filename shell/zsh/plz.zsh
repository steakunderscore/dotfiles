# for https://please.build/
if [ $commands[plz] ]; then
  source <(plz --completion_script)
elif [ $commands[please] ]; then
  source <(plz --completion_script)
fi
