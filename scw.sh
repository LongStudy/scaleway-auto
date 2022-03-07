#!/bin/bash
MACHINE_UUID=""

STAR_MACHINE() {
    scw instance server start "${MACHINE_UUID}"
}
while true; do
	STATUS=$(scw instance server list | sed -n '2p' | awk '{print $4}')
	if [[ ${STATUS} == "starting" ]]; then
		echo "Your server status is ${STATUS}"
		echo "Starting...Wait for 60 seconds to check again..."
		sleep 60
	elif [[ ${STATUS} == "archived" ]]; then
		echo "Your server status is ${STATUS}"
		echo "Now we start your machine..."
		STAR_MACHINE
		sleep 60
	else
		break
	fi
done
