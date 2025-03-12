#!/bin/sh
set -x
set -e
OS_VERSION="stable/zed"
sudo chown stack:stack /home/stack
cd /home/stack
git clone https://opendev.org/openstack-dev/devstack -b "${OS_VERSION}"
cd devstack
echo enable_plugin swift https://opendev.org/openstack/swift "${OS_VERSION}" >> local.conf
