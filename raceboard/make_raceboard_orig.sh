#!/bin/bash
cd ~/
mousepad leaders.txt
cat leaders.txt | tr '\n' ' ' > output.txt; echo >> output.txt; while read a b c d e f g h i; do echo -e $a $b $c \\n$d $e $f \\n$g $h $i; convert -pointsize 36 -fill black -draw "text 185,637 \"$a $b\"" -draw "text 527,637 \"$c\"" -draw "text 185,774 \"$d $e\"" -draw "text 527,774 \"$f\"" -draw "text 185,910 \"$g $h\"" -draw "text 527,910 \"$i\"" -rotate 270 raceboard_template.jpg raceboard.jpg; done < output.txt
cat leaders.txt | tr '\n' ' ' > output.txt; echo >> output.txt; while read a b c d e f g h i; do echo -e $a $b $c \\n$d $e $f \\n$g $h $i; convert -pointsize 36 -fill black -draw "text 185,637 \"$a $b\"" -draw "text 527,637 \"$c\"" -draw "text 185,774 \"$d $e\"" -draw "text 527,774 \"$f\"" -draw "text 185,910 \"$g $h\"" -draw "text 527,910 \"$i\"" raceboard_template.jpg raceboard_temp.jpg; done < output.txt
firefox /userhome/raceboard_temp.jpg
rm /userhome/raceboard_temp.jpg
