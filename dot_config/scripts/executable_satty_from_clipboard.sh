#!/bin/bash
file_path=$(wl-paste --type text/uri-list 2>/dev/null | grep '^file://' | sed 's|^file://||' | tr -d '\r\n')

if [ -n "$file_path" ]; then
    satty -f "$file_path"
else
    wl-paste --type image/png | satty -f -
fi
