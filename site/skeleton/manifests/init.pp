
  file { '/etc/skel':    
    ensure  => directory,    
    mode    => '0755', 
  }


  file { '/etc/skell/.bashrc':    
    ensure  => file,    
    source  => 'puppet:///modules/skeleton/bashrc',  
  }
