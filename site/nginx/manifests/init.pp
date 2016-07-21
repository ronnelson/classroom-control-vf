
class ngnx {

  package { 'ngnx':  
    ensure => present, 
  }

  file { '/var/www':  
    ensure  => directory,  
    owner   => 'root',  
    group   => 'root',  
    mode    => '0755',  
    require => Package['ngnx'], 
  }

  file { '/etc/ngnx/ngnx.conf':  
    ensure  => file,  
    owner   => 'root',  
    group   => 'root',  
    mode    => '0644',  
    source  => 'puppet:///modules/ngnx/ngnx.conf',  
    require => Package['ngnx'], 
  }

  service { 'ngnx':  
    ensure    => running,  
    enable    => true,  
    subscribe => File['/etc/ngnx/ngnx.conf'], 
  }

}
