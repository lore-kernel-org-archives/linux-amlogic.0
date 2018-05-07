From: Minas.Harutyunyan@synopsys.com (Minas Harutyunyan)
Date: Mon, 7 May 2018 13:27:24 +0000
Subject: dwc2 (on Meson8b) doesn't detect "hot-plugged" USB devices
References: <CAFBinCBEWb_2d7ypgS2uC2EXq_XSw67=zyPPqdRFZWi32aWPmA@mail.gmail.com>
Message-ID: <410670D7E743164D87FA6160E7907A560113AFA2F2@am04wembxb.internal.synopsys.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Martin,

On 5/7/2018 12:28 AM, Martin Blumenstingl wrote:
> Hello,
> 
> I was a bit surprised to see that hot-plugging USB devices on Amlogic
> Meson8b (for example: Odroid-C1) is broken.
> to be fair: I *think* it worked before, but I cannot guarantee it nor
> can I say when it broke
> 
> all examples below are from an Odroid-C1 board with Amlogic Meson8b (S805) SoC.
> this connects a (fixed, soldered down) 4-port USB hub to the dwc2
> controller (which is in "host" mode)
> 
> during boot I see:
> [    1.651687] dwc2 c90c0000.usb: c90c0000.usb supply vusb_d not
> found, using dummy regulator
> [    1.654434] dwc2 c90c0000.usb: c90c0000.usb supply vusb_a not
> found, using dummy regulator
> [    1.732374] dwc2 c90c0000.usb: dwc2_check_params: Invalid parameter lpm=1
> [    1.733526] dwc2 c90c0000.usb: dwc2_check_params: Invalid parameter
> lpm_clock_gating=1
> [    1.741427] dwc2 c90c0000.usb: dwc2_check_params: Invalid parameter besl=1
> [    1.748305] dwc2 c90c0000.usb: dwc2_check_params: Invalid parameter
> hird_threshold_en=1
> [    1.756491] dwc2 c90c0000.usb: DWC OTG Controller
> [    1.760993] dwc2 c90c0000.usb: new USB bus registered, assigned bus number 1
> [    1.768046] dwc2 c90c0000.usb: irq 24, io mem 0xc90c0000
> [    1.773947] hub 1-0:1.0: USB hub found
> [    1.777063] hub 1-0:1.0: 1 port detected
> ...
> [    2.212432] usb 1-1: new high-speed USB device number 2 using dwc2
> [    2.464742] hub 1-1:1.0: USB hub found
> [    2.465118] hub 1-1:1.0: 4 ports detected
> 
> if a USB device is plugged into one of the four USB ports during boot
> then it is detected automatically.
> if I plug in devices later they are not detected automatically (I have
> to run "lsusb -v" due to some reason, then hot-plugged devices are
> being detected)
> un-plugging USB devices is recognized instantly (no "lsusb" trickery
> is required)
> 
> is this a known issue? how can I help debugging?
> any help is appreciated!
> 
> below is the output of all dwc2 debugfs files.
> 
> 
> Regards
> Martin
> 
> 
> [rootodroidc1 c90c0000.usb]# cat dr_mode
> host
> [rootodroidc1 c90c0000.usb]# cat fifo
> Non-periodic FIFOs:
> RXFIFO: Size 0
> NPTXFIFO: Size 0, Start 0x00000000
> 
> Periodic TXFIFOs:
> [rootodroidc1 c90c0000.usb]# cat hw_params
> op_mode                       : 5
> arch                          : 2
> dma_desc_enable               : 1
> enable_dynamic_fifo           : 1
> en_multiple_tx_fifo           : 0
> rx_fifo_size                  : 2048
> host_nperio_tx_fifo_size      : 2048
> dev_nperio_tx_fifo_size       : 0
> host_perio_tx_fifo_size       : 2048
> nperio_tx_q_depth             : 4
> host_perio_tx_q_depth         : 4
> dev_token_q_depth             : 8
> max_transfer_size             : 524287
> max_packet_count              : 1023
> host_channels                 : 16
> hs_phy_type                   : 1
> fs_phy_type                   : 0
> i2c_enable                    : 0
> num_dev_ep                    : 2
> num_dev_perio_in_ep           : 0
> total_fifo_size               : 1984
> power_optimized               : 1
> utmi_phy_data_width           : 1
> snpsid                        : 0x4f54310a
> dev_ep_dirs                   : 0x0
> [rootodroidc1 c90c0000.usb]# cat params
> otg_cap                       : 2
> dma_desc_enable               : 0
> dma_desc_fs_enable            : 0
> speed                         : 0
> enable_dynamic_fifo           : 1
> en_multiple_tx_fifo           : 0
> host_rx_fifo_size             : 512
> host_nperio_tx_fifo_size      : 500
> host_perio_tx_fifo_size       : 500
> max_transfer_size             : 524287
> max_packet_count              : 1023
> host_channels                 : 16
> phy_type                      : 1
> phy_utmi_width                : 16
> phy_ulpi_ddr                  : 0
> phy_ulpi_ext_vbus             : 0
> i2c_enable                    : 0
> ulpi_fs_ls                    : 0
> host_support_fs_ls_low_power  : 0
> host_ls_low_power_phy_clk     : 0
> ts_dline                      : 0
> reload_ctl                    : 1
> ahbcfg                        : 0xa
> uframe_sched                  : 0
> external_id_pin_ctl           : 0
> power_down                    : 1
> lpm                           : 0
> lpm_clock_gating              : 0
> besl                          : 0
> hird_threshold_en             : 0
> hird_threshold                : 4
> host_dma                      : 1
> g_dma                         : 0
> g_dma_desc                    : 0
> g_rx_fifo_size                : 0
> g_np_tx_fifo_size             : 0
> g_tx_fifo_size[0]             : 0
> g_tx_fifo_size[1]             : 0
> g_tx_fifo_size[2]             : 0
> g_tx_fifo_size[3]             : 0
> g_tx_fifo_size[4]             : 0
> g_tx_fifo_size[5]             : 0
> g_tx_fifo_size[6]             : 0
> g_tx_fifo_size[7]             : 0
> g_tx_fifo_size[8]             : 0
> g_tx_fifo_size[9]             : 0
> g_tx_fifo_size[10]            : 0
> g_tx_fifo_size[11]            : 0
> g_tx_fifo_size[12]            : 0
> g_tx_fifo_size[13]            : 0
> g_tx_fifo_size[14]            : 0
> g_tx_fifo_size[15]            : 0
> [rootodroidc1 c90c0000.usb]# cat state
> DCFG=0x00000000, DCTL=0x00000000, DSTS=0x00000000
> DIEPMSK=0x00000000, DOEPMASK=0x00000000
> GINTMSK=0xf0000000, GINTSTS=0x00000001
> DAINTMSK=0x00000000, DAINT=0x00000000
> GNPTXSTS=0x00000000, GRXSTSR=00000000
> 
> Endpoint status:
> [rootodroidc1 c90c0000.usb]# cat testmode
> no test
> [rootodroidc1 c90c0000.usb]# cat regdump
> <system hangs>
> 

Your core configured for SRP capable host only mode "op_mode: 5", but 
USBCFG programmed for "otg_cap = 2" which mean 
"DWC2_CAP_PARAM_NO_HNP_SRP_CAPABLE", i.e. no SRP.
1. Please try to set "p->otg_cap = DWC2_CAP_PARAM_SRP_ONLY_CAPABLE;"
2. Looks like your driver configured for DRD mode. Change it to "HOST 
only" mode.
2. Please send us verbose debug log when device not recognized and after 
lsusb when device recognized.
3. On "cat regdump <system hung>" please use fix by Stefan Wahren 
"[PATCH] usb: dwc2: debugfs: Don't touch RX FIFO during register dump".

Thanks,
Minas
