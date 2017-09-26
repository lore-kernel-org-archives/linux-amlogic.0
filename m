From: linus.luessing@c0d3.blue (Linus =?utf-8?Q?L=C3=BCssing?=)
Date: Tue, 26 Sep 2017 03:17:59 +0200
Subject: [RFC PATCH 0/1] ARM: meson: Add Ethernet for Odroid C1/C1+
In-Reply-To: <20170926010847.30219-1-linus.luessing@c0d3.blue>
References: <20170926010847.30219-1-linus.luessing@c0d3.blue>
Message-ID: <20170926011759.GB2245@otheros>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

QA5:A;SVN:B72;POC:17F;STS:0;BOOT:0;INIT:10;BOOT:1;INIT:0;READ:0;CHECK:0;PASS:1;
-----------------------------------------------------------------------
* Welcome to Hardkernel's ODROID-C... (Built at 19:33:00 Dec  8 2014) *
-----------------------------------------------------------------------
CPU : AMLogic S805
MEM : 1024MB (DDR3 at 792MHz)
BID : HKC1310001
S/N : HKC11222F37DF7FE
0x0000009f
check SD_boot_type:0x1	 card_type:0x1
Loading U-boot...success.


U-boot-00000-g87cafd6(odroidc at 87cafd6a) (Jul 12 2016 - 17:04:30)

