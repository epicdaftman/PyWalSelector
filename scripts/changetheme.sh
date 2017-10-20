#Made by daft https://github.com/epicdaftman
cd ~/.config/i3/themes

lines=$(ls -1 --file-type | grep -v '/$' | wc -l) #Determine the number of lines for rofi to show
theme=`(for name in $(ls); do echo $name; done; echo '------------------------------------------------------------------';echo Random; echo "Save"; echo Rename; echo Delete) | rofi -lines $(( $lines + 5 )) -font unifont\ 28 -dmenu -p Theme:` #Use rofi to select option


if [ $theme = 'Random' ]; then #Random images from imgur :)
  python ../scripts/randimg.py
  wal -c -i ../wall

elif [ $theme == "Rename" ]; then
  first=$( (for name in $(ls); do echo $name; done; echo '------------------------------------------------------------------';echo Cancel;) | rofi -dmenu -p "Which theme do you want to rename? " -font unifont\ 28 -lines $(( $lines + 2 )) )
  if [ $first == '-----------------------------------------------------------------' ]; then exit; fi
  if [ $fist == 'Cancel' ]; then exit; fi
  second=$( echo Cancel | rofi -dmenu -p "What do you want to rename $first to? " -l 1 -font unifont\ 28)
  if [ $second = "Cancel" ]; then exit;
  else
    mv $first $second
  fi

elif [ $theme = 'Delete' ];then
  del=$( (for i in $(ls); do echo $i; done; echo '------------------------------------------------------------------'; echo "Cancel")| rofi -dmenu -lines $(( $lines + 2 )) -font unifont\ 28 -p "Which One? ")
  if [ $del == "Cancel" ]; then
    exit
  elif [ $del == '------------------------------------------------------------------' ]; then
    exit
  fi
  mv $del .deleted


elif [ $theme = 'Save' ]; then
  new=$(echo "Cancel" | rofi -dmenu -lines 1 -font unifont\ 28 -p "What do you want to call it? ")
  if [ $new == "Cancel" ]; then
    exit
  fi
  cp ../wall $new

elif [ $theme = '------------------------------------------------------------------' ]; then
  exit

else
  cp $theme ../wall #This is where the wallpaper is stored
  wal -c -i ../wall #Set colorscheme to the selected one
fi
