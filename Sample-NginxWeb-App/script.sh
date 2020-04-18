#!/bin/sh

IpADDR=`hostname -i`
FilePATH="/usr/share/nginx/html/index.html"

sed -i "s/xxxxxxxxxx/$IpADDR/g" $FilePATH