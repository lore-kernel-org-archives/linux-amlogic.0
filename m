From: ingrassia@epigenesys.com (Emiliano Ingrassia)
Date: Mon, 18 Dec 2017 21:07:54 +0100
Subject: [PATCH 2/4] ARM: dts: meson8b: extending ethernet controller
 description
In-Reply-To: <CAFBinCB+vRX0FW03gFGgJpNEijKOWHjt-rXHK19pXnun6H_W4g@mail.gmail.com>
References: <cover.1506507688.git.ingrassia@epigenesys.com>
 <aecccf76841a035f8dc5cc23dadfad66fbbac03e.1506507688.git.ingrassia@epigenesys.com>
 <CAFBinCAwn7mz8LWMmF4cvYTWz_v6dDCQBGOu-1iU6+AOd+nbrA@mail.gmail.com>
 <20170929191021.GA20840@ingrassia.epigenesys.com>
 <CAFBinCCGYUituNx0AtUYvZkPKRRw9_p40bSYeCtCjSxOrwpN5Q@mail.gmail.com>
 <20171121153613.GA16818@ingrassia.epigenesys.com>
 <CAFBinCAX6hUr4hPvOZKBaHmSy0s2BG47J_QJqhOMcF8L-p27EQ@mail.gmail.com>
 <20171204223733.GA26597@ingrassia.epigenesys.com>
 <CAFBinCB+vRX0FW03gFGgJpNEijKOWHjt-rXHK19pXnun6H_W4g@mail.gmail.com>
Message-ID: <20171218200754.GA4512@ingrassia.epigenesys.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Martin,

On Sun, Dec 17, 2017 at 12:39:58AM +0100, Martin Blumenstingl wrote:
> Hi Emiliano,
> 
> sorry for the late reply
>

thanks for the reply, don't worry ;)

