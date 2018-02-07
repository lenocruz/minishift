#!/bin/bash

sh -c 'echo -e "[centos]\nname=CentOS $releasever - $basearch\nbaseurl=http://mirror.centos.org/centos/7/os/\$basearch/\nenabled=1\ngpgcheck=1\ngpgkey=http://mirror.centos.org/centos/7/os/\$basearch/RPM-GPG-KEY-CentOS-7" > /etc/yum.repos.d/centos.repo'

curl -o  /etc/systemd/system/script2.service https://raw.githubusercontent.com/itikabc/minishift/master/script2.service

curl -o  /root/script2.sh https://raw.githubusercontent.com/itikabc/minishift/master/script2.sh

chmod +x /root/script2.sh

systemctl daemon-reload

systemctl enable script2.service

yum clean all

yum install epel-release -y

yum update -y

yum install gcc make kernel-devel -y

echo "This will reboot now, unfortunately after reboot, it should continue to install on the background."
echo "Check the /tmp/minishitisdone file existence.  If it does not exist, it is not done, you may also check"
echo "the second script on the process ps -ef script2.sh"

sleep 10

systemctl reboot
