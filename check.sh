launchctl list | awk '{print $3}' > temp; diff temp mac_sierra_vanilla.txt; rm -rf temp;
