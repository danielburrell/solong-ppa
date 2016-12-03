# == Class: ppa
#
# Full description of class ppa here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'ppa':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2016 Your name here, unless otherwise noted.
#
class ppa (
  $repo_key,
  $location     = "https://${repo_key}@apt.fury.io/danielburrell/",
  $release      = ' ',
  $repos        = '/',
  $include_src  = false,
  $key          = '01F5EA31B83C705DC22970D7FFB2C86BE76B7011',
  $key_source   = 'pgp.mit.edu',
  $architecture = undef,
  $allow_unsigned = false,
  $repos_ensure = true,
  ) {

  # ordering / ensure to get the last version of repository


  $ensure_source = $repos_ensure ? {
    false   => 'absent',
    default => 'present',
  }
  


  apt::source { 'solong-gemfury':
    ensure       => $ensure_source,
    location     => $location,
    release      => $release,
    repos        => $repos,
    include_src  => $include_src,
    key      => {
      'id'     => $key,
      'server' => $key_source,
    },
    architecture => $architecture,
    allow_unsigned => $allow_unsigned,
  }

}
