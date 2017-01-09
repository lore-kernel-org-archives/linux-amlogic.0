From: felipe.balbi@linux.intel.com (Felipe Balbi)
Date: Mon, 09 Jan 2017 14:16:11 +0200
Subject: dwc3: add support for hardware with multiple ports on USB2 hub
 enabled
In-Reply-To: <CAFBinCAgO5MmhGuk8yssGsxCHeXRcJxirDNcOjeNg5RaV_ZRwA@mail.gmail.com>
References: <CAFBinCBFVp1qdymz9rqKB2Lq8-iBihJ_Xo5JN7zCTLg223wWSw@mail.gmail.com>
 <878tqkv7sf.fsf@linux.intel.com>
 <CAFBinCBxHN5_STQ+fed2+8sLFgJYDKjShqWL+5u7qsihr-3GCw@mail.gmail.com>
 <87zij0trau.fsf@linux.intel.com>
 <CAFBinCCntJWgn2mNGaV2U64WhEcndJBUmYOjj2OjqHG7VQFZmA@mail.gmail.com>
 <87tw98tple.fsf@linux.intel.com>
 <CAFBinCAgO5MmhGuk8yssGsxCHeXRcJxirDNcOjeNg5RaV_ZRwA@mail.gmail.com>
Message-ID: <87o9zgtoms.fsf@linux.intel.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org


Hi,

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:
>>>>>>> When searching the web I did not come across any SoC that uses a
>>>>>>> configuration with more than one port enabled.
>>>>>>>
>>>>>>> On my Amlogic Meson GXM device (consumer device, no development board)
>>>>>>> I see the following USB2 PHY register configuration (full register
>>>>>>> dump from the kernel that was shipped with the device is attached):
>>>>>>> GUSB2PHYCFG(0) = 0x40102500
>>>>>>> GUSB2PHYCFG(1) = 0x40102540
>>>>>>> GUSB2PHYCFG(2) = 0x40102540
>>>>>>
>>>>>> multiple PHYs are only used by the host block (xHCI). Don't touch these
>>>>>> and just let xHCI core handle the ports.
>>>>> could you be more specific with "xHCI core" - do you mean the core in
>>>>> the dwc3 IP or drivers/usb/host/xhci-*?
>>>>> However, we still have a "problem" here: the USB PHYs for each
>>>>> "enabled" port have to be turned on (if I leave only one USB PHY
>>>>> disabled then none of the ports is working). unfortunately the current
>>>>> code (both, in dwc3 and drivers/usb/host/*) assumes that there's
>>>>> either 0 or 1 PHY for each HCD.
>>
>> true. But even so, that PHY handle is only needed for devices which
>> weren't properly configured at coreConsultant time.
> I don't understand that - there are two separate modules involved
> here: 1. the dwc3 IP block 2. Amlogic's own USB2 PHYs (they did not
> choose Synopsys DesignWare PHYs)
> (some background info: the USB2 PHYs are in "reset mode" by default)
> So even if the dwc3 IP block is configured correctly at coreConsultant
> time we still need to configure the PHYs. From "USB controller driver"
> (could be dwc3, or some generic hcd.c code, etc.) this means that
> phy_init() and phy_power_on() needs to be called for each of the three
> "Amlogic USB2 PHYs". the current code however only calls these for the
> first PHY (leaving the others in reset mode = disabled).

argh, good point. In that case, we need to figure out the best way to
pass all these handles to xHCI-plat

>>>>>>> Then vendor kernel sources (a 3.14 kernel) are adding the resets for
>>>>>>> GUSB2PHYCFG([1-3]) in dwc3_core_soft_reset().
>>>>>>
>>>>>> That shouldn't be necessary, actually. If it is, it means the HW was
>>>>>> poorly integrated. In that case, we _can_ add the other resets, but I
>>>>>> need confirmation that they are needed by means of a public errata
>>>>>> document.
>>>>>>
>>>>>>> A mainline 4.9+(Meson GXL USB PHY patches + dwc3/xhci-plat DMA patches
>>>>>>> from linux-usb) kernel works fine even with just applying the reset to
>>>>>>> GUSB2PHYCFG(0).
>>>>>>
>>>>>> there you go
>>>>> does that mean that the reset of GUSB2PHYCFG(0) (which is part of the
>>>>> current dwc3 code in dwc3_phy_setup) is done only because of the
>>>>> quirks/erratas? in other words: do you mean that one would not have to
>>>>> reset GUSB2PHYCFG(0) if there were no erratas?
>>>>
>>>> no, it's done for peripheral configuration of dwc3. Look at the code
>>>> more carefully:
>>> sorry for the confusion - the word "reset" should be "configuration".
>>> The function I am looking at is dwc3_phy_setup(): apart from toggling
>>> some "errata bits" it also configures the PHY modes. I am wondering if
>>> I need to do this setup (DWC3_GUSB2PHYCFG_ULPI_UTMI and
>>> DWC3_GUSB2PHYCFG_PHYIF_MASK related bits) not only for the *first*
>>> port ("DWC3_GUSB2PHYCFG(0)") but also for the "other" ports (index 1
>>> and 2 in above case, where the roothub has 3 ports)
>>
>> Ideally, that should've been set at coreConsultant (RTL instantiation)
>> time. If it wasn't, then we need to add a quirk for these SoCs
>> accordingly. We _do_ need documentation that this quirk is, indeed,
>> needed.
> That is an explanation I'm fine with: we trust the (default) values
> which are in hardware until we have documentation that we need a
> quirk. I do not have access to Amlogic's documentation so I can't
> provide that - but we can probably leave it as it is as it "worked for
> me".

awesome, so we need *only* phy_init() / phy_power_on() for the other
PHYs, right?

-- 
balbi
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 832 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-amlogic/attachments/20170109/7482a1b7/attachment.sig>
