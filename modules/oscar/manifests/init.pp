
class oscar {
  $target_osc = '/var/lib/tomcat6/webapps/Oscar12.war'
  $target_doc = '/var/lib/tomcat6/webapps/OscarDocument.war'
  $target_conf = '/usr/share/tomcat6/Oscar12.properties'
  $uri = "https://sourceforge.net/projects/oscarmcmaster/files/Oscar%20McMaster%20Manual%20Install/12/oscar_mcmaster_12_release.tar.gz"
  $db_name=Oscar12
  $db_password=mysql

  exec { "wget_oscar":
    path => "/bin:/usr/bin",
    timeout     => 1800,
    command => "wget $uri -qO /home/vagrant/oscar.tar.gz",
  }

  exec { "unzip_oscar":
    subscribe => Exec["wget_oscar"],
    refreshonly => true,
    path => "/bin:/usr/bin",
    command => "tar xvfz /home/vagrant/oscar.tar.gz -C /home/vagrant",
  }

  exec { "move_osc":
    subscribe => Exec["unzip_oscar"],
    refreshonly => true,
    path => "/bin:/usr/bin",
    command => "mv /home/vagrant/oscar_mcmaster_12_release/Oscar12.war $target_osc",
  }

  exec { "move_doc":
    subscribe => Exec["unzip_oscar"],
    refreshonly => true,
    path => "/bin:/usr/bin",
    command => "mv /home/vagrant/oscar_mcmaster_12_release/OscarDocument.war $target_doc",
  }

  exec { "move_conf":
    subscribe => Exec["unzip_oscar"],
    refreshonly => true,
    path => "/bin:/usr/bin",
    command => "mv /home/vagrant/oscar_mcmaster_12_release/Oscar12.properties $target_conf",
  }

  exec { "config_db_password":
      subscribe => Exec["move_conf"],
      refreshonly => true,
      path => "/bin:/usr/bin",
      command => "sed -i 's/^.*db_password.*$/db_password = $db_password/' $target_conf"
  }

  exec { "config_db_name":
      subscribe => Exec["move_conf"],
      refreshonly => true,
      path => "/bin:/usr/bin",
      command => "sed -i 's/^.*db_name.*$/db_name = $db_name/' $target_conf"
  }

  exec { "mysql_create_db":
    subscribe => Exec["move_conf"],
    refreshonly => true,
    path => "/bin:/usr/bin",
    command => "mysqladmin -uroot -p$db_password create $db_name",
  }

  exec { "mysql_write_data":
    subscribe => Exec["mysql_create_db"],
    refreshonly => true,
    path => "/bin:/usr/bin",
    command => "mysql -uroot -p$db_password $db_name < /home/vagrant/oscar_mcmaster_12_release/OscarON12.sql",
  }

}
