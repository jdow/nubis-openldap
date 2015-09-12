# Main entry for puppet

file { '/usr/local/bin/nubis-startup':
    ensure => directory,
    owner  => root,
    group  => root,
    mode   => '0744',
}

import 'openldap.pp'
import 'eni.pp'
