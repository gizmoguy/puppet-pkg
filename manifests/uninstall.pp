# Class: pkg::uninstall
#
# This class allows packages to be uninstalled
#
# Parameters:
#   [*packages*]
#     List of packages to uninstall.
#     Default: []
#
# Actions:
#   Uninstalls listed packages
#
# Requires:
#   Nothing
#
class pkg::uninstall (
  $packages = $pkg::params::packages
) inherits pkg::params {

  validate_array($packages)

  package {
    $packages:
      ensure => 'absent'
  }
}
