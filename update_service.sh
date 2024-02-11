#! /bin/bash

basename $0

satellite_service=wyoming-satellite
wakeword_service=wyoming-openwakeword
timestamp=$(date '+%Y_%m_%d_%N')

# Disable the service(s)
echo "Disable the service(s)"
sudo systemctl disable --now ${satellite_service}.service
sudo systemctl disable --now ${wakeword_service}.service

# Backup exsisting services
echo "Backup exsisting services"
sudo cp /etc/systemd/system/${satellite_service}.service /home/satellite/Documents/bkup/${satellite_service}_${timestamp}.txt | exit 1
sudo cp /etc/systemd/system/${wakeword_service}.service /home/satellite/Documents/bkup/${wakeword_service}_${timestamp}.txt | exit 1

# Update service
echo "Update service"
sudo cp /home/satellite/Documents/${satellite_service}.txt /etc/systemd/system/${satellite_service}.service
sudo cp /home/satellite/Documents/${wakeword_service}.txt /etc/systemd/system/${wakeword_service}.service

# Enable the service
echo "Enable the service"
sudo systemctl enable --now ${wakeword_service}.service
sudo systemctl enable --now ${satellite_service}.service

sudo systemctl daemon-reload
sudo systemctl restart wyoming-satellite.service
