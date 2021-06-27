#!/usr/bin/env bash
echo "
       Creat-SWAP by yanglc
       本脚本仅在Debian系系统下进行过测试
       "
now=`free -m| grep "Swap:"| awk '{print $2}'`
echo "当前系统swap分区大小为:$now Mb"
echo "请输入要增加的swap分区大小（单位Mb）:"
read -e swap
echo "###########开始添加SWAP分区##########"
sudo dd if=/dev/zero of=/mnt/swap bs=1M count=${swap}
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
