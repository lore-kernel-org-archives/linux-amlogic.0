From: narmstrong@baylibre.com (Neil Armstrong)
Date: Tue, 17 Jan 2017 13:31:31 +0100
Subject: [RFC/RFT PATCH 1/4] drm/bridge: dw-hdmi: Switch to regmap for
 register access
In-Reply-To: <1484656294-6140-1-git-send-email-narmstrong@baylibre.com>
References: <1484656294-6140-1-git-send-email-narmstrong@baylibre.com>
Message-ID: <1484656294-6140-2-git-send-email-narmstrong@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

The Synopsys Designware HDMI TX Controller does not enforce register access
on platforms instanciating it.
The current driver supports two different types of memory-mapped flat
register access, but in order to support the Amlogic Meson SoCs integration,
and provide a more generic way to handle all sorts of register mapping,
switch the register access to use the regmap infrastructure.

In the case of the registers are not flat memory-mapped or does not conform
at the actual driver implementation, a regmap struct can be given in the
plat_data and be used at probe or bind.

Since the AHB audio driver only uses direct memory access, using regmap only
allows the I2S audio driver to be registered.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/bridge/dw-hdmi.c | 105 +++++++++++++++++++++------------------
 include/drm/bridge/dw_hdmi.h     |   1 +
 2 files changed, 57 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/bridge/dw-hdmi.c b/drivers/gpu/drm/bridge/dw-hdmi.c
index ca9d0ce..13747fe 100644
--- a/drivers/gpu/drm/bridge/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/dw-hdmi.c
@@ -20,6 +20,7 @@
 #include <linux/mutex.h>
 #include <linux/of_device.h>
 #include <linux/spinlock.h>
+#include <linux/regmap.h>
 
 #include <drm/drm_of.h>
 #include <drm/drmP.h>
@@ -167,8 +168,7 @@ struct dw_hdmi {
 	unsigned int audio_n;
 	bool audio_enable;
 
-	void (*write)(struct dw_hdmi *hdmi, u8 val, int offset);
-	u8 (*read)(struct dw_hdmi *hdmi, int offset);
+	struct regmap *regm;
 };
 
 #define HDMI_IH_PHY_STAT0_RX_SENSE \
