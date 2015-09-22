# Main entry for puppet

file { '/usr/local/bin/nubis-startup':
    ensure => directory,
    owner  => root,
    group  => root,
    mode   => '0744',
}

file { '/usr/local/lib/util.sh':
    ensure => file,
    owner  => root,
    group  => root,
    mode   => '0644',
    source => 'puppet:///nubis/files/util.sh'
}

import 'openldap.pp'
import 'eni.pp'
import 'confd.pp'
import 'misc.pp'
