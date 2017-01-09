From: felipe.balbi@linux.intel.com (Felipe Balbi)
Date: Mon, 09 Jan 2017 13:18:33 +0200
Subject: dwc3: add support for hardware with multiple ports on USB2 hub
 enabled
In-Reply-To: <CAFBinCBxHN5_STQ+fed2+8sLFgJYDKjShqWL+5u7qsihr-3GCw@mail.gmail.com>
References: <CAFBinCBFVp1qdymz9rqKB2Lq8-iBihJ_Xo5JN7zCTLg223wWSw@mail.gmail.com>
 <878tqkv7sf.fsf@linux.intel.com>
 <CAFBinCBxHN5_STQ+fed2+8sLFgJYDKjShqWL+5u7qsihr-3GCw@mail.gmail.com>
Message-ID: <87zij0trau.fsf@linux.intel.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org


Hi,

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:
>> Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:
>>> while adding USB support on the Amlogic Meson GXL / GXM SoCs I have
>>> come across something I did not know yet:
>>> dwc3 has an internal USB2 hub (from what I can read in the code there
>>> seem to be multiple USB3 ports supported as well).
>>
>> no, that's not true. It has a roothub when working as host. But that's
>> it. When working as peripheral, it's always single-port AFAIR.
> OK, I should have been more clear here: I am only talking about
> host-mode since DWC3_GHWPARAMS0 on the GXL/GXM SoCs has a value of
> 0x20208009 which translates to "DWC3_GHWPARAMS0_MODE_HOST".
>
> are you sure about the fact that it does not have an internal hub?
> What I see in both, the vendor kernel's and my own patched mainline
> kernel log is:
> [   19.130331 at 3] xhci-hcd xhci-hcd.0.auto: xHCI Host Controller
> [   19.130385 at 3] xhci-hcd xhci-hcd.0.auto: new USB bus registered,
> assigned bus number 1
> [   19.139666 at 3] xhci-hcd xhci-hcd.0.auto: irq 62, io mem 0xc9000000
> [   19.145295 at 3] hub 1-0:1.0: USB hub found

this is the roothub :-)

> [   19.148098 at 3] hub 1-0:1.0: 3 ports detected
> [   19.152396 at 3] xhci-hcd xhci-hcd.0.auto: xHCI Host Controller
> [   19.157813 at 3] xhci-hcd xhci-hcd.0.auto: new USB bus registered,
> assigned bus number 2
> [   19.166598 at 3] hub 2-0:1.0: USB hub found
> [   19.169452 at 3] hub 2-0:1.0: config failed, hub doesn't have any
> ports! (err -19)
> This is from a GXM SoC which also comes with 3x USB2 PHYs (these are
> not Synopsys DesignWare PHYs but custom ones from Amlogic).
> I see similar messages but with "2 ports detect" on a GXL SoC which
> comes with 2x USB2 PHYs.

The fact that is claims that it has "no ports" hints at quirk caused,
likely, by poor RTL edits. coreConsultant should make sure that
MAX_PORTS (in xHCI HCC_PARAMS* register set) was set to correct value,
but somehow that field is set to 0 in one of your Amlogic SoC.

>>> When searching the web I did not come across any SoC that uses a
>>> configuration with more than one port enabled.
>>>
>>> On my Amlogic Meson GXM device (consumer device, no development board)
>>> I see the following USB2 PHY register configuration (full register
>>> dump from the kernel that was shipped with the device is attached):
>>> GUSB2PHYCFG(0) = 0x40102500
>>> GUSB2PHYCFG(1) = 0x40102540
>>> GUSB2PHYCFG(2) = 0x40102540
>>
>> multiple PHYs are only used by the host block (xHCI). Don't touch these
>> and just let xHCI core handle the ports.
> could you be more specific with "xHCI core" - do you mean the core in
> the dwc3 IP or drivers/usb/host/xhci-*?
> However, we still have a "problem" here: the USB PHYs for each
> "enabled" port have to be turned on (if I leave only one USB PHY
> disabled then none of the ports is working). unfortunately the current
> code (both, in dwc3 and drivers/usb/host/*) assumes that there's
> either 0 or 1 PHY for each HCD.
>
>>> Then vendor kernel sources (a 3.14 kernel) are adding the resets for
>>> GUSB2PHYCFG([1-3]) in dwc3_core_soft_reset().
>>
>> That shouldn't be necessary, actually. If it is, it means the HW was
>> poorly integrated. In that case, we _can_ add the other resets, but I
>> need confirmation that they are needed by means of a public errata
>> document.
>>
>>> A mainline 4.9+(Meson GXL USB PHY patches + dwc3/xhci-plat DMA patches
>>> from linux-usb) kernel works fine even with just applying the reset to
>>> GUSB2PHYCFG(0).
>>
>> there you go
> does that mean that the reset of GUSB2PHYCFG(0) (which is part of the
> current dwc3 code in dwc3_phy_setup) is done only because of the
> quirks/erratas? in other words: do you mean that one would not have to
> reset GUSB2PHYCFG(0) if there were no erratas?

no, it's done for peripheral configuration of dwc3. Look at the code
more carefully:

> /**
>  * dwc3_core_soft_reset - Issues core soft reset and PHY reset
>  * @dwc: pointer to our context structure
>  */
> static int dwc3_core_soft_reset(struct dwc3 *dwc)
> {
> 	u32		reg;
> 	int		retries = 1000;
> 	int		ret;
>
> 	usb_phy_init(dwc->usb2_phy);
> 	usb_phy_init(dwc->usb3_phy);
> 	ret = phy_init(dwc->usb2_generic_phy);
> 	if (ret < 0)
> 		return ret;
>
> 	ret = phy_init(dwc->usb3_generic_phy);
> 	if (ret < 0) {
> 		phy_exit(dwc->usb2_generic_phy);
> 		return ret;
> 	}
>
> 	/*
> 	 * We're resetting only the device side because, if we're in host mode,
> 	 * XHCI driver will reset the host block. If dwc3 was configured for
> 	 * host-only mode, then we can return early.
> 	 */
> 	if (dwc->dr_mode == USB_DR_MODE_HOST)
> 		return 0;

see here ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

> 	reg = dwc3_readl(dwc->regs, DWC3_DCTL);
> 	reg |= DWC3_DCTL_CSFTRST;
> 	dwc3_writel(dwc->regs, DWC3_DCTL, reg);
>
> 	do {
> 		reg = dwc3_readl(dwc->regs, DWC3_DCTL);
> 		if (!(reg & DWC3_DCTL_CSFTRST))
> 			return 0;
>
> 		udelay(1);
> 	} while (--retries);
>
> 	return -ETIMEDOUT;
> }

-- 
balbi
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 832 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-amlogic/attachments/20170109/7cb4f0f1/attachment.sig>
