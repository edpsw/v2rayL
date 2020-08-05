#!/bin/bash
# author: Suummmmer


rm /usr/bin/v2rayL/v2rayLui

echo "正在下载相关文件"
file_real_url=$(curl https://blog.thinker.ink/get_lanzou_link/?url=https://www.lanzous.com/i7jnw0b -s)
wget -O /etc/v2rayL/files.tar ${file_real_url:1:-1}
cd /etc/v2rayL
tar -xvf files.tar 1>/dev/null
sudo mv v2rayL.service /etc/systemd/system/v2rayL.service
sudo systemctl daemon-reload
chmod +x /etc/v2rayL/add.sh
chmod +x /etc/v2rayL/remove.sh
rm /etc/v2rayL/files.tar
sudo sed -i '/v2rayL.service/d' /etc/sudoers
current_user=$USER
echo "$current_user ALL=NOPASSWD:/bin/systemctl restart v2rayL.service,/bin/systemctl start v2rayL.service,/bin/systemctl stop v2rayL.service,/bin/systemctl status v2rayL.service,/bin/systemctl enable v2rayL.service,/bin/systemctl disable v2rayL.service,/bin/bash /etc/v2rayL/add.sh,/bin/bash /etc/v2rayL/remove.sh" | sudo tee -a /etc/sudoers
echo "正在下载最新应用"
app_real_url=$(curl https://blog.thinker.ink/get_lanzou_link/?url=https://www.lanzous.com/i7k5c0j -s)
wget -O /usr/bin/v2rayL/v2rayLui.tar ${app_real_url:1:-1}
# wget -O /usr/bin/v2rayL/v2rayLui https://github.com/Suummmmer/dl/releases/download/2.1.1/v2rayLui
cd /usr/bin/v2rayL
tar -xvf v2rayLui.tar 1>/dev/null
chmod +x /usr/bin/v2rayL/v2rayLui
rm /usr/bin/v2rayL/v2rayLui.tar


echo "更新完成, 重启程序生效."
