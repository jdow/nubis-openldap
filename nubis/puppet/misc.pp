
file { '/usr/local/bin/nubis-startup/who-be-the-leader':
    ensure => file,
    owner  => root,
    group  => root,
    mode   => '0755',
    source => 'puppet:///nubis/files/who-be-the-leader',
}

file { '/etc/nubis.d/99-who-be-the-leader':
    ensure  => link,
    target  => '/usr/local/bin/nubis-startup/who-be-the-leader',
    require => File['/usr/local/bin/nubis-startup/who-be-the-leader']
}

file { '/usr/local/bin/check_ldapmaster_leader':
    ensure  => link,
    target  => '/usr/local/bin/nubis-startup/who-be-the-leader',
    require => File['/usr/local/bin/nubis-startup/who-be-the-leader']
}

file { '/etc/consul/svc-ldapmaster-leader.json':
    ensure  => file,
    owner   => root,
    group   => root,
    mode    => '0644',
    source  => 'puppet:///nubis/files/svc-ldapmaster-leader.json',
    require => [ File['/usr/local/bin/nubis-startup/who-be-the-leader'], File['/usr/local/bin/check_ldapmaster_leader'] ]
}

