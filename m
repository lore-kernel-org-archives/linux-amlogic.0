From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Mon, 9 Jan 2017 13:55:46 +0100
Subject: dwc3: add support for hardware with multiple ports on USB2 hub
 enabled
In-Reply-To: <87lguktnj8.fsf@linux.intel.com>
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
Message-ID: <CAFBinCBnoJ-FRgRudiKN9FaN-mNZibBbacEZNA8wrZAi=vhoAA@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Mon, Jan 9, 2017 at 1:39 PM, Felipe Balbi
<felipe.balbi@linux.intel.com> wrote:
>
> Hi,
>
> Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:
>
> [snip]
>
>>>>> true. But even so, that PHY handle is only needed for devices which
>>>>> weren't properly configured at coreConsultant time.
>>>> I don't understand that - there are two separate modules involved
>>>> here: 1. the dwc3 IP block 2. Amlogic's own USB2 PHYs (they did not
>>>> choose Synopsys DesignWare PHYs)
>>>> (some background info: the USB2 PHYs are in "reset mode" by default)
>>>> So even if the dwc3 IP block is configured correctly at coreConsultant
>>>> time we still need to configure the PHYs. From "USB controller driver"
>>>> (could be dwc3, or some generic hcd.c code, etc.) this means that
>>>> phy_init() and phy_power_on() needs to be called for each of the three
>>>> "Amlogic USB2 PHYs". the current code however only calls these for the
>>>> first PHY (leaving the others in reset mode = disabled).
>>>
>>> argh, good point. In that case, we need to figure out the best way to
>>> pass all these handles to xHCI-plat
>> OK, I assume that we want to let xHCI-plat manage the PHYs in the
>> future instead of doing this in dwc3 (dwc3 may have to pass these to
>> xHCI-plat, but it should not do the logic on it's own)?
>
> perhaps. Maybe that mode check for dwc3 to bail out if mode == Host
> should be done earlier.
I guess your idea is to let xHCI-plat handle all phy_* logic when in host-mode?

> [snip]
>
>>>> That is an explanation I'm fine with: we trust the (default) values
>>>> which are in hardware until we have documentation that we need a
>>>> quirk. I do not have access to Amlogic's documentation so I can't
>>>> provide that - but we can probably leave it as it is as it "worked for
>>>> me".
>>>
>>> awesome, so we need *only* phy_init() / phy_power_on() for the other
>>> PHYs, right?
>> correct!
>> That made me curious and I found these:
>> - ehci-platform.c has ehci_platform_power_{on,off}
>> - xhci-mtk.c has xhci_mtk_phy_{init,exit,power_on,power_off}
>> - ohci-platform.c has ohci_platform_power_{on,off}
>> - (there are some more, for example ohci-exynos.c which are doing similar stuff)
>>
>> all of them are parsing the "phys" property and build an array of "struct phy*":
>> of_count_phandle_with_args(np, "phys", "#phy-cells");
>> (afterwards they apply phy_{init,power_on,power_off,exit} in a loop on
>> all of the PHYs)
>>
>> Maybe it would make sense to remove duplicated code from these drivers
>> and create some generic functions from it.
>
> makes sense to me. The difficulty is really just making sure no
> regressions are caused along the way. Also, DWC3 creates xHCI
> platform-device manually, so we need to figure out a clean way of
> passing along PHY phandles to xHCI. Another thing to consider is
> dual-role implementations of dwc3. In such cases, peripheral side also
> needs to control PHY[0].
indeed, regression-testing is probably the hardest part here!

I think we already have the correct device_node (sysdev->of_node)
available in xHCI-plat, see the comment above the sysdev variable
assignment in xhci_plat_probe.

The Amlogic GXL and GXM SoCs also support dual-role mode, but I think
that is a bit more exotic:
like you mentioned PHY[0] is used for dual-role mode. There is an
additional USB3 PHY which also does mode-detection (in otg mode).
when that USB3 PHY/mode-detection block detects that it has to switch
to device mode it re-configures USB2 PHY[0] accordingly.
however it doesn't stop here: after that it goes ahead and turns on an
additional dwc2 (yes, dwc2, not dwc3!) IP block which is limited to
"device" (peripheral) mode only.
So on Amlogic GXL and GXM SoCs host-mode is handled by dwc3 while
device-mode is handled by dwc2

>> that would result in a few functions (function names are just to
>> illustrate my idea):
>> - devm_get_all_phys_from_of_node()
>> - all_phys_init_and_power_on() (phy_init and phy_power_on always seem
>> to be used together)
>> - all_phys_power_off_and_exit() (phy_power_off and phy_exit always
>> seem to be used together)
>>
>> let me know what you think
>
> I like that, specially so if it's done generically and all HCD drivers
> just use the same piece of code.
great!
how should we proceed: should I come up with a first RFC so we can
then discuss issues/improvements based on that RFC patch?
