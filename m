From: narmstrong@baylibre.com (Neil Armstrong)
Date: Thu, 14 Jun 2018 13:43:40 +0200
Subject: [PATCH u-boot 4/5] meson: use the clock driver
In-Reply-To: <1528976621-8397-1-git-send-email-narmstrong@baylibre.com>
References: <1528976621-8397-1-git-send-email-narmstrong@baylibre.com>
Message-ID: <1528976621-8397-5-git-send-email-narmstrong@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

From: Beniamino Galvani <b.galvani@gmail.com>

Use the clk framework to initialize clocks from drivers that need them
instead of having hardcoded frequencies and initializations from board
code.

Signed-off-by: Beniamino Galvani <b.galvani@gmail.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm/include/asm/arch-meson/gx.h      | 10 ----------
 arch/arm/mach-meson/eth.c                 |  3 +--
 board/amlogic/libretech-cc/libretech-cc.c |  4 ----
 board/amlogic/odroid-c2/odroid-c2.c       |  3 ---
 drivers/i2c/meson_i2c.c                   | 20 +++++++++++++++++---
 5 files changed, 18 insertions(+), 22 deletions(-)

diff --git a/arch/arm/include/asm/arch-meson/gx.h b/arch/arm/include/asm/arch-meson/gx.h
index 03fb6b0..4bc9475 100644
--- a/arch/arm/include/asm/arch-meson/gx.h
+++ b/arch/arm/include/asm/arch-meson/gx.h
@@ -56,14 +56,4 @@
 /* Ethernet memory power domain */
 #define GX_MEM_PD_REG_0_ETH_MASK	(BIT(2) | BIT(3))
 
-/* Clock gates */
-#define GX_GCLK_MPEG_0	GX_HIU_ADDR(0x50)
-#define GX_GCLK_MPEG_1	GX_HIU_ADDR(0x51)
-#define GX_GCLK_MPEG_2	GX_HIU_ADDR(0x52)
-#define GX_GCLK_MPEG_OTHER	GX_HIU_ADDR(0x53)
-#define GX_GCLK_MPEG_AO	GX_HIU_ADDR(0x54)
-
-#define GX_GCLK_MPEG_0_I2C   BIT(9)
-#define GX_GCLK_MPEG_1_ETH	BIT(3)
-
 #endif /* __GX_H__ */
diff --git a/arch/arm/mach-meson/eth.c b/arch/arm/mach-meson/eth.c
index 061f19a..8b28bc8 100644
--- a/arch/arm/mach-meson/eth.c
+++ b/arch/arm/mach-meson/eth.c
@@ -48,7 +48,6 @@ void meson_gx_eth_init(phy_interface_t mode, unsigned int flags)
 		return;
 	}
 
-	/* Enable power and clock gate */
-	setbits_le32(GX_GCLK_MPEG_1, GX_GCLK_MPEG_1_ETH);
+	/* Enable power gate */
 	clrbits_le32(GX_MEM_PD_REG_0, GX_MEM_PD_REG_0_ETH_MASK);
 }
diff --git a/board/amlogic/libretech-cc/libretech-cc.c b/board/amlogic/libretech-cc/libretech-cc.c
index e89bf77..ccab127 100644
--- a/board/amlogic/libretech-cc/libretech-cc.c
+++ b/board/amlogic/libretech-cc/libretech-cc.c
@@ -32,10 +32,6 @@ int misc_init_r(void)
 	meson_gx_eth_init(PHY_INTERFACE_MODE_RMII,
 			  MESON_GXL_USE_INTERNAL_RMII_PHY);
 
