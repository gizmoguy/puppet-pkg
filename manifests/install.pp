# Class: pkg::install
#
# This class allows packages to be installed
#
# Parameters:
#   [*packages*]
#     List of packages to install.
#     Default: []
#
# Actions:
#   Installs listed packages
#
# Requires:
#   Nothing
#
class pkg::install (
  $packages = []
) inherits pkg::params {
  package {
    $packages:
      ensure => 'installed'
  }
}
