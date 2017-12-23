From: jbrunet@baylibre.com (Jerome Brunet)
Date: Sat, 23 Dec 2017 18:32:08 +0100
Subject: [RFT net-next 1/2] net: stmmac: dwmac-meson8b: fix setting the
 PHY clock on Meson8b
In-Reply-To: <20171223170433.8150-2-martin.blumenstingl@googlemail.com>
References: <20171223170433.8150-1-martin.blumenstingl@googlemail.com>
 <20171223170433.8150-2-martin.blumenstingl@googlemail.com>
Message-ID: <1514050328.29566.45.camel@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Sat, 2017-12-23 at 18:04 +0100, Martin Blumenstingl wrote:
> Meson8b only supports MPLL2 as clock input. The rate of the MPLL2 clock
> set by Odroid-C1's u-boot is close to 500MHz. The exact rate is
> 500002394Hz, which is calculated in drivers/clk/meson/clk-mpll.c
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
> means we'll now end up with a clock rate of 25000120Hz (= 25MHz plus
> 120Hz).
> This has no effect on the Meson GX SoCs since there fclk_div2 is used as
> input clock, which has a rate of 1000MHz (and thus is divisible cleanly
> to 250MHz and 25MHz).
> 
> Fixes: 566e8251625304 ("net: stmmac: add a glue driver for the Amlogic Meson 8b / GXBB DWMAC")
> Reported-by: Emiliano Ingrassia <ingrassia@epigenesys.com>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Makes sense to add ROUND_CLOSEST (no risk if the rate is slightly over the
requested one)

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
