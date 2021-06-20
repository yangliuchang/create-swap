#!/usr/bin/env bash
echo "
       Creat-SWAP by yanglc
       本脚本仅在Debian系系统下进行过测试
       "
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
echo "按任意键添加1G大小的SWAP分区："
char=`get_char`
echo "###########开始添加SWAP分区##########"
dd if=/dev/zero of=/mnt/swap bs=1M count=1024
echo -e
echo " ###########设置交换分区文件##########"
mkswap /mnt/swap
echo -e
echo " ###########启动SWAP分区中...#########"
swapon /mnt/swap
echo -e
echo " ###########设置开机自启动############"
echo '/mnt/swap swap swap defaults 0 0' >> /etc/fstab
echo "All done！Thanks for using this shell script"
