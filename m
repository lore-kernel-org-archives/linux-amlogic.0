From: narmstrong@baylibre.com (Neil Armstrong)
Date: Mon, 30 Jan 2017 12:05:16 +0100
Subject: [PATCH 2/4] drm: bridge: dw-hdmi: Add support for custom PHY handling
In-Reply-To: <1485774318-21916-1-git-send-email-narmstrong@baylibre.com>
References: <1485774318-21916-1-git-send-email-narmstrong@baylibre.com>
Message-ID: <1485774318-21916-3-git-send-email-narmstrong@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

The Synopsys DesignWare HDMI TX Controller support various Transceivers (PHY)
attached to the controller, but also allows fully custom PHYs to be connected.

Add PHY init and disable functions in phy_ops structure passed in plat_data
to handle fully custom PHY init or provide the default one.

Some custom PHYs also handles the HPD and RxSense separately and do not use
the internal signals exported in the Controller's IRQ stat, so a read_hpd
is provided to switch to HPD status polling.
To complete the implementation, add a function to mimic the Controllers
interrupt HPD and RxSense handling from the vendor PHY wrapper code.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/bridge/dw-hdmi.c | 145 +++++++++++++++++++++++++--------------
 include/drm/bridge/dw_hdmi.h     |  35 ++++++++++
 2 files changed, 127 insertions(+), 53 deletions(-)

diff --git a/drivers/gpu/drm/bridge/dw-hdmi.c b/drivers/gpu/drm/bridge/dw-hdmi.c
index 674ab05..a8083f4 100644
--- a/drivers/gpu/drm/bridge/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/dw-hdmi.c
@@ -85,24 +85,6 @@ enum hdmi_datamap {
 	{ 0x6756, 0x78ab, 0x2000, 0x0200 }
 };
 
-struct hdmi_vmode {
-	bool mdataenablepolarity;
-
-	unsigned int mpixelclock;
-	unsigned int mpixelrepetitioninput;
-	unsigned int mpixelrepetitionoutput;
-};
-
-struct hdmi_data_info {
-	unsigned int enc_in_format;
-	unsigned int enc_out_format;
-	unsigned int enc_color_depth;
-	unsigned int colorimetry;
-	unsigned int pix_repet_factor;
-	unsigned int hdcp_enable;
-	struct hdmi_vmode video_mode;
-};
-
 struct dw_hdmi_i2c {
 	struct i2c_adapter	adap;
 
@@ -144,6 +126,7 @@ struct dw_hdmi {
 	u8 edid[HDMI_EDID_LEN];
 	bool cable_plugin;
 
+	const struct dw_hdmi_phy_ops *phy_ops;
 	const struct dw_hdmi_phy_data *phy;
 	bool phy_enabled;
 
@@ -926,7 +909,8 @@ static void dw_hdmi_phy_sel_interface_control(struct dw_hdmi *hdmi, u8 enable)
 			 HDMI_PHY_CONF0_SELDIPIF_MASK);
 }
 
