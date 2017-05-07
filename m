From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sun, 7 May 2017 23:08:48 +0200
Subject: Testing.
In-Reply-To: <f1cfbf25-08a8-46c1-a6bc-886a850ca8c2@yandex.ru>
References: <ae3d52d1-1eab-61e3-5943-21761d28d214@yandex.ru>
 <CAFBinCBHWSt36ApkFPYKyF=oOBebWwkK8D3Pa27Ab-KsM+B0_Q@mail.gmail.com>
 <aed4bf63-cba2-cc63-d834-d0acf3da35d3@yandex.ru>
 <CAFBinCDC9XwDa1NNiKQKp49GJ-WazS_iZFKkV4TAYo9ZnhPBcg@mail.gmail.com>
 <e7eb7d12-8fa8-5507-5d7b-53ef9ce3e300@yandex.ru>
 <CAFBinCDk+fFhTd=wx2k7mzr4Xh8NPQ15TTh+edbSdgtfLRwOEw@mail.gmail.com>
 <dd2f16b1-a9a1-4bc5-a694-1f64907d4669@yandex.ru>
 <CAFBinCA1A5K372F7_BuwNnZFvK+RwbQyWp4yYVomhW7Edu7HJA@mail.gmail.com>
 <dd90255e-0073-9988-de70-7e2d2bb0c00c@yandex.ru>
 <CAFBinCAyqip30C=6J35OGfyiMcXRXNefNtOLT0gkKYCRMxWa3Q@mail.gmail.com>
 <f1cfbf25-08a8-46c1-a6bc-886a850ca8c2@yandex.ru>
Message-ID: <CAFBinCAktR94_3diH1NqAL4uXbLkL_cThaj7WtXgODe0LMQ88A@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Sun, May 7, 2017 at 10:57 PM, Oleg <balbes-150@yandex.ru> wrote:
> [    5.784393] tegra-ehci: Tegra EHCI driver
> [    5.788381] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
> [    5.794471] ohci-pci: OHCI PCI platform driver
> [    5.798903] ohci-platform: OHCI generic platform driver
> [    5.804174] ohci-omap3: OHCI OMAP3 driver
> [    5.808132] SPEAr-ohci: OHCI SPEAr driver
> [    5.812119] ohci-st: OHCI STMicroelectronics driver
> [    5.816989] ohci-atmel: OHCI Atmel driver
> [    5.821290] usbcore: registered new interface driver usb-storage
> [    5.829289] i2c /dev entries driver
> [    5.835640] meson_wdt c1109900.watchdog: Watchdog enabled (timeout=8 sec,
> nowayout=0)
> [    5.839928] sdhci: Secure Digital Host Controller Interface driver
> [    5.844316] sdhci: Copyright(c) Pierre Ossman
> [    5.849477] Synopsys Designware Multimedia Card Interface Driver
> [    5.856562] sdhci-pltfm: SDHCI platform and OF driver helper
> [    5.861442] of_pwm_get(): PWM chip not found
> [    5.864538] leds_pwm pwmleds: unable to request PWM for m8s:blue:power:
> -517
> [    5.871728] ledtrig-cpu: registered to indicate activity on CPUs
> [    5.877766] usbcore: registered new interface driver usbhid
> [    5.883048] usbhid: USB HID core driver
> [    5.944209] NET: Registered protocol family 10
> [    5.944923] Segment Routing with IPv6
> [    5.946713] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
> [    5.953100] NET: Registered protocol family 17
> [    5.956991] can: controller area network core (rev 20120528 abi 9)
> [    5.963199] NET: Registered protocol family 29
> [    5.967561] can: raw protocol (rev 20120528)
> [    5.971808] can: broadcast manager protocol (rev 20161123 t)
> [    5.977457] can: netlink gateway (rev 20130117) max_hops=1
> [    5.983198] Key type dns_resolver registered
> [    5.987424] ThumbEE CPU extension supported.
> [    5.991403] Registering SWP/SWPB emulation handler
> [    5.997855] Btrfs loaded, crc32c=crc32c-generic
> [    6.005513] dwc2 c9040000.usb: c9040000.usb supply vusb_d not found,
> using dummy regulator
> [    6.008952] dwc2 c9040000.usb: c9040000.usb supply vusb_a not found,
> using dummy regulator
> [    6.018320] phy phy-c1108800.phy.0: USB ID detect failed!
> [    6.022538] phy phy-c1108800.phy.0: phy poweron failed --> -22
> [    6.028450] dwc2: probe of c9040000.usb failed with error -22
I assume your device has an internal USB hub? this probably has to be
turned on before the controller starts working

> [    6.035485] dwc2 c90c0000.usb: c90c0000.usb supply vusb_d not found,
> using dummy regulator
> [    6.042337] dwc2 c90c0000.usb: c90c0000.usb supply vusb_a not found,
> using dummy regulator
> [    6.182662] dwc2 c90c0000.usb: DWC OTG Controller
> [    6.182732] dwc2 c90c0000.usb: new USB bus registered, assigned bus
> number 1
> [    6.188786] dwc2 c90c0000.usb: irq 23, io mem 0xc90c0000
> [    6.194739] hub 1-0:1.0: USB hub found
> [    6.197804] hub 1-0:1.0: 1 port detected
> [    6.206952] of_pwm_get(): PWM chip not found
this sounds innocent at first but actually it's crucial for MMC (at
least in the current M8S configuration). PWM_E is used to generate the
32.768 kHz clock for the wifi chip. so without CONFIG_PWM_MESON the
pwm_ef node won't get probed, meaning that a dependency of the mmc
controller is missing.
I'll fix that as well next weekend (it also has to be enabled in
multi_v7_defconfig)

> [    6.207005] leds_pwm pwmleds: unable to request PWM for m8s:blue:power:
> -517
> [    6.213401] hctosys: unable to open rtc device (rtc0)
> [    6.218262] VCC3V3: disabling
> [    6.222866] Freeing unused kernel memory: 2048K
> [    6.622590] usb 1-1: new high-speed USB device number 2 using dwc2
> [    6.832594] usb 1-1: device descriptor read/64, error -32
> [    7.162580] usb 1-1: device descriptor read/64, error -32
> [    7.492542] usb 1-1: new high-speed USB device number 3 using dwc2
> [    7.702535] usb 1-1: device descriptor read/64, error -32
> [    8.032534] usb 1-1: device descriptor read/64, error -32
> [    8.362547] usb 1-1: new high-speed USB device number 4 using dwc2
> [    8.802534] usb 1-1: device not accepting address 4, error -32
> [    9.012535] usb 1-1: new high-speed USB device number 5 using dwc2
> [    9.452534] usb 1-1: device not accepting address 5, error -32
> [    9.452767] usb usb1-port1: unable to enumerate USB device
this looks suspicious, do you have anything connected to that port?
I've seen that when connecting a 2.5" HDD when the PSU doesn't have
enough power to spin up the HDD as well.


Martin
