From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Wed, 11 Jan 2017 16:35:51 +0100
Subject: dwc3: add support for hardware with multiple ports on USB2 hub
 enabled
In-Reply-To: <87inpotmbz.fsf@linux.intel.com>
References: <CAFBinCBFVp1qdymz9rqKB2Lq8-iBihJ_Xo5JN7zCTLg223wWSw@mail.gmail.com>
 <878tqkv7sf.fsf@linux.intel.com>
 <CAFBinCBxHN5_STQ+fed2+8sLFgJYDKjShqWL+5u7qsihr-3GCw@mail.gmail.com>
 <87zij0trau.fsf@linux.intel.com>
 <CAFBinCCntJWgn2mNGaV2U64WhEcndJBUmYOjj2OjqHG7VQFZmA@mail.gmail.com>
 <87tw98tple.fsf@linux.intel.com>
 <CAFBinCAgO5MmhGuk8yssGsxCHeXRcJxirDNcOjeNg5RaV_ZRwA@mail.gmail.com>
 <87o9zgtoms.fsf@linux.intel.com>
 <CAFBinCBVbQHxgDfkx5GH+qsDZULtyGLNLry8aatfFv6vqGs+Ag@mail.gmail.com>
 <87lguktnj8.fsf@linux.intel.com>
 <CAFBinCBnoJ-FRgRudiKN9FaN-mNZibBbacEZNA8wrZAi=vhoAA@mail.gmail.com>
 <87inpotmbz.fsf@linux.intel.com>
Message-ID: <CAFBinCAyt72ikyA79Lm9NMjOMoc-N+GaNmf-tNyhutayyHaadw@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Mon, Jan 9, 2017 at 2:05 PM, Felipe Balbi
<felipe.balbi@linux.intel.com> wrote:
>
> Hi,
>
> Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:
>> On Mon, Jan 9, 2017 at 1:39 PM, Felipe Balbi
>> <felipe.balbi@linux.intel.com> wrote:
>>>
>>> Hi,
>>>
>>> Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:
>>>
>>> [snip]
>>>
>>>>>>> true. But even so, that PHY handle is only needed for devices which
>>>>>>> weren't properly configured at coreConsultant time.
>>>>>> I don't understand that - there are two separate modules involved
>>>>>> here: 1. the dwc3 IP block 2. Amlogic's own USB2 PHYs (they did not
>>>>>> choose Synopsys DesignWare PHYs)
>>>>>> (some background info: the USB2 PHYs are in "reset mode" by default)
>>>>>> So even if the dwc3 IP block is configured correctly at coreConsultant
>>>>>> time we still need to configure the PHYs. From "USB controller driver"
>>>>>> (could be dwc3, or some generic hcd.c code, etc.) this means that
>>>>>> phy_init() and phy_power_on() needs to be called for each of the three
>>>>>> "Amlogic USB2 PHYs". the current code however only calls these for the
>>>>>> first PHY (leaving the others in reset mode = disabled).
>>>>>
>>>>> argh, good point. In that case, we need to figure out the best way to
>>>>> pass all these handles to xHCI-plat
>>>> OK, I assume that we want to let xHCI-plat manage the PHYs in the
>>>> future instead of doing this in dwc3 (dwc3 may have to pass these to
>>>> xHCI-plat, but it should not do the logic on it's own)?
>>>
>>> perhaps. Maybe that mode check for dwc3 to bail out if mode == Host
>>> should be done earlier.
>> I guess your idea is to let xHCI-plat handle all phy_* logic when in host-mode?
>
> right. I guess at the end of the day host-only dwc3 instances shouldn't
> need dwc3.ko at all. Only peripheral-only and dual-role implementations
> should rely on dwc3.ko.
interesting thought, I guess that makes sense!

> okay, in that case this is less important for you. We should really make
> sure we don't cause problems for a future dual-role support.
>
>> like you mentioned PHY[0] is used for dual-role mode. There is an
>> additional USB3 PHY which also does mode-detection (in otg mode).
>> when that USB3 PHY/mode-detection block detects that it has to switch
>> to device mode it re-configures USB2 PHY[0] accordingly.
>
> okay
>
>> however it doesn't stop here: after that it goes ahead and turns on an
>> additional dwc2 (yes, dwc2, not dwc3!) IP block which is limited to
>> "device" (peripheral) mode only.
>
> hehe, that's interesting :-)
>
>> So on Amlogic GXL and GXM SoCs host-mode is handled by dwc3 while
>> device-mode is handled by dwc2
>
> so you have host-only dwc3 (for all practical reasons, a standard xHCI)
> and a peripheral only dwc2. Good to know. I wonder why it was done this
> way. Maybe Amlogic didn't pay for dual-role dwc3 license?
I don't know any details how this decision was made but licensing
costs may have been the reason (it may also be the same reason why
they chose to enable multiple USB ports on just one dwc3 instance).
Please note that this is just pure speculation and no official
information (as I don't have that)!

>>>> that would result in a few functions (function names are just to
>>>> illustrate my idea):
>>>> - devm_get_all_phys_from_of_node()
>>>> - all_phys_init_and_power_on() (phy_init and phy_power_on always seem
>>>> to be used together)
>>>> - all_phys_power_off_and_exit() (phy_power_off and phy_exit always
>>>> seem to be used together)
>>>>
>>>> let me know what you think
>>>
>>> I like that, specially so if it's done generically and all HCD drivers
>>> just use the same piece of code.
>> great!
>> how should we proceed: should I come up with a first RFC so we can
>> then discuss issues/improvements based on that RFC patch?
>
> yeah, that's usually the way :-)
I sent a first draft to the linux-usb list with the subject "[RFC
PATCH 0/2] initialize (multiple) PHYs in xhci-plat" (which does not
show up in the usual web-archives yet)


Regards,
Martin
