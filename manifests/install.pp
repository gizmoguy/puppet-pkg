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
  $packages = $pkg::params::packages
) inherits pkg::params {

  validate_array($packages)

  package {
    $packages:
      ensure => 'installed'
  }
}