I2C:   clear pinmux reg1[24]=0
clear pinmux reg1[1]=0
out reg=c1108058,value=fffcfa00
set output en 0xc1108054[21]=0
set output val 0xc1108058[21]=0
clear pinmux reg1[25]=0
clear pinmux reg8[12]=0
clear pinmux reg1[3]=0
clear pinmux reg1[2]=0
set output en 0xc1108054[20]=1
clear pinmux reg1[24]=0
clear pinmux reg1[1]=0
out reg=c1108058,value=fffcfa00
set output en 0xc1108054[21]=0
set output val 0xc1108058[21]=0
clear pinmux reg1[25]=0
clear pinmux reg8[12]=0
clear pinmux reg1[3]=0
clear pinmux reg1[2]=0
out reg=c1108058,value=fffcfa00
set output en 0xc1108054[20]=0
set output val 0xc1108058[20]=0
clear pinmux reg1[25]=0
clear pinmux reg8[12]=0
clear pinmux reg1[3]=0
clear pinmux reg1[2]=0
set output en 0xc1108054[20]=1
clear pinmux reg1[24]=0
clear pinmux reg1[1]=0
out reg=c1108058,value=ffdcfa00
set output en 0xc1108054[21]=0
set output val 0xc1108058[21]=0
clear pinmux reg1[24]=0
clear pinmux reg1[1]=0
out reg=c1108058,value=fffcfa00
set output en 0xc1108054[21]=0
set output val 0xc1108058[21]=0
clear pinmux reg1[24]=0
clear pinmux reg1[1]=0
out reg=c1108058,value=ffdcfa00
set output en 0xc1108054[21]=0
set output val 0xc1108058[21]=0
clear pinmux reg1[24]=0
clear pinmux reg1[1]=0
out reg=c1108058,value=fffcfa00
set output en 0xc1108054[21]=0
set output val 0xc1108058[21]=0
clear pinmux reg1[24]=0
clear pinmux reg1[1]=0
out reg=c1108058,value=ffdcfa00
set output en 0xc1108054[21]=0
set output val 0xc1108058[21]=0
clear pinmux reg1[24]=0
clear pinmux reg1[1]=0
out reg=c1108058,value=fffcfa00
set output en 0xc1108054[21]=0
set output val 0xc1108058[21]=0
clear pinmux reg1[24]=0
clear pinmux reg1[1]=0
out reg=c1108058,value=ffdcfa00
set output en 0xc1108054[21]=0
set output val 0xc1108058[21]=0
clear pinmux reg1[24]=0
clear pinmux reg1[1]=0
out reg=c1108058,value=fffcfa00
set output en 0xc1108054[21]=0
set output val 0xc1108058[21]=0
clear pinmux reg1[24]=0
clear pinmux reg1[1]=0
out reg=c1108058,value=ffdcfa00
set output en 0xc1108054[21]=0
set output val 0xc1108058[21]=0
clear pinmux reg1[24]=0
clear pinmux reg1[1]=0
out reg=c1108058,value=fffcfa00
set output en 0xc1108054[21]=0
set output val 0xc1108058[21]=0
clear pinmux reg1[24]=0
clear pinmux reg1[1]=0
out reg=c1108058,value=ffdcfa00
set output en 0xc1108054[21]=0
set output val 0xc1108058[21]=0
clear pinmux reg1[24]=0
clear pinmux reg1[1]=0
out reg=c1108058,value=fffcfa00
set output en 0xc1108054[21]=0
set output val 0xc1108058[21]=0
clear pinmux reg1[24]=0
clear pinmux reg1[1]=0
out reg=c1108058,value=ffdcfa00
set output en 0xc1108054[21]=0
set output val 0xc1108058[21]=0
clear pinmux reg1[24]=0
clear pinmux reg1[1]=0
out reg=c1108058,value=fffcfa00
set output en 0xc1108054[21]=0
set output val 0xc1108058[21]=0
clear pinmux reg1[24]=0
clear pinmux reg1[1]=0
out reg=c1108058,value=ffdcfa00
set output en 0xc1108054[21]=0
set output val 0xc1108058[21]=0
clear pinmux reg1[24]=0
clear pinmux reg1[1]=0
out reg=c1108058,value=fffcfa00
set output en 0xc1108054[21]=0
set output val 0xc1108058[21]=0
clear pinmux reg1[24]=0
clear pinmux reg1[1]=0
out reg=c1108058,value=ffdcfa00
set output en 0xc1108054[21]=0
set output val 0xc1108058[21]=0
clear pinmux reg1[24]=0
clear pinmux reg1[1]=0
out reg=c1108058,value=fffcfa00
set output en 0xc1108054[21]=0
set output val 0xc1108058[21]=0
clear pinmux reg1[24]=0
clear pinmux reg1[1]=0
out reg=c1108058,value=ffdcfa00
set output en 0xc1108054[21]=0
set output val 0xc1108058[21]=0
clear pinmux reg1[25]=0
clear pinmux reg8[12]=0
clear pinmux reg1[3]=0
clear pinmux reg1[2]=0
out reg=c1108058,value=ffccfa00
set output en 0xc1108054[20]=0
set output val 0xc1108058[20]=0
clear pinmux reg1[24]=0
clear pinmux reg1[1]=0
out reg=c1108058,value=ffecfa00
set output en 0xc1108054[21]=0
set output val 0xc1108058[21]=0
clear pinmux reg1[25]=0
clear pinmux reg8[12]=0
clear pinmux reg1[3]=0
clear pinmux reg1[2]=0
set output en 0xc1108054[20]=1
clear pinmux reg1[25]=0
clear pinmux reg8[12]=0
clear pinmux reg1[3]=0
clear pinmux reg1[2]=0
set output en 0xc1108054[20]=1
clear pinmux reg1[25]=0
clear pinmux reg8[12]=0
clear pinmux reg1[3]=0
clear pinmux reg1[2]=0
set output en 0xc1108054[20]=1
ready
DRAM:  1 GiB
relocation Offset is: 2ff18000
MMC:   SDCARD: 0, eMMC: 1
IR init is done!
vpu clk_level = 3
set vpu clk: 182150000Hz, readback: 182150000Hz(0x701)
mode = 6  vic = 4
set HDMI vic: 4
mode is: 6
viu chan = 1
config HPLL
config HPLL done
reconfig packet setting done
MMC read: dev # 0, block # 33984, count 12288 ... 12288 blocks read: OK
There is no valid bmp file at the given address
============================================================
Vendor: Man 02544d Snr 260d1913 Rev: 2.5 Prod: SA16G
            Type: Removable Hard Disk
            Capacity: 14772.0 MB = 14.4 GB (30253056 x 512)
------------------------------------------------------------
Partition     Start Sector     Num Sectors     Type
    1		      2048	    262144	 c
    2		    264192	  29987841	83
============================================================
Net:   Meson_Ethernet
init suspend firmware done. (ret:0)
Hit Enter key to stop autoboot -- :  0 
exit abortboot: 0
reading boot.ini

