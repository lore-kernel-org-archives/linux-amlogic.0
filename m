From: narmstrong@baylibre.com (Neil Armstrong)
Date: Thu,  6 Jul 2017 12:33:06 +0200
Subject: [PATCH] drm/bridge: dw_hdmi: add cec notifier support
Message-ID: <1499337186-24429-1-git-send-email-narmstrong@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

From: Russell King <rmk+kernel@armlinux.org.uk>

Add CEC notifier support to the HDMI bridge driver, so that the CEC
part of the IP can receive its physical address.

Tested-by: Neil Armstrong <narmstrong@baylibre.com>
Acked-by: Neil Armstrong <narmstrong@baylibre.com>
Acked-by: Hans Verkuil <hans.verkuil@cisco.com>
Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

Hi Archit, Hans,

This is repost of Russell's patch from his dw-hdmi CEC patchset.

Since his CEC implementation will be integrated in the bridge driver,
this notifier patch won't be re-posted.

But the Amlogic Platform needs a notifier since it uses a standalone CEC
controller.

Thanks,
Neil

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index ead1124..9c03846 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -33,6 +33,8 @@
 #include <uapi/linux/media-bus-format.h>
 #include <uapi/linux/videodev2.h>
 
+#include <media/cec-notifier.h>
+
 #include "dw-hdmi.h"
 #include "dw-hdmi-audio.h"
 
@@ -175,6 +177,8 @@ struct dw_hdmi {
 	struct regmap *regm;
 	void (*enable_audio)(struct dw_hdmi *hdmi);
 	void (*disable_audio)(struct dw_hdmi *hdmi);
+
+	struct cec_notifier *cec_notifier;
 };
 
 #define HDMI_IH_PHY_STAT0_RX_SENSE \
@@ -1896,6 +1900,7 @@ static int dw_hdmi_connector_get_modes(struct drm_connector *connector)
 		hdmi->sink_is_hdmi = drm_detect_hdmi_monitor(edid);
 		hdmi->sink_has_audio = drm_detect_monitor_audio(edid);
 		drm_mode_connector_update_edid_property(connector, edid);
+		cec_notifier_set_phys_addr_from_edid(hdmi->cec_notifier, edid);
 		ret = drm_add_edid_modes(connector, edid);
 		/* Store the ELD */
 		drm_edid_to_eld(connector, edid);
@@ -2077,6 +2082,10 @@ void __dw_hdmi_setup_rx_sense(struct dw_hdmi *hdmi, bool hpd, bool rx_sense)
 		dw_hdmi_update_phy_mask(hdmi);
 	}
 	mutex_unlock(&hdmi->mutex);
+
+	if (!rx_sense && !hpd)
+		cec_notifier_set_phys_addr(hdmi->cec_notifier,
+					   CEC_PHYS_ADDR_INVALID);
 }
 
 void dw_hdmi_setup_rx_sense(struct device *dev, bool hpd, bool rx_sense)
@@ -2376,6 +2385,12 @@ static int dw_hdmi_detect_phy(struct dw_hdmi *hdmi)
 	if (ret)
 		goto err_iahb;
 
+	hdmi->cec_notifier = cec_notifier_get(dev);
+	if (!hdmi->cec_notifier) {
+		ret = -ENOMEM;
+		goto err_iahb;
+	}
+
 	/*
 	 * To prevent overflows in HDMI_IH_FC_STAT2, set the clk regenerator
 	 * N and cts values before enabling phy
@@ -2452,6 +2467,9 @@ static int dw_hdmi_detect_phy(struct dw_hdmi *hdmi)
 		hdmi->ddc = NULL;
 	}
 
+	if (hdmi->cec_notifier)
+		cec_notifier_put(hdmi->cec_notifier);
+
 	clk_disable_unprepare(hdmi->iahb_clk);
 err_isfr:
 	clk_disable_unprepare(hdmi->isfr_clk);
-- 
1.9.1
