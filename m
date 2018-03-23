From: hverkuil@xs4all.nl (Hans Verkuil)
Date: Fri, 23 Mar 2018 13:59:14 +0100
Subject: [PATCHv2 2/3] drm: bridge: dw-hdmi: check the cec-disable property
In-Reply-To: <20180323125915.13986-1-hverkuil@xs4all.nl>
References: <20180323125915.13986-1-hverkuil@xs4all.nl>
Message-ID: <20180323125915.13986-3-hverkuil@xs4all.nl>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

From: Hans Verkuil <hans.verkuil@cisco.com>

If the cec-disable property was set, then disable the DW CEC
controller. This is needed for boards that have their own
CEC controller.

Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index a38db40ce990..597220e40541 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2508,7 +2508,8 @@ __dw_hdmi_probe(struct platform_device *pdev,
 		hdmi->audio = platform_device_register_full(&pdevinfo);
 	}
 
-	if (config0 & HDMI_CONFIG0_CEC) {
+	if ((config0 & HDMI_CONFIG0_CEC) &&
+	    !of_property_read_bool(np, "cec-disable")) {
 		cec.hdmi = hdmi;
 		cec.ops = &dw_hdmi_cec_ops;
 		cec.irq = irq;
-- 
2.15.1
