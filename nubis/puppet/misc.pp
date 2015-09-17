
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
