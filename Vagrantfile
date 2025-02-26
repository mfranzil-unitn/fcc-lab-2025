# -*- mode: ruby -*-
# vi: set ft=ruby :

ANSIBLE_LOGLEVEL = ENV['ANSIBLE_LOGLEVEL'] || "v"
ANSIBLE_PLAYBOOK = ENV['ANSIBLE_PLAYBOOK'] || "provision-dockerhost.yml"

Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/focal64"

  config.vm.hostname = "docker-host"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "8192"
    vb.cpus = "4"
  end

  config.vm.provision :ansible do |ansible|
    ansible.verbose = ANSIBLE_LOGLEVEL
    ansible.playbook = ANSIBLE_PLAYBOOK
  end
end
