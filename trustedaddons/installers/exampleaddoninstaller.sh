#!/bin/bash
# NOTE: This requires KLSH to be preinsatlled
# execute chmod 755 ./exampleaddoninstaller before opening this
wget --quiet https://raw.githubusercontent.com/codingbunnys/klsh/master/trustedaddons/addons/exampleaddon
echo "exampleaddon" >> ${HOME}/.klsh/addons/Addons.list
