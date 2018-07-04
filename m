From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Wed, 4 Jul 2018 15:12:47 +0200
Subject: dwc2 (on Meson8b) doesn't detect "hot-plugged" USB devices
In-Reply-To: <3AD91E696667BF4BA728303C178E8A6353125B2C@am04wembxb.internal.synopsys.com>
References: <CAFBinCBEWb_2d7ypgS2uC2EXq_XSw67=zyPPqdRFZWi32aWPmA@mail.gmail.com>
 <410670D7E743164D87FA6160E7907A560113AFA2F2@am04wembxb.internal.synopsys.com>
 <CAFBinCCr-_H1ZJBn3pfmcEHBNVv8hiobttywP18VOUvS__WMeA@mail.gmail.com>
 <CAFBinCDVCdBDpZoLi=Kq5-f_oBVo3w=Jp5jQc1DuSPceXk5K+w@mail.gmail.com>
 <3AD91E696667BF4BA728303C178E8A6353125B2C@am04wembxb.internal.synopsys.com>
Message-ID: <CAFBinCC2S9-NLV1WpF3JsEiHj=OEMyJhvn5ab==QBc9ESxWBLw@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hello Arthur, Hello Minas,

On Wed, Jul 4, 2018 at 1:43 PM Artur Petrosyan
<Arthur.Petrosyan@synopsys.com> wrote:
>
> Hello Martin,
>
> On 7/4/2018 01:39, Martin Blumenstingl wrote:
> > Hello Minas,
> >
> > On Thu, May 10, 2018 at 11:44 AM Martin Blumenstingl
> > <martin.blumenstingl@googlemail.com> wrote:
> >>
> >> Hello Minas,
> >>
> >> On Mon, May 7, 2018 at 3:27 PM, Minas Harutyunyan
> >> <Minas.Harutyunyan@synopsys.com> wrote:
> >>> Hi Martin,
> >>>
> >>> On 5/7/2018 12:28 AM, Martin Blumenstingl wrote:
> >>>> Hello,
> >>>>
> >>>> I was a bit surprised to see that hot-plugging USB devices on Amlogic
> >>>> Meson8b (for example: Odroid-C1) is broken.
> >>>> to be fair: I *think* it worked before, but I cannot guarantee it nor
> >>>> can I say when it broke
> >>>>
> >>>> all examples below are from an Odroid-C1 board with Amlogic Meson8b (S805) SoC.
> >>>> this connects a (fixed, soldered down) 4-port USB hub to the dwc2
> >>>> controller (which is in "host" mode)
> >>>>
> >>>> during boot I see:
> >>>> [    1.651687] dwc2 c90c0000.usb: c90c0000.usb supply vusb_d not
> >>>> found, using dummy regulator
> >>>> [    1.654434] dwc2 c90c0000.usb: c90c0000.usb supply vusb_a not
> >>>> found, using dummy regulator
> >>>> [    1.732374] dwc2 c90c0000.usb: dwc2_check_params: Invalid parameter lpm=1
> >>>> [    1.733526] dwc2 c90c0000.usb: dwc2_check_params: Invalid parameter
> >>>> lpm_clock_gating=1
> >>>> [    1.741427] dwc2 c90c0000.usb: dwc2_check_params: Invalid parameter besl=1
> >>>> [    1.748305] dwc2 c90c0000.usb: dwc2_check_params: Invalid parameter
> >>>> hird_threshold_en=1
> >>>> [    1.756491] dwc2 c90c0000.usb: DWC OTG Controller
> >>>> [    1.760993] dwc2 c90c0000.usb: new USB bus registered, assigned bus number 1
> >>>> [    1.768046] dwc2 c90c0000.usb: irq 24, io mem 0xc90c0000
> >>>> [    1.773947] hub 1-0:1.0: USB hub found
> >>>> [    1.777063] hub 1-0:1.0: 1 port detected
> >>>> ...
> >>>> [    2.212432] usb 1-1: new high-speed USB device number 2 using dwc2
> >>>> [    2.464742] hub 1-1:1.0: USB hub found
> >>>> [    2.465118] hub 1-1:1.0: 4 ports detected
> >>>>
> >>>> if a USB device is plugged into one of the four USB ports during boot
> >>>> then it is detected automatically.
> >>>> if I plug in devices later they are not detected automatically (I have
> >>>> to run "lsusb -v" due to some reason, then hot-plugged devices are
> >>>> being detected)
> >>>> un-plugging USB devices is recognized instantly (no "lsusb" trickery
> >>>> is required)
> >>>>
> >>>> is this a known issue? how can I help debugging?
> >>>> any help is appreciated!
> >>>>
> >>>> below is the output of all dwc2 debugfs files.
> >>>>
> >>>>
> >>>> Regards
> >>>> Martin
> >>>>
> >>>>
> >>>> [rootodroidc1 c90c0000.usb]# cat dr_mode
> >>>> host
> >>>> [rootodroidc1 c90c0000.usb]# cat fifo
> >>>> Non-periodic FIFOs:
> >>>> RXFIFO: Size 0
> >>>> NPTXFIFO: Size 0, Start 0x00000000
> >>>>
> >>>> Periodic TXFIFOs:
> >>>> [rootodroidc1 c90c0000.usb]# cat hw_params
> >>>> op_mode                       : 5
> >>>> arch                          : 2
> >>>> dma_desc_enable               : 1
> >>>> enable_dynamic_fifo           : 1
> >>>> en_multiple_tx_fifo           : 0
> >>>> rx_fifo_size                  : 2048
> >>>> host_nperio_tx_fifo_size      : 2048
> >>>> dev_nperio_tx_fifo_size       : 0
> >>>> host_perio_tx_fifo_size       : 2048
> >>>> nperio_tx_q_depth             : 4
> >>>> host_perio_tx_q_depth         : 4
> >>>> dev_token_q_depth             : 8
> >>>> max_transfer_size             : 524287
> >>>> max_packet_count              : 1023
> >>>> host_channels                 : 16
> >>>> hs_phy_type                   : 1
> >>>> fs_phy_type                   : 0
> >>>> i2c_enable                    : 0
> >>>> num_dev_ep                    : 2
> >>>> num_dev_perio_in_ep           : 0
> >>>> total_fifo_size               : 1984
> >>>> power_optimized               : 1
> >>>> utmi_phy_data_width           : 1
> >>>> snpsid                        : 0x4f54310a
> >>>> dev_ep_dirs                   : 0x0
> >>>> [rootodroidc1 c90c0000.usb]# cat params
> >>>> otg_cap                       : 2
> >>>> dma_desc_enable               : 0
> >>>> dma_desc_fs_enable            : 0
> >>>> speed                         : 0
> >>>> enable_dynamic_fifo           : 1
> >>>> en_multiple_tx_fifo           : 0
> >>>> host_rx_fifo_size             : 512
> >>>> host_nperio_tx_fifo_size      : 500
> >>>> host_perio_tx_fifo_size       : 500
> >>>> max_transfer_size             : 524287
> >>>> max_packet_count              : 1023
> >>>> host_channels                 : 16
> >>>> phy_type                      : 1
> >>>> phy_utmi_width                : 16
> >>>> phy_ulpi_ddr                  : 0
> >>>> phy_ulpi_ext_vbus             : 0
> >>>> i2c_enable                    : 0
> >>>> ulpi_fs_ls                    : 0
> >>>> host_support_fs_ls_low_power  : 0
> >>>> host_ls_low_power_phy_clk     : 0
> >>>> ts_dline                      : 0
> >>>> reload_ctl                    : 1
> >>>> ahbcfg                        : 0xa
> >>>> uframe_sched                  : 0
> >>>> external_id_pin_ctl           : 0
> >>>> power_down                    : 1
> >>>> lpm                           : 0
> >>>> lpm_clock_gating              : 0
> >>>> besl                          : 0
> >>>> hird_threshold_en             : 0
> >>>> hird_threshold                : 4
> >>>> host_dma                      : 1
> >>>> g_dma                         : 0
> >>>> g_dma_desc                    : 0
> >>>> g_rx_fifo_size                : 0
> >>>> g_np_tx_fifo_size             : 0
> >>>> g_tx_fifo_size[0]             : 0
> >>>> g_tx_fifo_size[1]             : 0
> >>>> g_tx_fifo_size[2]             : 0
> >>>> g_tx_fifo_size[3]             : 0
> >>>> g_tx_fifo_size[4]             : 0
> >>>> g_tx_fifo_size[5]             : 0
> >>>> g_tx_fifo_size[6]             : 0
> >>>> g_tx_fifo_size[7]             : 0
> >>>> g_tx_fifo_size[8]             : 0
> >>>> g_tx_fifo_size[9]             : 0
> >>>> g_tx_fifo_size[10]            : 0
> >>>> g_tx_fifo_size[11]            : 0
> >>>> g_tx_fifo_size[12]            : 0
> >>>> g_tx_fifo_size[13]            : 0
> >>>> g_tx_fifo_size[14]            : 0
> >>>> g_tx_fifo_size[15]            : 0
> >>>> [rootodroidc1 c90c0000.usb]# cat state
> >>>> DCFG=0x00000000, DCTL=0x00000000, DSTS=0x00000000
> >>>> DIEPMSK=0x00000000, DOEPMASK=0x00000000
> >>>> GINTMSK=0xf0000000, GINTSTS=0x00000001
> >>>> DAINTMSK=0x00000000, DAINT=0x00000000
> >>>> GNPTXSTS=0x00000000, GRXSTSR=00000000
> >>>>
> >>>> Endpoint status:
> >>>> [rootodroidc1 c90c0000.usb]# cat testmode
> >>>> no test
> >>>> [rootodroidc1 c90c0000.usb]# cat regdump
> >>>> <system hangs>
> >>>>
> >>>
> >>> Your core configured for SRP capable host only mode "op_mode: 5", but
> >>> USBCFG programmed for "otg_cap = 2" which mean
> >>> "DWC2_CAP_PARAM_NO_HNP_SRP_CAPABLE", i.e. no SRP.
> >>> 1. Please try to set "p->otg_cap = DWC2_CAP_PARAM_SRP_ONLY_CAPABLE;"
> >> this results in the (soldered down) USB hub not even being detected anymore
> >> # dmesg | grep c90c0000
> >> [    1.771610] dwc2 c90c0000.usb: c90c0000.usb supply vusb_d not
> >> found, using dummy regulator
> >> [    1.779262] dwc2 c90c0000.usb: c90c0000.usb supply vusb_a not
> >> found, using dummy regulator
> >> [    1.852346] dwc2 c90c0000.usb: dwc2_check_params: Invalid parameter lpm=1
> >> [    1.853496] dwc2 c90c0000.usb: dwc2_check_params: Invalid parameter
> >> lpm_clock_gating=1
> >> [    1.861397] dwc2 c90c0000.usb: dwc2_check_params: Invalid parameter besl=1
> >> [    1.868274] dwc2 c90c0000.usb: dwc2_check_params: Invalid parameter
> >> hird_threshold_en=1
> >> [    1.876357] dwc2 c90c0000.usb: DWC OTG Controller
> >> [    1.880954] dwc2 c90c0000.usb: new USB bus registered, assigned bus number 2
> >> [    1.888010] dwc2 c90c0000.usb: irq 25, io mem 0xc90c0000
> >> [    2.002455] dwc2 c90c0000.usb: Overcurrent change detected
> >> [    2.132721] dwc2 c90c0000.usb: Overcurrent change detected
> >> [    2.252442] dwc2 c90c0000.usb: Overcurrent change detected
> >> <lsusb -v here>
> >> [   47.682374] dwc2 c90c0000.usb: Overcurrent change detected
> >>
> >> (this is with "host only" mode being configured and DRD mode being
> >> disabled in the driver)
> >>
> >>> 2. Looks like your driver configured for DRD mode. Change it to "HOST
> >>> only" mode.
> >> Amlogic Meson8, Meson8b, Meson8m2 and GXBB SoCs come with two dwc2 controllers:
> >> - a host-only one (which is the one I'm seeing problems with)
> >> - an "OTG capable" one (where the dwc2's OTG detection IRQ/detection
> >> *may* not be routed dwc2)
> >>
> >> this is why my driver was configured for DRD mode
> >> but let's focus on the host-only core for now
> >>
> >> the only documentation about the USB implementation in these SoCs is
> >> in the public S805 (Meson8b) and S905 (GXBB) datasheets.
> >> the following sections are from these datasheets (both use an
> >> indentical description):
> >>
> >> The OTG controller features:
> >> * Support for the following speeds: High-Speed (HS,
> >> 480-Mbps),Full-Speed (FS, 12-Mbps) and Low-Speed (LS, 1.5-Mbps) modes
> >> * Multiple DMA/non DMA mode access support on the application side
> >> * Supports up to 16 bidirectional endpoints, including control endpoint 0.
> >> * Supports Session Request Protocol (SRP) and Host Negotiation Protocol (HNP)
> >> * Supports up to 16 host channels.
> >>
> >> The Host controller features:
> >> * Support for the following speeds: High-Speed (HS,
> >> 480-Mbps),Full-Speed (FS, 12-Mbps) and Low-Speed (LS, 1.5-Mbps) modes
> >> * Multiple DMA/non DMA mode access support on the application side
> >> * Supports up to 16 host  channels.
> >>
> >>> 2. Please send us verbose debug log when device not recognized and after
> >>> lsusb when device recognized.
> >> do you want to see the dev_dbg() and dwc2_sch_dbg() output from the
> >> dwc2 driver or is there some other way?
> > gentle ping, did you have time to look into my questions so I can give
> > you everything you need?
>
> Sorry for the late reply. We need verbose debug logs with dev_dbg().
> So could you please provide verbose debug loges as Minas requested
> earlier (dwc2_sch_dbg() not required).
OK, I have:
CONFIG_USB_DWC2=y
CONFIG_USB_DWC2_HOST=y
# CONFIG_USB_DWC2_PERIPHERAL is not set
# CONFIG_USB_DWC2_DUAL_ROLE is not set
# CONFIG_USB_DWC2_PCI is not set
CONFIG_USB_DWC2_DEBUG=y
# CONFIG_USB_DWC2_VERBOSE is not set
# CONFIG_USB_DWC2_TRACK_MISSED_SOFS is not set
CONFIG_USB_DWC2_DEBUG_PERIODIC=y

I attached the kernel log with that during boot - nothing is connected
via USB at this point

then I insert a USB thumb drive (into the dwc2 controller at
0xc90c0000), this leads to the following two kernel messages (but
nothing else):
[  126.447388] dwc2 c90c0000.usb: gintsts=40000001  gintmsk=f0000000
[  126.447495] dwc2 c90c0000.usb: Session request interrupt - lx_state=2

then I run "lsusb -vv" again:
[  137.727674] dwc2 c90c0000.usb: dwc2_restore_global_registers
[  137.727712] dwc2 c90c0000.usb: dwc2_restore_host_registers
[  137.813122] dwc2 c90c0000.usb: gintsts=05000021  gintmsk=f3000006
[  137.954518] dwc2 c90c0000.usb: ClearPortFeature USB_PORT_FEAT_C_CONNECTION
[  138.049661] dwc2 c90c0000.usb: SetPortFeature
[  138.049743] dwc2 c90c0000.usb: SetPortFeature - USB_PORT_FEAT_RESET
[  138.049826] dwc2 c90c0000.usb: In host mode, hprt0=00021501
[  138.232522] dwc2 c90c0000.usb: gintsts=05000021  gintmsk=f3000006
[  138.302713] dwc2 c90c0000.usb: ClearPortFeature USB_PORT_FEAT_C_RESET
[  138.367202] usb 2-1: new high-speed USB device number 2 using dwc2
[  138.368646] dwc2 c90c0000.usb: SetPortFeature
[  138.368722] dwc2 c90c0000.usb: SetPortFeature - USB_PORT_FEAT_RESET
[  138.368802] dwc2 c90c0000.usb: In host mode, hprt0=00001101
[  138.368911] dwc2 c90c0000.usb: gintsts=05000029  gintmsk=f3000006
[  138.449418] dwc2 c90c0000.usb: gintsts=05000029  gintmsk=f3000006
[  138.574912] dwc2 c90c0000.usb: DWC OTG HCD HUB STATUS DATA: Root
port status changed
[  138.575035] dwc2 c90c0000.usb:   port_connect_status_change: 0
[  138.575133] dwc2 c90c0000.usb:   port_reset_change: 1
[  138.575220] dwc2 c90c0000.usb:   port_enable_change: 1
[  138.575304] dwc2 c90c0000.usb:   port_suspend_change: 0
[  138.575387] dwc2 c90c0000.usb:   port_over_current_change: 0
[  138.576373] dwc2 c90c0000.usb: ClearPortFeature USB_PORT_FEAT_C_RESET
[  138.708422] dwc2 c90c0000.usb: DWC OTG HCD EP DISABLE:
bEndpointAddress=0x00, ep->hcpriv=19c630e7
[  138.708546] dwc2 c90c0000.usb: DWC OTG HCD EP DISABLE:
bEndpointAddress=0x00, ep->hcpriv=  (null)
[  138.708631] dwc2 c90c0000.usb: DWC OTG HCD EP RESET: bEndpointAddress=0x00
[  138.932380] dwc2 c90c0000.usb: DWC OTG HCD HUB STATUS DATA: Root
port status changed
[  138.932516] dwc2 c90c0000.usb:   port_connect_status_change: 0
[  138.932613] dwc2 c90c0000.usb:   port_reset_change: 0
[  138.932698] dwc2 c90c0000.usb:   port_enable_change: 1
[  138.932779] dwc2 c90c0000.usb:   port_suspend_change: 0
[  138.932861] dwc2 c90c0000.usb:   port_over_current_change: 0
[  138.939026] dwc2 c90c0000.usb: DWC OTG HCD EP RESET: bEndpointAddress=0x01
[  138.939119] dwc2 c90c0000.usb: DWC OTG HCD EP RESET: bEndpointAddress=0x82
[  138.941187] usb-storage 2-1:1.0: USB Mass Storage device detected
[  138.947734] scsi host0: usb-storage 2-1:1.0
[  138.972573] dwc2 c90c0000.usb: ClearPortFeature USB_PORT_FEAT_C_ENABLE
[  139.073802] dwc2 c90c0000.usb: GetHubDescriptor
[  139.075716] dwc2 c9040000.usb: dwc2_restore_global_registers
[  139.075734] dwc2 c9040000.usb: dwc2_restore_host_registers
[  139.108821] dwc2 c9040000.usb: GetHubDescriptor
[  139.109795] dwc2 c9040000.usb: dwc2_backup_global_registers
[  139.109811] dwc2 c9040000.usb: dwc2_backup_host_registers
[  140.312088] dwc2 c90c0000.usb: --Host Channel 13 Interrupt: STALL Received--
[  140.315501] scsi 0:0:0:0: Direct-Access     USB      USB 2.0 Flash
  8.07 PQ: 0 ANSI: 2
[  140.326869] sd 0:0:0:0: [sda] 2015744 512-byte logical blocks:
(1.03 GB/984 MiB)
[  140.338180] sd 0:0:0:0: [sda] Write Protect is off
[  140.340707] sd 0:0:0:0: [sda] Mode Sense: 03 00 00 00
[  140.342797] sd 0:0:0:0: [sda] No Caching mode page found
[  140.345904] sd 0:0:0:0: [sda] Assuming drive cache: write through
[  140.406312]  sda: sda1
[  140.410447] sd 0:0:0:0: [sda] Attached SCSI removable disk


> Also, the partial power down feature is under testing now.
> The debug logs would greatly help us in debugging.
let me know if you need more information, help testing a patch, ... :)


