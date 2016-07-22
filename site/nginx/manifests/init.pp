class nginx {

  package { 'nginx':  
    ensure => present, 
  }

  file { '/var/www':  
    ensure  => directory,  
    owner   => 'root',  
    group   => 'root',  
    mode    => '0755',  
    require => Package['nginx'], 
  }

  file { '/var/www/index.html':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0664',
    source => 'puppet:///modules/nginx/index.html',
  } 

  file { '/etc/nginx/nginx.conf':  
    ensure  => file,  
    owner   => 'root',  
    group   => 'root',  
    mode    => '0644',  
    source  => 'puppet:///modules/nginx/nginx.conf',  
    require => Package['nginx'], 
  }

  service { 'nginx':  
    ensure    => running,  
    enable    => true,  
    subscribe => File['/etc/nginx/nginx.conf'], 
  }

}
