# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # base box and URL where to get it if not present
 config.vm.box = "CentOS"
  config.vm.box_url = "http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.4-x86_64-v20130731.box"

#  config.vm.box = "CentOS5"  
#  config.vm.box_url = "http://tag1consulting.com/files/centos-5.9-x86-64-minimal.box"
 
# config for the appserver box
  config.vm.define "appserver" do |app|
    app.vm.network  :forwarded_port, host: 8000, guest: 8080
    app.vm.host_name = "appserver01.local"
    app.vm.provision :shell, :path => "setIPTables.sh"
    app.vm.provision :puppet do |puppet|
      puppet.manifests_path = "manifests"
      puppet.manifest_file = "appserver.pp"
    end
    app.vm.provision :shell, :path => "copyWar.sh"
  end

  # config for the webserver box
  config.vm.define "webserver" do |web|
    web.vm.network :forwarded_port, host: 9000, guest: 80
    web.vm.host_name = "webserver01.local"
    web.vm.provision :shell, :path => "setIPTables.sh"
    web.vm.provision :puppet do |puppet|
      puppet.manifests_path = "manifests"
      puppet.manifest_file = "webserver.pp"
    end
  end

end
