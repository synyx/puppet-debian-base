# == Class: debian_base
#
# Prepares a debian based box
#
# Supported operating systems are:
# - Ubuntu
# - Debian
#
# === Authors
#
# Johannes Graf <graf@synyx.de>
#
# === Copyright
#
# Copyright 2013 synyx GmbH & Co. KG
#
class debian_base {

  file { '/etc/motd':
    content => 'This machine is managed by Puppet!',
    notify  => Exec['apt-get update'],
  }

  exec { 'apt-get update':
    path        => '/usr/bin/',
    command     => 'apt-get update',
    refreshonly => true,
  }

}
