
  file { '/etc/skel':    
    ensure  => directory,    
    mode    => '0755', 
  }


  file { '/etc/ssh/sshd_config':    
    ensure  => file,    
    owner   => 'root',    
    group   => 'root',    
    mode    => '0644',    
    require => Package['openssh'],    
    source  => 'puppet:///modules/ssh/sshd_config',  
  }
