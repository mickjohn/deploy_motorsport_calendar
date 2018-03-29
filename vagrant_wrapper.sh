#!/bin/bash

function vagrant() {
  command=$1
  script="E:
  cd E:\Documents\VagrantFiles\motorsport_calendar
  vagrant ${command}"
  echo "$script" | cmd.exe
}

function vagrant_ssh() {
  ssh_port=2222
  ssh vagrant@localhost -p "${ssh_port}" -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null
}

function provision() {
  ansible-playbook -i inventory_test playbooks/main.yml -k -u vagrant
}

case $1 in
  "up")
    vagrant "$1" && provision
    ;;
  "up-no-provision")
    vagrant up --no-provision
    ;;
  "status")
    vagrant "$1"
    ;;
  "destroy")
    vagrant "$1 -f"
    ;;
  "provision")
    provision
    ;;
  "ssh")
    vagrant_ssh
    ;;
  *)
    echo "Error, command must be one of up, up-no-provision, status, ssh, provision, destroy"
    exit 1
    ;;
esac
