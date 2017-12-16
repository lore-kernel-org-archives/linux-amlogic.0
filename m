From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sun, 17 Dec 2017 00:39:58 +0100
Subject: [PATCH 2/4] ARM: dts: meson8b: extending ethernet controller
 description
In-Reply-To: <20171204223733.GA26597@ingrassia.epigenesys.com>
References: <cover.1506507688.git.ingrassia@epigenesys.com>
 <aecccf76841a035f8dc5cc23dadfad66fbbac03e.1506507688.git.ingrassia@epigenesys.com>
 <CAFBinCAwn7mz8LWMmF4cvYTWz_v6dDCQBGOu-1iU6+AOd+nbrA@mail.gmail.com>
 <20170929191021.GA20840@ingrassia.epigenesys.com>
 <CAFBinCCGYUituNx0AtUYvZkPKRRw9_p40bSYeCtCjSxOrwpN5Q@mail.gmail.com>
 <20171121153613.GA16818@ingrassia.epigenesys.com>
 <CAFBinCAX6hUr4hPvOZKBaHmSy0s2BG47J_QJqhOMcF8L-p27EQ@mail.gmail.com>
 <20171204223733.GA26597@ingrassia.epigenesys.com>
Message-ID: <CAFBinCB+vRX0FW03gFGgJpNEijKOWHjt-rXHK19pXnun6H_W4g@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Emiliano,

sorry for the late reply

