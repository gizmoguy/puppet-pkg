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
  $packages = []
) inherits pkg::params {
  package {
    $packages:
      ensure => 'absent'
  }
}
