#!/bin/bash

cd ~/

if [ ! -d /smbmount ]
	then
	zenity --error --text "ums_filetransfer not mounted - check profile"
	exit 1;
fi

if [ $1 == "--rescue" ]
	then
		mousepad /userhome/leaders.txt
	else
		zenity --forms \
		--add-entry=First\ Name \
		--add-entry=Last\ Name \
		--add-entry=Lap\ Time \
		--text=Race\ Demo \
		| tr -d ' ' \
		| tr '|' ' ' \
		>> /userhome/leaders.txt
fi

sort -n -k3 /userhome/leaders.txt | sed '/^\s*$/d' > /userhome/leaders.sorted
head -3 /userhome/leaders.sorted | tr '\n' ' ' > /userhome/output.txt
echo >> /userhome/output.txt

	while read a b c d e f g h i
	do echo -e $a $b $c \\n$d $e $f \\n$g $h $i
		convert -pointsize 36 -fill black \
		-draw "text 185,637 \"${a:0:9} ${b:0:9}\"" \
		-draw "text 527,637 \"$c\"" \
		-draw "text 185,774 \"${d:0:9} ${e:0:9}\"" \
		-draw "text 527,774 \"$f\"" \
		-draw "text 185,910 \"${g:0:9} ${h:0:9}\"" \
		-draw "text 527,910 \"$i\"" \
		-rotate 270 \
		/userhome/raceboard_template.jpg /userhome/raceboard.jpg
	done < /userhome/output.txt
	
	while read a b c d e f g h i
	do echo -e $a $b $c \\n$d $e $f \\n$g $h $i
		convert -pointsize 36 -fill black \
		-draw "text 185,637 \"${a:0:9} ${b:0:9}\"" \
		-draw "text 527,637 \"$c\"" \
		-draw "text 185,774 \"${d:0:9} ${e:0:9}\"" \
		-draw "text 527,774 \"$f\"" \
		-draw "text 185,910 \"${g:0:9} ${h:0:9}\"" \
		-draw "text 527,910 \"$i\"" \
		/userhome/raceboard_template.jpg /userhome/raceboard_temp.jpg
	done < /userhome/output.txt

#firefox /userhome/raceboard_temp.jpg
rm /userhome/raceboard_temp.jpg

cp /userhome/raceboard.jpg /smbmount/Program\ Files\ \(x86\)/IGEL/RemoteManager/rmguiserver/webapps/ums_filetransfer/

	if [[ $? -ne 0 ]]; then
		zenity --error \
		--text "Image not copied.  Check availabity of UMS and configuration of smbmount in profile"
	exit 1
	fi

# These are not needed, but kept for historical purposes

# Uncomment this if running this directly on raceboard device
#xterm -iconic -e 'su -c "/config/bin/custom_ci" root'

# Uncomment this if running on other device -- Racecar or kiosk in booth
# Make sure to edit the SSH IP!
#ssh -t root@192.168.0.82 -o StrictHostKeyChecking=no '/config/bin/custom_ci'
