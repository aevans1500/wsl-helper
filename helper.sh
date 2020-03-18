#!/bin/bash

base_dir="/mnt/c/Users/aevan/Desktop/WSL"

function mirror() {

	cur=$(pwd)

	IFS='/'
	read -ra arr <<< "$cur"
	len=${#arr[@]}

	read -ra brr <<< "$base_dir"
	base_len=${#brr[@]}
	base_last="${brr[-1]}"

	dir=""
	if [ "${arr[1]}" = "home" ]; then
		dir="$base_dir$cur"
	elif (( $len > $base_len-1 )); then
		if [ "${arr[6]}" = "$base_last" ]; then
			for ((i = 7 ; i < $len ; i++)); do
				dir="$dir/${arr[$i]}"
			done
		fi
	fi

	local ret="$dir"
	echo "$ret"

}

function relay() {

	if (( $# == 0 )); then
		echo "please specify contents"
		return
	fi

	dir=$(mirror)

	mkdir -p "$dir"
	cp "$@" "$dir"

}

function base() {

	cd "$base_dir"

}

function warp() {

	dir=$(mirror)

	if [ "$dir" = "" ]; then
		dir=~
	else
		mkdir -p "$dir"
	fi

	cd "$dir"

}
