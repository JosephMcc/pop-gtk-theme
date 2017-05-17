#! /bin/bash
#
# This file is part of pop-gtk-theme
#
# Copyright (C) 2016-2017 Tista <tista.gma500@gmail.com>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#

SRC_FILE="../assets-gtk2.svg"
COL_FILE="../../sass/common/_colors.scss"
KEY_FILE="../../sass/common/_key_colors.scss"

# Default colours
selection1="#00BCD4"
accent1="#4DB6AC"
suggestion1="#009688"
destruction1="#FF5252"
background1="#263238"
extra1="#2f3d44"
switch1="#293338"
tray1="#3b4c54"
check1="#29353b"
check2="#374248"
button1="#222d32"
equals1="#364249"
button2="#3f4d53"
button3="#2d383f"
button4="#4d5a60"


# Check and re-color color-scheme
if [ -e $KEY_FILE ]; then
    selection2="`grep 'key_accent' $KEY_FILE | \
                 cut -d' ' -f2 | cut -d';' -f1`"
    accent2="`grep 'key_selection' $KEY_FILE | \
              cut -d' ' -f2 | cut -d';' -f1`"
    suggestion2="`grep 'key_suggestion' $KEY_FILE | \
                  cut -d' ' -f2 | cut -d';' -f1`"
    destruction2="`grep 'key_destruction' $KEY_FILE | \
                   cut -d' ' -f2 | cut -d';' -f1`"
    background2="#574f4a"
    extra2="#39322f"
    switch2="#313131"
    tray2="#625c59"

    cp -f $SRC_FILE.in $SRC_FILE && sleep 1

    if [ $selection1 != $selection2 ]; then
        sed -i "s/$selection1/$selection2/gi" $SRC_FILE
        echo $selection1 is re-colored with $selection2.
    fi
    if [ $accent1 != $accent2 ]; then
        sed -i "s/$accent1/$accent2/gi" $SRC_FILE
        echo $accent1 is re-colored with $accent2.
    fi
    if [ $suggestion1 != $suggestion2 ]; then
        sed -i "s/$suggestion1/$suggestion2/gi" $SRC_FILE
        echo $suggestion1 is re-colored with $suggestion2.
    fi
    if [ $destruction1 != $destruction2 ]; then
        sed -i "s/$destruction1/$destruction2/gi" $SRC_FILE
        echo $destruction1 is re-colored with $destruction2.
    fi
    if [ $background1 != $background2 ]; then
        sed -i "s/$background1/$background2/gi" $SRC_FILE
        sed -i "s/$check1/$background2/gi" $SRC_FILE
        sed -i "s/$check2/$background2/gi" $SRC_FILE
        sed -i "s/$button3/$background2/gi" $SRC_FILE
        echo $background1 is re-colored with $background2.
    fi
    if [ $extra1 != $extra2 ]; then
        sed -i "s/$extra1/$extra2/gi" $SRC_FILE
        sed -i "s/$button1/$extra2/gi" $SRC_FILE
        echo $extra1 is re-colored with $extra2.
    fi
    if [ $switch1 != $switch2 ]; then
        sed -i "s/$switch1/$switch2/gi" $SRC_FILE
        sed -i "s/$button2/$switch2/gi" $SRC_FILE
        echo $switch1 is re-colored with $switch2.
    fi
    if [ $tray1 != $tray2 ]; then
        sed -i "s/$tray1/$tray2/gi" $SRC_FILE
        sed -i "s/$equals1/$tray2/gi" $SRC_FILE
        sed -i "s/$button4/$tray2/gi" $SRC_FILE
        echo $tray1 is re-colored with $tray2.
    fi
else
    echo _key_colors.scss was not found. Stopped...
    exit 1
fi
