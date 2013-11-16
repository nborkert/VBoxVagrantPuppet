VBoxVagrantPuppet
=================

This is a simple example of how to build a virtual test environment with Vagrant and Puppet.

The setup contains two virtual machines, one web server with Apache and one application server with Tomcat 6.

cd into the top-level directory and then run

> vagrant up

to start the two boxes.

You'll then have your application server at http://localhost:8000 and your web server at http://localhost:9000.

Test for success by pointing a browser from the host machine to http://localhost:8000/sample and http://localhost:9000.

When you're done, don't forget to stop your virtual boxes with

> vagrant halt

or completely remove them with

> vagrant destroy

