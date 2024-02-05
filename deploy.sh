#!/bin/bash
if [ ! -f /usr/share/nginx/html/deployed ]
then
    cp -R /tmp/cloudacademy/globe/src/. /usr/share/nginx/html/
    touch /usr/share/nginx/html/deployed
    echo $(date) > /usr/share/nginx/html/deployed
fi