
file { '/etc/confd/conf.d/ldapcert.toml'
    ensure => file,
    owner  => root,
    group  => root,
    mode   => '0644',
    source => 'puppet:///nubis/files/confd/ldapcert.toml'
}

file { '/etc/confd/conf.d/mozilla-ca.toml':
    ensure => file,
    owner  => root,
    group  => root,
    mode   => '0644',
    source => 'puppet:///nubis/files/confd/mozilla-ca.toml',
}

file { '/etc/confd/templates/ldapcert.tmpl':
    ensure => file,
    owner  => root,
    group  => root,
    mode   => '0644',
    source => 'puppet:///nubis/files/confd/ldapcert.tmpl',
}

file { '/etc/confd/templates/ldapcert.toml':
    ensure => file,
    owner  => root,
    group  => root,
    mode   => '0644',
    source => 'puppet:///nubis/files/confd/ldapcert.toml'
}

# After copying the toml and tmpl files we want to do startup stuff here
file { '/usr/local/bin/nubis-startup/confd-fixup':
    ensure => file,
    owner  => root,
    group  => root,
    mode   => '0755',
    source => 'puppet:///nubis/files/confd-fixup',
}

file { '/etc/nubis.d/15-confd-fixup':
    ensure  => link,
    target  => '/usr/local/bin/nubis-startup/confd-fixup',
    require => File['/usr/local/bin/nubis-startup/confd-fixup']
}
