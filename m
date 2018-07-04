From: Arthur.Petrosyan@synopsys.com (Artur Petrosyan)
Date: Wed, 4 Jul 2018 13:41:58 +0000
Subject: dwc2 (on Meson8b) doesn't detect "hot-plugged" USB devices
References: <CAFBinCBEWb_2d7ypgS2uC2EXq_XSw67=zyPPqdRFZWi32aWPmA@mail.gmail.com>
 <410670D7E743164D87FA6160E7907A560113AFA2F2@am04wembxb.internal.synopsys.com>
 <CAFBinCCr-_H1ZJBn3pfmcEHBNVv8hiobttywP18VOUvS__WMeA@mail.gmail.com>
 <CAFBinCDVCdBDpZoLi=Kq5-f_oBVo3w=Jp5jQc1DuSPceXk5K+w@mail.gmail.com>
 <3AD91E696667BF4BA728303C178E8A6353125B2C@am04wembxb.internal.synopsys.com>
 <CAFBinCC2S9-NLV1WpF3JsEiHj=OEMyJhvn5ab==QBc9ESxWBLw@mail.gmail.com>
Message-ID: <3AD91E696667BF4BA728303C178E8A6353125B89@am04wembxb.internal.synopsys.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Martin,

On 7/4/2018 17:13, Martin Blumenstingl wrote:
> Hello Arthur, Hello Minas,
> 
> On Wed, Jul 4, 2018 at 1:43 PM Artur Petrosyan
> <Arthur.Petrosyan@synopsys.com> wrote:
>>
>> Hello Martin,
>>
>> On 7/4/2018 01:39, Martin Blumenstingl wrote:
>>> Hello Minas,
>>>
>>> On Thu, May 10, 2018 at 11:44 AM Martin Blumenstingl
>>> <martin.blumenstingl@googlemail.com> wrote:
>>>>
>>>> Hello Minas,
>>>>
>>>> On Mon, May 7, 2018 at 3:27 PM, Minas Harutyunyan
>>>> <Minas.Harutyunyan@synopsys.com> wrote:
>>>>> Hi Martin,
>>>>>
>>>>> On 5/7/2018 12:28 AM, Martin Blumenstingl wrote:
>>>>>> Hello,
>>>>>>
>>>>>> I was a bit surprised to see that hot-plugging USB devices on Amlogic
>>>>>> Meson8b (for example: Odroid-C1) is broken.
>>>>>> to be fair: I *think* it worked before, but I cannot guarantee it nor
>>>>>> can I say when it broke
>>>>>>
>>>>>> all examples below are from an Odroid-C1 board with Amlogic Meson8b (S805) SoC.
>>>>>> this connects a (fixed, soldered down) 4-port USB hub to the dwc2
>>>>>> controller (which is in "host" mode)
>>>>>>
>>>>>> during boot I see:
>>>>>> [    1.651687] dwc2 c90c0000.usb: c90c0000.usb supply vusb_d not
>>>>>> found, using dummy regulator
>>>>>> [    1.654434] dwc2 c90c0000.usb: c90c0000.usb supply vusb_a not
>>>>>> found, using dummy regulator
>>>>>> [    1.732374] dwc2 c90c0000.usb: dwc2_check_params: Invalid parameter lpm=1
>>>>>> [    1.733526] dwc2 c90c0000.usb: dwc2_check_params: Invalid parameter
>>>>>> lpm_clock_gating=1
>>>>>> [    1.741427] dwc2 c90c0000.usb: dwc2_check_params: Invalid parameter besl=1
>>>>>> [    1.748305] dwc2 c90c0000.usb: dwc2_check_params: Invalid parameter
>>>>>> hird_threshold_en=1
>>>>>> [    1.756491] dwc2 c90c0000.usb: DWC OTG Controller
>>>>>> [    1.760993] dwc2 c90c0000.usb: new USB bus registered, assigned bus number 1
>>>>>> [    1.768046] dwc2 c90c0000.usb: irq 24, io mem 0xc90c0000
>>>>>> [    1.773947] hub 1-0:1.0: USB hub found
>>>>>> [    1.777063] hub 1-0:1.0: 1 port detected
>>>>>> ...
>>>>>> [    2.212432] usb 1-1: new high-speed USB device number 2 using dwc2
>>>>>> [    2.464742] hub 1-1:1.0: USB hub found
>>>>>> [    2.465118] hub 1-1:1.0: 4 ports detected
>>>>>>
>>>>>> if a USB device is plugged into one of the four USB ports during boot
>>>>>> then it is detected automatically.
>>>>>> if I plug in devices later they are not detected automatically (I have
>>>>>> to run "lsusb -v" due to some reason, then hot-plugged devices are
>>>>>> being detected)
>>>>>> un-plugging USB devices is recognized instantly (no "lsusb" trickery
>>>>>> is required)
>>>>>>
>>>>>> is this a known issue? how can I help debugging?
>>>>>> any help is appreciated!
>>>>>>
>>>>>> below is the output of all dwc2 debugfs files.
>>>>>>
>>>>>>
>>>>>> Regards
>>>>>> Martin
>>>>>>
>>>>>>
>>>>>> [rootodroidc1 c90c0000.usb]# cat dr_mode
>>>>>> host
>>>>>> [rootodroidc1 c90c0000.usb]# cat fifo
>>>>>> Non-periodic FIFOs:
>>>>>> RXFIFO: Size 0
>>>>>> NPTXFIFO: Size 0, Start 0x00000000
>>>>>>
>>>>>> Periodic TXFIFOs:
>>>>>> [rootodroidc1 c90c0000.usb]# cat hw_params
>>>>>> op_mode                       : 5
>>>>>> arch                          : 2
>>>>>> dma_desc_enable               : 1
>>>>>> enable_dynamic_fifo           : 1
>>>>>> en_multiple_tx_fifo           : 0
>>>>>> rx_fifo_size                  : 2048
>>>>>> host_nperio_tx_fifo_size      : 2048
>>>>>> dev_nperio_tx_fifo_size       : 0
>>>>>> host_perio_tx_fifo_size       : 2048
>>>>>> nperio_tx_q_depth             : 4
>>>>>> host_perio_tx_q_depth         : 4
>>>>>> dev_token_q_depth             : 8
>>>>>> max_transfer_size             : 524287
>>>>>> max_packet_count              : 1023
>>>>>> host_channels                 : 16
>>>>>> hs_phy_type                   : 1
>>>>>> fs_phy_type                   : 0
>>>>>> i2c_enable                    : 0
>>>>>> num_dev_ep                    : 2
>>>>>> num_dev_perio_in_ep           : 0
>>>>>> total_fifo_size               : 1984
>>>>>> power_optimized               : 1
>>>>>> utmi_phy_data_width           : 1
>>>>>> snpsid                        : 0x4f54310a
>>>>>> dev_ep_dirs                   : 0x0
>>>>>> [rootodroidc1 c90c0000.usb]# cat params
>>>>>> otg_cap                       : 2
>>>>>> dma_desc_enable               : 0
>>>>>> dma_desc_fs_enable            : 0
>>>>>> speed                         : 0
>>>>>> enable_dynamic_fifo           : 1
>>>>>> en_multiple_tx_fifo           : 0
>>>>>> host_rx_fifo_size             : 512
>>>>>> host_nperio_tx_fifo_size      : 500
>>>>>> host_perio_tx_fifo_size       : 500
>>>>>> max_transfer_size             : 524287
>>>>>> max_packet_count              : 1023
>>>>>> host_channels                 : 16
>>>>>> phy_type                      : 1
>>>>>> phy_utmi_width                : 16
>>>>>> phy_ulpi_ddr                  : 0
>>>>>> phy_ulpi_ext_vbus             : 0
>>>>>> i2c_enable                    : 0
>>>>>> ulpi_fs_ls                    : 0
>>>>>> host_support_fs_ls_low_power  : 0
>>>>>> host_ls_low_power_phy_clk     : 0
>>>>>> ts_dline                      : 0
>>>>>> reload_ctl                    : 1
>>>>>> ahbcfg                        : 0xa
>>>>>> uframe_sched                  : 0
>>>>>> external_id_pin_ctl           : 0
>>>>>> power_down                    : 1
>>>>>> lpm                           : 0
>>>>>> lpm_clock_gating              : 0
>>>>>> besl                          : 0
>>>>>> hird_threshold_en             : 0
>>>>>> hird_threshold                : 4
>>>>>> host_dma                      : 1
>>>>>> g_dma                         : 0
>>>>>> g_dma_desc                    : 0
>>>>>> g_rx_fifo_size                : 0
>>>>>> g_np_tx_fifo_size             : 0
>>>>>> g_tx_fifo_size[0]             : 0
>>>>>> g_tx_fifo_size[1]             : 0
>>>>>> g_tx_fifo_size[2]             : 0
>>>>>> g_tx_fifo_size[3]             : 0
>>>>>> g_tx_fifo_size[4]             : 0
>>>>>> g_tx_fifo_size[5]             : 0
>>>>>> g_tx_fifo_size[6]             : 0
>>>>>> g_tx_fifo_size[7]             : 0
>>>>>> g_tx_fifo_size[8]             : 0
>>>>>> g_tx_fifo_size[9]             : 0
>>>>>> g_tx_fifo_size[10]            : 0
>>>>>> g_tx_fifo_size[11]            : 0
>>>>>> g_tx_fifo_size[12]            : 0
>>>>>> g_tx_fifo_size[13]            : 0
>>>>>> g_tx_fifo_size[14]            : 0
>>>>>> g_tx_fifo_size[15]            : 0
>>>>>> [rootodroidc1 c90c0000.usb]# cat state
>>>>>> DCFG=0x00000000, DCTL=0x00000000, DSTS=0x00000000
>>>>>> DIEPMSK=0x00000000, DOEPMASK=0x00000000
>>>>>> GINTMSK=0xf0000000, GINTSTS=0x00000001
>>>>>> DAINTMSK=0x00000000, DAINT=0x00000000
>>>>>> GNPTXSTS=0x00000000, GRXSTSR=00000000
>>>>>>
>>>>>> Endpoint status:
>>>>>> [rootodroidc1 c90c0000.usb]# cat testmode
>>>>>> no test
>>>>>> [rootodroidc1 c90c0000.usb]# cat regdump
>>>>>> <system hangs>
>>>>>>
>>>>>
>>>>> Your core configured for SRP capable host only mode "op_mode: 5", but
>>>>> USBCFG programmed for "otg_cap = 2" which mean
>>>>> "DWC2_CAP_PARAM_NO_HNP_SRP_CAPABLE", i.e. no SRP.
>>>>> 1. Please try to set "p->otg_cap = DWC2_CAP_PARAM_SRP_ONLY_CAPABLE;"
>>>> this results in the (soldered down) USB hub not even being detected anymore
>>>> # dmesg | grep c90c0000
>>>> [    1.771610] dwc2 c90c0000.usb: c90c0000.usb supply vusb_d not
>>>> found, using dummy regulator
>>>> [    1.779262] dwc2 c90c0000.usb: c90c0000.usb supply vusb_a not
>>>> found, using dummy regulator
>>>> [    1.852346] dwc2 c90c0000.usb: dwc2_check_params: Invalid parameter lpm=1
>>>> [    1.853496] dwc2 c90c0000.usb: dwc2_check_params: Invalid parameter
>>>> lpm_clock_gating=1
>>>> [    1.861397] dwc2 c90c0000.usb: dwc2_check_params: Invalid parameter besl=1
>>>> [    1.868274] dwc2 c90c0000.usb: dwc2_check_params: Invalid parameter
>>>> hird_threshold_en=1
>>>> [    1.876357] dwc2 c90c0000.usb: DWC OTG Controller
>>>> [    1.880954] dwc2 c90c0000.usb: new USB bus registered, assigned bus number 2
>>>> [    1.888010] dwc2 c90c0000.usb: irq 25, io mem 0xc90c0000
>>>> [    2.002455] dwc2 c90c0000.usb: Overcurrent change detected
>>>> [    2.132721] dwc2 c90c0000.usb: Overcurrent change detected
>>>> [    2.252442] dwc2 c90c0000.usb: Overcurrent change detected
>>>> <lsusb -v here>
>>>> [   47.682374] dwc2 c90c0000.usb: Overcurrent change detected
>>>>
>>>> (this is with "host only" mode being configured and DRD mode being
>>>> disabled in the driver)
>>>>
>>>>> 2. Looks like your driver configured for DRD mode. Change it to "HOST
>>>>> only" mode.
>>>> Amlogic Meson8, Meson8b, Meson8m2 and GXBB SoCs come with two dwc2 controllers:
>>>> - a host-only one (which is the one I'm seeing problems with)
>>>> - an "OTG capable" one (where the dwc2's OTG detection IRQ/detection
>>>> *may* not be routed dwc2)
>>>>
>>>> this is why my driver was configured for DRD mode
>>>> but let's focus on the host-only core for now
>>>>
>>>> the only documentation about the USB implementation in these SoCs is
>>>> in the public S805 (Meson8b) and S905 (GXBB) datasheets.
>>>> the following sections are from these datasheets (both use an
>>>> indentical description):
>>>>
>>>> The OTG controller features:
>>>> * Support for the following speeds: High-Speed (HS,
>>>> 480-Mbps),Full-Speed (FS, 12-Mbps) and Low-Speed (LS, 1.5-Mbps) modes
>>>> * Multiple DMA/non DMA mode access support on the application side
>>>> * Supports up to 16 bidirectional endpoints, including control endpoint 0.
>>>> * Supports Session Request Protocol (SRP) and Host Negotiation Protocol (HNP)
>>>> * Supports up to 16 host channels.
>>>>
>>>> The Host controller features:
>>>> * Support for the following speeds: High-Speed (HS,
>>>> 480-Mbps),Full-Speed (FS, 12-Mbps) and Low-Speed (LS, 1.5-Mbps) modes
>>>> * Multiple DMA/non DMA mode access support on the application side
>>>> * Supports up to 16 host  channels.
>>>>
>>>>> 2. Please send us verbose debug log when device not recognized and after
>>>>> lsusb when device recognized.
>>>> do you want to see the dev_dbg() and dwc2_sch_dbg() output from the
>>>> dwc2 driver or is there some other way?
>>> gentle ping, did you have time to look into my questions so I can give
>>> you everything you need?
>>
>> Sorry for the late reply. We need verbose debug logs with dev_dbg().
>> So could you please provide verbose debug loges as Minas requested
>> earlier (dwc2_sch_dbg() not required).
> OK, I have:
> CONFIG_USB_DWC2=y
> CONFIG_USB_DWC2_HOST=y
> # CONFIG_USB_DWC2_PERIPHERAL is not set
> # CONFIG_USB_DWC2_DUAL_ROLE is not set
> # CONFIG_USB_DWC2_PCI is not set
> CONFIG_USB_DWC2_DEBUG=y
> # CONFIG_USB_DWC2_VERBOSE is not set

Could you please enable the verbose debug and send the log as requested?

> # CONFIG_USB_DWC2_TRACK_MISSED_SOFS is not set
> CONFIG_USB_DWC2_DEBUG_PERIODIC=y
> 
> I attached the kernel log with that during boot - nothing is connected
> via USB at this point
> 
> then I insert a USB thumb drive (into the dwc2 controller at
> 0xc90c0000), this leads to the following two kernel messages (but
> nothing else):
> [  126.447388] dwc2 c90c0000.usb: gintsts=40000001  gintmsk=f0000000
> [  126.447495] dwc2 c90c0000.usb: Session request interrupt - lx_state=2
> 
> then I run "lsusb -vv" again:
> [  137.727674] dwc2 c90c0000.usb: dwc2_restore_global_registers
> [  137.727712] dwc2 c90c0000.usb: dwc2_restore_host_registers
> [  137.813122] dwc2 c90c0000.usb: gintsts=05000021  gintmsk=f3000006
> [  137.954518] dwc2 c90c0000.usb: ClearPortFeature USB_PORT_FEAT_C_CONNECTION
> [  138.049661] dwc2 c90c0000.usb: SetPortFeature
> [  138.049743] dwc2 c90c0000.usb: SetPortFeature - USB_PORT_FEAT_RESET
> [  138.049826] dwc2 c90c0000.usb: In host mode, hprt0=00021501
> [  138.232522] dwc2 c90c0000.usb: gintsts=05000021  gintmsk=f3000006
> [  138.302713] dwc2 c90c0000.usb: ClearPortFeature USB_PORT_FEAT_C_RESET
> [  138.367202] usb 2-1: new high-speed USB device number 2 using dwc2
> [  138.368646] dwc2 c90c0000.usb: SetPortFeature
> [  138.368722] dwc2 c90c0000.usb: SetPortFeature - USB_PORT_FEAT_RESET
> [  138.368802] dwc2 c90c0000.usb: In host mode, hprt0=00001101
> [  138.368911] dwc2 c90c0000.usb: gintsts=05000029  gintmsk=f3000006
> [  138.449418] dwc2 c90c0000.usb: gintsts=05000029  gintmsk=f3000006
> [  138.574912] dwc2 c90c0000.usb: DWC OTG HCD HUB STATUS DATA: Root
> port status changed
> [  138.575035] dwc2 c90c0000.usb:   port_connect_status_change: 0
> [  138.575133] dwc2 c90c0000.usb:   port_reset_change: 1
> [  138.575220] dwc2 c90c0000.usb:   port_enable_change: 1
> [  138.575304] dwc2 c90c0000.usb:   port_suspend_change: 0
> [  138.575387] dwc2 c90c0000.usb:   port_over_current_change: 0
> [  138.576373] dwc2 c90c0000.usb: ClearPortFeature USB_PORT_FEAT_C_RESET
> [  138.708422] dwc2 c90c0000.usb: DWC OTG HCD EP DISABLE:
> bEndpointAddress=0x00, ep->hcpriv=19c630e7
> [  138.708546] dwc2 c90c0000.usb: DWC OTG HCD EP DISABLE:
> bEndpointAddress=0x00, ep->hcpriv=  (null)
> [  138.708631] dwc2 c90c0000.usb: DWC OTG HCD EP RESET: bEndpointAddress=0x00
> [  138.932380] dwc2 c90c0000.usb: DWC OTG HCD HUB STATUS DATA: Root
> port status changed
> [  138.932516] dwc2 c90c0000.usb:   port_connect_status_change: 0
> [  138.932613] dwc2 c90c0000.usb:   port_reset_change: 0
> [  138.932698] dwc2 c90c0000.usb:   port_enable_change: 1
> [  138.932779] dwc2 c90c0000.usb:   port_suspend_change: 0
> [  138.932861] dwc2 c90c0000.usb:   port_over_current_change: 0
> [  138.939026] dwc2 c90c0000.usb: DWC OTG HCD EP RESET: bEndpointAddress=0x01
> [  138.939119] dwc2 c90c0000.usb: DWC OTG HCD EP RESET: bEndpointAddress=0x82
> [  138.941187] usb-storage 2-1:1.0: USB Mass Storage device detected
> [  138.947734] scsi host0: usb-storage 2-1:1.0
> [  138.972573] dwc2 c90c0000.usb: ClearPortFeature USB_PORT_FEAT_C_ENABLE
> [  139.073802] dwc2 c90c0000.usb: GetHubDescriptor
> [  139.075716] dwc2 c9040000.usb: dwc2_restore_global_registers
> [  139.075734] dwc2 c9040000.usb: dwc2_restore_host_registers
> [  139.108821] dwc2 c9040000.usb: GetHubDescriptor
> [  139.109795] dwc2 c9040000.usb: dwc2_backup_global_registers
> [  139.109811] dwc2 c9040000.usb: dwc2_backup_host_registers
> [  140.312088] dwc2 c90c0000.usb: --Host Channel 13 Interrupt: STALL Received--
> [  140.315501] scsi 0:0:0:0: Direct-Access     USB      USB 2.0 Flash
>    8.07 PQ: 0 ANSI: 2
> [  140.326869] sd 0:0:0:0: [sda] 2015744 512-byte logical blocks:
> (1.03 GB/984 MiB)
> [  140.338180] sd 0:0:0:0: [sda] Write Protect is off
> [  140.340707] sd 0:0:0:0: [sda] Mode Sense: 03 00 00 00
> [  140.342797] sd 0:0:0:0: [sda] No Caching mode page found
> [  140.345904] sd 0:0:0:0: [sda] Assuming drive cache: write through
> [  140.406312]  sda: sda1
> [  140.410447] sd 0:0:0:0: [sda] Attached SCSI removable disk
> 
> 
>> Also, the partial power down feature is under testing now.
>> The debug logs would greatly help us in debugging.
> let me know if you need more information, help testing a patch, ... :)
> 
> 
> Regards
> Martin
> 

Regards,
Artur
