From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sun, 26 Nov 2017 22:58:57 +0100
Subject: [PATCH 2/4] ARM: dts: meson8b: extending ethernet controller
 description
In-Reply-To: <CAFBinCAX6hUr4hPvOZKBaHmSy0s2BG47J_QJqhOMcF8L-p27EQ@mail.gmail.com>
References: <cover.1506507688.git.ingrassia@epigenesys.com>
 <aecccf76841a035f8dc5cc23dadfad66fbbac03e.1506507688.git.ingrassia@epigenesys.com>
 <CAFBinCAwn7mz8LWMmF4cvYTWz_v6dDCQBGOu-1iU6+AOd+nbrA@mail.gmail.com>
 <20170929191021.GA20840@ingrassia.epigenesys.com>
 <CAFBinCCGYUituNx0AtUYvZkPKRRw9_p40bSYeCtCjSxOrwpN5Q@mail.gmail.com>
 <20171121153613.GA16818@ingrassia.epigenesys.com>
 <CAFBinCAX6hUr4hPvOZKBaHmSy0s2BG47J_QJqhOMcF8L-p27EQ@mail.gmail.com>
Message-ID: <CAFBinCD79jeL0OOq_s64ypVHJ0gkVWu91doT57eVpBLn=za=BQ@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Sun, Nov 26, 2017 at 10:02 PM, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
> Hi Emiliano,
>
> On Tue, Nov 21, 2017 at 4:36 PM, Emiliano Ingrassia
> <ingrassia@epigenesys.com> wrote:
>> Hi Martin,
>>
>> sorry for my very late response!
> no worries, I'm also very late with this mail
>
>>
>> On Sat, Sep 30, 2017 at 04:09:48PM +0200, Martin Blumenstingl wrote:
>>> Hi Emiliano,
>>>
>>> On Fri, Sep 29, 2017 at 9:10 PM, Emiliano Ingrassia
>>> <ingrassia@epigenesys.com> wrote:
>>> > Hi Martin,
>>> >
>>> > thanks for the review!
>>> >
>>> > On Thu, Sep 28, 2017 at 11:41:48PM +0200, Martin Blumenstingl wrote:
>>> >> Hi Emiliano,
>>> >>
>>> >> On Wed, Sep 27, 2017 at 11:39 PM, Emiliano Ingrassia
>>> >> <ingrassia@epigenesys.com> wrote:
>>> >> > This patch adds ethernet controller pin description and extend its
>>> >> > attributes in the relative node.
>>> >> >
>>> >> > Signed-off-by: Emiliano Ingrassia <ingrassia@epigenesys.com>
>>> >> > ---
>>> >> >
>>> >> > This patch corrects the meson8b-dwmac reg attributes updated by the previous
>>> >> > 2/4 patch (450a483abe07f8d903c6cb74091592743975a8eb).
>>> >> > The second addresses range, taken from S805 (aka Meson8b) SoC manual,
>>> >> > was not correct.
>>> >> >
>>> >> > Please, apply this patch and discard the previous
>>> >> > (450a483abe07f8d903c6cb74091592743975a8eb).
>>> >> >
>>> >> >  arch/arm/boot/dts/meson8b.dtsi | 40 ++++++++++++++++++++++++++++++++++++++--
>>> >> >  1 file changed, 38 insertions(+), 2 deletions(-)
>>> >> >
>>> >> > diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
>>> >> > index bc278da7df0d..816bc9188f44 100644
>>> >> > --- a/arch/arm/boot/dts/meson8b.dtsi
>>> >> > +++ b/arch/arm/boot/dts/meson8b.dtsi
>>> >> > @@ -154,12 +154,48 @@
>>> >> >                         #gpio-cells = <2>;
>>> >> >                         gpio-ranges = <&pinctrl_cbus 0 0 130>;
>>> >> >                 };
>>> >> > +
>>> >> > +               eth_rgmii_pins: eth-rgmii {
>>> >> > +                       mux {
>>> >> > +                               groups = "eth_tx_clk",
>>> >> > +                                        "eth_tx_en",
>>> >> > +                                        "eth_txd1_0",
>>> >> > +                                        "eth_txd1_1",
>>> >> > +                                        "eth_txd0_0",
>>> >> > +                                        "eth_txd0_1",
>>> >> > +                                        "eth_rx_clk",
>>> >> > +                                        "eth_rx_dv",
>>> >> > +                                        "eth_rxd1",
>>> >> > +                                        "eth_rxd0",
>>> >> > +                                        "eth_mdio_en",
>>> >> > +                                        "eth_mdc",
>>> >> > +                                        "eth_ref_clk",
>>> >> > +                                        "eth_txd2",
>>> >> > +                                        "eth_txd3";
>>> >> > +                               function = "ethernet";
>>> >> > +                       };
>>> >> > +               };
>>> >> >         };
>>> >> >  };
>>> >> >
>>> >> >  &ethmac {
>>> >> > -       clocks = <&clkc CLKID_ETH>;
>>> >> > -       clock-names = "stmmaceth";
>>> >> > +       compatible = "amlogic,meson8b-dwmac", "snps,dwmac-3.70a", "snps,dwmac";
>>> >> without a reg property this passes 0xc1108108 (as defined in
>>> >> meson.dtsi) to the meson8b-dwmac driver.
>>> >> are you sure that this shouldn't be 0xc1108140 (like in your initial patch)?
>>> >> 0xc1108108 translates to 0x2050 (calculation formula: (0xc1108108 -
>>> >> cbus base addr 0xc1100000) / 4) which is used in Amlogic's u-boot
>>> >> sources, for example [0]
>>> >>
>>> >
>>> > Yes, I know. This was the intention.
>>> OK, this is interesting
>>>
>>
>> After some research I agree with you: the correct ethernet register address is
>> 0xc1108140.
> great - thank you for checking!
>
>>
>>> >> currently the meson8b-dwmac driver is writing to the old register
>>> >> location which probably does nothing.
>>> without your change the meson6-dwmac driver is used. when I wrote the
>>> meson8b-dwmac driver I documented the following behavior (see [0]):
>>> "This worked for many boards because the bootloader programs the
>>> PRG_ETHERNET registers correctly. Additionally the meson6-dwmac driver
>>> only sets bit 1 of PRG_ETHERNET_ADDR0 which (according to the
>>> datasheet) is only used during reset."
>>>
>>> > Actually, changing the second addresses range from 0xc1108108 to
>>> > 0xc1108140 leads to an unusable ethernet controller.
>>> Odroid-C1's u-boot writes 0x7d21 to 0xc1108140 (= (0x2050 * 4) + cbus
>>> base), see [1]
>>> have you tried to verify that writing 0x7d21 (= the value used in the
>>> Odroid-C1 u-boot sources) at the end of meson8b_init_prg_eth makes it
>>> work for you again? if it does then we are not setting the register
>>> values correctly (which may simply be related to the clock setup -
>>> either the internal clock in the meson8b-dwmac driver or the "other"
>>> ethernet clock)
>>
>> Actually, writing 0x7d21 at the end of the initialization procedure leads
>> to a working ethernet controller. Consider that I'm using MPLL2 as clock
>> source for both "clkin0" and "clkin1" because, as stated in S805 SoC manual,
>> "M8Baby internal clock source is mp2_clk_out only.".
> this value is pretty close to the one on GXBB (and newer) SoCs which use 0x1621
> what is the MPLL2 clock rate on your board (my Meson8m2 and Meson8b
> boards both have a RMII PHY)?
based on [0] it might be 510MHz. according to these values (matched
with the S912 datasheet):
SDM_IN = 1638
EN_DDS2 = 1
SDM_EN2 = 1
N_IN2 = 5
LP_EN2 = 0
IR_BYIN2 = 0
MODSEL2 = 0
IR_BYPASS2 = 0

