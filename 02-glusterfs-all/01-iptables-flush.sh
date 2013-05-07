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


# Open required Ports for GlusterFS
# See http://gluster.org/community/documentation/index.php/Gluster_3.2:_Installing_GlusterFS_on_Red_Hat_Package_Manager_(RPM)_Distributions
iptables -A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 24007:24047 -j ACCEPT 
iptables -A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 111 -j ACCEPT 
iptables -A RH-Firewall-1-INPUT -m state --state NEW -m udp -p udp --dport 111 -j ACCEPT 
iptables -A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 38465:38467 -j ACCEPT

# Save the configuration and restart iptables
service iptables save
service iptables restart
