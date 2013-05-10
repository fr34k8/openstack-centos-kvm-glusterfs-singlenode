#!/bin/sh

# Copyright 2012 Anton Beloglazov
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


# Start the Qpid AMQP message broker
service qpidd restart

# Restart libvirtd for mirtual machine management
service libvirtd restart

# Start OpenStack Nova services
service openstack-nova-api restart
service openstack-nova-cert restart
service openstack-nova-consoleauth restart

# Nova Metadata API must not run on single Node Installations as it blocks nova-compute from starting
#service openstack-nova-metadata-api restart

service openstack-nova-scheduler restart
service openstack-nova-conductor restart
service openstack-nova-compute restart

# Make the service start on the system startup
chkconfig qpidd on
chkconfig openstack-nova-api on
chkconfig openstack-nova-cert on
chkconfig openstack-nova-consoleauth on
# Nova Metadata API must not run on single Node Installations as it blocks nova-compute from starting
#chkconfig openstack-nova-metadata-api on
chkconfig openstack-nova-scheduler on
chkconfig openstack-nova-conductor on
chkconfig openstack-nova-compute on
