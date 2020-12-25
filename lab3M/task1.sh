#!/bin/bash



mkdir ~/test && { echo "catalog test was created successfully" > ~/report ; touch ~/test/$(date +'%F_%T'); }
ping net_nikogo.ru || echo "${dates} ERROR HOST" >> ~/report
