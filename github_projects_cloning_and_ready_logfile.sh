#!/bin/bash

echo
echo "======== Starting reading links from links.txt========" #Make sure links.txt present in current dir.
echo
echo

path=$(pwd)
echo "root path: $path"
echo

while read gitLink
do
	
	echo "Started cloning project $gitLink"
	echo
	
	arr=(` echo $gitLink | tr '/' ' ' `) #this is to get the name of project.
	pPath="${path}/${arr[3]}"
	
	echo
	git clone $gitLink
	echo
	
	cd $pPath
	git log > ${arr[3]}_log.txt
	cd ../

done < links.txt