#!/bin/bash

#Epson printer driver (L456, L455, L366, L365, L362, L360, L312, L310, L222, L220, L132, L130)
paru -S epson-inkjet-printer-201401w

sudo pacman -S imagescan system-config-printer simple-scan cups-pdf 
sudo systemctl enable cups
