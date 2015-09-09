
# Copies eni associate script over
file { '/etc/nubis.d/99-eni-associate':
    ensure => file,
    owner  => root,
    group  => root,
    mode   => '0755',
    source => 'puppet:///nubis/files/eni-associate',
}
