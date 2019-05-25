#!/bin/bash

ansible-playbook -i inventory --private-key ~/.ssh/id_rsa -K -u mick playbooks/main.yml