> On Mon, Dec 4, 2017 at 11:37 PM, Emiliano Ingrassia
> <ingrassia@epigenesys.com> wrote:
> > Hi Martin,
> >
> > thank you for the response.
> >
> > On Sun, Nov 26, 2017 at 10:02:35PM +0100, Martin Blumenstingl wrote:
> >> Hi Emiliano,
> >>
> >> On Tue, Nov 21, 2017 at 4:36 PM, Emiliano Ingrassia
> >> <ingrassia@epigenesys.com> wrote:
> >> > Hi Martin,
> >> >
> >> > sorry for my very late response!
> >> no worries, I'm also very late with this mail
> >>
> >> >
> >> > On Sat, Sep 30, 2017 at 04:09:48PM +0200, Martin Blumenstingl wrote:
> >> >> Hi Emiliano,
> >> >>
> >> >> On Fri, Sep 29, 2017 at 9:10 PM, Emiliano Ingrassia
> >> >> <ingrassia@epigenesys.com> wrote:
> >> >> > Hi Martin,
> >> >> >
> >> >> > thanks for the review!
> >> >> >
> >> >> > On Thu, Sep 28, 2017 at 11:41:48PM +0200, Martin Blumenstingl wrote:
> >> >> >> Hi Emiliano,
> >> >> >>
> >> >> >> On Wed, Sep 27, 2017 at 11:39 PM, Emiliano Ingrassia
> >> >> >> <ingrassia@epigenesys.com> wrote:
> >> >> >> > This patch adds ethernet controller pin description and extend its
> >> >> >> > attributes in the relative node.
> >> >> >> >
> >> >> >> > Signed-off-by: Emiliano Ingrassia <ingrassia@epigenesys.com>
> >> >> >> > ---
> >> >> >> >
> >> >> >> > This patch corrects the meson8b-dwmac reg attributes updated by the previous
> >> >> >> > 2/4 patch (450a483abe07f8d903c6cb74091592743975a8eb).
> >> >> >> > The second addresses range, taken from S805 (aka Meson8b) SoC manual,
> >> >> >> > was not correct.
> >> >> >> >
> >> >> >> > Please, apply this patch and discard the previous
> >> >> >> > (450a483abe07f8d903c6cb74091592743975a8eb).
> >> >> >> >
> >> >> >> >  arch/arm/boot/dts/meson8b.dtsi | 40 ++++++++++++++++++++++++++++++++++++++--
> >> >> >> >  1 file changed, 38 insertions(+), 2 deletions(-)
> >> >> >> >
> >> >> >> > diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
> >> >> >> > index bc278da7df0d..816bc9188f44 100644
> >> >> >> > --- a/arch/arm/boot/dts/meson8b.dtsi
> >> >> >> > +++ b/arch/arm/boot/dts/meson8b.dtsi
> >> >> >> > @@ -154,12 +154,48 @@
> >> >> >> >                         #gpio-cells = <2>;
> >> >> >> >                         gpio-ranges = <&pinctrl_cbus 0 0 130>;
> >> >> >> >                 };
> >> >> >> > +
> >> >> >> > +               eth_rgmii_pins: eth-rgmii {
> >> >> >> > +                       mux {
> >> >> >> > +                               groups = "eth_tx_clk",
> >> >> >> > +                                        "eth_tx_en",
> >> >> >> > +                                        "eth_txd1_0",
> >> >> >> > +                                        "eth_txd1_1",
> >> >> >> > +                                        "eth_txd0_0",
> >> >> >> > +                                        "eth_txd0_1",
> >> >> >> > +                                        "eth_rx_clk",
> >> >> >> > +                                        "eth_rx_dv",
> >> >> >> > +                                        "eth_rxd1",
> >> >> >> > +                                        "eth_rxd0",
> >> >> >> > +                                        "eth_mdio_en",
> >> >> >> > +                                        "eth_mdc",
> >> >> >> > +                                        "eth_ref_clk",
> >> >> >> > +                                        "eth_txd2",
> >> >> >> > +                                        "eth_txd3";
> >> >> >> > +                               function = "ethernet";
> >> >> >> > +                       };
> >> >> >> > +               };
> >> >> >> >         };
> >> >> >> >  };
> >> >> >> >
> >> >> >> >  &ethmac {
> >> >> >> > -       clocks = <&clkc CLKID_ETH>;
> >> >> >> > -       clock-names = "stmmaceth";
> >> >> >> > +       compatible = "amlogic,meson8b-dwmac", "snps,dwmac-3.70a", "snps,dwmac";
> >> >> >> without a reg property this passes 0xc1108108 (as defined in
> >> >> >> meson.dtsi) to the meson8b-dwmac driver.
> >> >> >> are you sure that this shouldn't be 0xc1108140 (like in your initial patch)?
> >> >> >> 0xc1108108 translates to 0x2050 (calculation formula: (0xc1108108 -
> >> >> >> cbus base addr 0xc1100000) / 4) which is used in Amlogic's u-boot
> >> >> >> sources, for example [0]
> >> >> >>
> >> >> >
> >> >> > Yes, I know. This was the intention.
> >> >> OK, this is interesting
> >> >>
> >> >
> >> > After some research I agree with you: the correct ethernet register address is
> >> > 0xc1108140.
> >> great - thank you for checking!
> >>
> >> >
> >> >> >> currently the meson8b-dwmac driver is writing to the old register
> >> >> >> location which probably does nothing.
> >> >> without your change the meson6-dwmac driver is used. when I wrote the
> >> >> meson8b-dwmac driver I documented the following behavior (see [0]):
> >> >> "This worked for many boards because the bootloader programs the
> >> >> PRG_ETHERNET registers correctly. Additionally the meson6-dwmac driver
> >> >> only sets bit 1 of PRG_ETHERNET_ADDR0 which (according to the
> >> >> datasheet) is only used during reset."
> >> >>
> >> >> > Actually, changing the second addresses range from 0xc1108108 to
> >> >> > 0xc1108140 leads to an unusable ethernet controller.
> >> >> Odroid-C1's u-boot writes 0x7d21 to 0xc1108140 (= (0x2050 * 4) + cbus
> >> >> base), see [1]
> >> >> have you tried to verify that writing 0x7d21 (= the value used in the
> >> >> Odroid-C1 u-boot sources) at the end of meson8b_init_prg_eth makes it
> >> >> work for you again? if it does then we are not setting the register
> >> >> values correctly (which may simply be related to the clock setup -
> >> >> either the internal clock in the meson8b-dwmac driver or the "other"
> >> >> ethernet clock)
> >> >
> >> > Actually, writing 0x7d21 at the end of the initialization procedure leads
> >> > to a working ethernet controller. Consider that I'm using MPLL2 as clock
> >> > source for both "clkin0" and "clkin1" because, as stated in S805 SoC manual,
> >> > "M8Baby internal clock source is mp2_clk_out only.".
> >> this value is pretty close to the one on GXBB (and newer) SoCs which use 0x1621
> >> what is the MPLL2 clock rate on your board (my Meson8m2 and Meson8b
> >> boards both have a RMII PHY)?
> >>
> >> > Investigating dwmac-meson8b.c, a possible error lies in the use of
> >> > prg_ethernet_addr0 register bits 9-7.
> >> > Infact, they are used as field for CLK_M250_DIV value, which it seems to me
> >> > incorrect. From the SoC manual, those bits should be set as mpll2 clock rate
> >> > divided by 250*1000*1000.
> >> let's do the maths:
> >> this would work fine on GXBB (and later) where PRG_ETH0_CLK_M250_DIV
> >> is 0x4 and the parent clock is FCLK_DIV2 which is at 1GHz. 1GHz / 1000
> >> / 1000 / 250 = 0x4
> >> "unfortunately" it also works the other way round: 1GHz / 0x4 = 250MHz
> >>
> >> on your Odroid-C1 PRG_ETH0_CLK_M250_DIV is 0x2 - if the same maths
> >> still applies then MPLL2 should be at 500MHz:
> >> 500MHz / 1000 / 1000 / 250 = 0x2
> >> however, it also works the other way round: 500MHz / 0x2 = 250MHz
> >>
> >
> > Yes, of course!
> > The problem is that a value of 0x5, instead of 0x2, is written in those bits.
> so you mean that "dwmac-meson8b.c" writes a value of 0x5 instead of
> 0x2 (0x2 is the value set by the vendor driver as far as I know)?
> 
> > Actually I'm studying the call chain which starts from "clk_set_rate()"
> > on m25_clk_div. It seems that one of the function called sees a parent
> > clock slightly greater than 100 MHz (for m25_clk_div) and choose 0x5
> > as divisor (because of round up).
> this may be related to my mpll2 number game in my last email.
> 
> can you check which clock rate the clk-mpll driver sees for mpll2 in
> cat /sys/kernel/debug/clk/clk_summary?
> sdm = 1638
> n2 = 5
> parent_rate = 2550000000 (2.55GHz)
> resulting clock rate = 500002393Hz (= 500-odd MHz)
> 

