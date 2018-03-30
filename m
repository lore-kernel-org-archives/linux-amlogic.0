From: narmstrong@baylibre.com (Neil Armstrong)
Date: Fri, 30 Mar 2018 09:53:52 +0200
Subject: [PATCH 3/4] clk: add Amlogic meson clock driver
In-Reply-To: <CAPnjgZ176Z7gjh=zvpzFvWEp=XrA6jML4UmgxSzc_WfDqyOJbw@mail.gmail.com>
References: <20171203091713.22029-1-b.galvani@gmail.com>
 <20171203091713.22029-4-b.galvani@gmail.com>
 <0f77c1b8-845c-9190-5550-a115bad9c926@baylibre.com>
 <CAPnjgZ176Z7gjh=zvpzFvWEp=XrA6jML4UmgxSzc_WfDqyOJbw@mail.gmail.com>
Message-ID: <37e9510f-8150-9c4e-e3b9-3938d637c650@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 30/03/2018 00:41, Simon Glass wrote:
> Hi Neil,
> 
> On 29 March 2018 at 16:42, Neil Armstrong <narmstrong@baylibre.com> wrote:
>> Hi Beniamino,
>>
>> On 03/12/2017 10:17, Beniamino Galvani wrote:
>>> Introduce a basic clock driver for Amlogic Meson SoCs which supports
>>> enabling/disabling clock gates and getting their frequency.
>>>
>>> Signed-off-by: Beniamino Galvani <b.galvani@gmail.com>
>>> ---
>>>  arch/arm/mach-meson/Kconfig |   2 +
>>>  drivers/clk/Makefile        |   1 +
>>>  drivers/clk/clk_meson.c     | 196 ++++++++++++++++++++++++++++++++++++++++++++
>>>  3 files changed, 199 insertions(+)
>>>  create mode 100644 drivers/clk/clk_meson.c
>>>
>>> diff --git a/arch/arm/mach-meson/Kconfig b/arch/arm/mach-meson/Kconfig
>>> index d4bd230be3..7acee3bc5c 100644
>>> --- a/arch/arm/mach-meson/Kconfig
>>> +++ b/arch/arm/mach-meson/Kconfig
>>
>> [...]
>>> +
>>> +static int meson_set_gate(struct clk *clk, bool on)
>>> +{
>>> +     struct meson_clk *priv = dev_get_priv(clk->dev);
>>> +     struct meson_gate *gate;
>>> +
>>> +     if (clk->id >= ARRAY_SIZE(gates))
>>> +             return -ENOENT;
>>
>> This should be -ENOSYS, otherwise it breaks the ethernet driver since it waits -ENOSYS if clock cannot be enabled.
> 
> Perhaps, but this is a genuine error, so it is OK to break the
> Ethernet driver, isn't it? We don't want errors to be silently
> ignored.
> 
> Not having a device is one thing, but having a device that does not work is bad.
> 

The driver only manages the gates, enabling and disabling them and getting their freq.
The missing clocks of the ethernet driver in this case are dividers of the PLL, thus
we don't need to enable them, and for now the driver don't need the freq.

> Also I have tried to keep -ENOSYS for cases where the driver does not
> support the operation. We should be very clear in clk-uclass.h as to
> what errors are returned. At present I don't see ENOSYS mentioned. At
> the very least we should update the docs if certain behaviour is
> expected. I would also expect us to have a sandbox test for it.

In this case, the driver does not support the operation for these clocks, but maybe it would be
better to add them with reg=0 and return -ENOSYS in the following return :

> 
>>
>>> +
>>> +     gate = &gates[clk->id];
>>> +
>>> +     if (gate->reg == 0)
>>> +             return -ENOENT;
>>
>> Same here -ENOSYS

Here thsi means it's not a gate.

>>
>>> +
>>> +     clrsetbits_le32(priv->addr + gate->reg,
>>> +                     BIT(gate->bit), on ? BIT(gate->bit) : 0);
>>> +     return 0;
>>> +}
>>> +
>>> +static int meson_clk_enable(struct clk *clk)
>>> +{
>>> +     return meson_set_gate(clk, true);
>>> +}
>>> +
>>> +static int meson_clk_disable(struct clk *clk)
>>> +{
>>> +     return meson_set_gate(clk, false);
>>> +}
>>> +
>>> +static ulong meson_clk_get_rate(struct clk *clk)
>>> +{
>>> +     struct meson_clk *priv = dev_get_priv(clk->dev);
>>> +
>>> +     if (clk->id != CLKID_CLK81) {
>>> +             if (clk->id >= ARRAY_SIZE(gates))
>>> +                     return -ENOENT;
>>
>> Same here -ENOSYS
>>
>>> +             if (gates[clk->id].reg == 0)
>>> +                     return -ENOENT;
>>
>> Same here -ENOSYS
>>
>>> +     }
>>> +
>>> +     /* Use cached value if available */
>>> +     if (priv->rate)
>>> +             return priv->rate;
>>> +
>>> +     priv->rate = meson_measure_clk_rate(CLK_81);
>>> +
>>> +     return priv->rate;
>>> +}
>>> +
>>
>> [...]
>>
>> Neil
> 
> Regards,
> Simon
> 
