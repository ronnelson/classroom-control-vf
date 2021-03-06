class nginx (
   $package = $nginx::params::package,
   $owner   = $nginx::params::owner,
   $group   = $nginx::params::group,
   $docroot = $nginx::params::docroot,
   $confdir = $nginx::params::confdir,
   $logdir  = $nginx::params::logdir,
   $user    = $nginx::params::user, 
) inherits nginx::params {

  #  $nginx_user = $::osfamily ? { 
  #  'redhat' => 'nginx',
  #  'debian' => 'www-data',
  #}
  #
  #$docroot = $root

  File {
    owner => 'root',
    group => 'root',
    mode  => '0664',
  }

  package { 'nginx':  
    ensure => present, 
  }

  file { 'docroot':  
    ensure  => directory,  
    path    => $docroot,  
    require => Package['nginx'], 
  }

  file { 'html':
    ensure => file,
    path   => "${docroot}/index.html",  
    source => 'puppet:///modules/nginx/index.html',
  }

  file { 'nginx conf':  
    ensure  => file,  
    path    => '/etc/nginx/nginx.conf',  
    source  => 'puppet:///modules/nginx/nginx.conf',  
    #content  => template('nginx/nginx.erb'),  
    require => Package['nginx'], 
    notify  => Service['nginx'],
  }
  file { 'default site config':
    ensure  => file,
    path    => '/etc/nginx/conf.d/default.conf',
    source  => 'puppet:///modules/nginx/default.conf',
    require => Package['nginx'],
    notify  => Service['nginx'],
  }

  service { 'nginx':  
    ensure    => running,  
    enable    => true,  
    subscribe => File['/etc/nginx/nginx.conf'], 
  }

}
