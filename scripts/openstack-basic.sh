#!/usr/bin/env bash
DEBIAN_FRONTEND=noninteractive
DIST_CODENAME=$(lsb_release -cs)

wget https://apt.puppetlabs.com/puppetlabs-release-pc1-$DIST_CODENAME.deb -O /tmp/puppetlabs-release-pc1-$DIST_CODENAME.deb
dpkg -i /tmp/puppetlabs-release-pc1-$DIST_CODENAME.deb

apt-get update
apt-get upgrade -y
apt-get install -y puppet-agent unzip curl

echo -n 'export PATH="$PATH:/opt/puppetlabs/bin:/opt/puppetlabs/puppet/bin"' > /etc/profile.d/Z69-puppet.sh
