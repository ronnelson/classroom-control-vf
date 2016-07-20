
class skeleton {
  file { '/etc/skel':    
    owner => 'root',
    group => 'root',
    ensure  => directory,    
    mode    => '0755', 
  }


  file { '/etc/skel/.bashrc':    
    ensure  => file,    
    source  => 'puppet:///modules/skeleton/bashrc',  
  }
}
