group { 'puppet': ensure => 'present' }


class java_6 {

  package { "java-1.6.0-openjdk":
    ensure => installed,
  }

}

class tomcat_6 {

  package { "tomcat6":
    ensure => installed,
    require => Package['java-1.6.0-openjdk'],
  }
  
  
  service { "tomcat6":
    ensure => running,
    require => Package['tomcat6'],
    subscribe => File["tomcat-users.xml"]
  }

  file { "tomcat-users.xml":
    owner => 'root',
    path => '/etc/tomcat6/tomcat-users.xml',
    require => Package['tomcat6'],
    notify => Service['tomcat6'],
    content => template('/vagrant/templates/tomcat-users.xml.erb')
  }

}


include java_6
include tomcat_6

