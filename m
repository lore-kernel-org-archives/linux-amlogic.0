From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Fri, 29 Dec 2017 08:52:46 +0100
Subject: [RFT net-next v3 0/5] dwmac-meson8b: RGMII clock fixes for Meson8b
In-Reply-To: <CAFBinCDVRNKBTG0CHcmV9iJ9gb2VeODCfU6BO+dyRU6bVwkffg@mail.gmail.com>
References: <20171228222128.15215-1-martin.blumenstingl@googlemail.com>
 <20171229013116.GA5446@ingrassia.epigenesys.com>
 <CAFBinCDVRNKBTG0CHcmV9iJ9gb2VeODCfU6BO+dyRU6bVwkffg@mail.gmail.com>
Message-ID: <CAFBinCDxDQHgp0RE4U7k9pCEngp9woxMthr3wEO3eD73NAke9g@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Fri, Dec 29, 2017 at 8:48 AM, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
> Hi Emiliano,
>
> On Fri, Dec 29, 2017 at 2:31 AM, Emiliano Ingrassia
> <ingrassia@epigenesys.com> wrote:
>> Hi Martin, Hi Dave,
>>
>> On Thu, Dec 28, 2017 at 11:21:23PM +0100, Martin Blumenstingl wrote:
>>> Hi Dave,
>>>
>>> please do not apply this series until it got a Tested-by from Emiliano.
>>>
>>>
>>> Hi Emiliano,
>>>
>>> you reported [0] that you couldn't get dwmac-meson8b to work on your
>>> Odroid-C1. With your findings (register dumps, clk_summary output, etc.)
>>> I think I was able to find a fix: it consists of two patches (which you
>>> find in this series)
>>>
>>> Unfortunately I don't have any Meson8b boards with RGMII PHY so I could
>>> only partially test this (I could only check if the clocks were
>>> calculated correctly when using a dummy 500002394Hz input clock instead
>>> of MPLL2).
>>>
>>> Could you please give this series a try and let me know about the
>>> results?
>>> You obviously still need your two "ARM: dts: meson8b" patches which
>>> - add the amlogic,meson8b-dwmac" compatible to meson8b.dtsi
>>> - enable Ethernet on the Odroid-C1
>>>
>>> When testing on Meson8b this also needs a fix for the MPLL clock driver:
>>> "clk: meson: mpll: use 64-bit maths in params_from_rate", see:
>>> https://patchwork.kernel.org/patch/10131677/
>>>
>>>
>>> I have tested this myself on a Khadas VIM (GXL SoC, internal RMII PHY)
>>> and a Khadas VIM2 (GXM SoC, external RGMII PHY). Both are still working
>>> fine (so let's hope that this also fixes your Meson8b issue :)).
>>>
>>>
>>> changes since v1 at [1]:
>>> - changed the subject of the cover-letter to indicate that this is all
>>>   about the RGMII clock
>>> - added PATCH #1 which ensures that we don't unnecessarily change the
>>>   parent clocks in RMII mode (and also makes the code easier to
>>>   understand)
>>> - changed subject of PATCH #2 (formerly PATCH #1) to state that this
>>>   is about the RGMII clock
>>> - added Jerome's Reviewed-by to PATCH #2 (formerly PATCH #1)
>>> - replaced PATCH #3 (formerly PATCH #2) with one that sets
>>>   CLK_SET_RATE_PARENT on the mux and thus re-configures the MPLL2 clock
>>>   on Meson8b correctly
>>>
>>> changes since v2 at [2]:
>>> - added PATCH #2 to make the following patch easier
>>> - Emiliano reported that there's currently another bug in the
>>>   dwmac-meson8b driver which prevents it from working with RGMII PHYs on
>>>   Meson8b: bit 10 of the PRG_ETH0 register is configures a clock gate
>>>   (instead of a divide by 5 or divide by 10 clock divider). This has not
>>>   been visible on GXBB and later due to the input clock which always led
>>>   to a selection of "divide by 10" (which is done internally in the IP
>>>   block, but the bit actually means "enable RGMII clock output").
>>>   PATCH #3 was added to address this issue.
>>> - the commit message of PATCH #4 and #5 (formerly PATCH #2 and #3) were
>>>   updated and the patch itself rebased because the m25_div clock was
>>>   removed with the new PATCH #3 (so some of the statements were not
>>>   valid anymore)
>>>
>>
>> Here is the clk_summary relative to ethernet on Odroid-C1+
>> with this new series applied:
>>
>> xtal                                1            1    24000000          0 0
>>  sys_pll                            0            0  1200000000          0 0
>>   cpu_clk                           0            0  1200000000          0 0
>>  vid_pll                            0            0   732000000          0 0
>>  fixed_pll                          2            2  2550000000          0 0
>>   mpll2                             1            1   249999701          0 0
>>    c9410000.ethernet#m250_sel       1            1   249999701          0 0
>>     c9410000.ethernet#m250_div      1            1   249999701          0 0
>>      c9410000.ethernet#fixed_div10  1            1    24999970          0 0
>>       c9410000.ethernet#m25_en      1            1    24999970          0 0
>>
>> The ethernet prg0 register is set to 0x74A1 which should be correct with
>> respect to the information contained in the S805 SoC manual.
>> Actually, the ethernet is not yet fully functional.
>> Trying to ping the board, I can see ARP request from host to board using
>> tcpdump. However, the host can't see any response.
> great - we're getting closer!
>
>> Following the U-Boot value for prg0 register, which is 0x7d21, I also
>> tried to set bit 11. As expected, this did not have any influence.
> it *may* be something outside the PRG_ETH0 register than
> to confirm that: could you temporarily revert the last patch from this
> series ("net: stmmac: dwmac-meson8b: propagate rate changes to the
> parent clock")? this way MPLL2 will stay at ~500MHz and PRG_ETH0
> should be identical to what u-boot sets (apart from bit 11, but that
> is only relevant in RMII mode according to the datasheet)
>
>> Another thing that we should check is the "Ethernet Memory PD" (see S805
>> manual - sec. 5.4) register which bits 3-2 enable/disable ethernet
>> normal operation. However, those bits are already cleared by U-Boot.
> if the peripheral registers itself are configured correctly it's
> typically one of these issues:
> - gate clock not being enabled (can you confirm that you hav the
> "stmmaceth" with CLKID_ETH in the ethmac node?)
> - incorrect pinmux settings (as a hack I would remove all ethernet
> pinctrl properties/nodes from meson8b.dtsi and meson8b-odroidc1.dts.
> before booting the mainline kernel you'll need to use Ethernet from
> within u-boot once)
> - incorrect TX delay (amlogic,tx-delay-ns = <2> should be defined in
> meson8b-odroidc1.dts, but the driver should auto-select that value if
> it's missing)
> - IP block being in some undefined state which can be brought back
> into a working state by adding the reset line (RESET_ETHERNET)
> - Ethernet PHY being in some undefined state  can be brought back into
> a working state by adding the reset line (GPIOH_4, see
> meson-gxbb-odroidc2.dts how to use that)
> - I have not seen that the power-domains ("Ethernet Memory PD") were a
> problem yet, but you already checked that
and I forgot the "eee-broken-1000t;" property on the PHY! have a look
at meson-gxbb-odroidc2.dts - I would assume that the ethmac node in
your meson8b-odroidc1.dts looks almost identical (no interrupt
configuration inside the PHY node, different reset-GPIO)

>
> maybe you can share your current .dts patch and a boot-log so others
> can have a look as well?
>
>> Thank you for the support.
> thank you for your patience as well, most people would have given up by now
>
>> Best regards,
>>
>> Emiliano
>>
>>>
>>> [0] http://lists.infradead.org/pipermail/linux-amlogic/2017-December/005596.html
>>> [1] http://lists.infradead.org/pipermail/linux-amlogic/2017-December/005848.html
>>> [2] http://lists.infradead.org/pipermail/linux-amlogic/2017-December/005861.html
>>>
>>>
>>> Martin Blumenstingl (5):
>>>   net: stmmac: dwmac-meson8b: only configure the clocks in RGMII mode
>>>   net: stmmac: dwmac-meson8b: simplify generating the clock names
>>>   net: stmmac: dwmac-meson8b: fix internal RGMII clock configuration
>>>   net: stmmac: dwmac-meson8b: fix setting the RGMII clock on Meson8b
>>>   net: stmmac: dwmac-meson8b: propagate rate changes to the parent clock
>>>
>>>  .../net/ethernet/stmicro/stmmac/dwmac-meson8b.c    | 119 +++++++++++----------
>>>  1 file changed, 63 insertions(+), 56 deletions(-)
>>>
>>> --
>>> 2.15.1
>>>
>
>
> Regards
> Martin
