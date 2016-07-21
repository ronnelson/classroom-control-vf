define users::managed_user (  
  $group = $title, 
  $shell = '/bin/bash',
  $create_ssh_dir = true,
) {  
  user { $title:    
    ensure => present,  
    gid    => $group,
    shell  => $shell,
  }  
  group { $group:
    ensure => present,
  }
  file { "/home/${title}":
    ensure => directory,
    owner  => $title,
    group  => $group,
  }
  file { "/home/${title}/.ssh":    
    ensure => directory,    
    owner  => $title,    
    group  => $group,  
    mode   => '0700',
  } 
}