4195 bytes read
Loading boot.ini from mmc0:1 (vfat)
Executing the script...
setenv m "1080p"                # 1080P at 60Hz
setenv vout_mode "hdmi"
setenv m_bpp "32"
setenv monitor_onoff "false" # true or false
setenv hpd "0"
setenv cec "0"
setenv disableuhs "disableuhs"
setenv vpu "1"
setenv hdmioutput "1"
setenv condev "console=tty0 console=ttyS0 console=ttyAML0,115200n8"   # on both
setenv max_freq "1536"
if test "${hpd}" = "0"; then setenv hdmi_hpd "disablehpd=true"; fi
if test "${cec}" = "1"; then setenv hdmi_cec "hdmitx=cecf"; fi
setenv bootargs "root=UUID=fdcafc05-1bf2-46c8-8f58-936466688204 rootwait ro ${condev} no_console_suspend vdaccfg=0xa000 logo=osd1,loaded,0x7900000,720p,full dmfc=3 cvbsmode=576cvbs hdmimode=${m} m_bpp=${m_bpp} vout=${vout_mode} ${disableuhs} ${hdmi_hpd} ${hdmi_cec} ${enabledac} monitor_onoff=${monitor_onoff} max_freq=${max_freq}"
fatload mmc 0:1 0x21000000 uImage
reading uImage

7864904 bytes read
fatload mmc 0:1 0x22000000 uInitrd
reading uInitrd

3415578 bytes read
fatload mmc 0:1 0x21800000 meson8b-odroidc1.dtb
reading meson8b-odroidc1.dtb

8578 bytes read
fdt addr 21800000
if test "${vpu}" = "0"; then fdt rm /mesonstream; fdt rm /vdec; fdt rm /ppmgr; fi
if test "${hdmioutput}" = "0"; then fdt rm /mesonfb; fi
bootm 0x21000000 0x22000000 0x21800000"
## Booting kernel from Legacy Image at 21000000 ...
   Image Name:   Linux-4.14.0-rc1-00008-g8b87c29e
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    7864840 Bytes = 7.5 MiB
   Load Address: 00208000
   Entry Point:  00208000
   Verifying Checksum ... OK
## Loading init Ramdisk from Legacy Image at 22000000 ...
   Image Name:   uInitrd
   Image Type:   ARM Linux RAMDisk Image (uncompressed)
   Data Size:    3415514 Bytes = 3.3 MiB
   Load Address: 00000000
   Entry Point:  00000000
   Verifying Checksum ... OK
## Flattened Device Tree blob at 21800000
   Booting using the fdt blob at 0x21800000
   Loading Kernel Image ... OK
OK
uboot time: 6077107 us.
Using machid 0xf81 from environment
faild to get aml_reserved_end address
the default relocate ramdisk and fdt address-relocate_addr: 0x20000000
   Loading Ramdisk to 1fcbe000, end 1ffffdda ... OK
   Loading Device Tree to 1fcb8000, end 1fcbd181 ... OK
libfdt fdt_path_offset() returned FDT_ERR_NOTFOUND
libfdt fdt_path_offset() returned FDT_ERR_NOTFOUND

Starting kernel ...

