#!/bin/bash
FILE_NAME=initroot-xt1514-p64-STOCK.cpio.gz

fastboot flash aleph $FILE_NAME
sleep 4

fastboot oem config fsg-id "a initrd=0x94000000,950295"
sleep 2

fastboot continue
sleep 2

