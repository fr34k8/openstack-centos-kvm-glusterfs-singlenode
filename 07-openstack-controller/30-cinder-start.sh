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

# Start OpenStack Cinder services
service openstack-cinder-api restart
service openstack-cinder-scheduler restart
service openstack-cinder-volume restart

# Make the service start on the system startup
chkconfig openstack-cinder-api on
chkconfig openstack-cinder-scheduler on
chkconfig openstack-cinder-volume on