The clk_summary reports:

 clock                         enable_cnt  prepare_cnt     rate 
-------------------------------------------------------------------
xtal                               1            1          24000000
 sys_pll                           0            0        1200000000
  cpu_clk                          0            0        1200000000
 vid_pll                           0            0         732000000
 fixed_pll                         2            2        2550000000
   mpll2                           1            1         500002394
    c9410000.ethernet#m250_sel     1            1         500002394
     c9410000.ethernet#m250_div    1            1         100000479
      c9410000.ethernet#m25_div    1            1          20000096

Accuracy and phase are all zero.

> you could try the attached patch which enables rounding on the
> dividers within the dwmac-meson8b driver and see if this solves the
> problem?
>

I tried your patch with no luck. The prg_ethernet0 register is set to
0x72a1 instead of 0x7d21.
So, bit 9-7 are 0x5 instead of 0x2.
I'll keep on investigating and let you know.
Any advice will be appreciated :D

> > By the way, I confirm you that MPLL2 is at 500 MHz on Odroid-C1+.
> great - thanks!
> 
> 
> Regards
> Martin

Thanks for the patch, best regards,

Emiliano

> From 548f99cdf30c57ae6539fa0074082ba45e3ede57 Mon Sep 17 00:00:00 2001
> From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Date: Sat, 25 Mar 2017 19:08:36 +0100
> Subject: [PATCH] net: stmmac: dwmac-meson8b: fix setting the PHY clock on
>  Meson8b
> 
> Meson8b only supports MPLL2 as clock input. The rate of the MPLL2 clock
> set by Odroid-C1's u-boot is close to 500MHz. The exact rate is
> 500002393Hz, which is calculated in drivers/clk/meson/clk-mpll.c
> using the following formula:
> DIV_ROUND_UP_ULL((u64)parent_rate * SDM_DEN, (SDM_DEN * n2) + sdm)
> Odroid-C1's u-boot configures MPLL2 with the following values:
> - SDM_DEN = 16384
> - SDM = 1638
> - N2 = 5
> 
> The 250MHz and 25MHz clocks inside dwmac-meson8b driver are derived
> from the MPLL2 clock. Due to MPLL2 running slightly faster than 500MHz
> the common clock framework chooses dividers which are too big to
> generate the 250MHz and 25MHz clocks. Emiliano Ingrassia observed that
> the divider for the 250MHz clock was set to 0x5 which results in a clock
> rate of close to 100MHz instead of 250MHz. The divider for the 25MHz
> clock is set to 0x0 (which means "divide by 5") so the resulting RGMII
> clock is running at 20MHz (plus a few additional Hz). The RTL8211F PHY
> on Odroid-C1 however fails to operate with a 20MHz RGMII clock.
> 
> Round the divider's clock rates to prevent this issue on Meson8b. This
> means we'll now end up with a clock rate of 25000119Hz (= 25MHz plus
> 119Hz).
> This has no effect on the Meson GX SoCs since there fclk_div2 is used as
> input clock, which has a rate of 1000MHz (and thus is divisible cleanly
> to 250MHz and 25MHz).
> 
> Fixes: 566e8251625304 ("net: stmmac: add a glue driver for the Amlogic Meson 8b / GXBB DWMAC")
> Reported-by: Emiliano Ingrassia <ingrassia@epigenesys.com>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
> index 4404650b32c5..c71966332387 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
> @@ -144,7 +144,9 @@ static int meson8b_init_clk(struct meson8b_dwmac *dwmac)
>  	dwmac->m250_div.shift = PRG_ETH0_CLK_M250_DIV_SHIFT;
>  	dwmac->m250_div.width = PRG_ETH0_CLK_M250_DIV_WIDTH;
>  	dwmac->m250_div.hw.init = &init;
> -	dwmac->m250_div.flags = CLK_DIVIDER_ONE_BASED | CLK_DIVIDER_ALLOW_ZERO;
> +	dwmac->m250_div.flags = CLK_DIVIDER_ONE_BASED |
> +				CLK_DIVIDER_ALLOW_ZERO |
> +				CLK_DIVIDER_ROUND_CLOSEST;
>  
>  	dwmac->m250_div_clk = devm_clk_register(dev, &dwmac->m250_div.hw);
>  	if (WARN_ON(IS_ERR(dwmac->m250_div_clk)))
> @@ -164,7 +166,8 @@ static int meson8b_init_clk(struct meson8b_dwmac *dwmac)
>  	dwmac->m25_div.width = PRG_ETH0_CLK_M25_DIV_WIDTH;
>  	dwmac->m25_div.table = clk_25m_div_table;
>  	dwmac->m25_div.hw.init = &init;
> -	dwmac->m25_div.flags = CLK_DIVIDER_ALLOW_ZERO;
> +	dwmac->m25_div.flags = CLK_DIVIDER_ALLOW_ZERO |
> +				CLK_DIVIDER_ROUND_CLOSEST;
>  
>  	dwmac->m25_div_clk = devm_clk_register(dev, &dwmac->m25_div.hw);
>  	if (WARN_ON(IS_ERR(dwmac->m25_div_clk)))
> -- 
> 2.15.1
> 