[    0.000000] Booting Linux on physical CPU 0x200
[    0.000000] Linux version 4.14.0-rc1-00008-g8b87c29ea868-dirty (tux at Linus-Debian) (gcc version 7.2.0 (Debian 7.2.0-1)) #5 SMP Thu Sep 21 21:32:22 UTC 2017
[    0.000000] CPU: ARMv7 Processor [410fc051] revision 1 (ARMv7), cr=10c5387d
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction cache
[    0.000000] OF: fdt: Machine model: Hardkernel ODROID-C1
[    0.000000] Memory policy: Data cache writealloc
[    0.000000] efi: Getting EFI parameters from FDT:
[    0.000000] efi: UEFI not found.
[    0.000000] cma: Reserved 64 MiB at 0x3c000000
[    0.000000] random: fast init done
[    0.000000] percpu: Embedded 17 pages/cpu @ef7ac000 s39372 r8192 d22068 u69632
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 260608
[    0.000000] Kernel command line: root=UUID=fdcafc05-1bf2-46c8-8f58-936466688204 rootwait ro console=tty0 console=ttyS0 console=ttyAML0,115200n8 no_console_suspend vdaccfg=0xa000 logo=osd1,loaded,0x7900000,720p,full dmfc=3 cvbsmode=576cvbs hdmimode=1080p m_bpp=32 vout=hdmi disableuhs disablehpd=true monitor_onoff=false max_freq=1536
[    0.000000] PID hash table entries: 4096 (order: 2, 16384 bytes)
[    0.000000] Dentry cache hash table entries: 131072 (order: 7, 524288 bytes)
[    0.000000] Inode-cache hash table entries: 65536 (order: 6, 262144 bytes)
[    0.000000] Memory: 950940K/1048576K available (10240K kernel code, 1560K rwdata, 4260K rodata, 2048K init, 405K bss, 32100K reserved, 65536K cma-reserved, 196608K highmem)
[    0.000000] Virtual kernel memory layout:
[    0.000000]     vector  : 0xffff0000 - 0xffff1000   (   4 kB)
[    0.000000]     fixmap  : 0xffc00000 - 0xfff00000   (3072 kB)
[    0.000000]     vmalloc : 0xf0800000 - 0xff800000   ( 240 MB)
[    0.000000]     lowmem  : 0xc0000000 - 0xf0000000   ( 768 MB)
[    0.000000]     pkmap   : 0xbfe00000 - 0xc0000000   (   2 MB)
[    0.000000]     modules : 0xbf000000 - 0xbfe00000   (  14 MB)
[    0.000000]       .text : 0xc0208000 - 0xc0d00000   (11232 kB)
[    0.000000]       .init : 0xc1200000 - 0xc1400000   (2048 kB)
[    0.000000]       .data : 0xc1400000 - 0xc1586280   (1561 kB)
[    0.000000]        .bss : 0xc1590334 - 0xc15f576c   ( 406 kB)
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
[    0.000000] Hierarchical RCU implementation.
[    0.000000] 	RCU event tracing is enabled.
[    0.000000] 	RCU restricting CPUs from NR_CPUS=16 to nr_cpu_ids=4.
[    0.000000] RCU: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=4
[    0.000000] NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16
[    0.000000] L2C-310 erratum 769419 enabled
[    0.000000] L2C-310 dynamic clock gating enabled, standby mode enabled
[    0.000000] L2C-310 cache controller enabled, 8 ways, 512 kB
[    0.000000] L2C-310: CACHE_ID 0x4100a0c9, AUX_CTRL 0x06060000
[    0.000017] sched_clock: 32 bits at 1000kHz, resolution 1000ns, wraps every 2147483647500ns
[    0.000041] clocksource: timer: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 1911260446275 ns
[    0.000788] Console: colour dummy device 80x30
[    0.001180] console [tty0] enabled
[    0.001224] Calibrating delay loop... 795.44 BogoMIPS (lpj=3977216)
[    0.040130] pid_max: default: 32768 minimum: 301
[    0.040270] Mount-cache hash table entries: 2048 (order: 1, 8192 bytes)
[    0.040292] Mountpoint-cache hash table entries: 2048 (order: 1, 8192 bytes)
[    0.040809] CPU: Testing write buffer coherency: ok
[    0.041096] CPU0: thread -1, cpu 0, socket 2, mpidr 80000200
[    0.041542] Setting up static identity map for 0x300000 - 0x3000a0
[    0.041921] Hierarchical SRCU implementation.
[    0.042662] EFI services will not be available.
[    0.042825] smp: Bringing up secondary CPUs ...
[    0.082714] CPU1: thread -1, cpu 1, socket 2, mpidr 80000201
[    0.122713] CPU2: thread -1, cpu 2, socket 2, mpidr 80000202
[    0.162712] CPU3: thread -1, cpu 3, socket 2, mpidr 80000203
[    0.162786] smp: Brought up 1 node, 4 CPUs
[    0.162837] SMP: Total of 4 processors activated (3181.77 BogoMIPS).
[    0.162850] CPU: All CPU(s) started in SVC mode.
[    0.163519] devtmpfs: initialized
[    0.165860] VFP support v0.3: implementor 41 architecture 2 part 30 variant 5 rev 1
[    0.166069] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.166105] futex hash table entries: 1024 (order: 4, 65536 bytes)
[    0.169788] pinctrl core: initialized pinctrl subsystem
[    0.170717] DMI not present or invalid.
[    0.170998] NET: Registered protocol family 16
[    0.173052] DMA: preallocated 256 KiB pool for atomic coherent allocations
[    0.174376] cpuidle: using governor menu
[    0.174907] No ATAGs?
[    0.175020] hw-breakpoint: found 2 (+1 reserved) breakpoint and 1 watchpoint registers.
[    0.175051] hw-breakpoint: maximum watchpoint size is 4 bytes.
[    0.176147] Serial: AMBA PL011 UART driver
[    0.190104] AT91: Could not find identification node
[    0.191625] vgaarb: loaded
[    0.192204] SCSI subsystem initialized
[    0.192618] usbcore: registered new interface driver usbfs
[    0.192673] usbcore: registered new interface driver hub
[    0.192782] usbcore: registered new device driver usb
[    0.193361] pps_core: LinuxPPS API ver. 1 registered
[    0.193380] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
[    0.193417] PTP clock support registered
[    0.193522] EDAC MC: Ver: 3.0.0
[    0.193784] dmi: Firmware registration failed.
[    0.195356] clocksource: Switched to clocksource timer
[    0.202702] Clockevents: could not switch to one-shot mode:
[    0.202706] Clockevents: could not switch to one-shot mode:
[    0.202709] Clockevents: could not switch to one-shot mode:
[    0.202712] Clockevents: could not switch to one-shot mode:
[    0.202721]  dummy_timer is not functional.
[    0.202723]  dummy_timer is not functional.
[    0.202725]  dummy_timer is not functional.
[    0.202728] Could not switch to high resolution mode on CPU 2
[    0.202730] Could not switch to high resolution mode on CPU 3
[    0.202733] Could not switch to high resolution mode on CPU 1
[    0.202815]  dummy_timer is not functional.
[    0.202827] Could not switch to high resolution mode on CPU 0
[    0.238145] NET: Registered protocol family 2
[    0.238641] TCP established hash table entries: 8192 (order: 3, 32768 bytes)
[    0.238729] TCP bind hash table entries: 8192 (order: 4, 65536 bytes)
[    0.238852] TCP: Hash tables configured (established 8192 bind 8192)
[    0.238986] UDP hash table entries: 512 (order: 2, 16384 bytes)
[    0.239058] UDP-Lite hash table entries: 512 (order: 2, 16384 bytes)
[    0.239234] NET: Registered protocol family 1
[    0.239587] RPC: Registered named UNIX socket transport module.
[    0.239609] RPC: Registered udp transport module.
[    0.239620] RPC: Registered tcp transport module.
[    0.239632] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.240000] Trying to unpack rootfs image as initramfs...
[    0.421085] Freeing initrd memory: 3336K
[    0.423042] workingset: timestamp_bits=30 max_order=18 bucket_order=0
[    0.427582] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[    0.428133] NFS: Registering the id_resolver key type
[    0.428172] Key type id_resolver registered
[    0.428185] Key type id_legacy registered
[    0.428225] ntfs: driver 2.1.32 [Flags: R/O].
[    0.429437] bounce: pool size: 64 pages
[    0.429506] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 248)
[    0.429528] io scheduler noop registered
[    0.429540] io scheduler deadline registered
[    0.429726] io scheduler cfq registered (default)
[    0.429742] io scheduler mq-deadline registered
[    0.429755] io scheduler kyber registered
[    0.433210] GPIO line 134 (usb-hub-reset) hogged as output/high
[    0.481358] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
[    0.483157] SuperH (H)SCI(F) driver initialized
[    0.483651] c81004c0.serial: ttyAML0 at MMIO 0xc81004c0 (irq = 18, base_baud = 9960937) is a meson_uart
[    1.195031] console [ttyAML0] enabled
[    1.199121] msm_serial: driver initialized
[    1.202882] STMicroelectronics ASC driver initialized
[    1.216910] brd: module loaded
[    1.222967] loop: module loaded
[    1.227486] libphy: Fixed MDIO Bus: probed
[    1.228345] CAN device driver interface
[    1.230160] bgmac_bcma: Broadcom 47xx GBit MAC driver loaded
[    1.236005] e1000e: Intel(R) PRO/1000 Network Driver - 3.2.6-k
[    1.241239] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
[    1.247208] igb: Intel(R) Gigabit Ethernet Network Driver - version 5.4.0-k
[    1.254104] igb: Copyright (c) 2007-2014 Intel Corporation.
[    1.260861] meson8b-dwmac c9410000.ethernet: PTP uses main clock
[    1.265685] meson8b-dwmac c9410000.ethernet: no reset control found
[    1.272064] stmmac - user ID: 0x10, Synopsys ID: 0x37
[    1.276956] meson8b-dwmac c9410000.ethernet: Ring mode enabled
[    1.282763] meson8b-dwmac c9410000.ethernet: DMA HW capability register supported
[    1.290222] meson8b-dwmac c9410000.ethernet: Normal descriptors
[    1.296134] meson8b-dwmac c9410000.ethernet: RX Checksum Offload Engine supported
[    1.303604] meson8b-dwmac c9410000.ethernet: COE Type 2
[    1.308799] meson8b-dwmac c9410000.ethernet: TX Checksum insertion supported
[    1.315846] meson8b-dwmac c9410000.ethernet: Wake-Up On Lan supported
[    1.322291] meson8b-dwmac c9410000.ethernet: Enable RX Mitigation via HW Watchdog Timer
[    2.402714] libphy: stmmac: probed
[    2.428460] pegasus: v0.9.3 (2013/04/25), Pegasus/Pegasus II USB Ethernet driver
[    2.430295] usbcore: registered new interface driver pegasus
[    2.435983] usbcore: registered new interface driver asix
[    2.441288] usbcore: registered new interface driver ax88179_178a
[    2.447388] usbcore: registered new interface driver cdc_ether
[    2.453206] usbcore: registered new interface driver smsc75xx
[    2.458927] usbcore: registered new interface driver smsc95xx
[    2.464663] usbcore: registered new interface driver net1080
[    2.470288] usbcore: registered new interface driver cdc_subset
[    2.476209] usbcore: registered new interface driver zaurus
[    2.481765] usbcore: registered new interface driver cdc_ncm
[    2.488401] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    2.493909] ehci-pci: EHCI PCI platform driver
[    2.498344] ehci-platform: EHCI generic platform driver
[    2.503639] ehci-orion: EHCI orion driver
[    2.507589] SPEAr-ehci: EHCI SPEAr driver
[    2.511574] ehci-st: EHCI STMicroelectronics driver
[    2.516460] ehci-exynos: EHCI EXYNOS driver
[    2.520613] ehci-atmel: EHCI Atmel driver
[    2.524614] tegra-ehci: Tegra EHCI driver
[    2.528601] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    2.534733] ohci-pci: OHCI PCI platform driver
[    2.539163] ohci-platform: OHCI generic platform driver
[    2.544446] SPEAr-ohci: OHCI SPEAr driver
[    2.548398] ohci-st: OHCI STMicroelectronics driver
[    2.553281] ohci-atmel: OHCI Atmel driver
[    2.557516] usbcore: registered new interface driver usb-storage
[    2.565605] i2c /dev entries driver
[    2.568043] IR NEC protocol handler initialized
[    2.571171] IR RC5(x/sz) protocol handler initialized
[    2.576236] IR RC6 protocol handler initialized
[    2.580722] IR JVC protocol handler initialized
[    2.585248] IR Sony protocol handler initialized
[    2.589839] IR SANYO protocol handler initialized
[    2.594541] IR Sharp protocol handler initialized
[    2.599218] IR MCE Keyboard/mouse protocol handler initialized
[    2.605048] IR XMP protocol handler initialized
[    2.612878] meson_wdt c1109900.watchdog: Watchdog enabled (timeout=8 sec, nowayout=0)
[    2.618719] sdhci: Secure Digital Host Controller Interface driver
[    2.623579] sdhci: Copyright(c) Pierre Ossman
[    2.628575] Synopsys Designware Multimedia Card Interface Driver
[    2.634464] sdhci-pltfm: SDHCI platform and OF driver helper
[    2.640948] ledtrig-cpu: registered to indicate activity on CPUs
[    2.645780] usbcore: registered new interface driver usbhid
[    2.651063] usbhid: USB HID core driver
[    2.657144] NET: Registered protocol family 10
[    2.660228] Segment Routing with IPv6
[    2.663054] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
[    2.669344] NET: Registered protocol family 17
[    2.673330] can: controller area network core (rev 20170425 abi 9)
[    2.679514] NET: Registered protocol family 29
[    2.683908] can: raw protocol (rev 20170425)
[    2.688142] can: broadcast manager protocol (rev 20170425 t)
[    2.693809] can: netlink gateway (rev 20170425) max_hops=1
[    2.699562] Key type dns_resolver registered
[    2.703994] ThumbEE CPU extension supported.
[    2.707774] Registering SWP/SWPB emulation handler
[    2.852890] dwc2 c90c0000.usb: DWC OTG Controller
[    2.852977] dwc2 c90c0000.usb: new USB bus registered, assigned bus number 1
[    2.859036] dwc2 c90c0000.usb: irq 19, io mem 0xc90c0000
[    2.865072] hub 1-0:1.0: USB hub found
[    2.868072] hub 1-0:1.0: 1 port detected
[    2.872739] hctosys: unable to open rtc device (rtc0)
[    2.884902] Freeing unused kernel memory: 2048K
Loading, please wait...
starting version 232
[    3.302765] usb 1-1: new high-speed USB device number 2 using dwc2
[    3.554863] hub 1-1:1.0: USB hub found
[    3.555233] hub 1-1:1.0: 4 ports detected
Begin: Loading essential drivers ... done.
Begin: Running /scripts/init-premount ... done.
Begin: Mounting root file system ... Begin: Running /scripts/local-top ... done.
Begin: Running /scripts/local-premount ... done.
Begin: Waiting for root file system ... [    3.872739] usb 1-1.2: new high-speed USB device number 3 using dwc2
[    4.503694] asix 1-1.2:1.0 eth1: register 'asix' at usb-c90c0000.usb-1.2, ASIX AX88772B USB 2.0 Ethernet, 00:0e:c6:fa:40:d8
[    4.516848] asix 1-1.2:1.0 enx000ec6fa40d8: renamed from eth1
[    4.602735] usb 1-1.3: new high-speed USB device number 4 using dwc2
[    4.736008] usb-storage 1-1.3:1.0: USB Mass Storage device detected
[    4.738000] scsi host0: usb-storage 1-1.3:1.0
Begin: Running /scripts/local-block ... done.
[    5.326540] random: crng init done
[    5.763887] scsi 0:0:0:0: Direct-Access     Intenso  Premium          0.00 PQ: 0 ANSI: 2
[    5.772114] sd 0:0:0:0: [sda] 15794176 512-byte logical blocks: (8.09 GB/7.53 GiB)
[    5.774734] sd 0:0:0:0: [sda] Write Protect is off
[    5.779439] sd 0:0:0:0: [sda] Asking for cache data failed
[    5.784338] sd 0:0:0:0: [sda] Assuming drive cache: write through
[    5.860713]  sda: sda1 sda2
[    5.932447] sd 0:0:0:0: [sda] Attached SCSI removable disk
Begin: Running /scripts/local-block ... done.
done.
Begin: Will now check root file system ... fsck from util-linux 2.29.2
[/sbin/fsck.ext4 (1) -- /dev/sda2] fsck.ext4 -a -C0 /dev/sda2 
/dev/sda2: clean, 18331/268752 files, 161356/1074688 blocks
done.
[    7.157138] EXT4-fs (sda2): mounted filesystem with ordered data mode. Opts: (null)
done.
Begin: Running /scripts/local-bottom ... done.
Begin: Running /scripts/init-bottom ... done.
[    7.605160] systemd[1]: System time before build time, advancing clock.
[    7.684485] systemd[1]: systemd 232 running in system mode. (+PAM +AUDIT +SELINUX +IMA +APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP +GCRYPT +GNUTLS +ACL +XZ +LZ4 +SECCOMP +BLKID +ELFUTILS +KMOD +IDN)
[    7.697321] systemd[1]: Detected architecture arm.

