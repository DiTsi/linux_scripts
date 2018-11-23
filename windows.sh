#!/bin/bash

function workspaces_index {
	local index=$(wmctrl -d | awk '/*/ { print $1 }')
	echo $index
}

function workspaces_summary {
	local num=$(wmctrl -d | wc -l)
	echo $num
}

function apps_on_all_workspaces {
	local application_name=$1
	local apps=$(wmctrl -l | awk -v v=$application_name 'tolower($0) ~ /v/ {print $0}')
	echo $apps
}

function apps_on_current_workspace {
	application_name=$1

}

function windowid_current {
	local id=$(xprop -root | grep "_NET_ACTIVE_WINDOW(WINDOW): window id #" | awk '{gsub(",",""); print $5}')
	echo $id
}

function select_app_in_group {
	local application_name=$1
	local apps=$(apps_on_all_workspaces)
	local window_current=$(windowid_current)
	echo $apps
	echo $window_current



}

index=$(select_app_in_group chromium)
echo $index
exit 0
