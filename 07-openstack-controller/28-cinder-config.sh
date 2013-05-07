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

# Set Cinder API user credentials
openstack-config --set /etc/cinder/api-paste.ini filter:authtoken admin_tenant_name $NOVA_SERVICE_TENANT
openstack-config --set /etc/cinder/api-paste.ini filter:authtoken admin_user $CINDER_SERVICE_USERNAME
openstack-config --set /etc/cinder/api-paste.ini filter:authtoken admin_password $CINDER_SERVICE_PASSWORD

# Set the connection to the MySQL server
openstack-config --set /etc/cinder/cinder.conf DEFAULT sql_connection mysql://cinder:$CINDER_MYSQL_PASSWORD@localhost/cinder
