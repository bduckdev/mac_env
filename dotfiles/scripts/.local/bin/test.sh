#!/bin/bash

if [ "$1" ]; then
	echo "success"
elif [ "$1" = help ]; then
	echo "help page"
else
	echo "idk lol"
fi
