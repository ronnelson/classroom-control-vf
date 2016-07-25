class profile::blog {

  include '::mysql::server'

  include apache
  include apache::php

  apache::vhost { '127.0.0.1':
    docroot  => '/opt/wordpress',
  }

  include wordpress

}
