group { 'puppet': ensure => 'present' }


class apache {

  package { 'httpd':
    ensure => installed,
  }

  service { 'httpd':
   ensure => true,
   require => Package['httpd'],
  }
}

include apache

