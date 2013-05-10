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

# MySQL Connection String
openstack-config --set /etc/ceilometer/ceilometer.conf DEFAULT sql_connection mysql://ceilometer:$CEILOMETER_MYSQL_PASSWORD@localhost/ceilometer

openssl rand -hex 50 > metering-secret
# Set Metering Secret for Ceilometer
openstack-config --set /etc/ceilometer/ceilometer.conf DEFAULT metering_secret `cat metering-secret`

# Set Ceilometer user credentials
openstack-config --set /etc/ceilometer/ceilometer.conf DEFAULT os_tenant_name $NOVA_SERVICE_TENANT
openstack-config --set /etc/ceilometer/ceilometer.conf DEFAULT os_username $CEILOMETER_SERVICE_USERNAME
openstack-config --set /etc/ceilometer/ceilometer.conf DEFAULT os_password $CEILOMETER_SERVICE_PASSWORD

# Configure other Services to send Data to ceilometer

openstack-config --set /etc/glance/glance-api.conf DEFAULT notifier_strategy qpid
