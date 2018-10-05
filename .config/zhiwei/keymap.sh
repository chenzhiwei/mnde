#!/bin/bash

echo start $(date) > /tmp/xmodmap

xmodmap -e "keycode 76 = Insert Insert"

echo end $(date) >> /tmp/xmodmap
