From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sun, 24 Dec 2017 00:41:00 +0100
Subject: [RFT net-next v2 3/3] net: stmmac: dwmac-meson8b: propagate rate
 changes to the parent clock
In-Reply-To: <20171223234100.11814-1-martin.blumenstingl@googlemail.com>
References: <20171223234100.11814-1-martin.blumenstingl@googlemail.com>
Message-ID: <20171223234100.11814-4-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Meson8b the only valid input clock is MPLL2. The bootloader
configures that to run at 500002394Hz which cannot be divided evenly
down to 25MHz using the m250_div and m25_div clocks. Currently the
common clock framework chooses a m250_div of 2 and a m25_div of 10,
which results in a RGMII clock of 25000120Hz (120Hz above the requested
25MHz).

Letting the common clock framework propagate the rate changes from the
m25_div clock to m250_div clock to m250_mux to it's parent allows us to
get the best possible parent clock rate. With this patch the common clock
framework calculates a rate of close-to-125MHz (124999851Hz to be exact)
for the MPLL2 clock (which is the mux input). Dividing that by 5 (using
only the m25_div) gives us a RGMII clock of 24999971Hz (which is only
29Hz off the requested 25MHz, compared to 120Hz from u-boot and the
vendor driver).

For now we only want to propagate rate changes to make sure that the mux
parent is not changed automatically by the common clock framework. This
is just to keep the number of side-effects from this patch at a minimum.

SoCs from the Meson GX series are not affected by this change because
the input clock is FCLK_DIV2 whose rate cannot be changed. Additionally
the GX SoCs don't need to use the "closest" divider since the parent
clock is a multiple of 250MHz.

Fixes: 566e8251625304 ("net: stmmac: add a glue driver for the Amlogic Meson 8b / GXBB DWMAC")
Suggested-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index 0da551c84fe8..e542c8a14f2a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
@@ -116,7 +116,7 @@ static int meson8b_init_rgmii_clk(struct meson8b_dwmac *dwmac)
 	snprintf(clk_name, sizeof(clk_name), "%s#m250_sel", dev_name(dev));
 	init.name = clk_name;
 	init.ops = &clk_mux_ops;
-	init.flags = 0;
+	init.flags = CLK_SET_RATE_PARENT;
 	init.parent_names = mux_parent_names;
 	init.num_parents = MUX_CLK_NUM_PARENTS;
 
-- 
2.15.1
