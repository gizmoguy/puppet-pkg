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
  $packages = []
) inherits pkg::params {
  package {
    $packages:
      ensure => 'purged'
  }
}
