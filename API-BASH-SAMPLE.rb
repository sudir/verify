bash 'cleanup' do
 user 'root'
 cwd '/tmp'
  code <<-EOH
echo "

if test -f /sys/kernel/mm/transparent_hugepage/enabled; then
   echo never > /sys/kernel/mm/transparent_hugepage/enabled
fi
if test -f /sys/kernel/mm/transparent_hugepage/defrag; then
   echo never > /sys/kernel/mm/transparent_hugepage/defrag
fi 
">>/etc/rc.local
chkconfig rc-local on

chsh -s /bin/bash couchbase


echo " 
# Set swappiness to 0 to avoid swapping
vm.swappiness = 0">>/etc/sysctl.conf

rm -fr /etc/localtime
ln -s /usr/share/zoneinfo/America/New_York /etc/localtime

sed -i 's/mdcloud/md.cloud/g' /etc/hostname
sed -i 's/mdcloud/md.cloud/g' /etc/hosts
hostname `cat /etc/hostname`


reboot


EOH
end
