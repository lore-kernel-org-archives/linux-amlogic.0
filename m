From: felipe.balbi@linux.intel.com (Felipe Balbi)
Date: Mon, 09 Jan 2017 12:37:04 +0200
Subject: dwc3: add support for hardware with multiple ports on USB2 hub
 enabled
In-Reply-To: <CAFBinCBFVp1qdymz9rqKB2Lq8-iBihJ_Xo5JN7zCTLg223wWSw@mail.gmail.com>
References: <CAFBinCBFVp1qdymz9rqKB2Lq8-iBihJ_Xo5JN7zCTLg223wWSw@mail.gmail.com>
Message-ID: <878tqkv7sf.fsf@linux.intel.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org


Hi,

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:
> while adding USB support on the Amlogic Meson GXL / GXM SoCs I have
> come across something I did not know yet:
> dwc3 has an internal USB2 hub (from what I can read in the code there
> seem to be multiple USB3 ports supported as well).

no, that's not true. It has a roothub when working as host. But that's
it. When working as peripheral, it's always single-port AFAIR.

> When searching the web I did not come across any SoC that uses a
> configuration with more than one port enabled.
>
> On my Amlogic Meson GXM device (consumer device, no development board)
> I see the following USB2 PHY register configuration (full register
> dump from the kernel that was shipped with the device is attached):
> GUSB2PHYCFG(0) = 0x40102500
> GUSB2PHYCFG(1) = 0x40102540
> GUSB2PHYCFG(2) = 0x40102540

multiple PHYs are only used by the host block (xHCI). Don't touch these
and just let xHCI core handle the ports.

> Then vendor kernel sources (a 3.14 kernel) are adding the resets for
> GUSB2PHYCFG([1-3]) in dwc3_core_soft_reset().

That shouldn't be necessary, actually. If it is, it means the HW was
poorly integrated. In that case, we _can_ add the other resets, but I
need confirmation that they are needed by means of a public errata
document.

> A mainline 4.9+(Meson GXL USB PHY patches + dwc3/xhci-plat DMA patches
> from linux-usb) kernel works fine even with just applying the reset to
> GUSB2PHYCFG(0).

there you go

> That brings up two questions:
> 1. I guess it makes sense to adjust the upstream dwc3 to add the
> resets for all available USB2 PHYs - is there a specific reason why
> the current dwc3 driver does not do that (or is it simply because why
> we find on Meson GXL/GXM is very exotic)?

yeah, they're not needed :-)

> 2. would we also implement this for the USB3 "pipes" as well (without
> being able to test this)?

nope

> 3. from what I can see in the code we have to adjust dwc3_phy_setup()
> and ulpi.c to add support for multiple ports, but how do we detect the
> number of USB2 and USB3 ports (is this somewhere encoded in the
> DWC3_GHWPARAMS registers)?

also nope. xHCI can detect how many ports a roothub has and work with
it. From peripheral point of view, dwc3 is always single-port.

-- 
balbi
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 832 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-amlogic/attachments/20170109/d0420a8a/attachment.sig>
