#!/bin/bash
function proceed {
  cd ~
  wget --quiet https://raw.githubusercontent.com/codingbunnys/klsh/master/installerfiles/versions/1.0-alpha.2/klsh.zip
  unzip klsh.zip
  cd .klsh
  rm default
  cd ..
  echo "
  function klsh {
      source ~/.klsh/.klshcore
  }
  if [[ `cat \$HOME/.klsh/default` == \"true\" ]]; then
    klsh
  fi" >> .bashrc
  cd .klsh
  chmod 777 ./*
  chmod 777 ./addons/*
  zenity --notification --text="Done INSTALLING" --hint="open a **NEW** terminal and run \"klsh\""
}
if [[ "${USER}" != "root" ]]; then
  echo "If there isnt a request to enter a password below, Run this program as ROOT"
  sudo apt install zip
  if [[ $? == 0 ]]; then
    sudo apt install zenity
    if [[ $? == 0 ]]; then
      proceed
    fi
  fi
else
  apt install zip
  sudo apt install zenity
  proceed
fi
