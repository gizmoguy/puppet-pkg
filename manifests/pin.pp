# Class: pkg::pin
#
# This class allows packages to be pinned
#
# Parameters:
#   [*packages*]
#     List of packages to upgrade.
#     Default: []
#
# Actions:
#   Pins listed packages
#
# Requires:
#   puppetlabs-apt
#
class pkg::pin (
  $packages = {}
) inherits pkg::params {

  validate_hash($packages)

  create_resources('apt::pin', $packages)
}