according to the clk-mpll.c clock driver:
f(N2_integer, SDM_IN ) = 2.0G/(N2_integer + SDM_IN/16384)

however, the parent clock on Meson8b is fixed_pll at 2.55GHz
so the calculation is:
2550000000/(5 + (1638/16384))
a problem here is that (1638/16384) = 0.1 (rounded up)
assuming that clk-mpll doesn't do fractional digits: 2.55GHz/(5 + 0) = 510MHz
assuming that original code did this on purpose and that the MPLL
clock hardware rounds values up we get: 2.55GHz/(5 + 0.1) = 500MHz

but like I said: nothing of that was confirmed on actual hardware, so
this is just "guessing register bit meanings" episode X ;)

>
>> Investigating dwmac-meson8b.c, a possible error lies in the use of
>> prg_ethernet_addr0 register bits 9-7.
>> Infact, they are used as field for CLK_M250_DIV value, which it seems to me
>> incorrect. From the SoC manual, those bits should be set as mpll2 clock rate
>> divided by 250*1000*1000.
> let's do the maths:
> this would work fine on GXBB (and later) where PRG_ETH0_CLK_M250_DIV
> is 0x4 and the parent clock is FCLK_DIV2 which is at 1GHz. 1GHz / 1000
> / 1000 / 250 = 0x4
> "unfortunately" it also works the other way round: 1GHz / 0x4 = 250MHz
>
> on your Odroid-C1 PRG_ETH0_CLK_M250_DIV is 0x2 - if the same maths
> still applies then MPLL2 should be at 500MHz:
> 500MHz / 1000 / 1000 / 250 = 0x2
> however, it also works the other way round: 500MHz / 0x2 = 250MHz
>
> Mike was also under the impression that these bits are a divider back
> when he and Kevin received some clarifications (which unfortunately
> have not made it into the GXL and GXM datasheets) for the
> PRG_ETHERNET_ADDR0 registers: [0]
>
>> Then, I guess that the correct divider value for 25 Mhz PHY clock is
>> internally derived.
> let's go one-by-one to figure this out and clarify that "divider" first
>
> I also did some homework and found a struct that describes
> PRG_ETHERNET_ADDR0: [1]
> - the clock bits (mux, divider, phase / delay) are describing the
> RGMII TX clock (I should probably rename the clocks to rgmii_<current
> name>)
> - in other words: these are not relevant for RMII at all
> (dwmac-meson8b currently ignores this fact and still tries to do some
> magic with these bits)
> - nice-to-have: the TX delay could be implemented as a clock with
> .set_phase/.get_phase callbacks (this would also expose the phase in
> debugfs/clk/...)
>
>> Best regards,
>>
>> Emiliano
>>
>>>
>>> >> if above statement is true then you are relying on the bootloader to
>>> >> set up 0xc1108140 correctly.
>>> >
>>> > OK, sure this is bad! Those addresses are documented in S805 SoC manual
>>> > and we should set up them correctly.
>>> > However, checking the Odroid-C2 device tree I couldn't find
>>> > the PRG_ETHERNET_ADDR{0,1} addresses, which are documented in S905 SoC
>>> > manual.
>>> > Probably I'm missing something, but don't we have the same situation on
>>> > that board?
>>> I'm not sure if I understand you correctly:
>>> - the S805 datasheet mentioned that the addresses of the
>>> PRG_ETHERNET_ADDR{0,1} registers are 0x2050 and 0x2051
>>> - we assume that the PRG_ETHERNET_ADDR{0,1} address from the S905
>>> datasheet is wrong, see [4]
>>> - Mike got feedback from Amlogic confirming that the documentation in
>>> the S905 datasheet is not fully correct, see [2] and [5]. if they use
>>> the same IP block in Meson8b (like, due to the identical register
>>> description in the S805 and S905 datasheets) then the S805 datasheet
>>> is also wrong
>>>
>>> >> the reason why I wrote this meson8b-dwmac driver is because I had a
>>> >> GXBB board with RGMII PHY but u-boot configured the register to RMII
>>> >> mode -> ethernet wasn't working.
>>> >
>>> > Meson8b refers to S805 SoC while GXBB should refer to S905 SoC.
>>> > At first look it seemed to me that dwmac-meson8b driver correctly
>>> > support dwmac on Meson8b or we should extend the driver to better
>>> > support it?
>>> I added compatible strings for both SoCs (see [3]) because the
>>> register description in both datasheets is identical. dwmac-meson8b
>>> works fine on all known GXBB/GXL/GXM devices
>>> so it's the Meson8b compatibility that has to be improved (if it has
>>> to be improved, but for that we have to figure out the clock setup
>>> too).
>>>
>>> >> you could verify this by zeroing both (0xc1108108 and 0xc1108140) in
>>> >> u-boot or at the start of the meson8b-dwmac driver and see if ethernet
>>> >> still works for you
>>> >>
>>> >
>>> > I'll check it.
>>> thank you!
>>> please also see also my comment above regarding 0x7d21 from
>>> Odroid-C1's u-boot sources
>>>
>>> >> > +
>>> >> > +       interrupts = <GIC_SPI 8 IRQ_TYPE_EDGE_RISING>,
>>> >> > +                    <GIC_SPI 14 IRQ_TYPE_EDGE_RISING>;
>>> >> > +       interrupt-names = "macirq",
>>> >> > +                         "eth_lpi";
>>> >> did you receive one of the eth_lpi interrupts? if it works for you
>>> >> then we should try to add this to meson-gx.dtsi as well
>>> >> I also wonder if we should configure it in meson8b.dtsi or meson.dtsi
>>> >>
>>> >
>>> > Needs more testing.
>>> >
>>> >> > +
>>> >> > +       clock-names = "stmmaceth", "clkin0", "clkin1";
>>> >> > +       clocks = <&clkc CLKID_ETH>,
>>> >> > +                <&clkc CLKID_FCLK_DIV2>,
>>> >> > +                <&clkc CLKID_MPLL2>;
>>> >> > +
>>> >> > +       resets = <&reset RESET_ETHERNET>;
>>> >> > +       reset-names = "stmmaceth";
>>> >> I'm not sure if this works:
>>> >> our reset controller implements a reset pulse (write bit, IP block
>>> >> executes a reset and clears the bit again)
>>> >> stmmac on the other hand manually asserts and deasserts the reset line
>>> >> (which is not implemented by our reset driver), see [1]
>>> >>
>>> >
>>> > OK, I'll check and eventually fix this.
>>> as a small hint: on Meson GX (GXBB and newer) we currently do not
>>> configure the reset line
>>> if it's needed on Meson8b then you could implement it in a separate patch
>>>
>>> >> > +
>>> >> > +       rx-fifo-depth=<4000>;
>>> >> > +       tx-fifo-depth=<2000>;
>>> >> could you please add spaces around "=" and some info to the commit
>>> >> message why this is necessary and where you got these values from
>>> >>
>>> >
>>> > Those are optional attributes documented in
>>> > Documentation/devicetree/bindings/net/stmmac.txt.
>>> > The values were taken from S805 SoC manual, ch. 22 (ETHERNET MAC).
>>> ok, then these are identical on GXBB and newer (according to the datasheets)
>>> I wonder if the stmmac driver auto-detects the correct value when
>>> these are not set. otherwise we should also configure these on the GX
>>> SoCs
>>>
>>> >> >  };
>>> >> >
>>> >> >  &hwrng {
>>> >> > --
>>> >> > 2.14.1
>>> >> >
>>> >> >
>>> >> > _______________________________________________
>>> >> > linux-amlogic mailing list
>>> >> > linux-amlogic at lists.infradead.org
>>> >> > http://lists.infradead.org/mailman/listinfo/linux-amlogic
>>> >>
>>> >> looking forward to proper ethernet support on Meson8/Meson8b!
>>> >>
>>> >
>>> > OK, thanks for your suggestions!
>>> >
>>> >>
>>> >> Regards,
>>> >> Martin
>>> >>
>>> >
>>> > Regards,
>>> >
>>> > Emiliano
>>> >
>>> >>
>>> >> [0] https://github.com/hardkernel/u-boot/blob/odroidc-v2011.03/board/hardkernel/odroidc/odroidc-eth.c#L29
>>> >> [1] https://github.com/torvalds/linux/blob/master/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c#L4123
>>>
>>>
>>> Regards,
>>> Martin
>>>
>>>
>>> [0] http://lists.infradead.org/pipermail/linux-amlogic/2016-August/000764.html
>>> [1] https://github.com/hardkernel/u-boot/blob/odroidc-v2011.03/board/hardkernel/odroidc/odroidc-eth.c#L59
>>> [2] http://lists.infradead.org/pipermail/linux-amlogic/2016-July/000645.html
>>> [3] https://github.com/torvalds/linux/blob/master/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c#L330
>>> [4] http://lists.infradead.org/pipermail/linux-amlogic/2016-September/001055.html
>>> [5] http://lists.infradead.org/pipermail/linux-amlogic/2016-July/000646.html
>
> Regards
> Martin
>
> [0] https://www.mail-archive.com/netdev at vger.kernel.org/msg119290.html
> [1] https://github.com/endlessm/u-boot-meson/blob/master/arch/arm/include/asm/arch-m8/aml_eth_reg.h#L508


Regards
Martin


[0] https://github.com/hardkernel/u-boot/blob/odroidc-v2011.03/board/hardkernel/odroidc/odroidc-eth.c#L61
