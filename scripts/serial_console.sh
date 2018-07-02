#!/bin/bash

perl -pi -e 's/GRUB_CMDLINE_LINUX=(.*)/GRUB_CMDLINE_LINUX="console=tty0 console=ttyS0,115200n8 loglevel=7"/g' /etc/default/grub
echo 'GRUB_TERMINAL="console serial"' >> /etc/default/grub
echo 'GRUB_SERIAL_COMMAND="serial --speed=115200 --unit=0 --word=8 --parity=no --stop=1"' >> /etc/default/grub

echo 'ForwardToConsole=yes' >> /etc/systemd/journald.conf

update-grub

reboot