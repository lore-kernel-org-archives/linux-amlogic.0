From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sun, 14 May 2017 23:07:09 +0200
Subject: S805/S812 Device Tree upstreaming (was: Testing.)
Message-ID: <CAFBinCA__tiW03VrMzbfAFUOkKY1VoZG=OK7BNfZyfm05HOLng@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Oleg,

On Sat, May 13, 2017 at 9:25 PM, Oleg <balbes-150@yandex.ru> wrote:
>
>> you have to play around and see whether you need "enable-active-high;"
>> or not (depends on the original .dts / Amlogic kernel implementation)
>>
>> Additionally you need to add "phy-supply = <&usb_vbus>;" to the
>> usb0_phy node - otherwise the PHY does not know that it has to enable
>> the usb_vbus regulator.
>>
>>
>> Regards,
>> Martin
>
> Hi.
> I tried several different options.
> The result is about the same.
>
>
> [    5.714478] tegra-ehci: Tegra EHCI driver
> [    5.718461] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
> [    5.724554] ohci-pci: OHCI PCI platform driver
> [    5.728986] ohci-platform: OHCI generic platform driver
> [    5.734256] ohci-omap3: OHCI OMAP3 driver
> [    5.738217] SPEAr-ohci: OHCI SPEAr driver
> [    5.742204] ohci-st: OHCI STMicroelectronics driver
> [    5.747077] ohci-atmel: OHCI Atmel driver
> [    5.751365] usbcore: registered new interface driver usb-storage
> [    5.759402] i2c /dev entries driver
> [    5.765797] meson_wdt c1109900.watchdog: Watchdog enabled (timeout=8 sec,
> nowayout=0)
> [    5.770002] sdhci: Secure Digital Host Controller Interface driver
> [    5.774398] sdhci: Copyright(c) Pierre Ossman
> [    5.779584] Synopsys Designware Multimedia Card Interface Driver
> [    5.786645] sdhci-pltfm: SDHCI platform and OF driver helper
> [    5.791544] of_pwm_get(): PWM chip not found
> [    5.794619] leds_pwm pwmleds: unable to request PWM for m8s:blue:power:
> -517
> [    5.801821] ledtrig-cpu: registered to indicate activity on CPUs
> [    5.807847] usbcore: registered new interface driver usbhid
> [    5.813133] usbhid: USB HID core driver
> [    5.874177] NET: Registered protocol family 10
> [    5.874892] Segment Routing with IPv6
> [    5.876682] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
> [    5.883038] NET: Registered protocol family 17
> [    5.886958] can: controller area network core (rev 20120528 abi 9)
> [    5.893167] NET: Registered protocol family 29
> [    5.897529] can: raw protocol (rev 20120528)
> [    5.901775] can: broadcast manager protocol (rev 20161123 t)
> [    5.907424] can: netlink gateway (rev 20130117) max_hops=1
> [    5.913163] Key type dns_resolver registered
> [    5.917401] ThumbEE CPU extension supported.
> [    5.921369] Registering SWP/SWPB emulation handler
> [    5.927806] Btrfs loaded, crc32c=crc32c-generic
> [    5.935944] dwc2 c9040000.usb: c9040000.usb supply vusb_d not found,
> using dummy regulator
> [    5.938931] dwc2 c9040000.usb: c9040000.usb supply vusb_a not found,
> using dummy regulator
> [    5.948296] phy phy-c1108800.phy.0: USB ID detect failed!
> [    5.952506] phy phy-c1108800.phy.0: phy poweron failed --> -22
> [    5.958424] dwc2: probe of c9040000.usb failed with error -22
> [    5.965482] dwc2 c90c0000.usb: c90c0000.usb supply vusb_d not found,
> using dummy regulator
> [    5.972288] dwc2 c90c0000.usb: c90c0000.usb supply vusb_a not found,
> using dummy regulator
> [    6.112633] dwc2 c90c0000.usb: DWC OTG Controller
> [    6.112703] dwc2 c90c0000.usb: new USB bus registered, assigned bus
> number 1
> [    6.118756] dwc2 c90c0000.usb: irq 23, io mem 0xc90c0000
> [    6.124706] hub 1-0:1.0: USB hub found
> [    6.127775] hub 1-0:1.0: 1 port detected
> [    6.136994] of_pwm_get(): PWM chip not found
> [    6.137048] leds_pwm pwmleds: unable to request PWM for m8s:blue:power:
> -517
> [    6.143362] hctosys: unable to open rtc device (rtc0)
> [    6.148218] VCC3V3: disabling
> [    6.150894] USB0_VBUS: disabling
> [    6.156075] Freeing unused kernel memory: 2048K
> [    6.552575] usb 1-1: new high-speed USB device number 2 using dwc2
> [    6.762552] usb 1-1: device descriptor read/64, error -32
> [    7.092974] usb 1-1: device descriptor read/64, error -32
> [    7.422513] usb 1-1: new high-speed USB device number 3 using dwc2
> [    7.632505] usb 1-1: device descriptor read/64, error -32
> [    7.962503] usb 1-1: device descriptor read/64, error -32
> [    8.292515] usb 1-1: new high-speed USB device number 4 using dwc2
> [    8.732504] usb 1-1: device not accepting address 4, error -32
> [    8.942503] usb 1-1: new high-speed USB device number 5 using dwc2
> [    9.382504] usb 1-1: device not accepting address 5, error -32
> [    9.382735] usb usb1-port1: unable to enumerate USB device
> [  133.322520] random: crng init done
can you please boot the Android system that came with the device and
get a copy of:
- dmesg output
- /sys/kernel/debug/gpio
- /proc/interrupts
- /proc/iomem

