# Class: pkg::purge
#
# This class allows packages to be purged
#
# Parameters:
#   [*packages*]
#     List of packages to purge.
#     Default: []
#
# Actions:
#   Purges listed packages
#
# Requires:
#   Nothing
#
class pkg::purge (
  $packages = $pkg::params::packages
) inherits pkg::params {

  validate_array($packages)

  package {
    $packages:
      ensure => 'purged'
  }
}
