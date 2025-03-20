OpenStack cluster
=========

Create a simple cluster on OpenStack.
The cluster is composed by a single master an a given number of slave nodes.

Requirements (on host that controls the execution)
------------

* python >= 2.7
* shade >= 1.25.0

Role Variables
--------------

    cluster:
        name: Required. The name to give to the cluster
        ssh_user: Required. SSH user to access the instances
        ssh_port: Optional. The ssh server port (default 22).
        ssh_public_key: Required. SSH public key to authorize access to the instances
        master:
            group: Required. The name of the inventory group to assign the master to.
            image: Required. An OS image id.
            flavor: Required. An OS flavor.
            network: Required. A network to which to attach the master to.
            public_ip: Optional. Set to "yes" to assign a floating ip. (default: no)
        slaves:
            count: Required. The amount of slave nodes to create
            group: Required. The name of the inventory group to assign the master to.
            image: Required. An OS image id.
            flavor: Required. An OS flavor.
            network: Required. A network to which to attach the master to.
            public_ip: Optional. Set to "yes" to assign a floating ip. (default: no)

Dependencies
------------

Example Playbook
----------------

    - hosts: localhost
      roles:
         - role: ansible-os-cluster
           cluster:
               name: "kubeadm"
               ssh_user: "ubuntu"
               ssh_port: 22
               ssh_public_key: "{{ lookup('file', '~/.ssh/id_rsa.pub') }}"
               master:
                   group: "master"
                   image: "550a59ca-cb23-4ed4-9813-98d91a1783b2"
                   flavor: "m1.mini"
                   network: "net1"
                   public_ip: no
               slaves:
                   count: 2
                   group: "workers"
                   image: "550a59ca-cb23-4ed4-9813-98d91a1783b2"
                   flavor: "m1.mini"
                   network: "net1"
                   public_ip: no

License
-------

GPLv3