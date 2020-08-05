#!/bin/bash
# author: Suummmmer

SHELL_FOLDER=$(cd "$(dirname "$0")";pwd)

echo "创建   /etc/v2rayL"
if [ -d "/etc/v2rayL" ];then
    echo "已存在/etc/v2rayL"
else
    sudo mkdir /etc/v2rayL
    echo "设置权限和快捷方式"
    sudo chmod 777 -R /etc/v2rayL
fi

echo "创建   /usr/bin/v2rayL"
if [ -d "/usr/bin/v2rayL" ];then
    echo "已存在/usr/bin/v2rayL"
else
    sudo mkdir /usr/bin/v2rayL
    sudo chmod 777 -R /usr/bin/v2rayL
fi

cp ${SHELL_FOLDER}/v2ray-core.tar /etc/v2rayL
