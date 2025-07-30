#!/bin/bash
websites=("https://google.com" "https://facebook.com" "https://twitter.com")
log_file="website_status.log"
> "$log_file"
for site in "${websites[@]}"; do
http_code=$(curl -o /dev/null -s -L -w "%{http_code}" "$site")
if [[ $http_code == "200" ]]; then
echo "$site is UP" | tee -a "$log_file"
else
echo "$site is DOWN" | tee -a "$log_file"
fi
done
echo "Результати збережено у $log_file"
