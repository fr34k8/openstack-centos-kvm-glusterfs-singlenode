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


# Start the ceilometer services
service openstack-ceilometer-api restart
service openstack-ceilometer-collector restart

# Make sure they run on system start
chkconfig openstack-ceilometer-api on
chkconfig openstack-ceilometer-collector on
