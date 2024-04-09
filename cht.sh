#!/usr/bin/env bash


languages=$(echo "golang typescript rust"| tr " " "\n")
core_utils=$(echo "find xargs sed awk"| tr " " "\n")
selected=$(echo -e "$languages\n$core_utils" | fzf)

read -p "Enter the query :" query

if echo "$languages" | grep -qs "$selected"; then
      bash -c "curl cht.sh/$selected/$(echo "$query"|tr " " "+")| less"
else
     bash -c  "curl cht.sh/$selected~$query |less"
fi
