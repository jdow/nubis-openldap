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

file { '/var/lib/ldap_access_logs':
    ensure  => directory,
    owner   => 'ldap',
    group   => 'ldap',
    recurse => true,
    require => Package['openldap-servers']
}

file { '/var/lib/ldap_access_logs/logs':
    ensure  => directory,
    owner   => 'ldap',
    group   => 'ldap',
    require => File['/var/lib/ldap_access_logs']
}

file { '/var/lib/ldap/logs':
    ensure  => directory,
    owner   => 'ldap',
    group   => 'ldap',
    require => Package['openldap-servers']
}

file { '/var/lib/ldap/auditlogs':
    ensure  => directory,
    owner   => 'ldap',
    group   => 'ldap',
    require => Package['openldap-servers']
}

file { '/var/lib/ldap_access_logs/DB_CONFIG':
    ensure  => file,
    owner   => 'ldap',
    group   => 'ldap',
    source  => 'puppet:///nubis/files/ldap/DB_CONFIG',
    require => File['/var/lib/ldap_access_logs'],
}

file { '/var/lib/ldap/DB_CONFIG':
    ensure  => file,
    owner   => 'ldap',
    group   => 'ldap',
    source  => 'puppet:///nubis/files/ldap/DB_CONFIG',
    require => Package['openldap-servers'],
}

file { '/usr/local/bin/ldap':
    ensure => directory,
    owner  => root,
    group  => root,
    mode   => '0744',
}

file { '/usr/local/bin/ldap/ldap-backup':
    ensure  => file,
    owner   => root,
    group   => root,
    mode    => '0755',
    source  => 'puppet:///nubis/files/ldap/ldap-backup.sh',
    require => File['/usr/local/bin/ldap']
}
