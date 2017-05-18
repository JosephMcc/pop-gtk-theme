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

SRC_DIR="../assets-xfwm"
RECOLOR_FILE1="./../assets-xfwm/close-pressed.svg"
RECOLOR_FILE2="./../assets-xfwm/menu-pressed.svg"
RECOLOR_FILE3="./../assets-xfwm/close-prelight.svg"
COL_FILE="../../../gtk/sass/common/_colors.scss"
KEY_FILE="../../../gtk/sass/common/_key_colors.scss"

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

# Check and re-color 'close-pressed' and 'menu-pressed' button
if [ -e $KEY_FILE ]; then
    selection2="`grep 'key_selection' $KEY_FILE | \
                 cut -d' ' -f2 | cut -d';' -f1`"
    destruction2="`grep 'key_destruction' $KEY_FILE | \
                   cut -d' ' -f2 | cut -d';' -f1`"

    cp -f $RECOLOR_FILE1.in $RECOLOR_FILE1
    cp -f $RECOLOR_FILE2.in $RECOLOR_FILE2
    cp -f $RECOLOR_FILE3.in $RECOLOR_FILE3

    if [ $selection1 != $selection2 ]; then
        sed -i "s/$selection1/$selection2/gi" $RECOLOR_FILE1
        sed -i "s/$selection1/$selection2/gi" $RECOLOR_FILE2
        echo $selection1 is re-colored with $selection2.
    fi

    if [ $destruction1 != $destruction2 ]; then
        sed -i "s/$destruction1/$destruction2/gi" $RECOLOR_FILE3
        echo $destruction1 is re-colored with $destruction2.
    fi
else
    echo _key_colors.scss was not found. Stopped...
    exit 1
fi
