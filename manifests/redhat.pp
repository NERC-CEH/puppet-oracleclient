# Class: oracleclient::redhat
#
# This module manages oracleclient in a RedHat environment
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class oracleclient::redhat ()
  inherits oracleclient::common {

  # Make sure we have a URL to install rpm's from
  if $oracleclient::rpmurl == undef {
    fail("The oracleclient::rpmurl variable is undefined, RedHat installation cannot continue!")
  }

  $arch = $::architecture ? {
    'amd64'   => 'x86_64',
    'x86'     => 'i386',
  }

  package {"oracle-instantclient${oracleclient::version}-basic":
    ensure    => installed,
    provider  => 'rpm',
    source    => "${oracleclient::rpmurl}oracle-instantclient${oracleclient::version}-basic*.${arch}.rpm",
  } ->
  package {"oracle-instantclient${oracleclient::version}-sqlplus":
    ensure    => installed,
    provider  => 'rpm',
    source    => "${oracleclient::rpmurl}oracle-instantclient${oracleclient::version}-sqlplus*.${arch}.rpm",
  } ->
  package {"oracle-instantclient${oracleclient::version}-devel":
    ensure    => installed,
    provider  => 'rpm',
    source    => "${oracleclient::rpmurl}oracle-instantclient${oracleclient::version}-devel*.${arch}.rpm",
  }  
}