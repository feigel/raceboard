while [ 1 == 1 ]; do mount -oremount,rw /services/cspl; rm /services/cspl/wallpaper/raceboard.jpg; mount -oremount,ro /services/cspl; /config/bin/custom_ci; sleep 60; done
