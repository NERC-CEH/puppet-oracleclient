# Class: oracleclient::debian
#
# This module manages oracleclient in a Debian environment
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class oracleclient::debian ()
  inherits oracleclient::common {

  package {"oracle-instantclient${oracleclient::version}-basic":
    ensure  => installed,
  } ->
  package {"oracle-instantclient${oracleclient::version}-sqlplus":
    ensure  => installed,
  } ->
  package {"oracle-instantclient${oracleclient::version}-devel":
    ensure  => installed,
  } ->
  file {"${oracle_home}/include":
    ensure  => link,
    target  => "/usr/include/oracle/${oracleclient::version}/${client_dir}",
  } ->
  file {'/etc/ld.so.conf.d/oracle.conf':
    ensure  => file,
    owner   => root,
    group   => root,
    content => "${oracle_home}/${client_dir}/lib",
    mode    => '0644',
  }    
}
