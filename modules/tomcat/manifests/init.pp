class tomcat {
    package { 'tomcat6':
        ensure => "installed"
    }

    exec { 'configure_java':
        path => "/bin:/usr/bin",
        refreshonly => true,
        subscribe => Package['tomcat6'],
        command => "sed -i 's/^JAVA_OPTS.*$/JAVA_OPTS=\"-Djava.awt.headless=true -Xmx1024m -Xms1024m -XX:MaxPermSize=512m -server\"/' /etc/default/tomcat6"
    }
}
