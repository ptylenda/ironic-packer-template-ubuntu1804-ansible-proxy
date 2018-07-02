#!/bin/bash

if [[ $PACKER_BUILDER_TYPE =~ hyperv-iso ]]; then
  # gen 2 EFI fix - see https://docs.microsoft.com/en-us/windows-server/virtualization/hyper-v/supported-ubuntu-virtual-machines-on-hyper-v
  mkdir -p /boot/efi/EFI/BOOT
  cp /boot/efi/EFI/ubuntu/* /boot/efi/EFI/BOOT
  mv /boot/efi/EFI/BOOT/shimx64.efi /boot/efi/EFI/BOOT/BOOTX64.EFI
fi
