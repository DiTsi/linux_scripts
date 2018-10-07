#!/bin/bash

# TITLE_COLOR="\e[32"

##########################################################
# Script for installing pbis-open on Debian-like systems #
# This script should execute under root user             #
##########################################################

# Check package apt-transport-https is installed
dpkg -s apt-transport-htasdsd
if [ $? -eq 1 ]; then
	echo Package apt-transport-htasdsd is not installed. Please install it first
	exit 1
fi


# Add public key
echo -e "\e[32 Adding public key for pbis:"
wget -O - http://repo.pbis.beyondtrust.com/apt/RPM-GPG-KEY-pbis|apt-key add -

# Add repository for pbis-open
echo -e "\e[32 Adding repo for pbis:"
wget -O /etc/apt/sources.list.d/pbiso.list http://repo.pbis.beyondtrust.com/apt/pbiso.list

echo -e "\e[32 Updating repos:"
apt-get update

echo -e "\e[32 Installing PBIS:"
apt-get install pbis-open


cd /opt/pbis/bin
echo -e "\e[32 Joining this PC to domain:"
./domainjoin-cli join HORSGROUP.COM dmitrii.tsybus

echo -e "\e[32 Set necessary configuration settings for PBIS:"
./config LoginShellTemplate "/bin/bash"
./config UserDomainPrefix "HORSGROUP"
# ./config DDRequireMembershipOf "HORSGROUP\\WikiAdmin"
./config AssumeDefaultDomain true

exit 0