Welcome to Debian GNU/Linux 9 (stretch)!

[    7.741120] systemd[1]: Set hostname to <treehouse>.
[    8.118982] systemd[1]: Listening on udev Control Socket.
[  OK  ] Listening on udev Control Socket.
[    8.152942] systemd[1]: Reached target Swap.
[  OK  ] Reached target Swap.
[    8.183014] systemd[1]: Listening on /dev/initctl Compatibility Named Pipe.
[  OK  ] Listening on /dev/initctl Compatibility Named Pipe.
[    8.223205] systemd[1]: Created slice System Slice.
[  OK  ] Created slice System Slice.
[    8.253099] systemd[1]: Created slice system-serial\x2dgetty.slice.
[  OK  ] Created slice system-serial\x2dgetty.slice.
[    8.283067] systemd[1]: Created slice system-getty.slice.
[  OK  ] Created slice system-getty.slice.
[    8.323700] systemd[1]: Listening on udev Kernel Socket.
[  OK  ] Listening on udev Kernel Socket.
[  OK  ] Listening on fsck to fsckd communication Socket.
[  OK  ] Listening on Journal Socket (/dev/log).
[  OK  ] Started Dispatch Password Requests to Console Directory Watch.
[  OK  ] Started Forward Password Requests to Wall Directory Watch.
[  OK  ] Reached target Paths.
[  OK  ] Listening on Syslog Socket.
[  OK  ] Created slice User and Session Slice.
[  OK  ] Reached target Slices.
[  OK  ] Reached target Remote File Systems.
         Mounting Debug File System...
