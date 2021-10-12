#!/usr/bin/env bash

# copy the default settings into back up file in case there are some errors occured we still have the backup
sudo cp /etc/pulse/default.pa /etc/pulse/default.pa.bak
# In this case we write some settings into default.pa 
sudo cat <<EOT >> /etc/pulse/default.pa
load-module module-echo-cancel source_name=noechosource sink_name=noechosink
set-default-source noechosource
set-default-sink noechosink
EOT

# run bash cmd and restart audio services
sudo bash && pulseaudio -k 