@@ -179,42 +179,23 @@ struct dw_hdmi {
 	(HDMI_PHY_RX_SENSE0 | HDMI_PHY_RX_SENSE1 | \
 	 HDMI_PHY_RX_SENSE2 | HDMI_PHY_RX_SENSE3)
 
-static void dw_hdmi_writel(struct dw_hdmi *hdmi, u8 val, int offset)
-{
-	writel(val, hdmi->regs + (offset << 2));
-}
-
-static u8 dw_hdmi_readl(struct dw_hdmi *hdmi, int offset)
-{
-	return readl(hdmi->regs + (offset << 2));
-}
-
-static void dw_hdmi_writeb(struct dw_hdmi *hdmi, u8 val, int offset)
-{
-	writeb(val, hdmi->regs + offset);
-}
-
-static u8 dw_hdmi_readb(struct dw_hdmi *hdmi, int offset)
-{
-	return readb(hdmi->regs + offset);
-}
-
 static inline void hdmi_writeb(struct dw_hdmi *hdmi, u8 val, int offset)
 {
-	hdmi->write(hdmi, val, offset);
+	regmap_write(hdmi->regm, offset, val);
 }
 
 static inline u8 hdmi_readb(struct dw_hdmi *hdmi, int offset)
 {
-	return hdmi->read(hdmi, offset);
+	unsigned int val = 0;
+
+	regmap_read(hdmi->regm, offset, &val);
+
+	return val;
 }
 
 static void hdmi_modb(struct dw_hdmi *hdmi, u8 data, u8 mask, unsigned reg)
 {
-	u8 val = hdmi_readb(hdmi, reg) & ~mask;
-
-	val |= data & mask;
-	hdmi_writeb(hdmi, val, reg);
+	regmap_update_bits(hdmi->regm, reg, mask, data);
 }
 
 static void hdmi_mask_writeb(struct dw_hdmi *hdmi, u8 data, unsigned int reg,
@@ -1949,6 +1930,21 @@ static int dw_hdmi_detect_phy(struct dw_hdmi *hdmi)
 	return 0;
 }
 
+static struct regmap_config hdmi_regmap_8bit_config = {
+	.reg_bits	= 32,
+	.val_bits	= 8,
+	.reg_stride	= 1,
+	.max_register	= HDMI_I2CM_FS_SCL_LCNT_0_ADDR,
+};
+
+static struct regmap_config hdmi_regmap_32bit_config = {
+	.reg_bits	= 8,
+	.pad_bits	= 24,
+	.val_bits	= 32,
+	.reg_stride	= 4,
+	.max_register	= HDMI_I2CM_FS_SCL_LCNT_0_ADDR,
+};
+
 static struct dw_hdmi *
 __dw_hdmi_probe(struct platform_device *pdev,
 		const struct dw_hdmi_plat_data *plat_data)
@@ -1958,7 +1954,8 @@ static int dw_hdmi_detect_phy(struct dw_hdmi *hdmi)
 	struct platform_device_info pdevinfo;
 	struct device_node *ddc_node;
 	struct dw_hdmi *hdmi;
-	struct resource *iores;
+	struct regmap_config *reg_config = &hdmi_regmap_8bit_config;
+	struct resource *iores = NULL;
 	int irq;
 	int ret;
 	u32 val = 1;
@@ -1982,20 +1979,21 @@ static int dw_hdmi_detect_phy(struct dw_hdmi *hdmi)
 	mutex_init(&hdmi->audio_mutex);
 	spin_lock_init(&hdmi->audio_lock);
 
-	of_property_read_u32(np, "reg-io-width", &val);
-
-	switch (val) {
-	case 4:
-		hdmi->write = dw_hdmi_writel;
-		hdmi->read = dw_hdmi_readl;
-		break;
-	case 1:
-		hdmi->write = dw_hdmi_writeb;
-		hdmi->read = dw_hdmi_readb;
-		break;
-	default:
-		dev_err(dev, "reg-io-width must be 1 or 4\n");
-		return ERR_PTR(-EINVAL);
+	if (plat_data->regm)
+		hdmi->regm = plat_data->regm;
+	else {
+		of_property_read_u32(np, "reg-io-width", &val);
+		switch (val) {
+		case 4:
+			reg_config = &hdmi_regmap_32bit_config;
+			break;
+		case 1:
+			reg_config = &hdmi_regmap_8bit_config;
+			break;
+		default:
+			dev_err(dev, "reg-io-width must be 1 or 4\n");
+			return ERR_PTR(-EINVAL);
+		}
 	}
 
 	ddc_node = of_parse_phandle(np, "ddc-i2c-bus", 0);
@@ -2011,11 +2009,20 @@ static int dw_hdmi_detect_phy(struct dw_hdmi *hdmi)
 		dev_dbg(hdmi->dev, "no ddc property found\n");
 	}
 
-	iores = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	hdmi->regs = devm_ioremap_resource(dev, iores);
-	if (IS_ERR(hdmi->regs)) {
-		ret = PTR_ERR(hdmi->regs);
-		goto err_res;
+	if (!plat_data->regm) {
+		iores = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+		hdmi->regs = devm_ioremap_resource(dev, iores);
+		if (IS_ERR(hdmi->regs)) {
+			ret = PTR_ERR(hdmi->regs);
+			goto err_res;
+		}
+
+		hdmi->regm = devm_regmap_init_mmio(dev, hdmi->regs, reg_config);
+		if (IS_ERR(hdmi->regm)) {
+			dev_err(dev, "Failed to configure regmap\n");
+			ret = PTR_ERR(hdmi->regm);
+			goto err_res;
+		}
 	}
 
 	hdmi->isfr_clk = devm_clk_get(hdmi->dev, "isfr");
@@ -2123,7 +2130,7 @@ static int dw_hdmi_detect_phy(struct dw_hdmi *hdmi)
 	config0 = hdmi_readb(hdmi, HDMI_CONFIG0_ID);
 	config3 = hdmi_readb(hdmi, HDMI_CONFIG3_ID);
 
-	if (config3 & HDMI_CONFIG3_AHBAUDDMA) {
+	if (iores && config3 & HDMI_CONFIG3_AHBAUDDMA) {
 		struct dw_hdmi_audio_data audio;
 
 		audio.phys = iores->start;
diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
index 735a8ab..163842d 100644
--- a/include/drm/bridge/dw_hdmi.h
+++ b/include/drm/bridge/dw_hdmi.h
@@ -60,6 +60,7 @@ struct dw_hdmi_plat_data {
 			     unsigned long mpixelclock);
 	enum drm_mode_status (*mode_valid)(struct drm_connector *connector,
 					   struct drm_display_mode *mode);
+	struct regmap *regm;
 };
 
 int dw_hdmi_probe(struct platform_device *pdev,
-- 
1.9.1
