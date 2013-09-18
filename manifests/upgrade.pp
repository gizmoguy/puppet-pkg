# Class: pkg::upgrade
#
# This class allows packages to be upgraded
#
# Parameters:
#   [*packages*]
#     List of packages to upgrade.
#     Default: []
#
# Actions:
#   Upgrades listed packages
#
# Requires:
#   Nothing
#
class pkg::upgrade (
  $packages = []
) inherits pkg::params {
  package {
    $packages:
      ensure => 'latest'
  }
}
