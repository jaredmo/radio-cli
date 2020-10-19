#!/bin/bash

PS3="Enter a station: "

select station in $(jq -r .[].name radio.json)
do
	echo "Selected station:" $station
	mpv $(jq -r '.[] | select(.name=="'$station'")'.url radio.json)
	break
done
