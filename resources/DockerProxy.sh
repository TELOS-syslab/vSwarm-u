#!/bin/bash
sudo cp daemon.json /etc/docker/
sudo systemctl daemon-reload
sudo systemctl restart docker
