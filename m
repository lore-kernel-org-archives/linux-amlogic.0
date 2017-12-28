From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Thu, 28 Dec 2017 23:21:28 +0100
Subject: [RFT net-next v3 5/5] net: stmmac: dwmac-meson8b: propagate rate
 changes to the parent clock
In-Reply-To: <20171228222128.15215-1-martin.blumenstingl@googlemail.com>
References: <20171228222128.15215-1-martin.blumenstingl@googlemail.com>
Message-ID: <20171228222128.15215-6-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Meson8b the only valid input clock is MPLL2. The bootloader
configures that to run at 500002394Hz which cannot be divided evenly
down to 25MHz using the m250_div and m25_div clocks. Currently the
common clock framework chooses a m250_div of 2 - with the internal fixed
"divide by 10" this results in a RGMII clock of 25000120Hz (120Hz above
the requested 25MHz).

Letting the common clock framework propagate the rate changes up to the
parent of m250_mux allows us to get the best possible clock rate. With
this patch the common clock framework calculates a rate of
very-close-to-250MHz (249999701Hz to be exact) for the MPLL2 clock
(which is the mux input). Dividing that by 1 (using m250_div) along with
the internal fixed divide-by-10 gives us a RGMII clock of 24999970Hz
(which is only 30Hz off the requested 25MHz, compared to 120Hz from
u-boot and the vendor driver).

SoCs from the Meson GX series are not affected by this change because
the input clock is FCLK_DIV2 whose rate cannot be changed (which is fine
since it's running at 1GHz, thus it's a multiple of 250MHz).

Fixes: 566e8251625304 ("net: stmmac: add a glue driver for the Amlogic Meson 8b / GXBB DWMAC")
Suggested-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index d06106417063..9c3cdfef414a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
@@ -111,7 +111,7 @@ static int meson8b_init_rgmii_clk(struct meson8b_dwmac *dwmac)
 	init.name = devm_kasprintf(dev, GFP_KERNEL, "%s#m250_sel",
 				   dev_name(dev));
 	init.ops = &clk_mux_ops;
-	init.flags = 0;
+	init.flags = CLK_SET_RATE_PARENT;
 	init.parent_names = mux_parent_names;
 	init.num_parents = MUX_CLK_NUM_PARENTS;
 
-- 
2.15.1
