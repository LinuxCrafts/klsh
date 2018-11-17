#!/bin/bash
cd $HOME
function install {
  mkdir .klsh
  cd .klsh
  #Main functions
  wget --quiet https://raw.githubusercontent.com/codingbunnys/klsh/master/.klsh/.klshfunction
  wget --quiet https://raw.githubusercontent.com/codingbunnys/klsh/master/.klsh/.klshfunction2
  wget --quiet https://raw.githubusercontent.com/codingbunnys/klsh/master/.klsh/.klshother
  wget --quiet https://raw.githubusercontent.com/codingbunnys/klsh/master/.klsh/.environmentvariables
  #ERROR SOUND
  wget --quiet https://s3.amazonaws.com/freesoundeffects/mp3/mp3_12258.mp3
  temp=`mv "mp3_12258.mp3" error.mp3`
  echo -e "#!/bin/bash\napt-get install vlc jq zenity" > ./installfiles
  chmod 755 ./installfiles
  gksudo -m "Enter password so we can install some required programs" ./installfiles
  if [[ $? == 255 ]]; then
    echo "Requirements might not be met..."
  fi
  rm ~/.klsh/installfiles
}

if [[ `ls .klsh/.klshfunction` == `echo .klsh/.klshfunction` ]]; then
  what=`zenity --list \
    --title="Wich of the following do you want to do" \
    --column="Option nr." --column="What" --column="Description" \
      1 Update/Reinstall "Reinstalls klsh[latest version]" \
      2 Uninstall "will uninstall klsh :("`
  if [[ "$what" == "1" ]]; then
    rm .klsh/.klsh*
    rm .klsh/.env*
    sleep 3
    install
  elif [[ "$what" == "2" ]]; then
    rm -rf .klsh
    echo ":("
  else
    echo "Canceled"
  fi
else
  # install
  printf ""
fi
