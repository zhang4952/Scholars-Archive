#!/bin/sh

set -e
sudo scholars-archive run rake db:create
sudo scholars-archive run rake db:migrate
sudo scholars-archive run rake jetty:clean
sudo scholars-archive run rake sufia:jetty:config

sudo scholars-archive configure
