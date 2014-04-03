# Class: oracleclient
#
# This module manages oracle instant client
#
# Parameters: 
#   version: which version of the instant client to install
#   rpmurl: location of downloaded rpm's
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#   class {'oracleclient':
#     rpmurl => 'http://some.location/'
#   }
#
# Authors:
#   Mike Wilson, mw@ceh.ac.uk
#
class oracleclient (
  $version = '11.2',
  $fullversion = '11.2.0.3.0-1',
  $rpmurl = undef,
  ) {
    
  # Module compatibility check
  $compatible = [ 'Debian', 'RedHat']
  if ! ($::osfamily in $compatible) {
    fail("Module is not compatible with ${::operatingsystem}")
  }    

  include "oracleclient::$::osfamily"
}
