#!/bin/bash
FILE_NAME=initroot-xt1033-p64-STOCK.cpio.gz

fastboot flash aleph $FILE_NAME
sleep 4

fastboot oem config fsg-id "a initrd=0x15000000,872988"
sleep 2

fastboot continue
sleep 2

