#! /bin/bash

basename $0

satellite_service=wyoming-satellite
wakeword_service=wyoming-openwakeword

sudo systemctl daemon-reload
sudo systemctl restart ${satellite_service}.service

