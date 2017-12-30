From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sat, 30 Dec 2017 22:02:54 +0100
Subject: [RFT net-next v3 0/5] dwmac-meson8b: RGMII clock fixes for Meson8b
In-Reply-To: <20171229230058.GA17364@ingrassia.epigenesys.com>
References: <20171228222128.15215-1-martin.blumenstingl@googlemail.com>
 <20171229013116.GA5446@ingrassia.epigenesys.com>
 <1514570663.7439.19.camel@baylibre.com>
 <20171229230058.GA17364@ingrassia.epigenesys.com>
Message-ID: <CAFBinCBOdUhi6nOg050stt=Mf3r0Gk7-ft1RY=Kry=CDf0nntA@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Emiliano,

On Sat, Dec 30, 2017 at 12:00 AM, Emiliano Ingrassia
<ingrassia@epigenesys.com> wrote:
> Hi Jerome, Hi Martin,
>
> On Fri, Dec 29, 2017 at 07:04:23PM +0100, Jerome Brunet wrote:
>> On Fri, 2017-12-29 at 02:31 +0100, Emiliano Ingrassia wrote:
>> > Hi Martin, Hi Dave,
>> >
>> > On Thu, Dec 28, 2017 at 11:21:23PM +0100, Martin Blumenstingl wrote:
>> > > Hi Dave,
>> > >
>> > > please do not apply this series until it got a Tested-by from Emiliano.
>> > >
>> > >
>> > > Hi Emiliano,
>> > >
>> > > you reported [0] that you couldn't get dwmac-meson8b to work on your
>> > > Odroid-C1. With your findings (register dumps, clk_summary output, etc.)
>> > > I think I was able to find a fix: it consists of two patches (which you
>> > > find in this series)
>> > >
>> > > Unfortunately I don't have any Meson8b boards with RGMII PHY so I could
>> > > only partially test this (I could only check if the clocks were
>> > > calculated correctly when using a dummy 500002394Hz input clock instead
>> > > of MPLL2).
>> > >
>> > > Could you please give this series a try and let me know about the
>> > > results?
>> > > You obviously still need your two "ARM: dts: meson8b" patches which
>> > > - add the amlogic,meson8b-dwmac" compatible to meson8b.dtsi
>> > > - enable Ethernet on the Odroid-C1
>> > >
>> > > When testing on Meson8b this also needs a fix for the MPLL clock driver:
>> > > "clk: meson: mpll: use 64-bit maths in params_from_rate", see:
>> > > https://patchwork.kernel.org/patch/10131677/
>> > >
>> > >
>> > > I have tested this myself on a Khadas VIM (GXL SoC, internal RMII PHY)
>> > > and a Khadas VIM2 (GXM SoC, external RGMII PHY). Both are still working
>> > > fine (so let's hope that this also fixes your Meson8b issue :)).
>> > >
>> > >
>> > > changes since v1 at [1]:
>> > > - changed the subject of the cover-letter to indicate that this is all
>> > >   about the RGMII clock
>> > > - added PATCH #1 which ensures that we don't unnecessarily change the
>> > >   parent clocks in RMII mode (and also makes the code easier to
>> > >   understand)
>> > > - changed subject of PATCH #2 (formerly PATCH #1) to state that this
>> > >   is about the RGMII clock
>> > > - added Jerome's Reviewed-by to PATCH #2 (formerly PATCH #1)
>> > > - replaced PATCH #3 (formerly PATCH #2) with one that sets
>> > >   CLK_SET_RATE_PARENT on the mux and thus re-configures the MPLL2 clock
>> > >   on Meson8b correctly
>> > >
>> > > changes since v2 at [2]:
>> > > - added PATCH #2 to make the following patch easier
>> > > - Emiliano reported that there's currently another bug in the
>> > >   dwmac-meson8b driver which prevents it from working with RGMII PHYs on
>> > >   Meson8b: bit 10 of the PRG_ETH0 register is configures a clock gate
>> > >   (instead of a divide by 5 or divide by 10 clock divider). This has not
>> > >   been visible on GXBB and later due to the input clock which always led
>> > >   to a selection of "divide by 10" (which is done internally in the IP
>> > >   block, but the bit actually means "enable RGMII clock output").
>> > >   PATCH #3 was added to address this issue.
>> > > - the commit message of PATCH #4 and #5 (formerly PATCH #2 and #3) were
>> > >   updated and the patch itself rebased because the m25_div clock was
>> > >   removed with the new PATCH #3 (so some of the statements were not
>> > >   valid anymore)
>> > >
>> >
>> > Here is the clk_summary relative to ethernet on Odroid-C1+
>> > with this new series applied:
>> >
>> > xtal                                    1            1    24000000          0 0
>> >  sys_pll                        0            0  1200000000          0 0
>> >   cpu_clk                       0            0  1200000000          0 0
>> >  vid_pll                        0            0   732000000          0 0
>> >  fixed_pll                      2            2  2550000000          0 0
>> >   mpll2                                 1            1   249999701          0 0
>> >    c9410000.ethernet#m250_sel       1            1   249999701          0 0
>> >     c9410000.ethernet#m250_div          1            1   249999701          0 0
>> >      c9410000.ethernet#fixed_div10  1            1    24999970          0 0
>> >       c9410000.ethernet#m25_en          1            1    24999970          0 0
>> >
>> > The ethernet prg0 register is set to 0x74A1 which should be correct with
>> > respect to the information contained in the S805 SoC manual.
>> > Actually, the ethernet is not yet fully functional.
>> > Trying to ping the board, I can see ARP request from host to board using
>> > tcpdump. However, the host can't see any response.
>>
>> If the rx path is ok-ish, I suppose the clock setting applied is good.
>> Maybe you could try to play with the tx delay (BIT 5-6 of the register) ?
>>
>
> Thanks for the suggestion. Finally the ethernet works correctly using 4
> ns as tx-delay.
> The clock summary is the same reported above. The prg0 ethernet register
> value is 0x74c1 as expected.
this is awesome!

