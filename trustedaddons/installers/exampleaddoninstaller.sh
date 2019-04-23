#!/bin/bash
# NOTE: This requires KLSH to be preinsatlled
# execute chmod 755 ./exampleaddoninstaller.sh before opening this
wget --quiet https://raw.githubusercontent.com/codingbunnys/klsh/master/trustedaddons/addons/exampleaddon
echo "exampleaddon" >> ${HOME}/.klsh/addons/Addons.list
mv ./exampleaddon ${HOME}/.klsh/addons/Addons.list
echo "INSTALLATION C O M P L E T E !"
