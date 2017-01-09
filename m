From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Mon, 9 Jan 2017 12:05:34 +0100
Subject: dwc3: add support for hardware with multiple ports on USB2 hub
 enabled
In-Reply-To: <878tqkv7sf.fsf@linux.intel.com>
References: <CAFBinCBFVp1qdymz9rqKB2Lq8-iBihJ_Xo5JN7zCTLg223wWSw@mail.gmail.com>
 <878tqkv7sf.fsf@linux.intel.com>
Message-ID: <CAFBinCBxHN5_STQ+fed2+8sLFgJYDKjShqWL+5u7qsihr-3GCw@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Felipe,

On Mon, Jan 9, 2017 at 11:37 AM, Felipe Balbi
<felipe.balbi@linux.intel.com> wrote:
>
> Hi,
>
> Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:
>> while adding USB support on the Amlogic Meson GXL / GXM SoCs I have
>> come across something I did not know yet:
>> dwc3 has an internal USB2 hub (from what I can read in the code there
>> seem to be multiple USB3 ports supported as well).
>
> no, that's not true. It has a roothub when working as host. But that's
> it. When working as peripheral, it's always single-port AFAIR.
OK, I should have been more clear here: I am only talking about
host-mode since DWC3_GHWPARAMS0 on the GXL/GXM SoCs has a value of
0x20208009 which translates to "DWC3_GHWPARAMS0_MODE_HOST".

are you sure about the fact that it does not have an internal hub?
What I see in both, the vendor kernel's and my own patched mainline
kernel log is:
[   19.130331 at 3] xhci-hcd xhci-hcd.0.auto: xHCI Host Controller
[   19.130385 at 3] xhci-hcd xhci-hcd.0.auto: new USB bus registered,
assigned bus number 1
[   19.139666 at 3] xhci-hcd xhci-hcd.0.auto: irq 62, io mem 0xc9000000
[   19.145295 at 3] hub 1-0:1.0: USB hub found
[   19.148098 at 3] hub 1-0:1.0: 3 ports detected
[   19.152396 at 3] xhci-hcd xhci-hcd.0.auto: xHCI Host Controller
[   19.157813 at 3] xhci-hcd xhci-hcd.0.auto: new USB bus registered,
assigned bus number 2
[   19.166598 at 3] hub 2-0:1.0: USB hub found
[   19.169452 at 3] hub 2-0:1.0: config failed, hub doesn't have any
ports! (err -19)
This is from a GXM SoC which also comes with 3x USB2 PHYs (these are
not Synopsys DesignWare PHYs but custom ones from Amlogic).
I see similar messages but with "2 ports detect" on a GXL SoC which
comes with 2x USB2 PHYs.

>> When searching the web I did not come across any SoC that uses a
>> configuration with more than one port enabled.
>>
>> On my Amlogic Meson GXM device (consumer device, no development board)
>> I see the following USB2 PHY register configuration (full register
>> dump from the kernel that was shipped with the device is attached):
>> GUSB2PHYCFG(0) = 0x40102500
>> GUSB2PHYCFG(1) = 0x40102540
>> GUSB2PHYCFG(2) = 0x40102540
>
> multiple PHYs are only used by the host block (xHCI). Don't touch these
> and just let xHCI core handle the ports.
could you be more specific with "xHCI core" - do you mean the core in
the dwc3 IP or drivers/usb/host/xhci-*?
However, we still have a "problem" here: the USB PHYs for each
"enabled" port have to be turned on (if I leave only one USB PHY
disabled then none of the ports is working). unfortunately the current
code (both, in dwc3 and drivers/usb/host/*) assumes that there's
either 0 or 1 PHY for each HCD.

>> Then vendor kernel sources (a 3.14 kernel) are adding the resets for
>> GUSB2PHYCFG([1-3]) in dwc3_core_soft_reset().
>
> That shouldn't be necessary, actually. If it is, it means the HW was
> poorly integrated. In that case, we _can_ add the other resets, but I
> need confirmation that they are needed by means of a public errata
> document.
>
>> A mainline 4.9+(Meson GXL USB PHY patches + dwc3/xhci-plat DMA patches
>> from linux-usb) kernel works fine even with just applying the reset to
>> GUSB2PHYCFG(0).
>
> there you go
does that mean that the reset of GUSB2PHYCFG(0) (which is part of the
current dwc3 code in dwc3_phy_setup) is done only because of the
quirks/erratas? in other words: do you mean that one would not have to
reset GUSB2PHYCFG(0) if there were no erratas?

>> That brings up two questions:
>> 1. I guess it makes sense to adjust the upstream dwc3 to add the
>> resets for all available USB2 PHYs - is there a specific reason why
>> the current dwc3 driver does not do that (or is it simply because why
>> we find on Meson GXL/GXM is very exotic)?
>
> yeah, they're not needed :-)
>
>> 2. would we also implement this for the USB3 "pipes" as well (without
>> being able to test this)?
>
> nope
these two are probably covered with the question before

>> 3. from what I can see in the code we have to adjust dwc3_phy_setup()
>> and ulpi.c to add support for multiple ports, but how do we detect the
>> number of USB2 and USB3 ports (is this somewhere encoded in the
>> DWC3_GHWPARAMS registers)?
>
> also nope. xHCI can detect how many ports a roothub has and work with
> it. From peripheral point of view, dwc3 is always single-port.
let's postpone this until we have discussed the more important questions


Regards,
Martin
