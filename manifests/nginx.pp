define symfony::nginx (
  $app_name     = $title,
  $server_name  = '_',
  $web_root     = undef,
  $enable       = true,
  $fastcgi_pass = 'unix:/var/run/php5-fpm.sock',
  $ssl_enabled  = false
){
  $available = "/etc/nginx/sites-available/$app_name"
  file {$available:
    ensure  => present,
    content => template('symfony/nginx/site.erb'),
    notify  => Service['nginx'],
  }

  if($enable) {
    file { "/etc/nginx/sites-enabled/$app_name":
      ensure  => link,
      target  => $available,
      require => File[$available],
      notify  => Service['nginx'],
    }
  }
}
