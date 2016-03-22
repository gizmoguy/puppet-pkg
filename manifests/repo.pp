# Class: pkg::repo
#
# This class allows additional repos to be configured
#
# Parameters:
#   [*repos*]
#     Hash of repos to define.
#     Default: []
#
# Actions:
#   Installs additional apt repos
#
# Requires:
#   puppetlabs-apt
#
class pkg::repo (
  $repos = {}
) {

  if $::osfamily != 'Debian' {
      fail("The ${module_name} module is not supported on an ${::osfamily} based system.")
  }

  validate_hash($repos)

  create_resources('apt::source', $repos)
}