-	/* Enable power and clock gate */
-	setbits_le32(GX_GCLK_MPEG_1, GX_GCLK_MPEG_1_ETH);
-	clrbits_le32(GX_MEM_PD_REG_0, GX_MEM_PD_REG_0_ETH_MASK);
-
 	if (!eth_env_get_enetaddr("ethaddr", mac_addr)) {
 		len = meson_sm_read_efuse(EFUSE_MAC_OFFSET,
 					  mac_addr, EFUSE_MAC_SIZE);
diff --git a/board/amlogic/odroid-c2/odroid-c2.c b/board/amlogic/odroid-c2/odroid-c2.c
index 1b7fd81..c47b9ce 100644
--- a/board/amlogic/odroid-c2/odroid-c2.c
+++ b/board/amlogic/odroid-c2/odroid-c2.c
@@ -30,9 +30,6 @@ int misc_init_r(void)
 
 	meson_gx_eth_init(PHY_INTERFACE_MODE_RGMII, 0);
 
-	/* Enable power and clock gate */
-	setbits_le32(GX_GCLK_MPEG_0, GX_GCLK_MPEG_0_I2C);
-
 	/* Reset PHY on GPIOZ_14 */
 	clrbits_le32(GX_GPIO_EN(3), BIT(14));
 	clrbits_le32(GX_GPIO_OUT(3), BIT(14));
diff --git a/drivers/i2c/meson_i2c.c b/drivers/i2c/meson_i2c.c
index 8c9318d..7d06d95 100644
--- a/drivers/i2c/meson_i2c.c
+++ b/drivers/i2c/meson_i2c.c
@@ -3,8 +3,8 @@
  * (C) Copyright 2017 - Beniamino Galvani <b.galvani@gmail.com>
  */
 #include <common.h>
-#include <asm/arch/i2c.h>
 #include <asm/io.h>
+#include <clk.h>
 #include <dm.h>
 #include <i2c.h>
 
@@ -42,6 +42,7 @@ struct i2c_regs {
 };
 
 struct meson_i2c {
+	struct clk clk;
 	struct i2c_regs *regs;
 	struct i2c_msg *msg;	/* Current I2C message */
 	bool last;		/* Whether the message is the last */
@@ -221,9 +222,13 @@ static int meson_i2c_xfer(struct udevice *bus, struct i2c_msg *msg,
 static int meson_i2c_set_bus_speed(struct udevice *bus, unsigned int speed)
 {
 	struct meson_i2c *i2c = dev_get_priv(bus);
-	unsigned int clk_rate = MESON_I2C_CLK_RATE;
+	ulong clk_rate;
 	unsigned int div;
 
+	clk_rate = clk_get_rate(&i2c->clk);
+	if (IS_ERR_VALUE(clk_rate))
+		return -EINVAL;
+
 	div = DIV_ROUND_UP(clk_rate, speed * 4);
 
 	/* clock divider has 12 bits */
@@ -238,7 +243,7 @@ static int meson_i2c_set_bus_speed(struct udevice *bus, unsigned int speed)
 	clrsetbits_le32(&i2c->regs->ctrl, REG_CTRL_CLKDIVEXT_MASK,
 			(div >> 10) << REG_CTRL_CLKDIVEXT_SHIFT);
 
-	debug("meson i2c: set clk %u, src %u, div %u\n", speed, clk_rate, div);
+	debug("meson i2c: set clk %u, src %lu, div %u\n", speed, clk_rate, div);
 
 	return 0;
 }
@@ -246,6 +251,15 @@ static int meson_i2c_set_bus_speed(struct udevice *bus, unsigned int speed)
 static int meson_i2c_probe(struct udevice *bus)
 {
 	struct meson_i2c *i2c = dev_get_priv(bus);
+	int ret;
+
+	ret = clk_get_by_index(bus, 0, &i2c->clk);
+	if (ret < 0)
+		return ret;
+
+	ret = clk_enable(&i2c->clk);
+	if (ret)
+		return ret;
 
 	i2c->regs = dev_read_addr_ptr(bus);
 	clrbits_le32(&i2c->regs->ctrl, REG_CTRL_START);
-- 
2.7.4