[  OK  ] Listening on Journal Socket.
         Starting Load Kernel Modules...
         Starting Create list of required st?ce nodes for the current kernel...
         Starting Journal Service...
         Starting Remount Root and Kernel File Systems...
[  OK  ] Reached target Encrypted Volumes.
[    8.815705] EXT4-fs (sda2): re-mounted. Opts: errors=remount-ro
[  OK  ] Mounted Debug File System.
[  OK  ] Started Journal Service.
[  OK  ] Started Load Kernel Modules.
[  OK  ] Started Create list of required sta?vice nodes for the current kernel.
[  OK  ] Started Remount Root and Kernel File Systems.
         Starting udev Coldplug all Devices...
         Starting Load/Save Random Seed...
         Starting Create Static Device Nodes in /dev...
         Starting Apply Kernel Variables...
         Mounting Configuration File System...
         Starting Flush Journal to Persistent Storage...
[  OK  ] Mounted Configuration File System.
[  OK  ] Started Load/Save Random Seed.
[  OK  ] Started Create Static Device Nodes in /dev.
[  OK  ] Started Apply Kernel Variables.
[    9.539945] systemd-journald[169]: Received request to flush runtime journal from PID 1
         Starting udev Kernel Device Manager...
[  OK  ] Reached target Local File Systems (Pre).
         Mounting /tmp...
