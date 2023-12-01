#!/bin/bash


if [ -e /usr/local/bin/devenv ]; then
	rm /usr/local/bin/devenv
	export PATH=$PATH:$PWD
	ln -s $PWD/DevEnv.sh /usr/local/bin/devenv
else
	export PATH=$PATH:$PWD
	ln -s $PWD/DevEnv.sh /usr/local/bin/devenv
fi

commands=("figlet")
function check_install_command {
  if ! command -v $1 &> /dev/null; then
    apt-get install $1
  fi
}
for cmd in "${commands[@]}"; do
  check_install_command $cmd
done


