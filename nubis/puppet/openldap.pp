package { 'openldap-servers':
    ensure => latest;
}

file { '/etc/openldap/certs':
    ensure  => directory,
    require => Package['openldap-servers']
}

file { '/etc/openldap/cacerts':
    ensure  => directory,
    require => Package['openldap-servers']
}
