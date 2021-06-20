#!/usr/bin/env bash
echo "Creat-SWAP by yanglc"
echo "本脚本仅在ubuntu下进行过测试"
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
echo "按任意键添加SWAP分区："
echo "使用CTRL+C退出脚本。。。"
echo "Press any key to continue："
echo " CTRL+C break command bash..."#CTRL+C EXIT
char=`get_char`
echo "Please set the partition size you want："
read -p "请输入要添加的大小:" size
sleep 1
echo "###########开始添加SWAP分区##########"
dd if=/dev/zero of=/mnt/swap bs=1M count='$size'
echo -e
echo "###########设置交换分区文件##########"
mkswap /mnt/swap
echo -e
echo "###########设置开机自启动############"
echo '/mnt/swap swap swap defaults 0 0' >> /etc/fstab
echo "All done！Thanks for using this shell script"
