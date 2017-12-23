From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sun, 24 Dec 2017 00:40:59 +0100
Subject: [RFT net-next v2 2/3] net: stmmac: dwmac-meson8b: fix setting the
 RGMII clock on Meson8b
In-Reply-To: <20171223234100.11814-1-martin.blumenstingl@googlemail.com>
References: <20171223234100.11814-1-martin.blumenstingl@googlemail.com>
Message-ID: <20171223234100.11814-3-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Meson8b only supports MPLL2 as clock input. The rate of the MPLL2 clock
set by Odroid-C1's u-boot is close to 500MHz. The exact rate is
500002394Hz, which is calculated in drivers/clk/meson/clk-mpll.c
using the following formula:
DIV_ROUND_UP_ULL((u64)parent_rate * SDM_DEN, (SDM_DEN * n2) + sdm)
Odroid-C1's u-boot configures MPLL2 with the following values:
- SDM_DEN = 16384
- SDM = 1638
- N2 = 5

The 250MHz and 25MHz clocks inside dwmac-meson8b driver are derived
from the MPLL2 clock. Due to MPLL2 running slightly faster than 500MHz
the common clock framework chooses dividers which are too big to
generate the 250MHz and 25MHz clocks. Emiliano Ingrassia observed that
the divider for the 250MHz clock was set to 0x5 which results in a clock
rate of close to 100MHz instead of 250MHz. The divider for the 25MHz
clock is set to 0x0 (which means "divide by 5") so the resulting RGMII
clock is running at 20MHz (plus a few additional Hz). The RTL8211F PHY
on Odroid-C1 however fails to operate with a 20MHz RGMII clock.

Round the divider's clock rates to prevent this issue on Meson8b. This
means we'll now end up with a clock rate of 25000120Hz (= 25MHz plus
120Hz).
This has no effect on the Meson GX SoCs since there fclk_div2 is used as
input clock, which has a rate of 1000MHz (and thus is divisible cleanly
to 250MHz and 25MHz).

Fixes: 566e8251625304 ("net: stmmac: add a glue driver for the Amlogic Meson 8b / GXBB DWMAC")
Reported-by: Emiliano Ingrassia <ingrassia@epigenesys.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index e1d5907e481c..0da551c84fe8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
@@ -144,7 +144,9 @@ static int meson8b_init_rgmii_clk(struct meson8b_dwmac *dwmac)
 	dwmac->m250_div.shift = PRG_ETH0_CLK_M250_DIV_SHIFT;
 	dwmac->m250_div.width = PRG_ETH0_CLK_M250_DIV_WIDTH;
 	dwmac->m250_div.hw.init = &init;
-	dwmac->m250_div.flags = CLK_DIVIDER_ONE_BASED | CLK_DIVIDER_ALLOW_ZERO;
+	dwmac->m250_div.flags = CLK_DIVIDER_ONE_BASED |
+				CLK_DIVIDER_ALLOW_ZERO |
+				CLK_DIVIDER_ROUND_CLOSEST;
 
 	dwmac->m250_div_clk = devm_clk_register(dev, &dwmac->m250_div.hw);
 	if (WARN_ON(IS_ERR(dwmac->m250_div_clk)))
@@ -164,7 +166,8 @@ static int meson8b_init_rgmii_clk(struct meson8b_dwmac *dwmac)
 	dwmac->m25_div.width = PRG_ETH0_CLK_M25_DIV_WIDTH;
 	dwmac->m25_div.table = clk_25m_div_table;
 	dwmac->m25_div.hw.init = &init;
-	dwmac->m25_div.flags = CLK_DIVIDER_ALLOW_ZERO;
+	dwmac->m25_div.flags = CLK_DIVIDER_ALLOW_ZERO |
+				CLK_DIVIDER_ROUND_CLOSEST;
 
 	dwmac->m25_div_clk = devm_clk_register(dev, &dwmac->m25_div.hw);
 	if (WARN_ON(IS_ERR(dwmac->m25_div_clk)))
-- 
2.15.1
