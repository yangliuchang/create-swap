#!/usr/bin/env bash
RED_COLOR="\033[0;31m"
NO_COLOR="\033[0m"
GREEN="\033[32m\033[01m"
BLUE="\033[0;36m"
FUCHSIA="\033[0;35m"
echo "export PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin:$PATH" >> ~/.bashrc
source ~/.bashrc
sleep 2
echo "
      ${GREEN} Creat-SWAP by yanglc
      ${GREEN} 本脚本仅在Debian系系统下进行过测试"
get_char()
{
    SAVEDSTTY=`stty -g`
    stty -echo
    stty cbreak
    dd if=/dev/tty bs=1 count=1 2> /dev/null
    stty -raw
    stty echo
    stty $SAVEDSTTY
}
echo " ${GREEN} 按任意键添加1G大小的SWAP分区："
char=`get_char`
echo " ${GREEN} ###########开始添加SWAP分区##########"
dd if=/dev/zero of=/mnt/swap bs=1M count=1024
echo -e
echo " ${GREEN} ###########设置交换分区文件##########"
mkswap /mnt/swap
echo -e
echo " ${GREEN} ###########启动SWAP分区中...#########"
swapon /mnt/swap
echo -e
echo " ${GREEN} ###########设置开机自启动############"
echo '/mnt/swap swap swap defaults 0 0' >> /etc/fstab
echo " ${GREEN} All done！Thanks for using this shell script"
