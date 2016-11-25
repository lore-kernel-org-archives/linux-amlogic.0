From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Fri, 25 Nov 2016 19:49:40 +0100
Subject: Amlogic Meson GXL/GXM USB support (dwc2 and dwc3)
In-Reply-To: <CAFBinCDRErG+9kD=ObTzDGHTKS6JGmSVCna-0nDs7ZEX3p_JkA@mail.gmail.com>
References: <CAFBinCDRErG+9kD=ObTzDGHTKS6JGmSVCna-0nDs7ZEX3p_JkA@mail.gmail.com>
Message-ID: <CAFBinCB3EsUnhMUeDP-_s96n7fcivp8OeYOwJGJp7JXSWeTzkQ@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Thu, Nov 24, 2016 at 6:42 PM, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
> Hello,
>
> currently I am trying to get the USB controllers on the Amlogic Meson
> GXL SoCs working: there is one dwc2 and dwc3 controller each.
>
> The SoC itself provides 3x USB2 PHYs and 1x USB3 PHY.
> I wrote drivers for both of them based on the vendor kernel, see [0]
> The PHY registers of the USB2 PHYs seem to be identical, regardless of
> whether they are connected to dwc2 or dwc3.
> The USB3 PHY also takes care of the OTG interrupts (to switch between
> host and device) and seems to inform the USB2 PHY about mode-changes.
> USB3 seems to be disabled in the dwc3 configuration, meaning it
> provides only high-speed support.
>
> The dwc3 core fails to initialize currently due to some DMA issues
> which will be fixed in Linux v4.10 - the corresponding patchset can be
> found here: [1]
> With these patches applied we get the dwc3 controller to initialize:
> xhci-hcd xhci-hcd.0.auto: xHCI Host Controller
> xhci-hcd xhci-hcd.0.auto: new USB bus registered, assigned bus number 1
> xhci-hcd xhci-hcd.0.auto: hcc params 0x0228f664 hci version 0x100
> quirks 0x00010010
> xhci-hcd xhci-hcd.0.auto: irq 20, io mem 0xc9000000
> hub 1-0:1.0: USB hub found
> hub 1-0:1.0: 3 ports detected
> xhci-hcd xhci-hcd.0.auto: xHCI Host Controller
> xhci-hcd xhci-hcd.0.auto: new USB bus registered, assigned bus number 2
> usb usb2: We don't know the algorithms for LPM for this host, disabling LPM.
> hub 2-0:1.0: USB hub found
> hub 2-0:1.0: config failed, hub doesn't have any ports! (err -19)
> (the last message seems fine, there are probably no USB3 ports enabled
> in the dwc3 hardware configuration)
>
> strange fact #1: there are 3 USB2 PHYs enabled in the dwc3 core
> (regdump from the vendor kernel - a full version is attached):
> GUSB2PHYCFG(0) = 0x40102500
> GUSB2PHYCFG(1) = 0x40102540
> GUSB2PHYCFG(2) = 0x40102540
> (this explains the "hub 1-0:1.0: 3 ports detected" message on my GXM
> board - other SoCs seem to have a different number of ports available
> based on the vendor sources, GXL seem to have 2 ports, while "TXL"
> seems to have 4 ports).
>
> I tried enabling all available PHYs in the SoC and giving
> GUSB2PHYCFG(1 and 2) the same tickle that is currently done in
> dwc3_phy_setup() for GUSB2PHYCFG(0).
> The LED on my thumb drive flashes when I plug it into the dwc3 port,
> but I don't get any interrupts and the kernel does not recognize any
> new USB device.
it turns out that this was a PHY problem.
due to whatever reason it seems that we have to enable all 3 USB2 PHYs
in the SoC to make *any* of these work!
After lots of headache and refactoring I have my USB2 PHY driver now
in a working state (in case someone is interested in this early code:
[0]).

> For the dwc2 controller I am probably missing a clock somewhere,
> because it's reporting:
> dwc2 c9100000.usb: Configuration mismatch. dr_mode forced to device
> dwc2 c9100000.usb: dwc2_core_reset() HANG! Soft Reset GRSTCTL=80000001
> dwc2 c9100000.usb: Specified GNPTXFDEP=1024 > 768
> dwc2 c9100000.usb: EPs: 7, dedicated fifos, 712 entries in SPRAM
> I must admit that I have been focusing on the dwc3 controller so far,
> so I don't have any more information here.
I do not have any (new) findings here as I was busy with the dwc3 PHY
driver again.


[0] https://github.com/xdarklight/linux/commits/meson-gx-integration-4.10-20161125
