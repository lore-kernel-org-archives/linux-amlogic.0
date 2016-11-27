From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sun, 27 Nov 2016 14:02:31 +0100
Subject: dwc3: add support for hardware with multiple ports on USB2 hub enabled
Message-ID: <CAFBinCBFVp1qdymz9rqKB2Lq8-iBihJ_Xo5JN7zCTLg223wWSw@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hello,

while adding USB support on the Amlogic Meson GXL / GXM SoCs I have
come across something I did not know yet:
dwc3 has an internal USB2 hub (from what I can read in the code there
seem to be multiple USB3 ports supported as well).
When searching the web I did not come across any SoC that uses a
configuration with more than one port enabled.

On my Amlogic Meson GXM device (consumer device, no development board)
I see the following USB2 PHY register configuration (full register
dump from the kernel that was shipped with the device is attached):
GUSB2PHYCFG(0) = 0x40102500
GUSB2PHYCFG(1) = 0x40102540
GUSB2PHYCFG(2) = 0x40102540

Then vendor kernel sources (a 3.14 kernel) are adding the resets for
GUSB2PHYCFG([1-3]) in dwc3_core_soft_reset().
A mainline 4.9+(Meson GXL USB PHY patches + dwc3/xhci-plat DMA patches
from linux-usb) kernel works fine even with just applying the reset to
GUSB2PHYCFG(0).

That brings up two questions:
1. I guess it makes sense to adjust the upstream dwc3 to add the
resets for all available USB2 PHYs - is there a specific reason why
the current dwc3 driver does not do that (or is it simply because why
we find on Meson GXL/GXM is very exotic)?
2. would we also implement this for the USB3 "pipes" as well (without
being able to test this)?
3. from what I can see in the code we have to adjust dwc3_phy_setup()
and ulpi.c to add support for multiple ports, but how do we detect the
number of USB2 and USB3 ports (is this somewhere encoded in the
DWC3_GHWPARAMS registers)?

lsusb output is also attached, based on the PHY drivers for which the
patches can be found here: [0]


Best Regards,
Martin


[0] http://lists.infradead.org/pipermail/linux-amlogic/2016-November/001721.html
-------------- next part --------------
A non-text attachment was scrubbed...
Name: sys_kernel_debug_dwc3_regdump_vendor_kernel
Type: application/octet-stream
Size: 8054 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-amlogic/attachments/20161127/9a64343e/attachment.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: lsusb-mainline-kernel
Type: application/octet-stream
Size: 4991 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-amlogic/attachments/20161127/9a64343e/attachment-0001.obj>
