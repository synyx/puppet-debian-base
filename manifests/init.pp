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

  group { 'puppet':
    ensure => 'present',
  }

  file { '/etc/motd':
    content => 'This machine is managed by Puppet!',
    notify  => Exec['apt-get update'],
  }

  exec { 'apt-get update':
    path        => '/usr/bin/',
    command     => 'apt-get update',
    refreshonly => true,
  }

  if !defined(Package['wget']) {
    package { 'wget':
      ensure => installed,
    }
  }
 
  if !defined(Package['vim']){
    package {'vim':
      ensure => installed,
    }
  }

  if !defined(Package['bash-completion']) {
    package {'bash-completion':
      ensure => installed,
    }
  }

  if !defined(Package['nmap']) {
    package {'nmap':
      ensure => installed,
    }
  }

}
