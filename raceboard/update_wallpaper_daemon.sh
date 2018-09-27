#!/bin/bash

LOCAL_WALLPAPER=/services/cspl/wallpaper/raceboard.jpg
REMOTE_WALLPAPER=/smbmount/Program\ Files\ \(x86\)/IGEL/RemoteManager/rmguiserver/webapps/ums_filetransfer/raceboard.jpg

while [ 1 == 1 ]
	do
		diff "$LOCAL_WALLPAPER" "$REMOTE_WALLPAPER"
		if [ $? -eq 2 ]
			then
				xterm -iconic -e 'su -c "/config/bin/custom_ci"'
		fi
		sleep 5
	done &
