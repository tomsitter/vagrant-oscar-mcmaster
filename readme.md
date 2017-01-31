# Vagrant-OSCAR-McMaster

Vagrant-OSCAR-McMaster is a vagrant script to install OSCAR McMaster 12.1 for training purposes.

## How to Use
- Install [VirtualBox for your OS](https://www.virtualbox.org/)
- Install [Vagrant for your OS](https://www.vagrantup.com/)
- Unzip / Clone this repository into a folder 
- cd to that folder

```sh
vagrant up
```

> It takes approximately 30 minutes to create the machine initially.

## Access:
- Access OSCAR at http://127.0.0.1:8001/Oscar12 (Login: oscardoc PASSWORD: mac2002 2ndPASSWORD: 1117)

## Suspend / Power down / Destroy
To suspend the machine use and resume later
```sh
vagrant suspend
vagrant resume
```
To power down the machine and restart later
```sh
vagrant halt
vagrant up
```
To destroy the machine and recreate
```sh
vagrant destroy --force
vagrant up
```

### Version
1.0.0

### Credits
- [vagrant-OpenMRS](https://github.com/crolfe/vagrant-OpenMRS)
- [OSCAR](https://oscar-emr.com/)

### Disclaimer
This is for testing only. Not suitable for production.

### For more information visit [NuChange Blog](http://nuchange.ca)

### Contact Us on the IRC Channel ##ehealth 
[![Visit our IRC channel](https://kiwiirc.com/buttons/irc.freenode.net/ehealth.png)](https://kiwiirc.com/client/irc.freenode.net/?nick=nuchange|?##ehealth)

### Contribute
pull-requests welcome



