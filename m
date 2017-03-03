From: laurent.pinchart@ideasonboard.com (Laurent Pinchart)
Date: Fri, 03 Mar 2017 14:16:58 +0200
Subject: [PATCH v2 2/2] drm: bridge: Move HPD handling to PHY operations
In-Reply-To: <67b8ac3e-3227-8f32-7f20-0cd4b6d4510f@synopsys.com>
References: <1488468572-31971-1-git-send-email-narmstrong@baylibre.com>
 <952185cf-16b8-b987-4737-96c2db4a0f6c@baylibre.com>
 <67b8ac3e-3227-8f32-7f20-0cd4b6d4510f@synopsys.com>
Message-ID: <19854660.KZ12oiydRY@avalon>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Jose,

On Friday 03 Mar 2017 10:05:36 Jose Abreu wrote:
> On 03-03-2017 09:07, Neil Armstrong wrote:
> > The problem is that the HPD/RxSense is tied to this phy_mask and glued
> > into the dw-hdmi driver.
> > 
> > The *real* solution would be to completely separate the HPD/RxSense irq
> > handling to a separate driver as a shared irq...
> > 
> > If Jose is willing to give me some documentation and Freescale some
> > boards, I'll be happy to do it !
> 
> Hmm, why don't get rid of phy_mask totally and just return the
> new mask in update_hpd() function? Or add a get_hpd_status()
> callback. (I also think there are too many callbacks. For example
> we could have: setup, set_status, clear and then just use
> parameters when needed:
>     void setup(bool force, bool disabled, bool rxsense)
>     void set_status(bool enable, bool enable_ints)
>     void clear()
> 
> What do you think? I only checked quickly the code, don't know if
> this is enough.

For the record, that's more or less what I had in mind. The following
preparatory patch could be useful.

commit 5ceb6a93d78e21e5be195efe52c4c7e5578ac787
Author: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Date:   Fri Mar 3 14:14:56 2017 +0200

    drm: bridge: dw-hdmi: Extract PHY interrupt setup to a function
    
    In preparation for adding PHY operations to handle RX SENSE and HPD,
    group all the PHY interrupt setup code in a single location and extract
    it to a separate function.
    
    Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

diff --git a/drivers/gpu/drm/bridge/dw-hdmi.c b/drivers/gpu/drm/bridge/dw-hdmi.c
index 026a0dce7661..1ed8bc12eed7 100644
--- a/drivers/gpu/drm/bridge/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/dw-hdmi.c
@@ -1496,7 +1496,7 @@ static int dw_hdmi_setup(struct dw_hdmi *hdmi, struct drm_display_mode *mode)
 }
 
 /* Wait until we are registered to enable interrupts */
-static int dw_hdmi_fb_registered(struct dw_hdmi *hdmi)
+static void dw_hdmi_fb_registered(struct dw_hdmi *hdmi)
 {
 	hdmi_writeb(hdmi, HDMI_PHY_I2CM_INT_ADDR_DONE_POL,
 		    HDMI_PHY_I2CM_INT_ADDR);
@@ -1504,15 +1504,6 @@ static int dw_hdmi_fb_registered(struct dw_hdmi *hdmi)
 	hdmi_writeb(hdmi, HDMI_PHY_I2CM_CTLINT_ADDR_NAC_POL |
 		    HDMI_PHY_I2CM_CTLINT_ADDR_ARBITRATION_POL,
 		    HDMI_PHY_I2CM_CTLINT_ADDR);
-
-	/* enable cable hot plug irq */
-	hdmi_writeb(hdmi, hdmi->phy_mask, HDMI_PHY_MASK0);
-
-	/* Clear Hotplug interrupts */
-	hdmi_writeb(hdmi, HDMI_IH_PHY_STAT0_HPD | HDMI_IH_PHY_STAT0_RX_SENSE,
-		    HDMI_IH_PHY_STAT0);
-
-	return 0;
 }
 
 static void initialize_hdmi_ih_mutes(struct dw_hdmi *hdmi)
@@ -1630,6 +1621,26 @@ static void dw_hdmi_update_phy_mask(struct dw_hdmi *hdmi)
 		hdmi_writeb(hdmi, hdmi->phy_mask, HDMI_PHY_MASK0);
 }
 
+static void dw_hdmi_phy_setup_hpd(struct dw_hdmi *hdmi)
+{
+	/*
+	 * Configure the PHY RX SENSE and HPD interrupts polarities and clear
+	 * any pending interrupt.
+	 */
+	hdmi_writeb(hdmi, HDMI_PHY_HPD | HDMI_PHY_RX_SENSE, HDMI_PHY_POL0);
+	hdmi_writeb(hdmi, HDMI_IH_PHY_STAT0_HPD | HDMI_IH_PHY_STAT0_RX_SENSE,
+		    HDMI_IH_PHY_STAT0);
+
+	/* Enable cable hot plug irq. */
+	hdmi_writeb(hdmi, hdmi->phy_mask, HDMI_PHY_MASK0);
+
+	/* Clear and unmute interrupts. */
+	hdmi_writeb(hdmi, HDMI_IH_PHY_STAT0_HPD | HDMI_IH_PHY_STAT0_RX_SENSE,
+		    HDMI_IH_PHY_STAT0);
+	hdmi_writeb(hdmi, ~(HDMI_IH_PHY_STAT0_HPD | HDMI_IH_PHY_STAT0_RX_SENSE),
+		    HDMI_IH_MUTE_PHY_STAT0);
+}
+
 static enum drm_connector_status
 dw_hdmi_connector_detect(struct drm_connector *connector, bool force)
 {
@@ -2141,29 +2152,14 @@ __dw_hdmi_probe(struct platform_device *pdev,
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
-
 	hdmi->bridge.driver_private = hdmi;
 	hdmi->bridge.funcs = &dw_hdmi_bridge_funcs;
 #ifdef CONFIG_OF
 	hdmi->bridge.of_node = pdev->dev.of_node;
 #endif
 
-	ret = dw_hdmi_fb_registered(hdmi);
-	if (ret)
-		goto err_iahb;
-
-	/* Unmute interrupts */
-	hdmi_writeb(hdmi, ~(HDMI_IH_PHY_STAT0_HPD | HDMI_IH_PHY_STAT0_RX_SENSE),
-		    HDMI_IH_MUTE_PHY_STAT0);
+	dw_hdmi_fb_registered(hdmi);
+	dw_hdmi_phy_setup_hpd(hdmi);
 
 	memset(&pdevinfo, 0, sizeof(pdevinfo));
 	pdevinfo.parent = dev;


-- 
Regards,

Laurent Pinchart
