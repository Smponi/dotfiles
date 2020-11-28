#!/bin/bash

#kill running instances
killall -q polybar

#wait
while grep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar mybar &
