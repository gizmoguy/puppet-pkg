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
  $packages = $pkg::params::packages
) inherits pkg::params {

  validate_array($packages)

  package {
    $packages:
      ensure => 'latest'
  }
}