> I tried to run the image without a INITRD. Got a kernel panic.
>
>
>     5.587299] ThumbEE CPU extension supported.
> [    5.591346] Registering SWP/SWPB emulation handler
> [    5.597785] Btrfs loaded, crc32c=crc32c-generic
> [    5.605922] dwc2 c9040000.usb: c9040000.usb supply vusb_d not found,
> using dummy regulator
> [    5.608891] dwc2 c9040000.usb: c9040000.usb supply vusb_a not found,
> using dummy regulator
> [    5.618271] phy phy-c1108800.phy.0: USB ID detect failed!
> [    5.622465] phy phy-c1108800.phy.0: phy poweron failed --> -22
> [    5.628412] dwc2: probe of c9040000.usb failed with error -22
> [    5.635451] dwc2 c90c0000.usb: c90c0000.usb supply vusb_d not found,
> using dummy regulator
> [    5.642271] dwc2 c90c0000.usb: c90c0000.usb supply vusb_a not found,
> using dummy regulator
> [    5.782627] dwc2 c90c0000.usb: DWC OTG Controller
> [    5.782696] dwc2 c90c0000.usb: new USB bus registered, assigned bus
> number 1
> [    5.788748] dwc2 c90c0000.usb: irq 23, io mem 0xc90c0000
> [    5.794694] hub 1-0:1.0: USB hub found
> [    5.797768] hub 1-0:1.0: 1 port detected
> [    5.806231] hctosys: unable to open rtc device (rtc0)
> [    5.806943] VCC3V3: disabling
> [    5.809619] USB0_VBUS: disabling
> [    5.813139] VFS: Cannot open root device "LABEL=ROOTFS" or
> unknown-block(0,0): error -6
> [    5.820800] Please append a correct "root=" boot option; here are the
> available partitions:
> [    5.829154] 0100           65536 ram0
> [    5.829157]  (driver?)
> [    5.835194] 0101           65536 ram1
> [    5.835197]  (driver?)
> [    5.841260] 0102           65536 ram2
> [    5.841262]  (driver?)
> [    5.847328] 0103           65536 ram3
> [    5.847330]  (driver?)
> [    5.853404] 0104           65536 ram4
> [    5.853407]  (driver?)
> [    5.859463] 0105           65536 ram5
> [    5.859465]  (driver?)
> [    5.865530] 0106           65536 ram6
> [    5.865533]  (driver?)
> [    5.871598] 0107           65536 ram7
> [    5.871600]  (driver?)
> [    5.877666] 0108           65536 ram8
> [    5.877669]  (driver?)
> [    5.883742] 0109           65536 ram9
> [    5.883744]  (driver?)
> [    5.889802] 010a           65536 ram10
> [    5.889804]  (driver?)
> [    5.895956] 010b           65536 ram11
> [    5.895959]  (driver?)
> [    5.902110] 010c           65536 ram12
> [    5.902113]  (driver?)
> [    5.908265] 010d           65536 ram13
> [    5.908268]  (driver?)
> [    5.914427] 010e           65536 ram14
> [    5.914430]  (driver?)
> [    5.920574] 010f           65536 ram15
> [    5.920576]  (driver?)
> [    5.926735] Kernel panic - not syncing: VFS: Unable to mount root fs on
> unknown-block(0,0)
> [    5.934965] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.11.0+ #6
> [    5.940941] Hardware name: Amlogic Meson platform
> [    5.945644] [<c03105b8>] (unwind_backtrace) from [<c030bb10>]
> (show_stack+0x10/0x14)
> [    5.953346] [<c030bb10>] (show_stack) from [<c07f562c>]
> (dump_stack+0x88/0x9c)
> [    5.960542] [<c07f562c>] (dump_stack) from [<c03d3c28>]
> (panic+0xdc/0x268)
> [    5.967392] [<c03d3c28>] (panic) from [<c1401218>]
> (mount_block_root+0x198/0x270)
> [    5.974842] [<c1401218>] (mount_block_root) from [<c1401500>]
> (mount_root+0x124/0x12c)
> [    5.982729] [<c1401500>] (mount_root) from [<c1401684>]
> (prepare_namespace+0x17c/0x1c4)
> [    5.990704] [<c1401684>] (prepare_namespace) from [<c1400e50>]
> (kernel_init_freeable+0x1dc/0x1ec)
> [    5.999548] [<c1400e50>] (kernel_init_freeable) from [<c0e80254>]
> (kernel_init+0x8/0x110)
> [    6.007697] [<c0e80254>] (kernel_init) from [<c0307db8>]
> (ret_from_fork+0x14/0x3c)
> [    6.015242] ---[ end Kernel panic - not syncing: VFS: Unable to mount
> root fs on unknown-block(0,0)
>
>
>
> I have a suggestion that the reason for the stop run mine the not correct
> Assembly of the image.
> I can see the log of system start-up do You have ?
> What image are You using ?
I'm using an initrd from Arch Linux ARM (from their ARMv7 multi-platform image).
however, I found another missing kernel config option yesterday: you
also need to enable CONFIG_COMMON_CLK_PWM
once you enable that you should be able to see /dev/mmcblk1p[0-9] with
all the partitions from your SD card

I was also able to reproduce the kernel crash you reported last week.
it seems to go away when enabling CONFIG_DEBUG_SPINLOCK in the kernel
config - but I will create a separate thread about this (as I suspect
that there may be some memory corruption along with a race condition
somewhere)


Regards,
Martin
