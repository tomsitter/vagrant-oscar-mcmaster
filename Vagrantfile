# -*- mode: ruby -*-
# vi: set ft=ruby :

#Installs OSCAR 15 (Electronic Medical Records Systems)
#By Bell Eapen (nuchange.ca) and Tom Sitter

$script = <<SCRIPT
  echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee /etc/apt/sources.list.d/webupd8team-java.list
  echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list
  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886
  apt-get update
  apt-get install oracle-java8-installer -y

  apt-get install wkhtmltopdf -y

  apt-get install tomcat7 libtomcat7-java unzip curl pgpgpg -y

  apt-get install mariadb-server mariadb-client libmysql-java -y

  sudo mysql_secure_installation

  wget http://sourceforge.net/projects/oscarmcmaster/files/Oscar%20Debian%2BUbuntu%20deb%20Package/oscar_emr15-51~508.deb

  sudo dpkg -i oscar_emr15-51~508.deb

  #Final Messages
  echo ---------------------------------------------------------
  echo Thanks for installing OSCAR 15
  echo This installation is suitable only for training purposes.
  echo ---------------------------------------------------------
  echo Access OSCAR at http://localhost:8001/oscar
  echo Login: oscardoc PASSWORD: mac2002 2ndPASSWORD: 1117
  echo ---------------------------------------------------------
  echo Access MySQL database at "mysql -u root -p"
  echo password: mysql
  echo ---------------------------------------------------------

SCRIPT


Vagrant.configure("2") do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  config.vm.box = "bento/ubuntu-16.04"
  config.vm.boot_timeout = 900
  config.ssh.insert_key = false


  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  #config.vm.box_url = "http://vagrant.boxes.lwndev.s3.amazonaws.com/quantal64.box"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine.
  config.vm.network "forwarded_port", guest: 8080, host: 8001, auto_correct: true

  # Share an additional folder to the guest VM. The first argument is
  # an identifier, the second is the path on the guest to mount the
  # folder, and the third is the path on the host to the actual folder.
  config.vm.synced_folder "code", "/home/vagrant/code", :create => true

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  #config.vm.network :private_network, ip: "192.168.40.10"

  config.vm.provider "virtualbox" do |v|
    v.name = "oscar15"
    v.customize [
       "modifyvm", :id,
       "--name", "oscar15",
       "--memory", "1536"]
    #v.gui = true
  end

  config.vm.provision "shell", inline: $script

end
