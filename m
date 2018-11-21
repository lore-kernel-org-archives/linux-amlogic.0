From: narmstrong@baylibre.com (Neil Armstrong)
Date: Wed, 21 Nov 2018 18:15:25 +0100
Subject: [PATCH] drm/meson: Fixes for drm_crtc_vblank_on/off support
Message-ID: <20181121171525.6593-1-narmstrong@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Since Linux 4.17, calls to drm_crtc_vblank_on/off are mandatory, and we get
a warning when ctrc is disabled :
" driver forgot to call drm_crtc_vblank_off()"

But, the vsync IRQ was not totally disabled due the transient hardware
state and specific interrupt line thus adding proper IRQ masking from
the HHI system control registers.

Finally, due to changed in the atomic_disable code path with the updated
fbdev emulation, checking the crct state with an atomic_disable call
leads to warning in further atomic_begin() with a leftover event not cleared.

To Summarize :
- Make sure that the CRTC code will call the enable/disable_vblank hooks.
- *Really* mask the Vsync IRQ
- Allways consume the state event in atomic_disable()

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/meson_crtc.c | 6 +++++-
 drivers/gpu/drm/meson/meson_venc.c | 3 +++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/meson/meson_crtc.c b/drivers/gpu/drm/meson/meson_crtc.c
index d78168f979db..a300556248fe 100644
--- a/drivers/gpu/drm/meson/meson_crtc.c
+++ b/drivers/gpu/drm/meson/meson_crtc.c
@@ -107,6 +107,8 @@ static void meson_crtc_atomic_enable(struct drm_crtc *crtc,
 			    priv->io_base + _REG(VPP_MISC));
 
 	priv->viu.osd1_enabled = true;
+
+	drm_crtc_vblank_on(crtc);
 }
 
 static void meson_crtc_atomic_disable(struct drm_crtc *crtc,
@@ -117,6 +119,8 @@ static void meson_crtc_atomic_disable(struct drm_crtc *crtc,
 
 	DRM_DEBUG_DRIVER("\n");
 
+	drm_crtc_vblank_off(crtc);
+
 	priv->viu.osd1_enabled = false;
 	priv->viu.osd1_commit = false;
 
@@ -128,7 +132,7 @@ static void meson_crtc_atomic_disable(struct drm_crtc *crtc,
 			    VPP_VD1_PREBLEND | VPP_POSTBLEND_ENABLE, 0,
 			    priv->io_base + _REG(VPP_MISC));
 
-	if (crtc->state->event && !crtc->state->active) {
+	if (crtc->state->event) {
 		spin_lock_irq(&crtc->dev->event_lock);
 		drm_crtc_send_vblank_event(crtc, crtc->state->event);
 		spin_unlock_irq(&crtc->dev->event_lock);
diff --git a/drivers/gpu/drm/meson/meson_venc.c b/drivers/gpu/drm/meson/meson_venc.c
index 9be0376e0329..ab72ddda242d 100644
--- a/drivers/gpu/drm/meson/meson_venc.c
+++ b/drivers/gpu/drm/meson/meson_venc.c
@@ -71,6 +71,7 @@
  */
 
 /* HHI Registers */
+#define HHI_GCLK_MPEG2		0x148 /* 0x52 offset in data sheet */
 #define HHI_VDAC_CNTL0		0x2F4 /* 0xbd offset in data sheet */
 #define HHI_VDAC_CNTL1		0x2F8 /* 0xbe offset in data sheet */
 #define HHI_HDMI_PHY_CNTL0	0x3a0 /* 0xe8 offset in data sheet */
@@ -1663,10 +1664,12 @@ unsigned int meson_venci_get_field(struct meson_drm *priv)
 void meson_venc_enable_vsync(struct meson_drm *priv)
 {
 	writel_relaxed(2, priv->io_base + _REG(VENC_INTCTRL));
+	regmap_update_bits(priv->hhi, HHI_GCLK_MPEG2, BIT(25), BIT(25));
 }
 
 void meson_venc_disable_vsync(struct meson_drm *priv)
 {
+	regmap_update_bits(priv->hhi, HHI_GCLK_MPEG2, BIT(25), 0);
 	writel_relaxed(0, priv->io_base + _REG(VENC_INTCTRL));
 }
 
-- 
2.19.1
