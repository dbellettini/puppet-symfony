define symfony::nginx (
  $app_name = undef,
  $app_path = undef,
  $enable   = false,
){
  file { "/etc/nginx/sites-available/$app_name": 
    ensure => present,
    content => template('nginx/site.erb')
  }
}
