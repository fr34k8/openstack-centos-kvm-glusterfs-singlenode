#!/bin/sh

# Copyright 2013 Jan Peters
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Configure tgt-admin as described here:
# http://docs.openstack.org/grizzly/openstack-compute/install/yum/content/cinder-install.html
sed -i "s|\(#include /etc/tgt/temp/[*]\.conf\)|\1\ninclude /var/lib/cinder/volumes/*|g" /etc/tgt/targets.conf

# Config cinder
openstack-config --set /etc/cinder/cinder.conf DEFAULT volume_group cinder-volumes
openstack-config --set /etc/cinder/cinder.conf DEFAULT volume_name_template volume-%s
openstack-config --set /etc/cinder/cinder.conf DEFAULT auth_strategy keystone
openstack-config --set /etc/cinder/cinder.conf DEFAULT volumes_dir /var/lib/cinder/volumes

# Set Cinder API user credentials
openstack-config --set /etc/cinder/api-paste.ini filter:authtoken admin_tenant_name $NOVA_SERVICE_TENANT
openstack-config --set /etc/cinder/api-paste.ini filter:authtoken admin_user $CINDER_SERVICE_USERNAME
openstack-config --set /etc/cinder/api-paste.ini filter:authtoken admin_password $CINDER_SERVICE_PASSWORD

# Set the connection to the MySQL server
openstack-config --set /etc/cinder/cinder.conf DEFAULT sql_connection mysql://cinder:$CINDER_MYSQL_PASSWORD@localhost/cinder

echo '--------------- ATTENTION! - Now one manual step is required!! ----------------------'
echo ' Find the device on which the "cinder-volume" is placed '
echo ' You can run the command --> lsblk <-- to get an overview '
echo ' Then you have to configure LVM with vi /etc/lvm/lvm.conf '
echo ' There, add ALL Devices that DO NOT CONTAIN the cinder-volume like in the EXAMPLE below: '
echo ' Seach for this line: '
echo '        filter = [ "a/.*/" ] '
echo ' and replace it with this Line, but change the devices to your config and the output of lsblk !!!! '
echo '        filter = [ "a/md1/", "a/md2/", "a/md3/", "a/md4/", "a/md5/", "r/.*/" ] '
echo ' In this example we need md1, md2, md3, md4 and md5. md6 contains the cinder-volume!'
echo ' The list HAS to END with --> "r/.*/" <-- ! '
echo ' After you are done. Continue with the scripts'
echo ' --------------------------------------------------------------------------------------'
