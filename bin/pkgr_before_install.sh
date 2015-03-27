#!/bin/sh

set -e
if [ ! -f fits-0.8.4_0.zip ]; then
  wget http://projects.iq.harvard.edu/files/fits/files/fits-0.8.4_0.zip
fi
if [ ! -f /tmp/fits-0.8.4/fits.sh ]; then
  unzip fits-0.8.4_0.zip -d /tmp/
fi
cp /tmp/fits-0.8.4/*.sh /usr/local/bin/ -f
if [ ! -f /usr/local/bin/fits ]; then
  ln -s /usr/local/bin/fits.sh /usr/local/bin/fits
  chmod +x /usr/local/bin/fits
fi
