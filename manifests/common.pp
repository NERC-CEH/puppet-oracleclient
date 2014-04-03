# Class: oracleclient::common
#
# This module manages oracleclient settings common to any
# environment.  Inherited by osfamily specific manifests.
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class oracleclient::common () {
  $oracle_home = "/usr/lib/oracle/${oracleclient::version}"
  
  $client_dir = $::architecture ? {
    /amd64|x86_64/  => 'client64',
    'x86'           => 'client',
  }
  
  $libaio_pkg = $::osfamily ? {
    'Debian'  => 'libaio1',
    'RedHat'  => 'libaio',
  }
  
  package {$libaio_pkg:
    ensure  => installed,
  }
  
  file {'/etc/profile.d/oracle.sh':
    ensure  => file,
    owner   => root,
    group   => root,
    content => template("oracleclient/oracle.sh.erb"),
    mode    => 644,
  }    
}