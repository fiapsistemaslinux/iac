if $::osfamily == 'RedHat' {

  # install httpd package
  package { 'httpd':
    ensure => installed,
  } 
  # ensure apache2 service is running
  service { 'httpd':
    ensure => running,
  } 
  # install mysql-server package
  package { 'mariadb-server':
    ensure => installed,
  }  
  # ensure mysql service is running
  service { 'mariadb':
    ensure => running,
  }
  # install php5 package
  package { 'php':
    ensure => installed,
  }  
  # ensure index.php file exists
  file { '/var/www/html/index.php':
    ensure => file,
    content => '<?php  phpinfo(); ?>',
    require => Package['httpd'],
  }
  # End if for Family RedHat

} elseif $::osfamily == 'Debian' {

  exec { 'apt-update':
    command => '/usr/bin/apt-get update' 
  }
  package { 'apache2':
    require => Exec['apt-update'],
    ensure => installed,
  }
  service { 'apache2':
    ensure => running,
  }
  package { 'mysql-server':
    require => Exec['apt-update'],
    ensure => installed,
  }
  service { 'mysql':
    ensure => running,
  }
  package { 'php5':
    require => Exec['apt-update'],
    ensure => installed,
  }
  file { '/var/www/html/info.php':
    ensure => file,
    content => '<?php  phpinfo(); ?>',
    require => Package['apache2'],
  } 
  # End if for Family Debian
}