-static void dw_hdmi_phy_power_off(struct dw_hdmi *hdmi)
+static void dw_hdmi_phy_power_off(struct dw_hdmi *hdmi,
+				  const struct dw_hdmi_plat_data *pdata)
 {
 	if (hdmi->phy->gen == 1) {
 		dw_hdmi_phy_enable_tmds(hdmi, 0);
@@ -1006,14 +990,15 @@ static int hdmi_phy_configure_dwc_hdmi_3d_tx(struct dw_hdmi *hdmi,
 	return 0;
 }
 
-static int hdmi_phy_configure(struct dw_hdmi *hdmi)
+static int hdmi_phy_configure(struct dw_hdmi *hdmi,
+			      const struct dw_hdmi_plat_data *pdata,
+			      struct hdmi_data_info *hdmi_data)
 {
-	const struct dw_hdmi_plat_data *pdata = hdmi->plat_data;
-	unsigned long mpixelclock = hdmi->hdmi_data.video_mode.mpixelclock;
+	unsigned long mpixelclock = hdmi_data->video_mode.mpixelclock;
 	u8 val, msec;
 	int ret;
 
-	dw_hdmi_phy_power_off(hdmi);
+	dw_hdmi_phy_power_off(hdmi, pdata);
 
 	/* Leave low power consumption mode by asserting SVSRET. */
 	if (hdmi->phy->has_svsret)
@@ -1062,7 +1047,10 @@ static int hdmi_phy_configure(struct dw_hdmi *hdmi)
 	return 0;
 }
 
-static int dw_hdmi_phy_init(struct dw_hdmi *hdmi)
+static int dw_hdmi_phy_init(struct dw_hdmi *hdmi,
+			    const struct dw_hdmi_plat_data *pdata,
+			    struct drm_display_mode *mode,
+			    struct hdmi_data_info *hdmi_data)
 {
 	int i, ret;
 
@@ -1071,15 +1059,21 @@ static int dw_hdmi_phy_init(struct dw_hdmi *hdmi)
 		dw_hdmi_phy_sel_data_en_pol(hdmi, 1);
 		dw_hdmi_phy_sel_interface_control(hdmi, 0);
 
-		ret = hdmi_phy_configure(hdmi);
+		ret = hdmi_phy_configure(hdmi, pdata, hdmi_data);
 		if (ret)
 			return ret;
 	}
 
-	hdmi->phy_enabled = true;
 	return 0;
 }
 
+/* Synopsys DW-HDMI PHY Control Ops */
+const struct dw_hdmi_phy_ops dw_hdmi_phy_ops = {
+	.phy_init = dw_hdmi_phy_init,
+	.phy_disable = dw_hdmi_phy_power_off,
+};
+EXPORT_SYMBOL_GPL(dw_hdmi_phy_ops);
+
 static void hdmi_tx_hdcp_config(struct dw_hdmi *hdmi)
 {
 	u8 de;
@@ -1294,15 +1288,6 @@ static void hdmi_av_composer(struct dw_hdmi *hdmi,
 	hdmi_writeb(hdmi, vsync_len, HDMI_FC_VSYNCINWIDTH);
 }
 
-static void dw_hdmi_phy_disable(struct dw_hdmi *hdmi)
-{
-	if (!hdmi->phy_enabled)
-		return;
-
-	dw_hdmi_phy_power_off(hdmi);
-	hdmi->phy_enabled = false;
-}
-
 /* HDMI Initialization Step B.4 */
 static void dw_hdmi_enable_video_path(struct dw_hdmi *hdmi)
 {
@@ -1434,10 +1419,15 @@ static int dw_hdmi_setup(struct dw_hdmi *hdmi, struct drm_display_mode *mode)
 	/* HDMI Initialization Step B.1 */
 	hdmi_av_composer(hdmi, mode);
 
-	/* HDMI Initializateion Step B.2 */
-	ret = dw_hdmi_phy_init(hdmi);
-	if (ret)
-		return ret;
+	/* HDMI Initialization Step B.2 */
+	if (hdmi->phy_ops->phy_init) {
+		ret = hdmi->phy_ops->phy_init(hdmi, hdmi->plat_data,
+					      &hdmi->previous_mode,
+					      &hdmi->hdmi_data);
+		if (ret)
+			return ret;
+	}
+	hdmi->phy_enabled = true;
 
 	/* HDMI Initialization Step B.3 */
 	dw_hdmi_enable_video_path(hdmi);
@@ -1552,7 +1542,13 @@ static void dw_hdmi_poweron(struct dw_hdmi *hdmi)
 
 static void dw_hdmi_poweroff(struct dw_hdmi *hdmi)
 {
-	dw_hdmi_phy_disable(hdmi);
+	if (!hdmi->phy_enabled)
+		return;
+
+	if (hdmi->phy_ops->phy_disable)
+		hdmi->phy_ops->phy_disable(hdmi, hdmi->plat_data);
+
+	hdmi->phy_enabled = false;
 	hdmi->bridge_is_on = false;
 }
 
@@ -1594,6 +1590,10 @@ static void dw_hdmi_update_phy_mask(struct dw_hdmi *hdmi)
 {
 	u8 old_mask = hdmi->phy_mask;
 
+	/* Ignore if HPD/RxSense handling is done outside the controller */
+	if (hdmi->plat_data && hdmi->plat_data->read_hpd)
+		return;
+
 	if (hdmi->force || hdmi->disabled || !hdmi->rxsense)
 		hdmi->phy_mask |= HDMI_PHY_RX_SENSE;
 	else
@@ -1615,6 +1615,12 @@ static void dw_hdmi_update_phy_mask(struct dw_hdmi *hdmi)
 	dw_hdmi_update_phy_mask(hdmi);
 	mutex_unlock(&hdmi->mutex);
 
+	/* Use specialized callback if handled outside the controller */
+	if (hdmi->plat_data && hdmi->plat_data->read_hpd)
+		return hdmi->plat_data->read_hpd(hdmi, hdmi->plat_data) ?
+			connector_status_connected :
+			connector_status_disconnected;
+
 	return hdmi_readb(hdmi, HDMI_PHY_STAT0) & HDMI_PHY_HPD ?
 		connector_status_connected : connector_status_disconnected;
 }
@@ -1902,6 +1908,26 @@ static irqreturn_t dw_hdmi_irq(int irq, void *dev_id)
 	}
 };
 
+void dw_hdmi_setup_rx_sense(struct device *dev, bool hpd, bool rx_sense)
+{
+	struct dw_hdmi *hdmi = dev_get_drvdata(dev);
+
+	mutex_lock(&hdmi->mutex);
+
+	if (!hdmi->disabled && !hdmi->force) {
+		if (!rx_sense)
+			hdmi->rxsense = false;
+
+		if (hpd)
+			hdmi->rxsense = true;
+
+		dw_hdmi_update_power(hdmi);
+		dw_hdmi_update_phy_mask(hdmi);
+	}
+	mutex_unlock(&hdmi->mutex);
+}
+EXPORT_SYMBOL_GPL(dw_hdmi_setup_rx_sense);
+
 static int dw_hdmi_detect_phy(struct dw_hdmi *hdmi)
 {
 	unsigned int i;
@@ -1922,7 +1948,10 @@ static int dw_hdmi_detect_phy(struct dw_hdmi *hdmi)
 		return -ENODEV;
 	}
 
-	if (!hdmi->phy->configure && !hdmi->plat_data->configure_phy) {
+	/* Consider Vendor PHY using phy_ops to control the PHY init/disable */
+	if (hdmi->phy->type != DW_HDMI_PHY_VENDOR_PHY &&
+	    !hdmi->phy->configure &&
+	    !hdmi->plat_data->configure_phy) {
 		dev_err(hdmi->dev, "%s requires platform support\n",
 			hdmi->phy->name);
 		return -ENODEV;
@@ -2051,6 +2080,11 @@ static int dw_hdmi_detect_phy(struct dw_hdmi *hdmi)
 		goto err_isfr;
 	}
 
+	/* Fallback to default PHY ops */
+	hdmi->phy_ops = plat_data->phy_ops;
+	if (!hdmi->phy_ops)
+		hdmi->phy_ops = &dw_hdmi_phy_ops;
+
 	/* Product and revision IDs */
 	hdmi->version = (hdmi_readb(hdmi, HDMI_DESIGN_ID) << 8)
 		      | (hdmi_readb(hdmi, HDMI_REVISION_ID) << 0);
@@ -2101,15 +2135,18 @@ static int dw_hdmi_detect_phy(struct dw_hdmi *hdmi)
 			hdmi->ddc = NULL;
 	}
 
-	/*
-	 * Configure registers related to HDMI interrupt
-	 * generation before registering IRQ.
-	 */
-	hdmi_writeb(hdmi, HDMI_PHY_HPD | HDMI_PHY_RX_SENSE, HDMI_PHY_POL0);
-
-	/* Clear Hotplug interrupts */
-	hdmi_writeb(hdmi, HDMI_IH_PHY_STAT0_HPD | HDMI_IH_PHY_STAT0_RX_SENSE,
-		    HDMI_IH_PHY_STAT0);
+	/* Ignore if HPD/RxSense handling is done outside the controller */
+	if (!hdmi->plat_data || !hdmi->plat_data->read_hpd) {
+		/*
+		 * Configure registers related to HDMI interrupt
+		 * generation before registering IRQ.
+		 */
+		hdmi_writeb(hdmi, HDMI_PHY_HPD | HDMI_PHY_RX_SENSE, HDMI_PHY_POL0);
+
+		/* Clear Hotplug interrupts */
+		hdmi_writeb(hdmi, HDMI_IH_PHY_STAT0_HPD | HDMI_IH_PHY_STAT0_RX_SENSE,
+			    HDMI_IH_PHY_STAT0);
+	}
 
 	hdmi->bridge.driver_private = hdmi;
 	hdmi->bridge.funcs = &dw_hdmi_bridge_funcs;
@@ -2119,9 +2156,11 @@ static int dw_hdmi_detect_phy(struct dw_hdmi *hdmi)
 	if (ret)
 		goto err_iahb;
 
-	/* Unmute interrupts */
-	hdmi_writeb(hdmi, ~(HDMI_IH_PHY_STAT0_HPD | HDMI_IH_PHY_STAT0_RX_SENSE),
-		    HDMI_IH_MUTE_PHY_STAT0);
+	/* Ignore if HPD/RxSense handling is done outside the controller */
+	if (!hdmi->plat_data || !hdmi->plat_data->read_hpd)
+		/* Unmute interrupts */
+		hdmi_writeb(hdmi, ~(HDMI_IH_PHY_STAT0_HPD | HDMI_IH_PHY_STAT0_RX_SENSE),
+			    HDMI_IH_MUTE_PHY_STAT0);
 
 	memset(&pdevinfo, 0, sizeof(pdevinfo));
 	pdevinfo.parent = dev;
diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
index 163842d..5b5dfb6 100644
--- a/include/drm/bridge/dw_hdmi.h
+++ b/include/drm/bridge/dw_hdmi.h
@@ -13,6 +13,7 @@
 #include <drm/drmP.h>
 
 struct dw_hdmi;
+struct dw_hdmi_plat_data;
 
 enum {
 	DW_HDMI_RES_8,
@@ -51,13 +52,46 @@ struct dw_hdmi_phy_config {
 	u16 vlev_ctr;   /* voltage level control */
 };
 
+struct hdmi_vmode {
+	bool mdataenablepolarity;
+
+	unsigned int mpixelclock;
+	unsigned int mpixelrepetitioninput;
+	unsigned int mpixelrepetitionoutput;
+};
+
+struct hdmi_data_info {
+	unsigned int enc_in_format;
+	unsigned int enc_out_format;
+	unsigned int enc_color_depth;
+	unsigned int colorimetry;
+	unsigned int pix_repet_factor;
+	unsigned int hdcp_enable;
+	struct hdmi_vmode video_mode;
+};
+
+struct dw_hdmi_phy_ops {
+	int (*phy_init)(struct dw_hdmi *hdmi,
+			const struct dw_hdmi_plat_data *pdata,
+			struct drm_display_mode *mode,
+			struct hdmi_data_info *hdmi_data);
+	void (*phy_disable)(struct dw_hdmi *hdmi,
+			    const struct dw_hdmi_plat_data *pdata);
+};
+
+/* Synopsys DW-HDMI PHY Control Ops */
+extern const struct dw_hdmi_phy_ops dw_hdmi_phy_ops;
+
 struct dw_hdmi_plat_data {
 	const struct dw_hdmi_mpll_config *mpll_cfg;
 	const struct dw_hdmi_curr_ctrl *cur_ctr;
 	const struct dw_hdmi_phy_config *phy_config;
+	const struct dw_hdmi_phy_ops *phy_ops;
 	int (*configure_phy)(struct dw_hdmi *hdmi,
 			     const struct dw_hdmi_plat_data *pdata,
 			     unsigned long mpixelclock);
+	bool (*read_hpd)(struct dw_hdmi *hdmi,
+			 const struct dw_hdmi_plat_data *pdata);
 	enum drm_mode_status (*mode_valid)(struct drm_connector *connector,
 					   struct drm_display_mode *mode);
 	struct regmap *regm;
@@ -70,6 +104,7 @@ int dw_hdmi_probe(struct platform_device *pdev,
 int dw_hdmi_bind(struct platform_device *pdev, struct drm_encoder *encoder,
 		 const struct dw_hdmi_plat_data *plat_data);
 
+void dw_hdmi_setup_rx_sense(struct device *dev, bool hpd, bool rx_sense);
 void dw_hdmi_set_sample_rate(struct dw_hdmi *hdmi, unsigned int rate);
 void dw_hdmi_audio_enable(struct dw_hdmi *hdmi);
 void dw_hdmi_audio_disable(struct dw_hdmi *hdmi);
-- 
1.9.1