On Mon, Dec 4, 2017 at 11:37 PM, Emiliano Ingrassia
<ingrassia@epigenesys.com> wrote:
> Hi Martin,
>
> thank you for the response.
>
> On Sun, Nov 26, 2017 at 10:02:35PM +0100, Martin Blumenstingl wrote:
>> Hi Emiliano,
>>
>> On Tue, Nov 21, 2017 at 4:36 PM, Emiliano Ingrassia
>> <ingrassia@epigenesys.com> wrote:
>> > Hi Martin,
>> >
>> > sorry for my very late response!
>> no worries, I'm also very late with this mail
>>
>> >
>> > On Sat, Sep 30, 2017 at 04:09:48PM +0200, Martin Blumenstingl wrote:
>> >> Hi Emiliano,
>> >>
>> >> On Fri, Sep 29, 2017 at 9:10 PM, Emiliano Ingrassia
>> >> <ingrassia@epigenesys.com> wrote:
>> >> > Hi Martin,
>> >> >
>> >> > thanks for the review!
>> >> >
>> >> > On Thu, Sep 28, 2017 at 11:41:48PM +0200, Martin Blumenstingl wrote:
>> >> >> Hi Emiliano,
>> >> >>
>> >> >> On Wed, Sep 27, 2017 at 11:39 PM, Emiliano Ingrassia
>> >> >> <ingrassia@epigenesys.com> wrote:
>> >> >> > This patch adds ethernet controller pin description and extend its
>> >> >> > attributes in the relative node.
>> >> >> >
>> >> >> > Signed-off-by: Emiliano Ingrassia <ingrassia@epigenesys.com>
>> >> >> > ---
>> >> >> >
>> >> >> > This patch corrects the meson8b-dwmac reg attributes updated by the previous
>> >> >> > 2/4 patch (450a483abe07f8d903c6cb74091592743975a8eb).
>> >> >> > The second addresses range, taken from S805 (aka Meson8b) SoC manual,
>> >> >> > was not correct.
>> >> >> >
>> >> >> > Please, apply this patch and discard the previous
>> >> >> > (450a483abe07f8d903c6cb74091592743975a8eb).
>> >> >> >
>> >> >> >  arch/arm/boot/dts/meson8b.dtsi | 40 ++++++++++++++++++++++++++++++++++++++--
>> >> >> >  1 file changed, 38 insertions(+), 2 deletions(-)
>> >> >> >
>> >> >> > diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
>> >> >> > index bc278da7df0d..816bc9188f44 100644
>> >> >> > --- a/arch/arm/boot/dts/meson8b.dtsi
>> >> >> > +++ b/arch/arm/boot/dts/meson8b.dtsi
>> >> >> > @@ -154,12 +154,48 @@
>> >> >> >                         #gpio-cells = <2>;
>> >> >> >                         gpio-ranges = <&pinctrl_cbus 0 0 130>;
>> >> >> >                 };
>> >> >> > +
>> >> >> > +               eth_rgmii_pins: eth-rgmii {
>> >> >> > +                       mux {
>> >> >> > +                               groups = "eth_tx_clk",
>> >> >> > +                                        "eth_tx_en",
>> >> >> > +                                        "eth_txd1_0",
>> >> >> > +                                        "eth_txd1_1",
>> >> >> > +                                        "eth_txd0_0",
>> >> >> > +                                        "eth_txd0_1",
>> >> >> > +                                        "eth_rx_clk",
>> >> >> > +                                        "eth_rx_dv",
>> >> >> > +                                        "eth_rxd1",
>> >> >> > +                                        "eth_rxd0",
>> >> >> > +                                        "eth_mdio_en",
>> >> >> > +                                        "eth_mdc",
>> >> >> > +                                        "eth_ref_clk",
>> >> >> > +                                        "eth_txd2",
>> >> >> > +                                        "eth_txd3";
>> >> >> > +                               function = "ethernet";
>> >> >> > +                       };
>> >> >> > +               };
>> >> >> >         };
>> >> >> >  };
>> >> >> >
>> >> >> >  &ethmac {
>> >> >> > -       clocks = <&clkc CLKID_ETH>;
>> >> >> > -       clock-names = "stmmaceth";
>> >> >> > +       compatible = "amlogic,meson8b-dwmac", "snps,dwmac-3.70a", "snps,dwmac";
>> >> >> without a reg property this passes 0xc1108108 (as defined in
>> >> >> meson.dtsi) to the meson8b-dwmac driver.
>> >> >> are you sure that this shouldn't be 0xc1108140 (like in your initial patch)?
>> >> >> 0xc1108108 translates to 0x2050 (calculation formula: (0xc1108108 -
>> >> >> cbus base addr 0xc1100000) / 4) which is used in Amlogic's u-boot
>> >> >> sources, for example [0]
>> >> >>
>> >> >
>> >> > Yes, I know. This was the intention.
>> >> OK, this is interesting
>> >>
>> >
>> > After some research I agree with you: the correct ethernet register address is
>> > 0xc1108140.
>> great - thank you for checking!
>>
>> >
>> >> >> currently the meson8b-dwmac driver is writing to the old register
>> >> >> location which probably does nothing.
>> >> without your change the meson6-dwmac driver is used. when I wrote the
>> >> meson8b-dwmac driver I documented the following behavior (see [0]):
>> >> "This worked for many boards because the bootloader programs the
>> >> PRG_ETHERNET registers correctly. Additionally the meson6-dwmac driver
>> >> only sets bit 1 of PRG_ETHERNET_ADDR0 which (according to the
>> >> datasheet) is only used during reset."
>> >>
>> >> > Actually, changing the second addresses range from 0xc1108108 to
>> >> > 0xc1108140 leads to an unusable ethernet controller.
>> >> Odroid-C1's u-boot writes 0x7d21 to 0xc1108140 (= (0x2050 * 4) + cbus
>> >> base), see [1]
>> >> have you tried to verify that writing 0x7d21 (= the value used in the
>> >> Odroid-C1 u-boot sources) at the end of meson8b_init_prg_eth makes it
>> >> work for you again? if it does then we are not setting the register
>> >> values correctly (which may simply be related to the clock setup -
>> >> either the internal clock in the meson8b-dwmac driver or the "other"
>> >> ethernet clock)
>> >
>> > Actually, writing 0x7d21 at the end of the initialization procedure leads
>> > to a working ethernet controller. Consider that I'm using MPLL2 as clock
>> > source for both "clkin0" and "clkin1" because, as stated in S805 SoC manual,
>> > "M8Baby internal clock source is mp2_clk_out only.".
>> this value is pretty close to the one on GXBB (and newer) SoCs which use 0x1621
>> what is the MPLL2 clock rate on your board (my Meson8m2 and Meson8b
>> boards both have a RMII PHY)?
>>
>> > Investigating dwmac-meson8b.c, a possible error lies in the use of
>> > prg_ethernet_addr0 register bits 9-7.
>> > Infact, they are used as field for CLK_M250_DIV value, which it seems to me
>> > incorrect. From the SoC manual, those bits should be set as mpll2 clock rate
>> > divided by 250*1000*1000.
>> let's do the maths:
>> this would work fine on GXBB (and later) where PRG_ETH0_CLK_M250_DIV
>> is 0x4 and the parent clock is FCLK_DIV2 which is at 1GHz. 1GHz / 1000
>> / 1000 / 250 = 0x4
>> "unfortunately" it also works the other way round: 1GHz / 0x4 = 250MHz
>>
>> on your Odroid-C1 PRG_ETH0_CLK_M250_DIV is 0x2 - if the same maths
>> still applies then MPLL2 should be at 500MHz:
>> 500MHz / 1000 / 1000 / 250 = 0x2
>> however, it also works the other way round: 500MHz / 0x2 = 250MHz
>>
>
> Yes, of course!
> The problem is that a value of 0x5, instead of 0x2, is written in those bits.
so you mean that "dwmac-meson8b.c" writes a value of 0x5 instead of
0x2 (0x2 is the value set by the vendor driver as far as I know)?

> Actually I'm studying the call chain which starts from "clk_set_rate()"
> on m25_clk_div. It seems that one of the function called sees a parent
> clock slightly greater than 100 MHz (for m25_clk_div) and choose 0x5
> as divisor (because of round up).
this may be related to my mpll2 number game in my last email.

can you check which clock rate the clk-mpll driver sees for mpll2 in
cat /sys/kernel/debug/clk/clk_summary?
sdm = 1638
n2 = 5
parent_rate = 2550000000 (2.55GHz)
resulting clock rate = 500002393Hz (= 500-odd MHz)

you could try the attached patch which enables rounding on the
dividers within the dwmac-meson8b driver and see if this solves the
problem?

> By the way, I confirm you that MPLL2 is at 500 MHz on Odroid-C1+.
great - thanks!


Regards
Martin
-------------- next part --------------
A non-text attachment was scrubbed...
Name: net-stmmac-dwmac-meson8b-fix-setting-the-PHY-clock-on-meson8b.patch
Type: text/x-patch
Size: 3203 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-amlogic/attachments/20171217/d3df0dae/attachment.bin>
