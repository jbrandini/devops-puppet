class http {

  case $::osfamily {
    'redhat':{
      $pacotes = [ "httpd", "epel-release" ]
      $httpd = "httpd"
    }
    'debian':{
      $pacotes = [ "apache2", "tree", "hollywood" ]
      $httpd = "apache2"
    }
  }
  package { $pacotes:
    ensure => "absent",
  }
  service { $httpd:
    ensure => "stopped",
    enable => false
  }
  file {"/var/www/html//index.html":
    source => "puppet:///modules/http/index.html",
    ensure => present
  }
}
