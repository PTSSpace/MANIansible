# MANI ansible scripts [![](https://travis-ci.org/PTScientists/MANIansible.svg?branch=master)](https://travis-ci.org/PTScientists/MANIansible)

This repo contains the scripts that allow you to prepare your Jetson TX2 board for the MANI project. 

## Services included

 * Basic setup: configure shells and vnc
 * Configure apt sources and install ros
 * Install catkin and create a new workspace

## Setup

 * Install ansible
 * Flash L4T on your TX2 board, restart it and take not of the IP address
 * Copy `inventory.example` to `inventory` and change the IP address
 * Run `ansible-playbook -i inventory provision.yml`
 * Wait patiently

## Connect to VNC

The vnc server is listening on port 5900 and the password is "ubuntu".

## Working on your projects

A catkin workspace is created at `/home/ubuntu/catkin_ws`. The setup script is sourced by default. If you want to automatically push your code there while you work and have `rsync` and `fswatch` installed you can use the command:

```shell
$ fswatch -o src | xargs -n1 -I{} rsync --info=progress2 -r src ubuntu@your_ip:catkin_ws
```

