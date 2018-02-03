#!/bin/bash

if [ ! -f ~/.ssh/id_rsa ]; then
	ssh-keygen -q -f ~/.ssh/id_rsa -N ""
	cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
	ssh -o StrictHostKeyChecking=no localhost "pwd" < /dev/null
fi

yum install git ansible -y

cd /tmp

git clone https://github.com/venerari/minishift.git

cd /tmp/minishift/

ansible-playbook -i inventory minishift.yml

touch /tmp/minishiftisdone

systemctl stop script2.service
systemctl disable script2.service
rm -f /etc/systemd/system/script2.service
systemctl daemon-reload
systemctl reset-failed
