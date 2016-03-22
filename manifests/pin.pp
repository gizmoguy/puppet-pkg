# Class: pkg::pin
#
# This class allows packages to be pinned
#
# Parameters:
#   [*packages*]
#     Hash of packages to pin.
#     Default: {}
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

  if $::osfamily != 'Debian' {
      fail("The ${module_name} module is not supported on an ${::osfamily} based system.")
  }

  validate_hash($packages)

  create_resources('apt::pin', $packages)
}
