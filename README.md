# Minishift Installation

Tested on Vmware Workstation v12 (check the 3 virtualization engines when creating the vm) and Centos7-physical.  I run minishift with 4 vcpu, 12GB ram and 100GB disk, we don't know the limit.  

***Make sure your centos7 is server-gui when you select the installation for you need to run the minishift on the browser inside the vm. It's up to you later when you want to change this to bridge with kvm and make centos to no gui.  And by default kvm will use NAT, if you don't touch it.***

***This will only take about 10-15 min if you are using SSD including vm provisioning.***

The resources arguments for vcpu/ram/disk can be change on group_vars/all, please change it according to your resources.  If your laptop/computer are capable of 4 vcpus, 16GB ram and 512GB disk, then allocate a VM centos7 of 3 vcpus, 8GB ram and 80GB disk and then on the minishift (kvm vm), allocate 2 vcpus, 6GB ram and 60GB disk for example.  And do not run intensive applications like youtube or any video app.

***You can't proceed if your vm or physical computer is not capable of virtualization, check it by running "grep -E '(vmx|svm)' /proc/cpuinfo", it should output either vmx or svm.***

Do these after the vm had been provisioned and it should be executed to itself, login/su/sudo to root.

```
curl https://raw.githubusercontent.com/venerari/minishift/master/script1.sh | /bin/bash

This will reboot, please login again as root, check for file existence /tmp/minishiftisdone if it is done, 
you may check the process by "ps -ef | grep script2.sh".
```
 
Run from shell "oc login" and it should show the URL and then you could go to your centos7 firefox and login on it.

***The minishift is sensitive, installing any other software will break it.***

