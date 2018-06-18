#!/bin/bash
#
# Can be used to clear away the data created and used by the OpenShift provisioner. Use at your own risk.

cd "$(dirname "${BASH_SOURCE[0]}")"
oc cluster down
rm -f nohup.out
echo "Would you like to unmount secrets mounted by the OpenShift cluster? (y/N)"
read unmount_secrets
if [ "$unmount_secrets" = "y" ]
then
    mount | grep /var/lib/origin/openshift.local.volumes | awk '{ print $3 }' | sudo xargs -r umount
    echo "Files unmounted succesfully"
fi

echo "Would you like to remove all files under and including /var/lib/origin? (y/N)"
read delete_origin
if [ "$delete_origin" = "y" ]
then
    sudo rm -rf /var/lib/origin
    echo "Deleted /var/lib/origin recursively"
fi