I think I also know the reason why you need a 4ns TX delay: because
with the vendor kernel it's the same!
the TX delay in PRG_ETHERNET0 is set to 2ns
however, the RTL8211F PHY can also generate a 2ns TX delay - this can
be enabled by pin-strapping (by pulling a pin low/high - there's no
public documentation on that). if this is also enabled then the two
delays sum up
the mainline RTL8211F PHY driver however disables the TX delay in the
PHY when not using phy-mode "rgmii-txid"

> I would like to thanks Martin for the support!
> As soon as this patch series [v3] will be submitted, I'll submit my patch for
> the device tree.
I would like to finish the discussion with Jerome on patch #3 - then I
will send a final version

if anyone has an oscilloscope that is able to measure up to ~50MHz
then I'd be happy if someone would volunteer to test... :)
(I ordered some parts to do that myself, but I'm not sure when this will arrive)

on any Amlogic SoC with RTL8211F Ethernet PHY this can be measured on
pin 36 of the PHY (Odroid-C1's datasheet describes pin 36 as
"XTAL_IN", see page 12 of the schematics: [0]):
- test 1: this series with bit 10 set -> should output 25MHz
- test 2: this series, but manually unset bit 10 after the
clk_set_rate() call -> if bit 10 is a gate then the clock signal is
off, if it's a divider then there should be a 50MHz signal

> Let me know if you have any question.
>
> Thanks again,
thank you for not giving up :)

> Emiliano
>
>> >
>> > Following the U-Boot value for prg0 register, which is 0x7d21, I also
>> > tried to set bit 11. As expected, this did not have any influence.
>> > Another thing that we should check is the "Ethernet Memory PD" (see S805
>> > manual - sec. 5.4) register which bits 3-2 enable/disable ethernet
>> > normal operation. However, those bits are already cleared by U-Boot.
>> >
>> > Thank you for the support.
>> >
>> > Best regards,
>> >
>> > Emiliano
>> >
>> > >
>> > > [0] http://lists.infradead.org/pipermail/linux-amlogic/2017-December/005596.html
>> > > [1] http://lists.infradead.org/pipermail/linux-amlogic/2017-December/005848.html
>> > > [2] http://lists.infradead.org/pipermail/linux-amlogic/2017-December/005861.html
>> > >
>> > >
>> > > Martin Blumenstingl (5):
>> > >   net: stmmac: dwmac-meson8b: only configure the clocks in RGMII mode
>> > >   net: stmmac: dwmac-meson8b: simplify generating the clock names
>> > >   net: stmmac: dwmac-meson8b: fix internal RGMII clock configuration
>> > >   net: stmmac: dwmac-meson8b: fix setting the RGMII clock on Meson8b
>> > >   net: stmmac: dwmac-meson8b: propagate rate changes to the parent clock
>> > >
>> > >  .../net/ethernet/stmicro/stmmac/dwmac-meson8b.c    | 119 +++++++++++----------
>> > >  1 file changed, 63 insertions(+), 56 deletions(-)
>> > >
>> > > --
>> > > 2.15.1
>> > >
>>


Regards
Martin


[0] https://dn.odroid.com/S805/Schematics/odroid-c1+_rev0.4_20160226.pdf
