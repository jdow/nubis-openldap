
# Copies eni associate script over
file { '/usr/local/bin/nubis-startup/eni-associate':
    ensure => file,
    owner  => root,
    group  => root,
    mode   => '0755',
    source => 'puppet:///nubis/files/eni-associate',
}

file { '/etc/nubis.d/10-eni-associate':
    ensure  => link,
    target  => '/usr/local/bin/nubis-startup/eni-associate',
    require => File['/usr/local/bin/nubis-startup/eni-associate']
}
