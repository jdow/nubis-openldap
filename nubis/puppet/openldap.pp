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

file { '/etc/openldap/restart-ldap.sh':
    ensure  => file,
    owner   => root,
    group   => root,
    mode    => '0755',
    source  => 'puppet:///nubis/files/ldap/restart-ldap.sh',
    require => Package['openldap-servers']
}