[  OK  ] Mounted /tmp.
[  OK  ] Started udev Kernel Device Manager.
[  OK  ] Started Flush Journal to Persistent Storage.
[  OK  ] Reached target Local File Systems.
         Starting Create Volatile Files and Directories...
         Starting Raise network interfaces...
[  OK  ] Started Create Volatile Files and Directories.
         Starting Update UTMP about System Boot/Shutdown...
         Starting Network Time Synchronization...
[  OK  ] Started Update UTMP about System Boot/Shutdown.
[  OK  ] Started Network Time Synchronization.
[  OK  ] Reached target System Time Synchronized.
[  OK  ] Started udev Coldplug all Devices.
[  OK  ] Reached target System Initialization.
[  OK  ] Started Daily Cleanup of Temporary Directories.
[  OK  ] Listening on D-Bus System Message Bus Socket.
[  OK  ] Reached target Sockets.
[  OK  ] Reached target Basic System.
         Starting System Logging Service...
[  OK  ] Started D-Bus System Message Bus.
[  OK  ] Started Regular background program processing daemon.
         Starting Login Service...
[  OK  ] Started System Logging Service.
[  OK  ] Found device /dev/ttyAML0.
[   11.178839] IPv6: ADDRCONF(NETDEV_UP): enx000ec6fa40d8: link is not ready
[   11.323208] IPv6: ADDRCONF(NETDEV_CHANGE): enx000ec6fa40d8: link becomes ready
[   11.343176] asix 1-1.2:1.0 enx000ec6fa40d8: link up, 100Mbps, full-duplex, lpa 0xCDE1
[  OK  ] Listening on Load/Save RF Kill Switch Status /dev/rfkill Watch.
[  OK  ] Started Login Service.
[  OK  ] Started Raise network interfaces.
[  OK  ] Reached target Network.
         Starting Permit User Sessions...
         Starting OpenBSD Secure Shell server...
