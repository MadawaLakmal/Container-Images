#!/bin/bash

echo "################################################################"
echo "#- This acript assume system has already installed CURL & ZIP -#"
echo "# Script will install the AWS-cli accoring to the architecture #"
echo "################################################################"

ARCH=`uname -p`
PACKAGE=""
PACKAGE_URL=""

if [[ "$ARCH" == "aarch64" || "$ARCH" == "arm" ]];then
    PACKAGE_URL="https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip";
    PACKAGE="ARM"
else
    PACKAGE_URL="https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip";
    PACKAGE="AMD"
fi

echo "[TASK 1] - Downloading Package for ${PACKAGE} atchitecture ......"
curl ${PACKAGE_URL} -o "awscliv2.zip"

echo "[TASK 2] - Unarchiving package ......"
unzip awscliv2.zip

echo "[TASK 3] - Installing package ......"
bash ./aws/install

if [ $? -eq 0 ];then
    echo "Installation succeeded !!!"
else
    echo "ERROR !!!"
fi

rm -rf aws
rm -rf awscliv2.zip