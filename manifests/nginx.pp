define symfony::nginx (
  $app_name    = $title,
  $server_name = undef,
  $web_root    = undef,
  $enable      = true,
){
  file { "/etc/nginx/sites-available/$app_name": 
    ensure => present,
    content => template('symfony/nginx/site.erb')
  }

  if($enable) {
    file { "/etc/nginx/sites-enabled/$app_name": 
      ensure => link,
      target => "/etc/nginx/sites-available/$app_name",
    }
  }
}