[  OK  ] Reached target Network is Online.
[  OK  ] Started Daily apt download activities.
[  OK  ] Started Daily apt upgrade and clean activities.
[  OK  ] Reached target Timers.
[  OK  ] Started Permit User Sessions.
[  OK  ] Started OpenBSD Secure Shell server.
[  OK  ] Started Getty on tty1.
[  OK  ] Started Serial Getty on ttyAML0.
[  OK  ] Reached target Login Prompts.
[  OK  ] Reached target Multi-User System.
[  OK  ] Reached target Graphical Interface.
         Starting Update UTMP about System Runlevel Changes...
[  OK  ] Started Update UTMP about System Runlevel Changes.

Debian GNU/Linux 9 treehouse ttyAML0

treehouse login: [  105.123705] meson8b-dwmac c9410000.ethernet eth0: device MAC address da:0e:a8:ec:a8:a7
[  105.322726] RTL8211F Gigabit Ethernet stmmac-0:00: attached PHY driver [RTL8211F Gigabit Ethernet] (mii_bus:phy_addr=stmmac-0:00, irq=POLL)
[  105.362725] meson8b-dwmac c9410000.ethernet: Failed to reset the dma
[  105.363466] meson8b-dwmac c9410000.ethernet eth0: stmmac_hw_setup: DMA engine initialization failed
[  105.372493] meson8b-dwmac c9410000.ethernet eth0: stmmac_open: Hw setup failed