Regards
Martin
-------------- next part --------------
[    1.258386] meson8b-dwmac c9410000.ethernet: DMA HW capability register supported
[    1.265856] meson8b-dwmac c9410000.ethernet: RX Checksum Offload Engine supported
[    1.273303] meson8b-dwmac c9410000.ethernet: COE Type 2
[    1.278503] meson8b-dwmac c9410000.ethernet: TX Checksum insertion supported
[    1.285516] meson8b-dwmac c9410000.ethernet: Wake-Up On Lan supported
[    1.291956] meson8b-dwmac c9410000.ethernet: Normal descriptors
[    1.297826] meson8b-dwmac c9410000.ethernet: Ring mode enabled
[    1.303643] meson8b-dwmac c9410000.ethernet: Enable RX Mitigation via HW Watchdog Timer
[    2.408476] libphy: stmmac: probed
[    2.413343] pegasus: v0.9.3 (2013/04/25), Pegasus/Pegasus II USB Ethernet driver
[    2.415126] usbcore: registered new interface driver pegasus
[    2.420780] usbcore: registered new interface driver asix
[    2.426124] usbcore: registered new interface driver ax88179_178a
[    2.432197] usbcore: registered new interface driver cdc_ether
[    2.437999] usbcore: registered new interface driver smsc75xx
[    2.443729] usbcore: registered new interface driver smsc95xx
[    2.449445] usbcore: registered new interface driver net1080
[    2.455070] usbcore: registered new interface driver cdc_subset
[    2.460975] usbcore: registered new interface driver zaurus
[    2.466520] usbcore: registered new interface driver cdc_ncm
[    2.472536] dwc2 c9040000.usb: mapped PA c9040000 to VA (ptrval)
[    2.472592] dwc2 c90c0000.usb: mapped PA c90c0000 to VA (ptrval)
[    2.472790] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    2.478646] ehci-pci: EHCI PCI platform driver
[    2.483075] ehci-platform: EHCI generic platform driver
[    2.488331] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    2.494432] ohci-pci: OHCI PCI platform driver
[    2.498858] ohci-platform: OHCI generic platform driver
[    2.504283] usbcore: registered new interface driver usb-storage
[    2.510532] udc-core: couldn't find an available UDC - added [g_cdc] to list of pending drivers
[    2.519134] i2c /dev entries driver
[    2.522498] IR NEC protocol handler initialized
[    2.526655] IR RC5(x/sz) protocol handler initialized
[    2.531695] IR RC6 protocol handler initialized
[    2.536192] IR JVC protocol handler initialized
[    2.540705] IR Sony protocol handler initialized
[    2.545291] IR SANYO protocol handler initialized
[    2.549979] IR Sharp protocol handler initialized
[    2.554653] IR MCE Keyboard/mouse protocol handler initialized
[    2.560467] IR XMP protocol handler initialized
[    2.565112] Registered IR keymap rc-empty
[    2.569012] rc rc0: meson-ir as /devices/platform/soc/c8100000.aobus/c8100480.ir-receiver/rc/rc0
[    2.577794] input: meson-ir as /devices/platform/soc/c8100000.aobus/c8100480.ir-receiver/rc/rc0/input0
[    2.587199] meson-ir c8100480.ir-receiver: receiver initialized
[    2.593714] meson_wdt c1109900.watchdog: Watchdog enabled (timeout=8 sec, nowayout=0)
[    2.600839] Bluetooth: HCI UART driver ver 2.3
[    2.605104] Bluetooth: HCI UART protocol H4 registered
[    2.610228] Bluetooth: HCI UART protocol BCSP registered
[    2.615505] Bluetooth: HCI UART protocol Three-wire (H5) registered
[    2.621800] Bluetooth: HCI UART protocol Broadcom registered
[    2.627394] Bluetooth: HCI UART protocol QCA registered
[    2.633876] sdhci: Secure Digital Host Controller Interface driver
[    2.638751] sdhci: Copyright(c) Pierre Ossman
[    2.643069] Synopsys Designware Multimedia Card Interface Driver
[    2.650242] platform c1108c20.mmc:slot at 1: Got CD GPIO
[    2.680089] sdhci-pltfm: SDHCI platform and OF driver helper
[    2.680360] leds_pwm pwmleds: unable to request PWM for m8s:blue:power: -517
[    2.687447] ledtrig-cpu: registered to indicate activity on CPUs
[    2.693213] usbcore: registered new interface driver usbhid
[    2.698672] usbhid: USB HID core driver
[    2.704397] NET: Registered protocol family 10
[    2.707438] Segment Routing with IPv6
[    2.710589] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
[    2.716735] NET: Registered protocol family 17
[    2.720869] can: controller area network core (rev 20170425 abi 9)
[    2.727029] NET: Registered protocol family 29
[    2.731431] can: raw protocol (rev 20170425)
[    2.735665] mmc0: new high speed SDHC card at address b368
[    2.735670] can: broadcast manager protocol (rev 20170425 t)
[    2.741392] mmcblk0: mmc0:b368 SDU1  15.0 GiB 
[    2.746768] can: netlink gateway (rev 20170425) max_hops=1
[    2.756833] Key type dns_resolver registered
[    2.759604]  mmcblk0: p1 p2
[    2.760992] ThumbEE CPU extension supported.
[    2.767920] Registering SWP/SWPB emulation handler
[    2.772964] Loading compiled-in X.509 certificates
[    2.782895] dwc2 c9040000.usb: mapped PA c9040000 to VA (ptrval)
[    2.782919] dwc2 c9040000.usb: c9040000.usb supply vusb_d not found, using dummy regulator
[    2.785718] dwc2 c9040000.usb: c9040000.usb supply vusb_a not found, using dummy regulator
[    2.793984] dwc2 c9040000.usb: registering common handler for irq27
[    2.795084] dwc2 c9040000.usb: Core Release: 3.10a (snpsid=4f54310a)
[    2.795089] dwc2 c9040000.usb: Forcing mode to host
[    2.806491] dwc2 c9040000.usb: dwc2_check_params: Invalid parameter lpm=1
[    2.807637] dwc2 c9040000.usb: dwc2_check_params: Invalid parameter lpm_clock_gating=1
[    2.815538] dwc2 c9040000.usb: dwc2_check_params: Invalid parameter besl=1
[    2.822381] dwc2 c9040000.usb: dwc2_check_params: Invalid parameter hird_threshold_en=1
[    2.830354] dwc2 c9040000.usb: DWC OTG HCD INIT
[    2.830359] dwc2 c9040000.usb: hcfg=00000200
[    2.830366] dwc2 c9040000.usb: dwc2_core_init((ptrval))
[    2.830370] dwc2 c9040000.usb: HS UTMI+ PHY selected
[    2.830374] dwc2 c9040000.usb: Internal DMA Mode
[    2.830379] dwc2 c9040000.usb: Host Mode
[    2.830650] dwc2 c9040000.usb: DWC OTG Controller
[    2.835040] dwc2 c9040000.usb: new USB bus registered, assigned bus number 1
[    2.842077] dwc2 c9040000.usb: irq 27, io mem 0xc9040000
[    2.847336] dwc2 c9040000.usb: DWC OTG HCD START
[    2.847344] dwc2 c9040000.usb: dwc2_core_host_init((ptrval))
[    2.847348] dwc2 c9040000.usb: Initializing HCFG.FSLSPClkSel to 00000000
[    2.847353] dwc2 c9040000.usb: initial grxfsiz=00000800
[    2.847358] dwc2 c9040000.usb: new grxfsiz=00000200
[    2.847361] dwc2 c9040000.usb: initial gnptxfsiz=08000800
[    2.847366] dwc2 c9040000.usb: new gnptxfsiz=01f40200
[    2.847369] dwc2 c9040000.usb: initial hptxfsiz=08001000
[    2.847373] dwc2 c9040000.usb: new hptxfsiz=01f403f4
[    2.847388] dwc2 c9040000.usb: dwc2_core_host_init: Halt channel 0
[    2.847392] dwc2 c9040000.usb: dwc2_core_host_init: Halt channel 1
[    2.847396] dwc2 c9040000.usb: dwc2_core_host_init: Halt channel 2
[    2.847399] dwc2 c9040000.usb: dwc2_core_host_init: Halt channel 3
[    2.847403] dwc2 c9040000.usb: dwc2_core_host_init: Halt channel 4
[    2.847407] dwc2 c9040000.usb: dwc2_core_host_init: Halt channel 5
[    2.847411] dwc2 c9040000.usb: dwc2_core_host_init: Halt channel 6
[    2.847414] dwc2 c9040000.usb: dwc2_core_host_init: Halt channel 7
[    2.847418] dwc2 c9040000.usb: dwc2_core_host_init: Halt channel 8
[    2.847421] dwc2 c9040000.usb: dwc2_core_host_init: Halt channel 9
[    2.847425] dwc2 c9040000.usb: dwc2_core_host_init: Halt channel 10
[    2.847429] dwc2 c9040000.usb: dwc2_core_host_init: Halt channel 11
[    2.847433] dwc2 c9040000.usb: dwc2_core_host_init: Halt channel 12
[    2.847436] dwc2 c9040000.usb: dwc2_core_host_init: Halt channel 13
[    2.847440] dwc2 c9040000.usb: dwc2_core_host_init: Halt channel 14
[    2.847443] dwc2 c9040000.usb: dwc2_core_host_init: Halt channel 15
[    2.847447] dwc2 c9040000.usb: Init: Port Power? op_state=9
[    2.847450] dwc2 c9040000.usb: Init: Power Port (0)
[    2.847454] dwc2 c9040000.usb: dwc2_enable_host_interrupts()
[    2.847458] dwc2 c9040000.usb: DWC OTG HCD Has Root Hub
[    2.847809] dwc2 c9040000.usb: DWC OTG HCD EP RESET: bEndpointAddress=0x81
[    2.847893] hub 1-0:1.0: USB hub found
[    2.851080] dwc2 c9040000.usb: GetHubDescriptor
[    2.851099] hub 1-0:1.0: 1 port detected
[    2.854978] dwc2 c9040000.usb: GetHubStatus
[    2.855026] dwc2 c9040000.usb: SetPortFeature
[    2.855146] dwc2 c9040000.usb: 
[    2.855150] dwc2 c9040000.usb: ************************************************************
[    2.855153] dwc2 c9040000.usb: HCD State:
[    2.855157] dwc2 c9040000.usb:   Num channels: 16
[    2.855161] dwc2 c9040000.usb:   Channel 0:
[    2.855165] dwc2 c9040000.usb:     dev_addr: 0, ep_num: 0, ep_is_in: 0
[    2.855168] dwc2 c9040000.usb:     speed: 0
[    2.855171] dwc2 c9040000.usb:     ep_type: 0
[    2.855175] dwc2 c9040000.usb:     max_packet: 0
[    2.855178] dwc2 c9040000.usb:     data_pid_start: 0
[    2.855181] dwc2 c9040000.usb:     multi_count: 0
[    2.855185] dwc2 c9040000.usb:     xfer_started: 0
[    2.855189] dwc2 c9040000.usb:     xfer_buf:   (null)
[    2.855193] dwc2 c9040000.usb:     xfer_dma: 00000000
[    2.855196] dwc2 c9040000.usb:     xfer_len: 0
[    2.855200] dwc2 c9040000.usb:     xfer_count: 0
[    2.855203] dwc2 c9040000.usb:     halt_on_queue: 0
[    2.855207] dwc2 c9040000.usb:     halt_pending: 0
[    2.855210] dwc2 c9040000.usb:     halt_status: 0
[    2.855213] dwc2 c9040000.usb:     do_split: 0
[    2.855216] dwc2 c9040000.usb:     complete_split: 0
[    2.855219] dwc2 c9040000.usb:     hub_addr: 0
[    2.855222] dwc2 c9040000.usb:     hub_port: 0
[    2.855225] dwc2 c9040000.usb:     xact_pos: 0
[    2.855228] dwc2 c9040000.usb:     requests: 0
[    2.855232] dwc2 c9040000.usb:     qh:   (null)
[    2.855235] dwc2 c9040000.usb:   Channel 1:
[    2.855239] dwc2 c9040000.usb:     dev_addr: 0, ep_num: 0, ep_is_in: 0
[    2.855242] dwc2 c9040000.usb:     speed: 0
[    2.855245] dwc2 c9040000.usb:     ep_type: 0
[    2.855248] dwc2 c9040000.usb:     max_packet: 0
[    2.855251] dwc2 c9040000.usb:     data_pid_start: 0
[    2.855254] dwc2 c9040000.usb:     multi_count: 0
[    2.855257] dwc2 c9040000.usb:     xfer_started: 0
[    2.855261] dwc2 c9040000.usb:     xfer_buf:   (null)
[    2.855264] dwc2 c9040000.usb:     xfer_dma: 00000000
[    2.855267] dwc2 c9040000.usb:     xfer_len: 0
[    2.855270] dwc2 c9040000.usb:     xfer_count: 0
[    2.855273] dwc2 c9040000.usb:     halt_on_queue: 0
[    2.855276] dwc2 c9040000.usb:     halt_pending: 0
[    2.855279] dwc2 c9040000.usb:     halt_status: 0
[    2.855282] dwc2 c9040000.usb:     do_split: 0
[    2.855285] dwc2 c9040000.usb:     complete_split: 0
[    2.855289] dwc2 c9040000.usb:     hub_addr: 0
[    2.855292] dwc2 c9040000.usb:     hub_port: 0
[    2.855295] dwc2 c9040000.usb:     xact_pos: 0
[    2.855298] dwc2 c9040000.usb:     requests: 0
[    2.855301] dwc2 c9040000.usb:     qh:   (null)
[    2.855304] dwc2 c9040000.usb:   Channel 2:
[    2.855308] dwc2 c9040000.usb:     dev_addr: 0, ep_num: 0, ep_is_in: 0
[    2.855311] dwc2 c9040000.usb:     speed: 0
[    2.855314] dwc2 c9040000.usb:     ep_type: 0
[    2.855317] dwc2 c9040000.usb:     max_packet: 0
[    2.855320] dwc2 c9040000.usb:     data_pid_start: 0
[    2.855323] dwc2 c9040000.usb:     multi_count: 0
[    2.855326] dwc2 c9040000.usb:     xfer_started: 0
[    2.855330] dwc2 c9040000.usb:     xfer_buf:   (null)
[    2.855333] dwc2 c9040000.usb:     xfer_dma: 00000000
[    2.855336] dwc2 c9040000.usb:     xfer_len: 0
[    2.855339] dwc2 c9040000.usb:     xfer_count: 0
[    2.855342] dwc2 c9040000.usb:     halt_on_queue: 0
[    2.855345] dwc2 c9040000.usb:     halt_pending: 0
[    2.855348] dwc2 c9040000.usb:     halt_status: 0
[    2.855352] dwc2 c9040000.usb:     do_split: 0
[    2.855355] dwc2 c9040000.usb:     complete_split: 0
[    2.855358] dwc2 c9040000.usb:     hub_addr: 0
[    2.855361] dwc2 c9040000.usb:     hub_port: 0
[    2.855364] dwc2 c9040000.usb:     xact_pos: 0
[    2.855367] dwc2 c9040000.usb:     requests: 0
[    2.855370] dwc2 c9040000.usb:     qh:   (null)
[    2.855373] dwc2 c9040000.usb:   Channel 3:
[    2.855377] dwc2 c9040000.usb:     dev_addr: 0, ep_num: 0, ep_is_in: 0
[    2.855380] dwc2 c9040000.usb:     speed: 0
[    2.855383] dwc2 c9040000.usb:     ep_type: 0
[    2.855386] dwc2 c9040000.usb:     max_packet: 0
[    2.855389] dwc2 c9040000.usb:     data_pid_start: 0
[    2.855392] dwc2 c9040000.usb:     multi_count: 0
[    2.855395] dwc2 c9040000.usb:     xfer_started: 0
[    2.855399] dwc2 c9040000.usb:     xfer_buf:   (null)
[    2.855402] dwc2 c9040000.usb:     xfer_dma: 00000000
[    2.855405] dwc2 c9040000.usb:     xfer_len: 0
[    2.855408] dwc2 c9040000.usb:     xfer_count: 0
[    2.855411] dwc2 c9040000.usb:     halt_on_queue: 0
[    2.855414] dwc2 c9040000.usb:     halt_pending: 0
[    2.855417] dwc2 c9040000.usb:     halt_status: 0
[    2.855420] dwc2 c9040000.usb:     do_split: 0
[    2.855423] dwc2 c9040000.usb:     complete_split: 0
[    2.855426] dwc2 c9040000.usb:     hub_addr: 0
[    2.855430] dwc2 c9040000.usb:     hub_port: 0
[    2.855433] dwc2 c9040000.usb:     xact_pos: 0
[    2.855436] dwc2 c9040000.usb:     requests: 0
[    2.855439] dwc2 c9040000.usb:     qh:   (null)
[    2.855442] dwc2 c9040000.usb:   Channel 4:
[    2.855445] dwc2 c9040000.usb:     dev_addr: 0, ep_num: 0, ep_is_in: 0
[    2.855449] dwc2 c9040000.usb:     speed: 0
[    2.855452] dwc2 c9040000.usb:     ep_type: 0
[    2.855455] dwc2 c9040000.usb:     max_packet: 0
[    2.855458] dwc2 c9040000.usb:     data_pid_start: 0
[    2.855461] dwc2 c9040000.usb:     multi_count: 0
[    2.855464] dwc2 c9040000.usb:     xfer_started: 0
[    2.855467] dwc2 c9040000.usb:     xfer_buf:   (null)
[    2.855470] dwc2 c9040000.usb:     xfer_dma: 00000000
[    2.855474] dwc2 c9040000.usb:     xfer_len: 0
[    2.855477] dwc2 c9040000.usb:     xfer_count: 0
[    2.855480] dwc2 c9040000.usb:     halt_on_queue: 0
[    2.855483] dwc2 c9040000.usb:     halt_pending: 0
[    2.855486] dwc2 c9040000.usb:     halt_status: 0
[    2.855489] dwc2 c9040000.usb:     do_split: 0
[    2.855492] dwc2 c9040000.usb:     complete_split: 0
[    2.855495] dwc2 c9040000.usb:     hub_addr: 0
[    2.855498] dwc2 c9040000.usb:     hub_port: 0
[    2.855501] dwc2 c9040000.usb:     xact_pos: 0
[    2.855504] dwc2 c9040000.usb:     requests: 0
[    2.855507] dwc2 c9040000.usb:     qh:   (null)
[    2.855510] dwc2 c9040000.usb:   Channel 5:
[    2.855514] dwc2 c9040000.usb:     dev_addr: 0, ep_num: 0, ep_is_in: 0
[    2.855517] dwc2 c9040000.usb:     speed: 0
[    2.855520] dwc2 c9040000.usb:     ep_type: 0
[    2.855523] dwc2 c9040000.usb:     max_packet: 0
[    2.855527] dwc2 c9040000.usb:     data_pid_start: 0
[    2.855530] dwc2 c9040000.usb:     multi_count: 0
[    2.855533] dwc2 c9040000.usb:     xfer_started: 0
[    2.855536] dwc2 c9040000.usb:     xfer_buf:   (null)
[    2.855539] dwc2 c9040000.usb:     xfer_dma: 00000000
[    2.855543] dwc2 c9040000.usb:     xfer_len: 0
[    2.855546] dwc2 c9040000.usb:     xfer_count: 0
[    2.855549] dwc2 c9040000.usb:     halt_on_queue: 0
[    2.855552] dwc2 c9040000.usb:     halt_pending: 0
[    2.855555] dwc2 c9040000.usb:     halt_status: 0
[    2.855558] dwc2 c9040000.usb:     do_split: 0
[    2.855561] dwc2 c9040000.usb:     complete_split: 0
[    2.855565] dwc2 c9040000.usb:     hub_addr: 0
[    2.855568] dwc2 c9040000.usb:     hub_port: 0
[    2.855571] dwc2 c9040000.usb:     xact_pos: 0
[    2.855574] dwc2 c9040000.usb:     requests: 0
[    2.855577] dwc2 c9040000.usb:     qh:   (null)
[    2.855580] dwc2 c9040000.usb:   Channel 6:
[    2.855584] dwc2 c9040000.usb:     dev_addr: 0, ep_num: 0, ep_is_in: 0
[    2.855587] dwc2 c9040000.usb:     speed: 0
[    2.855590] dwc2 c9040000.usb:     ep_type: 0
[    2.855593] dwc2 c9040000.usb:     max_packet: 0
[    2.855596] dwc2 c9040000.usb:     data_pid_start: 0
[    2.855599] dwc2 c9040000.usb:     multi_count: 0
[    2.855602] dwc2 c9040000.usb:     xfer_started: 0
[    2.855605] dwc2 c9040000.usb:     xfer_buf:   (null)
[    2.855608] dwc2 c9040000.usb:     xfer_dma: 00000000
[    2.855612] dwc2 c9040000.usb:     xfer_len: 0
[    2.855615] dwc2 c9040000.usb:     xfer_count: 0
[    2.855618] dwc2 c9040000.usb:     halt_on_queue: 0
[    2.855621] dwc2 c9040000.usb:     halt_pending: 0
[    2.855624] dwc2 c9040000.usb:     halt_status: 0
[    2.855627] dwc2 c9040000.usb:     do_split: 0
[    2.855630] dwc2 c9040000.usb:     complete_split: 0
[    2.855633] dwc2 c9040000.usb:     hub_addr: 0
[    2.855636] dwc2 c9040000.usb:     hub_port: 0
[    2.855639] dwc2 c9040000.usb:     xact_pos: 0
[    2.855642] dwc2 c9040000.usb:     requests: 0
[    2.855645] dwc2 c9040000.usb:     qh:   (null)
[    2.855649] dwc2 c9040000.usb:   Channel 7:
[    2.855652] dwc2 c9040000.usb:     dev_addr: 0, ep_num: 0, ep_is_in: 0
[    2.855655] dwc2 c9040000.usb:     speed: 0
[    2.855658] dwc2 c9040000.usb:     ep_type: 0
[    2.855661] dwc2 c9040000.usb:     max_packet: 0
[    2.855665] dwc2 c9040000.usb:     data_pid_start: 0
[    2.855668] dwc2 c9040000.usb:     multi_count: 0
[    2.855671] dwc2 c9040000.usb:     xfer_started: 0
[    2.855674] dwc2 c9040000.usb:     xfer_buf:   (null)
[    2.855677] dwc2 c9040000.usb:     xfer_dma: 00000000
[    2.855680] dwc2 c9040000.usb:     xfer_len: 0
[    2.855683] dwc2 c9040000.usb:     xfer_count: 0
[    2.855686] dwc2 c9040000.usb:     halt_on_queue: 0
[    2.855689] dwc2 c9040000.usb:     halt_pending: 0
[    2.855693] dwc2 c9040000.usb:     halt_status: 0
[    2.855696] dwc2 c9040000.usb:     do_split: 0
[    2.855699] dwc2 c9040000.usb:     complete_split: 0
[    2.855702] dwc2 c9040000.usb:     hub_addr: 0
[    2.855705] dwc2 c9040000.usb:     hub_port: 0
[    2.855708] dwc2 c9040000.usb:     xact_pos: 0
[    2.855711] dwc2 c9040000.usb:     requests: 0
[    2.855714] dwc2 c9040000.usb:     qh:   (null)
[    2.855717] dwc2 c9040000.usb:   Channel 8:
[    2.855721] dwc2 c9040000.usb:     dev_addr: 0, ep_num: 0, ep_is_in: 0
[    2.855724] dwc2 c9040000.usb:     speed: 0
[    2.855727] dwc2 c9040000.usb:     ep_type: 0
[    2.855730] dwc2 c9040000.usb:     max_packet: 0
[    2.855733] dwc2 c9040000.usb:     data_pid_start: 0
[    2.855737] dwc2 c9040000.usb:     multi_count: 0
[    2.855740] dwc2 c9040000.usb:     xfer_started: 0
[    2.855743] dwc2 c9040000.usb:     xfer_buf:   (null)
[    2.855746] dwc2 c9040000.usb:     xfer_dma: 00000000
[    2.855749] dwc2 c9040000.usb:     xfer_len: 0
[    2.855752] dwc2 c9040000.usb:     xfer_count: 0
[    2.855755] dwc2 c9040000.usb:     halt_on_queue: 0
[    2.855759] dwc2 c9040000.usb:     halt_pending: 0
[    2.855762] dwc2 c9040000.usb:     halt_status: 0
[    2.855765] dwc2 c9040000.usb:     do_split: 0
[    2.855768] dwc2 c9040000.usb:     complete_split: 0
[    2.855771] dwc2 c9040000.usb:     hub_addr: 0
[    2.855774] dwc2 c9040000.usb:     hub_port: 0
[    2.855777] dwc2 c9040000.usb:     xact_pos: 0
[    2.855780] dwc2 c9040000.usb:     requests: 0
[    2.855783] dwc2 c9040000.usb:     qh:   (null)
[    2.855786] dwc2 c9040000.usb:   Channel 9:
[    2.855790] dwc2 c9040000.usb:     dev_addr: 0, ep_num: 0, ep_is_in: 0
[    2.855793] dwc2 c9040000.usb:     speed: 0
[    2.855796] dwc2 c9040000.usb:     ep_type: 0
[    2.855799] dwc2 c9040000.usb:     max_packet: 0
[    2.855802] dwc2 c9040000.usb:     data_pid_start: 0
[    2.855805] dwc2 c9040000.usb:     multi_count: 0
[    2.855808] dwc2 c9040000.usb:     xfer_started: 0
[    2.855812] dwc2 c9040000.usb:     xfer_buf:   (null)
[    2.855815] dwc2 c9040000.usb:     xfer_dma: 00000000
[    2.855818] dwc2 c9040000.usb:     xfer_len: 0
[    2.855821] dwc2 c9040000.usb:     xfer_count: 0
[    2.855824] dwc2 c9040000.usb:     halt_on_queue: 0
[    2.855827] dwc2 c9040000.usb:     halt_pending: 0
[    2.855830] dwc2 c9040000.usb:     halt_status: 0
[    2.855833] dwc2 c9040000.usb:     do_split: 0
[    2.855836] dwc2 c9040000.usb:     complete_split: 0
[    2.855840] dwc2 c9040000.usb:     hub_addr: 0
[    2.855843] dwc2 c9040000.usb:     hub_port: 0
[    2.855846] dwc2 c9040000.usb:     xact_pos: 0
[    2.855849] dwc2 c9040000.usb:     requests: 0
[    2.855852] dwc2 c9040000.usb:     qh:   (null)
[    2.855855] dwc2 c9040000.usb:   Channel 10:
[    2.855859] dwc2 c9040000.usb:     dev_addr: 0, ep_num: 0, ep_is_in: 0
[    2.855862] dwc2 c9040000.usb:     speed: 0
[    2.855865] dwc2 c9040000.usb:     ep_type: 0
[    2.855868] dwc2 c9040000.usb:     max_packet: 0
[    2.855871] dwc2 c9040000.usb:     data_pid_start: 0
[    2.855874] dwc2 c9040000.usb:     multi_count: 0
[    2.855877] dwc2 c9040000.usb:     xfer_started: 0
[    2.855881] dwc2 c9040000.usb:     xfer_buf:   (null)
[    2.855884] dwc2 c9040000.usb:     xfer_dma: 00000000
[    2.855887] dwc2 c9040000.usb:     xfer_len: 0
[    2.855890] dwc2 c9040000.usb:     xfer_count: 0
[    2.855893] dwc2 c9040000.usb:     halt_on_queue: 0
[    2.855896] dwc2 c9040000.usb:     halt_pending: 0
[    2.855899] dwc2 c9040000.usb:     halt_status: 0
[    2.855902] dwc2 c9040000.usb:     do_split: 0
[    2.855905] dwc2 c9040000.usb:     complete_split: 0
[    2.855908] dwc2 c9040000.usb:     hub_addr: 0
[    2.855911] dwc2 c9040000.usb:     hub_port: 0
[    2.855914] dwc2 c9040000.usb:     xact_pos: 0
[    2.855918] dwc2 c9040000.usb:     requests: 0
[    2.855921] dwc2 c9040000.usb:     qh:   (null)
[    2.855924] dwc2 c9040000.usb:   Channel 11:
[    2.855928] dwc2 c9040000.usb:     dev_addr: 0, ep_num: 0, ep_is_in: 0
[    2.855931] dwc2 c9040000.usb:     speed: 0
[    2.855934] dwc2 c9040000.usb:     ep_type: 0
[    2.855937] dwc2 c9040000.usb:     max_packet: 0
[    2.855940] dwc2 c9040000.usb:     data_pid_start: 0
[    2.855943] dwc2 c9040000.usb:     multi_count: 0
[    2.855946] dwc2 c9040000.usb:     xfer_started: 0
[    2.855950] dwc2 c9040000.usb:     xfer_buf:   (null)
[    2.855953] dwc2 c9040000.usb:     xfer_dma: 00000000
[    2.855956] dwc2 c9040000.usb:     xfer_len: 0
[    2.855959] dwc2 c9040000.usb:     xfer_count: 0
[    2.855962] dwc2 c9040000.usb:     halt_on_queue: 0
[    2.855965] dwc2 c9040000.usb:     halt_pending: 0
[    2.855968] dwc2 c9040000.usb:     halt_status: 0
[    2.855971] dwc2 c9040000.usb:     do_split: 0
[    2.855974] dwc2 c9040000.usb:     complete_split: 0
[    2.855977] dwc2 c9040000.usb:     hub_addr: 0
[    2.855981] dwc2 c9040000.usb:     hub_port: 0
[    2.855984] dwc2 c9040000.usb:     xact_pos: 0
[    2.855987] dwc2 c9040000.usb:     requests: 0
[    2.855990] dwc2 c9040000.usb:     qh:   (null)
[    2.855993] dwc2 c9040000.usb:   Channel 12:
[    2.855996] dwc2 c9040000.usb:     dev_addr: 0, ep_num: 0, ep_is_in: 0
[    2.855999] dwc2 c9040000.usb:     speed: 0
[    2.856002] dwc2 c9040000.usb:     ep_type: 0
[    2.856006] dwc2 c9040000.usb:     max_packet: 0
[    2.856009] dwc2 c9040000.usb:     data_pid_start: 0
[    2.856012] dwc2 c9040000.usb:     multi_count: 0
[    2.856015] dwc2 c9040000.usb:     xfer_started: 0
[    2.856018] dwc2 c9040000.usb:     xfer_buf:   (null)
[    2.856021] dwc2 c9040000.usb:     xfer_dma: 00000000
[    2.856024] dwc2 c9040000.usb:     xfer_len: 0
[    2.856027] dwc2 c9040000.usb:     xfer_count: 0
[    2.856030] dwc2 c9040000.usb:     halt_on_queue: 0
[    2.856034] dwc2 c9040000.usb:     halt_pending: 0
[    2.856037] dwc2 c9040000.usb:     halt_status: 0
[    2.856040] dwc2 c9040000.usb:     do_split: 0
[    2.856043] dwc2 c9040000.usb:     complete_split: 0
[    2.856046] dwc2 c9040000.usb:     hub_addr: 0
[    2.856049] dwc2 c9040000.usb:     hub_port: 0
[    2.856052] dwc2 c9040000.usb:     xact_pos: 0
[    2.856055] dwc2 c9040000.usb:     requests: 0
[    2.856058] dwc2 c9040000.usb:     qh:   (null)
[    2.856061] dwc2 c9040000.usb:   Channel 13:
[    2.856065] dwc2 c9040000.usb:     dev_addr: 0, ep_num: 0, ep_is_in: 0
[    2.856068] dwc2 c9040000.usb:     speed: 0
[    2.856071] dwc2 c9040000.usb:     ep_type: 0
[    2.856074] dwc2 c9040000.usb:     max_packet: 0
[    2.856077] dwc2 c9040000.usb:     data_pid_start: 0
[    2.856081] dwc2 c9040000.usb:     multi_count: 0
[    2.856084] dwc2 c9040000.usb:     xfer_started: 0
[    2.856087] dwc2 c9040000.usb:     xfer_buf:   (null)
[    2.856090] dwc2 c9040000.usb:     xfer_dma: 00000000
[    2.856093] dwc2 c9040000.usb:     xfer_len: 0
[    2.856097] dwc2 c9040000.usb:     xfer_count: 0
[    2.856100] dwc2 c9040000.usb:     halt_on_queue: 0
[    2.856103] dwc2 c9040000.usb:     halt_pending: 0
[    2.856106] dwc2 c9040000.usb:     halt_status: 0
[    2.856109] dwc2 c9040000.usb:     do_split: 0
[    2.856112] dwc2 c9040000.usb:     complete_split: 0
[    2.856115] dwc2 c9040000.usb:     hub_addr: 0
[    2.856118] dwc2 c9040000.usb:     hub_port: 0
[    2.856121] dwc2 c9040000.usb:     xact_pos: 0
[    2.856124] dwc2 c9040000.usb:     requests: 0
[    2.856127] dwc2 c9040000.usb:     qh:   (null)
[    2.856130] dwc2 c9040000.usb:   Channel 14:
[    2.856134] dwc2 c9040000.usb:     dev_addr: 0, ep_num: 0, ep_is_in: 0
[    2.856137] dwc2 c9040000.usb:     speed: 0
[    2.856140] dwc2 c9040000.usb:     ep_type: 0
[    2.856143] dwc2 c9040000.usb:     max_packet: 0
[    2.856146] dwc2 c9040000.usb:     data_pid_start: 0
[    2.856149] dwc2 c9040000.usb:     multi_count: 0
[    2.856153] dwc2 c9040000.usb:     xfer_started: 0
[    2.856156] dwc2 c9040000.usb:     xfer_buf:   (null)
[    2.856159] dwc2 c9040000.usb:     xfer_dma: 00000000
[    2.856162] dwc2 c9040000.usb:     xfer_len: 0
[    2.856165] dwc2 c9040000.usb:     xfer_count: 0
[    2.856168] dwc2 c9040000.usb:     halt_on_queue: 0
[    2.856171] dwc2 c9040000.usb:     halt_pending: 0
[    2.856174] dwc2 c9040000.usb:     halt_status: 0
[    2.856177] dwc2 c9040000.usb:     do_split: 0
[    2.856181] dwc2 c9040000.usb:     complete_split: 0
[    2.856184] dwc2 c9040000.usb:     hub_addr: 0
[    2.856187] dwc2 c9040000.usb:     hub_port: 0
[    2.856190] dwc2 c9040000.usb:     xact_pos: 0
[    2.856193] dwc2 c9040000.usb:     requests: 0
[    2.856196] dwc2 c9040000.usb:     qh:   (null)
[    2.856199] dwc2 c9040000.usb:   Channel 15:
[    2.856203] dwc2 c9040000.usb:     dev_addr: 0, ep_num: 0, ep_is_in: 0
[    2.856206] dwc2 c9040000.usb:     speed: 0
[    2.856209] dwc2 c9040000.usb:     ep_type: 0
[    2.856212] dwc2 c9040000.usb:     max_packet: 0
[    2.856215] dwc2 c9040000.usb:     data_pid_start: 0
[    2.856218] dwc2 c9040000.usb:     multi_count: 0
[    2.856221] dwc2 c9040000.usb:     xfer_started: 0
[    2.856225] dwc2 c9040000.usb:     xfer_buf:   (null)
[    2.856228] dwc2 c9040000.usb:     xfer_dma: 00000000
[    2.856231] dwc2 c9040000.usb:     xfer_len: 0
[    2.856234] dwc2 c9040000.usb:     xfer_count: 0
[    2.856237] dwc2 c9040000.usb:     halt_on_queue: 0
[    2.856240] dwc2 c9040000.usb:     halt_pending: 0
[    2.856243] dwc2 c9040000.usb:     halt_status: 0
[    2.856246] dwc2 c9040000.usb:     do_split: 0
[    2.856249] dwc2 c9040000.usb:     complete_split: 0
[    2.856252] dwc2 c9040000.usb:     hub_addr: 0
[    2.856255] dwc2 c9040000.usb:     hub_port: 0
[    2.856258] dwc2 c9040000.usb:     xact_pos: 0
[    2.856262] dwc2 c9040000.usb:     requests: 0
[    2.856265] dwc2 c9040000.usb:     qh:   (null)
[    2.856269] dwc2 c9040000.usb:   non_periodic_channels: 0
[    2.856272] dwc2 c9040000.usb:   periodic_channels: 0
[    2.856275] dwc2 c9040000.usb:   periodic_usecs: 0
[    2.856279] dwc2 c9040000.usb:   NP Tx Req Queue Space Avail: 8
[    2.856282] dwc2 c9040000.usb:   NP Tx FIFO Space Avail: 500
[    2.856286] dwc2 c9040000.usb:   P Tx Req Queue Space Avail: 8
[    2.856289] dwc2 c9040000.usb:   P Tx FIFO Space Avail: 500
[    2.856292] dwc2 c9040000.usb: Core Global Registers
[    2.856296] dwc2 c9040000.usb: GOTGCTL	 @0xF0AC0000 : 0x022C0000
[    2.856300] dwc2 c9040000.usb: GOTGINT	 @0xF0AC0004 : 0x00000000
[    2.856304] dwc2 c9040000.usb: GAHBCFG	 @0xF0AC0008 : 0x0000002A
[    2.856308] dwc2 c9040000.usb: GUSBCFG	 @0xF0AC000C : 0x2000140F
[    2.856312] dwc2 c9040000.usb: GRSTCTL	 @0xF0AC0010 : 0x80000000
[    2.856316] dwc2 c9040000.usb: GINTSTS	 @0xF0AC0014 : 0x04000021
[    2.856320] dwc2 c9040000.usb: GINTMSK	 @0xF0AC0018 : 0xF3000806
[    2.856323] dwc2 c9040000.usb: GRXSTSR	 @0xF0AC001C : 0x000E000F
[    2.856328] dwc2 c9040000.usb: GRXFSIZ	 @0xF0AC0024 : 0x00000200
[    2.856331] dwc2 c9040000.usb: GNPTXFSIZ	 @0xF0AC0028 : 0x01F40200
[    2.856335] dwc2 c9040000.usb: GNPTXSTS	 @0xF0AC002C : 0x470801F4
[    2.856339] dwc2 c9040000.usb: GI2CCTL	 @0xF0AC0030 : 0x00000000
[    2.856343] dwc2 c9040000.usb: GPVNDCTL	 @0xF0AC0034 : 0x00000000
[    2.856347] dwc2 c9040000.usb: GGPIO	 @0xF0AC0038 : 0x00000000
[    2.856351] dwc2 c9040000.usb: GUID	 @0xF0AC003C : 0x12345678
[    2.856355] dwc2 c9040000.usb: GSNPSID	 @0xF0AC0040 : 0x4F54310A
[    2.856358] dwc2 c9040000.usb: GHWCFG1	 @0xF0AC0044 : 0x00000000
[    2.856362] dwc2 c9040000.usb: GHWCFG2	 @0xF0AC0048 : 0x229FD850
[    2.856366] dwc2 c9040000.usb: GHWCFG3	 @0xF0AC004C : 0x07C050E8
[    2.856369] dwc2 c9040000.usb: GHWCFG4	 @0xF0AC0050 : 0xD7F24030
[    2.856373] dwc2 c9040000.usb: GLPMCFG	 @0xF0AC0054 : 0x00000000
[    2.856377] dwc2 c9040000.usb: GPWRDN	 @0xF0AC0058 : 0x08400010
[    2.856381] dwc2 c9040000.usb: GDFIFOCFG	 @0xF0AC005C : 0x05E80800
[    2.856385] dwc2 c9040000.usb: HPTXFSIZ	 @0xF0AC0100 : 0x01F403F4
[    2.856388] dwc2 c9040000.usb: PCGCTL	 @0xF0AC0E00 : 0x00000000
[    2.856392] dwc2 c9040000.usb: Host Global Registers
[    2.856396] dwc2 c9040000.usb: HCFG	 @0xF0AC0400 : 0x00000200
[    2.856400] dwc2 c9040000.usb: HFIR	 @0xF0AC0404 : 0x0001EA60
[    2.856403] dwc2 c9040000.usb: HFNUM	 @0xF0AC0408 : 0xEA603FFF
[    2.856407] dwc2 c9040000.usb: HPTXSTS	 @0xF0AC0410 : 0x000801F4
[    2.856411] dwc2 c9040000.usb: HAINT	 @0xF0AC0414 : 0x00000000
[    2.856415] dwc2 c9040000.usb: HAINTMSK	 @0xF0AC0418 : 0x00000000
[    2.856419] dwc2 c9040000.usb: HPRT0	 @0xF0AC0440 : 0x00001000
[    2.856422] dwc2 c9040000.usb: Host Channel 0 Specific Registers
[    2.856426] dwc2 c9040000.usb: HCCHAR	 @0xF0AC0500 : 0x00000000
[    2.856430] dwc2 c9040000.usb: HCSPLT	 @0xF0AC0504 : 0x00000000
[    2.856433] dwc2 c9040000.usb: HCINT	 @0xF0AC0508 : 0x00000002
[    2.856437] dwc2 c9040000.usb: HCINTMSK	 @0xF0AC050C : 0x00000000
[    2.856441] dwc2 c9040000.usb: HCTSIZ	 @0xF0AC0510 : 0x00000000
[    2.856445] dwc2 c9040000.usb: HCDMA	 @0xF0AC0514 : 0xDA339FEF
[    2.856448] dwc2 c9040000.usb: Host Channel 1 Specific Registers
[    2.856452] dwc2 c9040000.usb: HCCHAR	 @0xF0AC0520 : 0x00000000
[    2.856456] dwc2 c9040000.usb: HCSPLT	 @0xF0AC0524 : 0x00000000
[    2.856459] dwc2 c9040000.usb: HCINT	 @0xF0AC0528 : 0x00000002
[    2.856463] dwc2 c9040000.usb: HCINTMSK	 @0xF0AC052C : 0x00000000
[    2.856467] dwc2 c9040000.usb: HCTSIZ	 @0xF0AC0530 : 0x00000000
[    2.856470] dwc2 c9040000.usb: HCDMA	 @0xF0AC0534 : 0x14541602
[    2.856474] dwc2 c9040000.usb: Host Channel 2 Specific Registers
[    2.856477] dwc2 c9040000.usb: HCCHAR	 @0xF0AC0540 : 0x00000000
[    2.856481] dwc2 c9040000.usb: HCSPLT	 @0xF0AC0544 : 0x00000000
[    2.856485] dwc2 c9040000.usb: HCINT	 @0xF0AC0548 : 0x00000002
[    2.856489] dwc2 c9040000.usb: HCINTMSK	 @0xF0AC054C : 0x00000000
[    2.856492] dwc2 c9040000.usb: HCTSIZ	 @0xF0AC0550 : 0x00000000
[    2.856496] dwc2 c9040000.usb: HCDMA	 @0xF0AC0554 : 0xEB4197A3
[    2.856500] dwc2 c9040000.usb: Host Channel 3 Specific Registers
[    2.856503] dwc2 c9040000.usb: HCCHAR	 @0xF0AC0560 : 0x00000000
[    2.856507] dwc2 c9040000.usb: HCSPLT	 @0xF0AC0564 : 0x00000000
[    2.856511] dwc2 c9040000.usb: HCINT	 @0xF0AC0568 : 0x00000002
[    2.856514] dwc2 c9040000.usb: HCINTMSK	 @0xF0AC056C : 0x00000000
[    2.856518] dwc2 c9040000.usb: HCTSIZ	 @0xF0AC0570 : 0x00000000
[    2.856522] dwc2 c9040000.usb: HCDMA	 @0xF0AC0574 : 0x21CDB1E0
[    2.856525] dwc2 c9040000.usb: Host Channel 4 Specific Registers
[    2.856529] dwc2 c9040000.usb: HCCHAR	 @0xF0AC0580 : 0x00000000
[    2.856533] dwc2 c9040000.usb: HCSPLT	 @0xF0AC0584 : 0x00000000
[    2.856536] dwc2 c9040000.usb: HCINT	 @0xF0AC0588 : 0x00000002
[    2.856540] dwc2 c9040000.usb: HCINTMSK	 @0xF0AC058C : 0x00000000
[    2.856544] dwc2 c9040000.usb: HCTSIZ	 @0xF0AC0590 : 0x00000000
[    2.856548] dwc2 c9040000.usb: HCDMA	 @0xF0AC0594 : 0x06674B6B
[    2.856551] dwc2 c9040000.usb: Host Channel 5 Specific Registers
[    2.856555] dwc2 c9040000.usb: HCCHAR	 @0xF0AC05A0 : 0x00000000
[    2.856558] dwc2 c9040000.usb: HCSPLT	 @0xF0AC05A4 : 0x00000000
[    2.856562] dwc2 c9040000.usb: HCINT	 @0xF0AC05A8 : 0x00000002
[    2.856566] dwc2 c9040000.usb: HCINTMSK	 @0xF0AC05AC : 0x00000000
[    2.856570] dwc2 c9040000.usb: HCTSIZ	 @0xF0AC05B0 : 0x00000000
[    2.856574] dwc2 c9040000.usb: HCDMA	 @0xF0AC05B4 : 0x015DBE19
[    2.856577] dwc2 c9040000.usb: Host Channel 6 Specific Registers
[    2.856581] dwc2 c9040000.usb: HCCHAR	 @0xF0AC05C0 : 0x00000000
[    2.856584] dwc2 c9040000.usb: HCSPLT	 @0xF0AC05C4 : 0x00000000
[    2.856588] dwc2 c9040000.usb: HCINT	 @0xF0AC05C8 : 0x00000002
[    2.856592] dwc2 c9040000.usb: HCINTMSK	 @0xF0AC05CC : 0x00000000
[    2.856596] dwc2 c9040000.usb: HCTSIZ	 @0xF0AC05D0 : 0x00000000
[    2.856599] dwc2 c9040000.usb: HCDMA	 @0xF0AC05D4 : 0xDBED42D4
[    2.856603] dwc2 c9040000.usb: Host Channel 7 Specific Registers
[    2.856606] dwc2 c9040000.usb: HCCHAR	 @0xF0AC05E0 : 0x00000000
[    2.856610] dwc2 c9040000.usb: HCSPLT	 @0xF0AC05E4 : 0x00000000
[    2.856614] dwc2 c9040000.usb: HCINT	 @0xF0AC05E8 : 0x00000002
[    2.856617] dwc2 c9040000.usb: HCINTMSK	 @0xF0AC05EC : 0x00000000
[    2.856621] dwc2 c9040000.usb: HCTSIZ	 @0xF0AC05F0 : 0x00000000
[    2.856625] dwc2 c9040000.usb: HCDMA	 @0xF0AC05F4 : 0x96075886
[    2.856628] dwc2 c9040000.usb: Host Channel 8 Specific Registers
[    2.856632] dwc2 c9040000.usb: HCCHAR	 @0xF0AC0600 : 0x00000000
[    2.856636] dwc2 c9040000.usb: HCSPLT	 @0xF0AC0604 : 0x00000000
[    2.856639] dwc2 c9040000.usb: HCINT	 @0xF0AC0608 : 0x00000002
[    2.856643] dwc2 c9040000.usb: HCINTMSK	 @0xF0AC060C : 0x00000000
[    2.856647] dwc2 c9040000.usb: HCTSIZ	 @0xF0AC0610 : 0x00000000
[    2.856651] dwc2 c9040000.usb: HCDMA	 @0xF0AC0614 : 0xD7A5EB55
[    2.856654] dwc2 c9040000.usb: Host Channel 9 Specific Registers
[    2.856658] dwc2 c9040000.usb: HCCHAR	 @0xF0AC0620 : 0x00000000
[    2.856661] dwc2 c9040000.usb: HCSPLT	 @0xF0AC0624 : 0x00000000
[    2.856665] dwc2 c9040000.usb: HCINT	 @0xF0AC0628 : 0x00000002
[    2.856669] dwc2 c9040000.usb: HCINTMSK	 @0xF0AC062C : 0x00000000
[    2.856672] dwc2 c9040000.usb: HCTSIZ	 @0xF0AC0630 : 0x00000000
[    2.856676] dwc2 c9040000.usb: HCDMA	 @0xF0AC0634 : 0x94CCE33E
[    2.856679] dwc2 c9040000.usb: Host Channel 10 Specific Registers
[    2.856683] dwc2 c9040000.usb: HCCHAR	 @0xF0AC0640 : 0x00000000
[    2.856687] dwc2 c9040000.usb: HCSPLT	 @0xF0AC0644 : 0x00000000
[    2.856690] dwc2 c9040000.usb: HCINT	 @0xF0AC0648 : 0x00000002
[    2.856694] dwc2 c9040000.usb: HCINTMSK	 @0xF0AC064C : 0x00000000
[    2.856698] dwc2 c9040000.usb: HCTSIZ	 @0xF0AC0650 : 0x00000000
[    2.856702] dwc2 c9040000.usb: HCDMA	 @0xF0AC0654 : 0xE9BB7FB6
[    2.856705] dwc2 c9040000.usb: Host Channel 11 Specific Registers
[    2.856709] dwc2 c9040000.usb: HCCHAR	 @0xF0AC0660 : 0x00000000
[    2.856713] dwc2 c9040000.usb: HCSPLT	 @0xF0AC0664 : 0x00000000
[    2.856716] dwc2 c9040000.usb: HCINT	 @0xF0AC0668 : 0x00000002
[    2.856720] dwc2 c9040000.usb: HCINTMSK	 @0xF0AC066C : 0x00000000
[    2.856724] dwc2 c9040000.usb: HCTSIZ	 @0xF0AC0670 : 0x00000000
[    2.856727] dwc2 c9040000.usb: HCDMA	 @0xF0AC0674 : 0x63BC4918
[    2.856731] dwc2 c9040000.usb: Host Channel 12 Specific Registers
[    2.856735] dwc2 c9040000.usb: HCCHAR	 @0xF0AC0680 : 0x00000000
[    2.856738] dwc2 c9040000.usb: HCSPLT	 @0xF0AC0684 : 0x00000000
[    2.856742] dwc2 c9040000.usb: HCINT	 @0xF0AC0688 : 0x00000002
[    2.856746] dwc2 c9040000.usb: HCINTMSK	 @0xF0AC068C : 0x00000000
[    2.856749] dwc2 c9040000.usb: HCTSIZ	 @0xF0AC0690 : 0x00000000
[    2.856753] dwc2 c9040000.usb: HCDMA	 @0xF0AC0694 : 0xFFDBDEB2
[    2.856756] dwc2 c9040000.usb: Host Channel 13 Specific Registers
[    2.856760] dwc2 c9040000.usb: HCCHAR	 @0xF0AC06A0 : 0x00000000
[    2.856764] dwc2 c9040000.usb: HCSPLT	 @0xF0AC06A4 : 0x00000000
[    2.856767] dwc2 c9040000.usb: HCINT	 @0xF0AC06A8 : 0x00000002
[    2.856771] dwc2 c9040000.usb: HCINTMSK	 @0xF0AC06AC : 0x00000000
[    2.856775] dwc2 c9040000.usb: HCTSIZ	 @0xF0AC06B0 : 0x00000000
[    2.856779] dwc2 c9040000.usb: HCDMA	 @0xF0AC06B4 : 0x28F46C44
[    2.856782] dwc2 c9040000.usb: Host Channel 14 Specific Registers
[    2.856786] dwc2 c9040000.usb: HCCHAR	 @0xF0AC06C0 : 0x00000000
[    2.856789] dwc2 c9040000.usb: HCSPLT	 @0xF0AC06C4 : 0x00000000
[    2.856793] dwc2 c9040000.usb: HCINT	 @0xF0AC06C8 : 0x00000002
[    2.856797] dwc2 c9040000.usb: HCINTMSK	 @0xF0AC06CC : 0x00000000
[    2.856800] dwc2 c9040000.usb: HCTSIZ	 @0xF0AC06D0 : 0x00000000
[    2.856804] dwc2 c9040000.usb: HCDMA	 @0xF0AC06D4 : 0x31ABCE1D
[    2.856807] dwc2 c9040000.usb: Host Channel 15 Specific Registers
[    2.856811] dwc2 c9040000.usb: HCCHAR	 @0xF0AC06E0 : 0x00000000
[    2.856815] dwc2 c9040000.usb: HCSPLT	 @0xF0AC06E4 : 0x00000000
[    2.856818] dwc2 c9040000.usb: HCINT	 @0xF0AC06E8 : 0x00000002
[    2.856822] dwc2 c9040000.usb: HCINTMSK	 @0xF0AC06EC : 0x00000000
[    2.856826] dwc2 c9040000.usb: HCTSIZ	 @0xF0AC06F0 : 0x00000000
[    2.856830] dwc2 c9040000.usb: HCDMA	 @0xF0AC06F4 : 0x03619E82
[    2.856833] dwc2 c9040000.usb: ************************************************************
[    2.856836] dwc2 c9040000.usb: 
[    2.857137] dwc2 c90c0000.usb: mapped PA c90c0000 to VA (ptrval)
[    2.857162] dwc2 c90c0000.usb: c90c0000.usb supply vusb_d not found, using dummy regulator
[    2.863240] dwc2 c90c0000.usb: c90c0000.usb supply vusb_a not found, using dummy regulator
[    2.871478] dwc2 c90c0000.usb: registering common handler for irq28
[    2.872566] dwc2 c90c0000.usb: Core Release: 3.10a (snpsid=4f54310a)
[    2.872570] dwc2 c90c0000.usb: Forcing mode to host
[    2.938468] dwc2 c90c0000.usb: dwc2_check_params: Invalid parameter lpm=1
[    2.939612] dwc2 c90c0000.usb: dwc2_check_params: Invalid parameter lpm_clock_gating=1
[    2.947501] dwc2 c90c0000.usb: dwc2_check_params: Invalid parameter besl=1
[    2.954355] dwc2 c90c0000.usb: dwc2_check_params: Invalid parameter hird_threshold_en=1
[    2.962329] dwc2 c90c0000.usb: DWC OTG HCD INIT
[    2.962333] dwc2 c90c0000.usb: hcfg=00000200
[    2.962339] dwc2 c90c0000.usb: dwc2_core_init((ptrval))
[    2.962342] dwc2 c90c0000.usb: HS UTMI+ PHY selected
[    2.962346] dwc2 c90c0000.usb: Internal DMA Mode
[    2.962350] dwc2 c90c0000.usb: Host Mode
[    2.962429] dwc2 c90c0000.usb: DWC OTG Controller
[    2.967011] dwc2 c90c0000.usb: new USB bus registered, assigned bus number 2
[    2.974045] dwc2 c90c0000.usb: irq 28, io mem 0xc90c0000
[    2.979318] dwc2 c90c0000.usb: DWC OTG HCD START
[    2.979325] dwc2 c90c0000.usb: dwc2_core_host_init((ptrval))
[    2.979328] dwc2 c90c0000.usb: Initializing HCFG.FSLSPClkSel to 00000000
[    2.979332] dwc2 c90c0000.usb: initial grxfsiz=00000800
[    2.979335] dwc2 c90c0000.usb: new grxfsiz=00000200
[    2.979339] dwc2 c90c0000.usb: initial gnptxfsiz=08000800
[    2.979342] dwc2 c90c0000.usb: new gnptxfsiz=01f40200
[    2.979345] dwc2 c90c0000.usb: initial hptxfsiz=08000000
[    2.979349] dwc2 c90c0000.usb: new hptxfsiz=01f403f4
[    2.979362] dwc2 c90c0000.usb: dwc2_core_host_init: Halt channel 0
[    2.979365] dwc2 c90c0000.usb: dwc2_core_host_init: Halt channel 1
[    2.979369] dwc2 c90c0000.usb: dwc2_core_host_init: Halt channel 2
[    2.979372] dwc2 c90c0000.usb: dwc2_core_host_init: Halt channel 3
[    2.979375] dwc2 c90c0000.usb: dwc2_core_host_init: Halt channel 4
[    2.979378] dwc2 c90c0000.usb: dwc2_core_host_init: Halt channel 5
[    2.979381] dwc2 c90c0000.usb: dwc2_core_host_init: Halt channel 6
[    2.979385] dwc2 c90c0000.usb: dwc2_core_host_init: Halt channel 7
[    2.979388] dwc2 c90c0000.usb: dwc2_core_host_init: Halt channel 8
[    2.979391] dwc2 c90c0000.usb: dwc2_core_host_init: Halt channel 9
[    2.979395] dwc2 c90c0000.usb: dwc2_core_host_init: Halt channel 10
[    2.979398] dwc2 c90c0000.usb: dwc2_core_host_init: Halt channel 11
[    2.979401] dwc2 c90c0000.usb: dwc2_core_host_init: Halt channel 12
[    2.979404] dwc2 c90c0000.usb: dwc2_core_host_init: Halt channel 13
[    2.979407] dwc2 c90c0000.usb: dwc2_core_host_init: Halt channel 14
[    2.979411] dwc2 c90c0000.usb: dwc2_core_host_init: Halt channel 15
[    2.979414] dwc2 c90c0000.usb: Init: Port Power? op_state=9
[    2.979417] dwc2 c90c0000.usb: Init: Power Port (0)
[    2.979420] dwc2 c90c0000.usb: dwc2_enable_host_interrupts()
[    2.979423] dwc2 c90c0000.usb: DWC OTG HCD Has Root Hub
[    2.979657] dwc2 c9040000.usb: dwc2_backup_global_registers
[    2.979663] dwc2 c9040000.usb: dwc2_backup_host_registers
[    2.979714] dwc2 c90c0000.usb: DWC OTG HCD EP RESET: bEndpointAddress=0x81
[    2.979779] hub 2-0:1.0: USB hub found
[    2.983041] dwc2 c90c0000.usb: GetHubDescriptor
[    2.983056] hub 2-0:1.0: 1 port detected
[    2.986951] dwc2 c90c0000.usb: GetHubStatus
[    2.986987] dwc2 c90c0000.usb: SetPortFeature
[    2.987094] dwc2 c90c0000.usb: 
[    2.987098] dwc2 c90c0000.usb: ************************************************************
[    2.987100] dwc2 c90c0000.usb: HCD State:
[    2.987103] dwc2 c90c0000.usb:   Num channels: 16
[    2.987107] dwc2 c90c0000.usb:   Channel 0:
[    2.987111] dwc2 c90c0000.usb:     dev_addr: 0, ep_num: 0, ep_is_in: 0
[    2.987113] dwc2 c90c0000.usb:     speed: 0
[    2.987116] dwc2 c90c0000.usb:     ep_type: 0
[    2.987119] dwc2 c90c0000.usb:     max_packet: 0
[    2.987122] dwc2 c90c0000.usb:     data_pid_start: 0
[    2.987125] dwc2 c90c0000.usb:     multi_count: 0
[    2.987127] dwc2 c90c0000.usb:     xfer_started: 0
[    2.987131] dwc2 c90c0000.usb:     xfer_buf:   (null)
[    2.987134] dwc2 c90c0000.usb:     xfer_dma: 00000000
[    2.987137] dwc2 c90c0000.usb:     xfer_len: 0
[    2.987140] dwc2 c90c0000.usb:     xfer_count: 0
[    2.987143] dwc2 c90c0000.usb:     halt_on_queue: 0
[    2.987146] dwc2 c90c0000.usb:     halt_pending: 0
[    2.987148] dwc2 c90c0000.usb:     halt_status: 0
[    2.987151] dwc2 c90c0000.usb:     do_split: 0
[    2.987154] dwc2 c90c0000.usb:     complete_split: 0
[    2.987157] dwc2 c90c0000.usb:     hub_addr: 0
[    2.987159] dwc2 c90c0000.usb:     hub_port: 0
[    2.987162] dwc2 c90c0000.usb:     xact_pos: 0
[    2.987165] dwc2 c90c0000.usb:     requests: 0
[    2.987167] dwc2 c90c0000.usb:     qh:   (null)
[    2.987170] dwc2 c90c0000.usb:   Channel 1:
[    2.987174] dwc2 c90c0000.usb:     dev_addr: 0, ep_num: 0, ep_is_in: 0
[    2.987176] dwc2 c90c0000.usb:     speed: 0
[    2.987179] dwc2 c90c0000.usb:     ep_type: 0
[    2.987182] dwc2 c90c0000.usb:     max_packet: 0
[    2.987184] dwc2 c90c0000.usb:     data_pid_start: 0
[    2.987187] dwc2 c90c0000.usb:     multi_count: 0
[    2.987190] dwc2 c90c0000.usb:     xfer_started: 0
[    2.987193] dwc2 c90c0000.usb:     xfer_buf:   (null)
[    2.987195] dwc2 c90c0000.usb:     xfer_dma: 00000000
[    2.987198] dwc2 c90c0000.usb:     xfer_len: 0
[    2.987201] dwc2 c90c0000.usb:     xfer_count: 0
[    2.987204] dwc2 c90c0000.usb:     halt_on_queue: 0
[    2.987206] dwc2 c90c0000.usb:     halt_pending: 0
[    2.987209] dwc2 c90c0000.usb:     halt_status: 0
[    2.987212] dwc2 c90c0000.usb:     do_split: 0
[    2.987215] dwc2 c90c0000.usb:     complete_split: 0
[    2.987217] dwc2 c90c0000.usb:     hub_addr: 0
[    2.987220] dwc2 c90c0000.usb:     hub_port: 0
[    2.987223] dwc2 c90c0000.usb:     xact_pos: 0
[    2.987225] dwc2 c90c0000.usb:     requests: 0
[    2.987228] dwc2 c90c0000.usb:     qh:   (null)
[    2.987231] dwc2 c90c0000.usb:   Channel 2:
[    2.987234] dwc2 c90c0000.usb:     dev_addr: 0, ep_num: 0, ep_is_in: 0
[    2.987237] dwc2 c90c0000.usb:     speed: 0
[    2.987240] dwc2 c90c0000.usb:     ep_type: 0
[    2.987242] dwc2 c90c0000.usb:     max_packet: 0
[    2.987245] dwc2 c90c0000.usb:     data_pid_start: 0
[    2.987248] dwc2 c90c0000.usb:     multi_count: 0
[    2.987251] dwc2 c90c0000.usb:     xfer_started: 0
[    2.987253] dwc2 c90c0000.usb:     xfer_buf:   (null)
[    2.987256] dwc2 c90c0000.usb:     xfer_dma: 00000000
[    2.987259] dwc2 c90c0000.usb:     xfer_len: 0
[    2.987262] dwc2 c90c0000.usb:     xfer_count: 0
[    2.987265] dwc2 c90c0000.usb:     halt_on_queue: 0
[    2.987267] dwc2 c90c0000.usb:     halt_pending: 0
[    2.987270] dwc2 c90c0000.usb:     halt_status: 0
[    2.987273] dwc2 c90c0000.usb:     do_split: 0
[    2.987275] dwc2 c90c0000.usb:     complete_split: 0
[    2.987278] dwc2 c90c0000.usb:     hub_addr: 0
[    2.987281] dwc2 c90c0000.usb:     hub_port: 0
[    2.987283] dwc2 c90c0000.usb:     xact_pos: 0
[    2.987286] dwc2 c90c0000.usb:     requests: 0
[    2.987289] dwc2 c90c0000.usb:     qh:   (null)
[    2.987291] dwc2 c90c0000.usb:   Channel 3:
[    2.987295] dwc2 c90c0000.usb:     dev_addr: 0, ep_num: 0, ep_is_in: 0
[    2.987297] dwc2 c90c0000.usb:     speed: 0
[    2.987300] dwc2 c90c0000.usb:     ep_type: 0
[    2.987303] dwc2 c90c0000.usb:     max_packet: 0
[    2.987306] dwc2 c90c0000.usb:     data_pid_start: 0
[    2.987308] dwc2 c90c0000.usb:     multi_count: 0
[    2.987311] dwc2 c90c0000.usb:     xfer_started: 0
[    2.987314] dwc2 c90c0000.usb:     xfer_buf:   (null)
[    2.987316] dwc2 c90c0000.usb:     xfer_dma: 00000000
[    2.987319] dwc2 c90c0000.usb:     xfer_len: 0
[    2.987322] dwc2 c90c0000.usb:     xfer_count: 0
[    2.987324] dwc2 c90c0000.usb:     halt_on_queue: 0
[    2.987327] dwc2 c90c0000.usb:     halt_pending: 0
[    2.987330] dwc2 c90c0000.usb:     halt_status: 0
[    2.987333] dwc2 c90c0000.usb:     do_split: 0
[    2.987335] dwc2 c90c0000.usb:     complete_split: 0
[    2.987338] dwc2 c90c0000.usb:     hub_addr: 0
[    2.987341] dwc2 c90c0000.usb:     hub_port: 0
[    2.987343] dwc2 c90c0000.usb:     xact_pos: 0
[    2.987346] dwc2 c90c0000.usb:     requests: 0
[    2.987349] dwc2 c90c0000.usb:     qh:   (null)
[    2.987352] dwc2 c90c0000.usb:   Channel 4:
[    2.987355] dwc2 c90c0000.usb:     dev_addr: 0, ep_num: 0, ep_is_in: 0
[    2.987358] dwc2 c90c0000.usb:     speed: 0
[    2.987360] dwc2 c90c0000.usb:     ep_type: 0
[    2.987363] dwc2 c90c0000.usb:     max_packet: 0
[    2.987366] dwc2 c90c0000.usb:     data_pid_start: 0
[    2.987368] dwc2 c90c0000.usb:     multi_count: 0
[    2.987371] dwc2 c90c0000.usb:     xfer_started: 0
[    2.987374] dwc2 c90c0000.usb:     xfer_buf:   (null)
[    2.987376] dwc2 c90c0000.usb:     xfer_dma: 00000000
[    2.987379] dwc2 c90c0000.usb:     xfer_len: 0
[    2.987382] dwc2 c90c0000.usb:     xfer_count: 0
[    2.987385] dwc2 c90c0000.usb:     halt_on_queue: 0
[    2.987388] dwc2 c90c0000.usb:     halt_pending: 0
[    2.987391] dwc2 c90c0000.usb:     halt_status: 0
[    2.987393] dwc2 c90c0000.usb:     do_split: 0
[    2.987396] dwc2 c90c0000.usb:     complete_split: 0
[    2.987399] dwc2 c90c0000.usb:     hub_addr: 0
[    2.987401] dwc2 c90c0000.usb:     hub_port: 0
[    2.987404] dwc2 c90c0000.usb:     xact_pos: 0
[    2.987407] dwc2 c90c0000.usb:     requests: 0
[    2.987410] dwc2 c90c0000.usb:     qh:   (null)
[    2.987412] dwc2 c90c0000.usb:   Channel 5:
[    2.987416] dwc2 c90c0000.usb:     dev_addr: 0, ep_num: 0, ep_is_in: 0
[    2.987418] dwc2 c90c0000.usb:     speed: 0
[    2.987421] dwc2 c90c0000.usb:     ep_type: 0
[    2.987424] dwc2 c90c0000.usb:     max_packet: 0
[    2.987426] dwc2 c90c0000.usb:     data_pid_start: 0
[    2.987429] dwc2 c90c0000.usb:     multi_count: 0
[    2.987432] dwc2 c90c0000.usb:     xfer_started: 0
[    2.987435] dwc2 c90c0000.usb:     xfer_buf:   (null)
[    2.987437] dwc2 c90c0000.usb:     xfer_dma: 00000000
[    2.987440] dwc2 c90c0000.usb:     xfer_len: 0
[    2.987443] dwc2 c90c0000.usb:     xfer_count: 0
[    2.987446] dwc2 c90c0000.usb:     halt_on_queue: 0
[    2.987448] dwc2 c90c0000.usb:     halt_pending: 0
[    2.987451] dwc2 c90c0000.usb:     halt_status: 0
[    2.987454] dwc2 c90c0000.usb:     do_split: 0
[    2.987457] dwc2 c90c0000.usb:     complete_split: 0
[    2.987459] dwc2 c90c0000.usb:     hub_addr: 0
[    2.987462] dwc2 c90c0000.usb:     hub_port: 0
[    2.987465] dwc2 c90c0000.usb:     xact_pos: 0
[    2.987467] dwc2 c90c0000.usb:     requests: 0
[    2.987470] dwc2 c90c0000.usb:     qh:   (null)
[    2.987473] dwc2 c90c0000.usb:   Channel 6:
[    2.987476] dwc2 c90c0000.usb:     dev_addr: 0, ep_num: 0, ep_is_in: 0
[    2.987479] dwc2 c90c0000.usb:     speed: 0
[    2.987482] dwc2 c90c0000.usb:     ep_type: 0
[    2.987484] dwc2 c90c0000.usb:     max_packet: 0
[    2.987487] dwc2 c90c0000.usb:     data_pid_start: 0
[    2.987490] dwc2 c90c0000.usb:     multi_count: 0
[    2.987492] dwc2 c90c0000.usb:     xfer_started: 0
[    2.987495] dwc2 c90c0000.usb:     xfer_buf:   (null)
[    2.987498] dwc2 c90c0000.usb:     xfer_dma: 00000000
[    2.987501] dwc2 c90c0000.usb:     xfer_len: 0
[    2.987504] dwc2 c90c0000.usb:     xfer_count: 0
[    2.987506] dwc2 c90c0000.usb:     halt_on_queue: 0
[    2.987509] dwc2 c90c0000.usb:     halt_pending: 0
[    2.987512] dwc2 c90c0000.usb:     halt_status: 0
[    2.987514] dwc2 c90c0000.usb:     do_split: 0
[    2.987517] dwc2 c90c0000.usb:     complete_split: 0
[    2.987520] dwc2 c90c0000.usb:     hub_addr: 0
[    2.987522] dwc2 c90c0000.usb:     hub_port: 0
[    2.987525] dwc2 c90c0000.usb:     xact_pos: 0
[    2.987528] dwc2 c90c0000.usb:     requests: 0
[    2.987531] dwc2 c90c0000.usb:     qh:   (null)
[    2.987533] dwc2 c90c0000.usb:   Channel 7:
[    2.987537] dwc2 c90c0000.usb:     dev_addr: 0, ep_num: 0, ep_is_in: 0
[    2.987539] dwc2 c90c0000.usb:     speed: 0
[    2.987542] dwc2 c90c0000.usb:     ep_type: 0
[    2.987545] dwc2 c90c0000.usb:     max_packet: 0
[    2.987547] dwc2 c90c0000.usb:     data_pid_start: 0
[    2.987550] dwc2 c90c0000.usb:     multi_count: 0
[    2.987553] dwc2 c90c0000.usb:     xfer_started: 0
[    2.987555] dwc2 c90c0000.usb:     xfer_buf:   (null)
[    2.987558] dwc2 c90c0000.usb:     xfer_dma: 00000000
[    2.987561] dwc2 c90c0000.usb:     xfer_len: 0
[    2.987564] dwc2 c90c0000.usb:     xfer_count: 0
[    2.987566] dwc2 c90c0000.usb:     halt_on_queue: 0
[    2.987569] dwc2 c90c0000.usb:     halt_pending: 0
[    2.987572] dwc2 c90c0000.usb:     halt_status: 0
[    2.987575] dwc2 c90c0000.usb:     do_split: 0
[    2.987577] dwc2 c90c0000.usb:     complete_split: 0
[    2.987580] dwc2 c90c0000.usb:     hub_addr: 0
[    2.987583] dwc2 c90c0000.usb:     hub_port: 0
[    2.987585] dwc2 c90c0000.usb:     xact_pos: 0
[    2.987588] dwc2 c90c0000.usb:     requests: 0
[    2.987591] dwc2 c90c0000.usb:     qh:   (null)
[    2.987593] dwc2 c90c0000.usb:   Channel 8:
[    2.987597] dwc2 c90c0000.usb:     dev_addr: 0, ep_num: 0, ep_is_in: 0
[    2.987599] dwc2 c90c0000.usb:     speed: 0
[    2.987602] dwc2 c90c0000.usb:     ep_type: 0
[    2.987605] dwc2 c90c0000.usb:     max_packet: 0
[    2.987608] dwc2 c90c0000.usb:     data_pid_start: 0
[    2.987611] dwc2 c90c0000.usb:     multi_count: 0
[    2.987613] dwc2 c90c0000.usb:     xfer_started: 0
[    2.987616] dwc2 c90c0000.usb:     xfer_buf:   (null)
[    2.987619] dwc2 c90c0000.usb:     xfer_dma: 00000000
[    2.987621] dwc2 c90c0000.usb:     xfer_len: 0
[    2.987624] dwc2 c90c0000.usb:     xfer_count: 0
[    2.987627] dwc2 c90c0000.usb:     halt_on_queue: 0
[    2.987630] dwc2 c90c0000.usb:     halt_pending: 0
[    2.987632] dwc2 c90c0000.usb:     halt_status: 0
[    2.987635] dwc2 c90c0000.usb:     do_split: 0
[    2.987638] dwc2 c90c0000.usb:     complete_split: 0
[    2.987640] dwc2 c90c0000.usb:     hub_addr: 0
[    2.987643] dwc2 c90c0000.usb:     hub_port: 0
[    2.987646] dwc2 c90c0000.usb:     xact_pos: 0
[    2.987648] dwc2 c90c0000.usb:     requests: 0
[    2.987651] dwc2 c90c0000.usb:     qh:   (null)
[    2.987654] dwc2 c90c0000.usb:   Channel 9:
[    2.987657] dwc2 c90c0000.usb:     dev_addr: 0, ep_num: 0, ep_is_in: 0
[    2.987660] dwc2 c90c0000.usb:     speed: 0
[    2.987662] dwc2 c90c0000.usb:     ep_type: 0
[    2.987665] dwc2 c90c0000.usb:     max_packet: 0
[    2.987668] dwc2 c90c0000.usb:     data_pid_start: 0
[    2.987671] dwc2 c90c0000.usb:     multi_count: 0
[    2.987673] dwc2 c90c0000.usb:     xfer_started: 0
[    2.987676] dwc2 c90c0000.usb:     xfer_buf:   (null)
[    2.987679] dwc2 c90c0000.usb:     xfer_dma: 00000000
[    2.987681] dwc2 c90c0000.usb:     xfer_len: 0
[    2.987684] dwc2 c90c0000.usb:     xfer_count: 0
[    2.987687] dwc2 c90c0000.usb:     halt_on_queue: 0
[    2.987689] dwc2 c90c0000.usb:     halt_pending: 0
[    2.987692] dwc2 c90c0000.usb:     halt_status: 0
[    2.987695] dwc2 c90c0000.usb:     do_split: 0
[    2.987698] dwc2 c90c0000.usb:     complete_split: 0
[    2.987700] dwc2 c90c0000.usb:     hub_addr: 0
[    2.987703] dwc2 c90c0000.usb:     hub_port: 0
[    2.987706] dwc2 c90c0000.usb:     xact_pos: 0
[    2.987708] dwc2 c90c0000.usb:     requests: 0
[    2.987711] dwc2 c90c0000.usb:     qh:   (null)
[    2.987714] dwc2 c90c0000.usb:   Channel 10:
[    2.987717] dwc2 c90c0000.usb:     dev_addr: 0, ep_num: 0, ep_is_in: 0
[    2.987720] dwc2 c90c0000.usb:     speed: 0
[    2.987723] dwc2 c90c0000.usb:     ep_type: 0
[    2.987726] dwc2 c90c0000.usb:     max_packet: 0
[    2.987728] dwc2 c90c0000.usb:     data_pid_start: 0
[    2.987731] dwc2 c90c0000.usb:     multi_count: 0
[    2.987734] dwc2 c90c0000.usb:     xfer_started: 0
[    2.987737] dwc2 c90c0000.usb:     xfer_buf:   (null)
[    2.987739] dwc2 c90c0000.usb:     xfer_dma: 00000000
[    2.987742] dwc2 c90c0000.usb:     xfer_len: 0
[    2.987745] dwc2 c90c0000.usb:     xfer_count: 0
[    2.987747] dwc2 c90c0000.usb:     halt_on_queue: 0
[    2.987750] dwc2 c90c0000.usb:     halt_pending: 0
[    2.987753] dwc2 c90c0000.usb:     halt_status: 0
[    2.987755] dwc2 c90c0000.usb:     do_split: 0
[    2.987758] dwc2 c90c0000.usb:     complete_split: 0
[    2.987761] dwc2 c90c0000.usb:     hub_addr: 0
[    2.987764] dwc2 c90c0000.usb:     hub_port: 0
[    2.987766] dwc2 c90c0000.usb:     xact_pos: 0
[    2.987769] dwc2 c90c0000.usb:     requests: 0
[    2.987771] dwc2 c90c0000.usb:     qh:   (null)
[    2.987774] dwc2 c90c0000.usb:   Channel 11:
[    2.987778] dwc2 c90c0000.usb:     dev_addr: 0, ep_num: 0, ep_is_in: 0
[    2.987780] dwc2 c90c0000.usb:     speed: 0
[    2.987783] dwc2 c90c0000.usb:     ep_type: 0
[    2.987786] dwc2 c90c0000.usb:     max_packet: 0
[    2.987788] dwc2 c90c0000.usb:     data_pid_start: 0
[    2.987791] dwc2 c90c0000.usb:     multi_count: 0
[    2.987794] dwc2 c90c0000.usb:     xfer_started: 0
[    2.987797] dwc2 c90c0000.usb:     xfer_buf:   (null)
[    2.987799] dwc2 c90c0000.usb:     xfer_dma: 00000000
[    2.987802] dwc2 c90c0000.usb:     xfer_len: 0
[    2.987805] dwc2 c90c0000.usb:     xfer_count: 0
[    2.987807] dwc2 c90c0000.usb:     halt_on_queue: 0
[    2.987810] dwc2 c90c0000.usb:     halt_pending: 0
[    2.987813] dwc2 c90c0000.usb:     halt_status: 0
[    2.987815] dwc2 c90c0000.usb:     do_split: 0
[    2.987818] dwc2 c90c0000.usb:     complete_split: 0
[    2.987821] dwc2 c90c0000.usb:     hub_addr: 0
[    2.987823] dwc2 c90c0000.usb:     hub_port: 0
[    2.987826] dwc2 c90c0000.usb:     xact_pos: 0
[    2.987829] dwc2 c90c0000.usb:     requests: 0
[    2.987831] dwc2 c90c0000.usb:     qh:   (null)
[    2.987834] dwc2 c90c0000.usb:   Channel 12:
[    2.987837] dwc2 c90c0000.usb:     dev_addr: 0, ep_num: 0, ep_is_in: 0
[    2.987840] dwc2 c90c0000.usb:     speed: 0
[    2.987843] dwc2 c90c0000.usb:     ep_type: 0
[    2.987846] dwc2 c90c0000.usb:     max_packet: 0
[    2.987848] dwc2 c90c0000.usb:     data_pid_start: 0
[    2.987851] dwc2 c90c0000.usb:     multi_count: 0
[    2.987854] dwc2 c90c0000.usb:     xfer_started: 0
[    2.987857] dwc2 c90c0000.usb:     xfer_buf:   (null)
[    2.987859] dwc2 c90c0000.usb:     xfer_dma: 00000000
[    2.987862] dwc2 c90c0000.usb:     xfer_len: 0
[    2.987865] dwc2 c90c0000.usb:     xfer_count: 0
[    2.987867] dwc2 c90c0000.usb:     halt_on_queue: 0
[    2.987870] dwc2 c90c0000.usb:     halt_pending: 0
[    2.987873] dwc2 c90c0000.usb:     halt_status: 0
[    2.987875] dwc2 c90c0000.usb:     do_split: 0
[    2.987878] dwc2 c90c0000.usb:     complete_split: 0
[    2.987881] dwc2 c90c0000.usb:     hub_addr: 0
[    2.987883] dwc2 c90c0000.usb:     hub_port: 0
[    2.987886] dwc2 c90c0000.usb:     xact_pos: 0
[    2.987889] dwc2 c90c0000.usb:     requests: 0
[    2.987891] dwc2 c90c0000.usb:     qh:   (null)
[    2.987894] dwc2 c90c0000.usb:   Channel 13:
[    2.987897] dwc2 c90c0000.usb:     dev_addr: 0, ep_num: 0, ep_is_in: 0
[    2.987900] dwc2 c90c0000.usb:     speed: 0
[    2.987903] dwc2 c90c0000.usb:     ep_type: 0
[    2.987906] dwc2 c90c0000.usb:     max_packet: 0
[    2.987908] dwc2 c90c0000.usb:     data_pid_start: 0
[    2.987911] dwc2 c90c0000.usb:     multi_count: 0
[    2.987914] dwc2 c90c0000.usb:     xfer_started: 0
[    2.987917] dwc2 c90c0000.usb:     xfer_buf:   (null)
[    2.987919] dwc2 c90c0000.usb:     xfer_dma: 00000000
[    2.987922] dwc2 c90c0000.usb:     xfer_len: 0
[    2.987925] dwc2 c90c0000.usb:     xfer_count: 0
[    2.987927] dwc2 c90c0000.usb:     halt_on_queue: 0
[    2.987930] dwc2 c90c0000.usb:     halt_pending: 0
[    2.987933] dwc2 c90c0000.usb:     halt_status: 0
[    2.987935] dwc2 c90c0000.usb:     do_split: 0
[    2.987938] dwc2 c90c0000.usb:     complete_split: 0
[    2.987941] dwc2 c90c0000.usb:     hub_addr: 0
[    2.987943] dwc2 c90c0000.usb:     hub_port: 0
[    2.987946] dwc2 c90c0000.usb:     xact_pos: 0
[    2.987949] dwc2 c90c0000.usb:     requests: 0
[    2.987951] dwc2 c90c0000.usb:     qh:   (null)
[    2.987954] dwc2 c90c0000.usb:   Channel 14:
[    2.987957] dwc2 c90c0000.usb:     dev_addr: 0, ep_num: 0, ep_is_in: 0
[    2.987960] dwc2 c90c0000.usb:     speed: 0
[    2.987963] dwc2 c90c0000.usb:     ep_type: 0
[    2.987965] dwc2 c90c0000.usb:     max_packet: 0
[    2.987968] dwc2 c90c0000.usb:     data_pid_start: 0
[    2.987971] dwc2 c90c0000.usb:     multi_count: 0
[    2.987974] dwc2 c90c0000.usb:     xfer_started: 0
[    2.987976] dwc2 c90c0000.usb:     xfer_buf:   (null)
[    2.987979] dwc2 c90c0000.usb:     xfer_dma: 00000000
[    2.987982] dwc2 c90c0000.usb:     xfer_len: 0
[    2.987984] dwc2 c90c0000.usb:     xfer_count: 0
[    2.987987] dwc2 c90c0000.usb:     halt_on_queue: 0
[    2.987990] dwc2 c90c0000.usb:     halt_pending: 0
[    2.987993] dwc2 c90c0000.usb:     halt_status: 0
[    2.987995] dwc2 c90c0000.usb:     do_split: 0
[    2.987998] dwc2 c90c0000.usb:     complete_split: 0
[    2.988001] dwc2 c90c0000.usb:     hub_addr: 0
[    2.988003] dwc2 c90c0000.usb:     hub_port: 0
[    2.988006] dwc2 c90c0000.usb:     xact_pos: 0
[    2.988009] dwc2 c90c0000.usb:     requests: 0
[    2.988011] dwc2 c90c0000.usb:     qh:   (null)
[    2.988014] dwc2 c90c0000.usb:   Channel 15:
[    2.988018] dwc2 c90c0000.usb:     dev_addr: 0, ep_num: 0, ep_is_in: 0
[    2.988020] dwc2 c90c0000.usb:     speed: 0
[    2.988023] dwc2 c90c0000.usb:     ep_type: 0
[    2.988026] dwc2 c90c0000.usb:     max_packet: 0
[    2.988028] dwc2 c90c0000.usb:     data_pid_start: 0
[    2.988031] dwc2 c90c0000.usb:     multi_count: 0
[    2.988034] dwc2 c90c0000.usb:     xfer_started: 0
[    2.988036] dwc2 c90c0000.usb:     xfer_buf:   (null)
[    2.988039] dwc2 c90c0000.usb:     xfer_dma: 00000000
[    2.988042] dwc2 c90c0000.usb:     xfer_len: 0
[    2.988045] dwc2 c90c0000.usb:     xfer_count: 0
[    2.988047] dwc2 c90c0000.usb:     halt_on_queue: 0
[    2.988050] dwc2 c90c0000.usb:     halt_pending: 0
[    2.988053] dwc2 c90c0000.usb:     halt_status: 0
[    2.988056] dwc2 c90c0000.usb:     do_split: 0
[    2.988058] dwc2 c90c0000.usb:     complete_split: 0
[    2.988061] dwc2 c90c0000.usb:     hub_addr: 0
[    2.988064] dwc2 c90c0000.usb:     hub_port: 0
[    2.988066] dwc2 c90c0000.usb:     xact_pos: 0
[    2.988069] dwc2 c90c0000.usb:     requests: 0
[    2.988071] dwc2 c90c0000.usb:     qh:   (null)
[    2.988074] dwc2 c90c0000.usb:   non_periodic_channels: 0
[    2.988078] dwc2 c90c0000.usb:   periodic_channels: 0
[    2.988080] dwc2 c90c0000.usb:   periodic_usecs: 0
[    2.988083] dwc2 c90c0000.usb:   NP Tx Req Queue Space Avail: 8
[    2.988086] dwc2 c90c0000.usb:   NP Tx FIFO Space Avail: 500
[    2.988089] dwc2 c90c0000.usb:   P Tx Req Queue Space Avail: 8
[    2.988092] dwc2 c90c0000.usb:   P Tx FIFO Space Avail: 500
[    2.988095] dwc2 c90c0000.usb: Core Global Registers
[    2.988098] dwc2 c90c0000.usb: GOTGCTL	 @0xF0B40000 : 0x02200000
[    2.988102] dwc2 c90c0000.usb: GOTGINT	 @0xF0B40004 : 0x00000000
[    2.988105] dwc2 c90c0000.usb: GAHBCFG	 @0xF0B40008 : 0x0000002A
[    2.988109] dwc2 c90c0000.usb: GUSBCFG	 @0xF0B4000C : 0x0000140F
[    2.988112] dwc2 c90c0000.usb: GRSTCTL	 @0xF0B40010 : 0x80000000
[    2.988115] dwc2 c90c0000.usb: GINTSTS	 @0xF0B40014 : 0x04000021
[    2.988119] dwc2 c90c0000.usb: GINTMSK	 @0xF0B40018 : 0xF3000006
[    2.988122] dwc2 c90c0000.usb: GRXSTSR	 @0xF0B4001C : 0x000E000F
[    2.988125] dwc2 c90c0000.usb: GRXFSIZ	 @0xF0B40024 : 0x00000200
[    2.988129] dwc2 c90c0000.usb: GNPTXFSIZ	 @0xF0B40028 : 0x01F40200
[    2.988132] dwc2 c90c0000.usb: GNPTXSTS	 @0xF0B4002C : 0x470801F4
[    2.988135] dwc2 c90c0000.usb: GI2CCTL	 @0xF0B40030 : 0x00000000
[    2.988139] dwc2 c90c0000.usb: GPVNDCTL	 @0xF0B40034 : 0x00000000
[    2.988142] dwc2 c90c0000.usb: GGPIO	 @0xF0B40038 : 0x00000000
[    2.988145] dwc2 c90c0000.usb: GUID	 @0xF0B4003C : 0x12345678
[    2.988149] dwc2 c90c0000.usb: GSNPSID	 @0xF0B40040 : 0x4F54310A
[    2.988152] dwc2 c90c0000.usb: GHWCFG1	 @0xF0B40044 : 0x00000000
[    2.988155] dwc2 c90c0000.usb: GHWCFG2	 @0xF0B40048 : 0x228FC855
[    2.988158] dwc2 c90c0000.usb: GHWCFG3	 @0xF0B4004C : 0x07C05068
[    2.988162] dwc2 c90c0000.usb: GHWCFG4	 @0xF0B40050 : 0xC9E04030
[    2.988165] dwc2 c90c0000.usb: GLPMCFG	 @0xF0B40054 : 0x00000000
[    2.988168] dwc2 c90c0000.usb: GPWRDN	 @0xF0B40058 : 0x08000010
[    2.988172] dwc2 c90c0000.usb: GDFIFOCFG	 @0xF0B4005C : 0x07C00800
[    2.988175] dwc2 c90c0000.usb: HPTXFSIZ	 @0xF0B40100 : 0x01F403F4
[    2.988178] dwc2 c90c0000.usb: PCGCTL	 @0xF0B40E00 : 0x00000000
[    2.988181] dwc2 c90c0000.usb: Host Global Registers
[    2.988184] dwc2 c90c0000.usb: HCFG	 @0xF0B40400 : 0x00000200
[    2.988187] dwc2 c90c0000.usb: HFIR	 @0xF0B40404 : 0x0001EA60
[    2.988191] dwc2 c90c0000.usb: HFNUM	 @0xF0B40408 : 0xEA603FFF
[    2.988194] dwc2 c90c0000.usb: HPTXSTS	 @0xF0B40410 : 0x000801F4
[    2.988197] dwc2 c90c0000.usb: HAINT	 @0xF0B40414 : 0x00000000
[    2.988200] dwc2 c90c0000.usb: HAINTMSK	 @0xF0B40418 : 0x00000000
[    2.988204] dwc2 c90c0000.usb: HPRT0	 @0xF0B40440 : 0x00001000
[    2.988206] dwc2 c90c0000.usb: Host Channel 0 Specific Registers
[    2.988210] dwc2 c90c0000.usb: HCCHAR	 @0xF0B40500 : 0x00000000
[    2.988213] dwc2 c90c0000.usb: HCSPLT	 @0xF0B40504 : 0x00000000
[    2.988216] dwc2 c90c0000.usb: HCINT	 @0xF0B40508 : 0x00000002
[    2.988219] dwc2 c90c0000.usb: HCINTMSK	 @0xF0B4050C : 0x00000000
[    2.988222] dwc2 c90c0000.usb: HCTSIZ	 @0xF0B40510 : 0x00000000
[    2.988228] dwc2 c90c0000.usb: HCDMA	 @0xF0B40514 : 0x16FBE7CB
[    2.988231] dwc2 c90c0000.usb: Host Channel 1 Specific Registers
[    2.988235] dwc2 c90c0000.usb: HCCHAR	 @0xF0B40520 : 0x00000000
[    2.988238] dwc2 c90c0000.usb: HCSPLT	 @0xF0B40524 : 0x00000000
[    2.988241] dwc2 c90c0000.usb: HCINT	 @0xF0B40528 : 0x00000002
[    2.988244] dwc2 c90c0000.usb: HCINTMSK	 @0xF0B4052C : 0x00000000
[    2.988247] dwc2 c90c0000.usb: HCTSIZ	 @0xF0B40530 : 0x00000000
[    2.988251] dwc2 c90c0000.usb: HCDMA	 @0xF0B40534 : 0x10C8F9BE
[    2.988253] dwc2 c90c0000.usb: Host Channel 2 Specific Registers
[    2.988257] dwc2 c90c0000.usb: HCCHAR	 @0xF0B40540 : 0x00000000
[    2.988260] dwc2 c90c0000.usb: HCSPLT	 @0xF0B40544 : 0x00000000
[    2.988263] dwc2 c90c0000.usb: HCINT	 @0xF0B40548 : 0x00000002
[    2.988266] dwc2 c90c0000.usb: HCINTMSK	 @0xF0B4054C : 0x00000000
[    2.988269] dwc2 c90c0000.usb: HCTSIZ	 @0xF0B40550 : 0x00000000
[    2.988273] dwc2 c90c0000.usb: HCDMA	 @0xF0B40554 : 0x49FF9E02
[    2.988275] dwc2 c90c0000.usb: Host Channel 3 Specific Registers
[    2.988279] dwc2 c90c0000.usb: HCCHAR	 @0xF0B40560 : 0x00000000
[    2.988282] dwc2 c90c0000.usb: HCSPLT	 @0xF0B40564 : 0x00000000
[    2.988285] dwc2 c90c0000.usb: HCINT	 @0xF0B40568 : 0x00000002
[    2.988288] dwc2 c90c0000.usb: HCINTMSK	 @0xF0B4056C : 0x00000000
[    2.988291] dwc2 c90c0000.usb: HCTSIZ	 @0xF0B40570 : 0x00000000
[    2.988294] dwc2 c90c0000.usb: HCDMA	 @0xF0B40574 : 0xC511B2AC
[    2.988297] dwc2 c90c0000.usb: Host Channel 4 Specific Registers
[    2.988301] dwc2 c90c0000.usb: HCCHAR	 @0xF0B40580 : 0x00000000
[    2.988304] dwc2 c90c0000.usb: HCSPLT	 @0xF0B40584 : 0x00000000
[    2.988307] dwc2 c90c0000.usb: HCINT	 @0xF0B40588 : 0x00000002
[    2.988310] dwc2 c90c0000.usb: HCINTMSK	 @0xF0B4058C : 0x00000000
[    2.988313] dwc2 c90c0000.usb: HCTSIZ	 @0xF0B40590 : 0x00000000
[    2.988316] dwc2 c90c0000.usb: HCDMA	 @0xF0B40594 : 0x7EACDDFB
[    2.988319] dwc2 c90c0000.usb: Host Channel 5 Specific Registers
[    2.988322] dwc2 c90c0000.usb: HCCHAR	 @0xF0B405A0 : 0x00000000
[    2.988326] dwc2 c90c0000.usb: HCSPLT	 @0xF0B405A4 : 0x00000000
[    2.988329] dwc2 c90c0000.usb: HCINT	 @0xF0B405A8 : 0x00000002
[    2.988332] dwc2 c90c0000.usb: HCINTMSK	 @0xF0B405AC : 0x00000000
[    2.988335] dwc2 c90c0000.usb: HCTSIZ	 @0xF0B405B0 : 0x00000000
[    2.988338] dwc2 c90c0000.usb: HCDMA	 @0xF0B405B4 : 0x4215E910
[    2.988341] dwc2 c90c0000.usb: Host Channel 6 Specific Registers
[    2.988344] dwc2 c90c0000.usb: HCCHAR	 @0xF0B405C0 : 0x00000000
[    2.988347] dwc2 c90c0000.usb: HCSPLT	 @0xF0B405C4 : 0x00000000
[    2.988351] dwc2 c90c0000.usb: HCINT	 @0xF0B405C8 : 0x00000002
[    2.988354] dwc2 c90c0000.usb: HCINTMSK	 @0xF0B405CC : 0x00000000
[    2.988357] dwc2 c90c0000.usb: HCTSIZ	 @0xF0B405D0 : 0x00000000
[    2.988360] dwc2 c90c0000.usb: HCDMA	 @0xF0B405D4 : 0xBE3BFFDB
[    2.988363] dwc2 c90c0000.usb: Host Channel 7 Specific Registers
[    2.988366] dwc2 c90c0000.usb: HCCHAR	 @0xF0B405E0 : 0x00000000
[    2.988369] dwc2 c90c0000.usb: HCSPLT	 @0xF0B405E4 : 0x00000000
[    2.988373] dwc2 c90c0000.usb: HCINT	 @0xF0B405E8 : 0x00000002
[    2.988376] dwc2 c90c0000.usb: HCINTMSK	 @0xF0B405EC : 0x00000000
[    2.988379] dwc2 c90c0000.usb: HCTSIZ	 @0xF0B405F0 : 0x00000000
[    2.988382] dwc2 c90c0000.usb: HCDMA	 @0xF0B405F4 : 0xF3A7CB80
[    2.988385] dwc2 c90c0000.usb: Host Channel 8 Specific Registers
[    2.988388] dwc2 c90c0000.usb: HCCHAR	 @0xF0B40600 : 0x00000000
[    2.988391] dwc2 c90c0000.usb: HCSPLT	 @0xF0B40604 : 0x00000000
[    2.988395] dwc2 c90c0000.usb: HCINT	 @0xF0B40608 : 0x00000002
[    2.988398] dwc2 c90c0000.usb: HCINTMSK	 @0xF0B4060C : 0x00000000
[    2.988401] dwc2 c90c0000.usb: HCTSIZ	 @0xF0B40610 : 0x00000000
[    2.988407] dwc2 c90c0000.usb: HCDMA	 @0xF0B40614 : 0xFC2EF8E2
[    2.988410] dwc2 c90c0000.usb: Host Channel 9 Specific Registers
[    2.988413] dwc2 c90c0000.usb: HCCHAR	 @0xF0B40620 : 0x00000000
[    2.988416] dwc2 c90c0000.usb: HCSPLT	 @0xF0B40624 : 0x00000000
[    2.988420] dwc2 c90c0000.usb: HCINT	 @0xF0B40628 : 0x00000002
[    2.988423] dwc2 c90c0000.usb: HCINTMSK	 @0xF0B4062C : 0x00000000
[    2.988426] dwc2 c90c0000.usb: HCTSIZ	 @0xF0B40630 : 0x00000000
[    2.988430] dwc2 c90c0000.usb: HCDMA	 @0xF0B40634 : 0x986152E8
[    2.988435] dwc2 c90c0000.usb: Host Channel 10 Specific Registers
[    2.988450] dwc2 c90c0000.usb: HCCHAR	 @0xF0B40640 : 0x00000000
[    2.988453] dwc2 c90c0000.usb: HCSPLT	 @0xF0B40644 : 0x00000000
[    2.988457] dwc2 c90c0000.usb: HCINT	 @0xF0B40648 : 0x00000002
[    2.988460] dwc2 c90c0000.usb: HCINTMSK	 @0xF0B4064C : 0x00000000
[    2.988463] dwc2 c90c0000.usb: HCTSIZ	 @0xF0B40650 : 0x00000000
[    2.988466] dwc2 c90c0000.usb: HCDMA	 @0xF0B40654 : 0xEFD42FB6
[    2.988469] dwc2 c90c0000.usb: Host Channel 11 Specific Registers
[    2.988473] dwc2 c90c0000.usb: HCCHAR	 @0xF0B40660 : 0x00000000
[    2.988476] dwc2 c90c0000.usb: HCSPLT	 @0xF0B40664 : 0x00000000
[    2.988479] dwc2 c90c0000.usb: HCINT	 @0xF0B40668 : 0x00000002
[    2.988483] dwc2 c90c0000.usb: HCINTMSK	 @0xF0B4066C : 0x00000000
[    2.988486] dwc2 c90c0000.usb: HCTSIZ	 @0xF0B40670 : 0x00000000
[    2.988489] dwc2 c90c0000.usb: HCDMA	 @0xF0B40674 : 0x7058E003
[    2.988492] dwc2 c90c0000.usb: Host Channel 12 Specific Registers
[    2.988495] dwc2 c90c0000.usb: HCCHAR	 @0xF0B40680 : 0x00000000
[    2.988499] dwc2 c90c0000.usb: HCSPLT	 @0xF0B40684 : 0x00000000
[    2.988502] dwc2 c90c0000.usb: HCINT	 @0xF0B40688 : 0x00000002
[    2.988505] dwc2 c90c0000.usb: HCINTMSK	 @0xF0B4068C : 0x00000000
[    2.988509] dwc2 c90c0000.usb: HCTSIZ	 @0xF0B40690 : 0x00000000
[    2.988512] dwc2 c90c0000.usb: HCDMA	 @0xF0B40694 : 0xF9EFE3AC
[    2.988515] dwc2 c90c0000.usb: Host Channel 13 Specific Registers
[    2.988518] dwc2 c90c0000.usb: HCCHAR	 @0xF0B406A0 : 0x00000000
[    2.988521] dwc2 c90c0000.usb: HCSPLT	 @0xF0B406A4 : 0x00000000
[    2.988525] dwc2 c90c0000.usb: HCINT	 @0xF0B406A8 : 0x00000002
[    2.988528] dwc2 c90c0000.usb: HCINTMSK	 @0xF0B406AC : 0x00000000
[    2.988532] dwc2 c90c0000.usb: HCTSIZ	 @0xF0B406B0 : 0x00000000
[    2.988535] dwc2 c90c0000.usb: HCDMA	 @0xF0B406B4 : 0x1A3141CA
[    2.988538] dwc2 c90c0000.usb: Host Channel 14 Specific Registers
[    2.988541] dwc2 c90c0000.usb: HCCHAR	 @0xF0B406C0 : 0x00000000
[    2.988545] dwc2 c90c0000.usb: HCSPLT	 @0xF0B406C4 : 0x00000000
[    2.988548] dwc2 c90c0000.usb: HCINT	 @0xF0B406C8 : 0x00000002
[    2.988551] dwc2 c90c0000.usb: HCINTMSK	 @0xF0B406CC : 0x00000000
[    2.988554] dwc2 c90c0000.usb: HCTSIZ	 @0xF0B406D0 : 0x00000000
[    2.988558] dwc2 c90c0000.usb: HCDMA	 @0xF0B406D4 : 0x97ECDD4E
[    2.988561] dwc2 c90c0000.usb: Host Channel 15 Specific Registers
[    2.988564] dwc2 c90c0000.usb: HCCHAR	 @0xF0B406E0 : 0x00000000
[    2.988567] dwc2 c90c0000.usb: HCSPLT	 @0xF0B406E4 : 0x00000000
[    2.988570] dwc2 c90c0000.usb: HCINT	 @0xF0B406E8 : 0x00000002
[    2.988573] dwc2 c90c0000.usb: HCINTMSK	 @0xF0B406EC : 0x00000000
[    2.988577] dwc2 c90c0000.usb: HCTSIZ	 @0xF0B406F0 : 0x00000000
[    2.988580] dwc2 c90c0000.usb: HCDMA	 @0xF0B406F4 : 0xA4088BC6
[    2.988583] dwc2 c90c0000.usb: ************************************************************
[    2.988586] dwc2 c90c0000.usb: 
