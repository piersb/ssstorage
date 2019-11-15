#!/usr/bin/env bash
#
# install these as root

export DEBIAN_FRONTEND=noninteractive

sudo dpkg-reconfigure debconf -f noninteractive -p critical

sudo apt-get update

function install {
    echo installing $1
    shift
    sudo apt-get -y install "$@" >/dev/null
}



echo "Provisioning box..."
 
install SQlite libsqlite3-dev
install nodejs
install 'development tools' build-essential autoconf libtool
install Rails rails
install build-essential 
install libcurl4-openssl-dev
install libxml2-dev
install libpq-dev
install imagemagick --fix-missing