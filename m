From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sun, 14 Jan 2018 22:48:57 +0100
Subject: [RFT net-next v4 4/5] net: stmmac: dwmac-meson8b: fix setting the
 RGMII TX clock on Meson8b
In-Reply-To: <20180114214858.7217-1-martin.blumenstingl@googlemail.com>
References: <20180114214858.7217-1-martin.blumenstingl@googlemail.com>
Message-ID: <20180114214858.7217-5-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Meson8b only supports MPLL2 as clock input. The rate of the MPLL2 clock
set by Odroid-C1's u-boot is close to (but not exactly) 500MHz. The
exact rate is 500002394Hz, which is calculated in
drivers/clk/meson/clk-mpll.c using the following formula:
DIV_ROUND_UP_ULL((u64)parent_rate * SDM_DEN, (SDM_DEN * n2) + sdm)
Odroid-C1's u-boot configures MPLL2 with the following values:
- SDM_DEN = 16384
- SDM = 1638
- N2 = 5

The 250MHz clock (m250_div) inside dwmac-meson8b driver is derived from
the MPLL2 clock. Due to MPLL2 running slightly faster than 500MHz the
common clock framework chooses a divider which is too big to generate
the 250MHz clock (a divider of 2 would be needed, but this is rounded up
to a divider of 3). This breaks the RTL8211F RGMII PHY on Odroid-C1
because it requires a (close to) 125MHz RGMII TX clock (on Gbit speeds,
the IP block internally divides that down to 25MHz on 100Mbit/s
connections and 2.5MHz on 10Mbit/s connections - we don't need any
special configuration for that).

Round the divider to the closest value to prevent this issue on Meson8b.
This means we'll now end up with a clock rate for the RGMII TX clock of
125001197Hz (= 125MHz plus 1197Hz), which is close-enough to 125MHz.
This has no effect on the Meson GX SoCs since there fclk_div2 is used as
input clock, which has a rate of 1000MHz (and thus is divisible cleanly
to 250MHz and 125MHz).

Fixes: 566e8251625304 ("net: stmmac: add a glue driver for the Amlogic Meson 8b / GXBB DWMAC")
Reported-by: Emiliano Ingrassia <ingrassia@epigenesys.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index e9fec9e0425c..e30ad05d6a6e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
@@ -139,7 +139,9 @@ static int meson8b_init_rgmii_tx_clk(struct meson8b_dwmac *dwmac)
 	dwmac->m250_div.shift = PRG_ETH0_CLK_M250_DIV_SHIFT;
 	dwmac->m250_div.width = PRG_ETH0_CLK_M250_DIV_WIDTH;
 	dwmac->m250_div.hw.init = &init;
-	dwmac->m250_div.flags = CLK_DIVIDER_ONE_BASED | CLK_DIVIDER_ALLOW_ZERO;
+	dwmac->m250_div.flags = CLK_DIVIDER_ONE_BASED |
+				CLK_DIVIDER_ALLOW_ZERO |
+				CLK_DIVIDER_ROUND_CLOSEST;
 
 	dwmac->m250_div_clk = devm_clk_register(dev, &dwmac->m250_div.hw);
 	if (WARN_ON(IS_ERR(dwmac->m250_div_clk)))
-- 
2.15.1
