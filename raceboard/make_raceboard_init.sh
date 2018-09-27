#!/bin/bash
#cp -r /custom/usr/* /usr/
ln -sf /custom/usr/* /usr/
ln -s /usr/bin/convert-im6 /usr/bin/convert
if [ ! -f /wfs/user/leaders.txt ]; then
	cp /custom/leaders.txt /wfs/user
fi
	ln -sf /wfs/user/leaders.txt /userhome/leaders.txt
cp /custom/raceboard_template.jpg /userhome
chmod 666 /userhome/leaders.txt
sed -i -e 's/FORCE_UPDATE_WALLPAPER="false"/FORCE_UPDATE_WALLPAPER="true"/' config/bin/custom_ci
