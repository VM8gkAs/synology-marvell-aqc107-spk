#!/bin/sh

# Marvell AQC107 Driver Service Setup
# This is a kernel module driver package, no service setup needed

service_postinst ()
{
    # Load the kernel module
    if [ -f "/lib/modules/$(uname -r)/atlantic.ko" ]; then
        insmod /lib/modules/$(uname -r)/atlantic.ko
        echo "Marvell AQC107 driver loaded successfully"
    else
        echo "Warning: Atlantic kernel module not found"
    fi
}

service_postuninst ()
{
    # Unload the kernel module if loaded
    if lsmod | grep -q atlantic; then
        rmmod atlantic
        echo "Marvell AQC107 driver unloaded"
    fi
}