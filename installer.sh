#!/bin/bash
echo this installer will no longer work; unless you got a time machine :D
cd $HOME
function program {
  function install {
    if [[ $klshexists != true ]]; then
      echo 'function klsh {
          source ~/.klsh/.klshfunction
          if [[ $? == 0 ]]; then
            echo "KLSH loaded sucessfully"
          else
            echo "KLSH failed to load"
          fi
      }
      if [[ `ls $HOME/.klsh/default` == "$HOME/.klsh/default" ]]; then
        klsh
      fi
      export klshexists="true"' >> .bashrc
    fi
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
  else
    what=`zenity --list \
      --title="Wich of the following do you want to do" \
      --column="Option nr." --column="What" --column="Description" \
        1 Install "Installs klsh[latest version]" \
        1 Install "Installs klsh[latest version]"`
  fi

  if [[ "$what" == "1" ]]; then
    aold010101010010101001010010101011=$a
    a=`rm .klsh/.klsh*`
    a=`rm .klsh/.env*`
    a=`rm error.mp3x`
    sleep 3
    install
    a=$aold010101010010101001010010101011
  elif [[ "$what" == "2" ]]; then
    rm -rf .klsh
    echo ":("
  else
    echo "Canceled"
  fi
}
wget -q --spider https://raw.githubusercontent.com
if [ $? -eq 0 ]; then
  program
else
  zenity --error --ellipsize --text="Can't Connect to Github's usercontent page. Check your internet connection."
  sleep 10
  wget -q --spider https://github.com
  if [ $? -eq 0 ]; then
    program
  else
    zenity --error --ellipsize --text="Can't Connect to Github.com. Check your internet connection."
  fi
fi
