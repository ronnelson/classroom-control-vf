class nginx:params {

  $package = 'nginx'
  $owner   = 'root'
  $group   = 'root'
  $docroot = '/var/www'
  $confdir = '/etc/nginx'
  $logdir  = '/var/log/nginx'

  $user = $::osfamily ? {
    'redhat' => 'nginx',
    'debian' => 'www-data',
  }
