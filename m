From: narmstrong@baylibre.com (Neil Armstrong)
Date: Wed, 28 Nov 2018 11:07:34 +0100
Subject: [PATCH v2] drm/meson: Fix an Alpha Primary Plane bug on Meson GXL/GXM
 SoCs
Message-ID: <20181128100734.6536-1-narmstrong@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On the Amlogic GXL & GXM SoCs, a bug occurs on the primary plane when
alpha is used where the alpha is not aligned with the pixel content.

The woraround Amlogic implemented is to reset the OSD1 plane hardware
block each time the plane is (re)enabled, solving the issue.

In the reset, we still need to save the content of 2 registers which
depends on the status of the plane, in addition to reload the scaler
conversion matrix at the same time.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
Changes since v1 at [1]:
- Fix flickering and shaking by moving reset when plane is disabled

[1] https://patchwork.freedesktop.org/patch/263550/

 drivers/gpu/drm/meson/meson_plane.c | 12 ++++++++++++
 drivers/gpu/drm/meson/meson_viu.c   | 27 +++++++++++++++++++++++++++
 drivers/gpu/drm/meson/meson_viu.h   |  1 +
 3 files changed, 40 insertions(+)

diff --git a/drivers/gpu/drm/meson/meson_plane.c b/drivers/gpu/drm/meson/meson_plane.c
index 12a47b4f65a5..8e27f275ece8 100644
--- a/drivers/gpu/drm/meson/meson_plane.c
+++ b/drivers/gpu/drm/meson/meson_plane.c
@@ -79,6 +79,7 @@
 struct meson_plane {
 	struct drm_plane base;
 	struct meson_drm *priv;
+	bool enabled;
 };
 #define to_meson_plane(x) container_of(x, struct meson_plane, base)
 
@@ -303,6 +304,15 @@ static void meson_plane_atomic_update(struct drm_plane *plane,
 	priv->viu.osd1_stride = fb->pitches[0];
 	priv->viu.osd1_height = fb->height;
 
+	if (!meson_plane->enabled) {
+		/* Reset OSD1 before enabling it on GXL+ SoCs */
+		if (meson_vpu_is_compatible(priv, "amlogic,meson-gxm-vpu") ||
+		    meson_vpu_is_compatible(priv, "amlogic,meson-gxl-vpu"))
+			meson_viu_osd1_reset(priv);
+
+		meson_plane->enabled = true;
+	}
+
 	spin_unlock_irqrestore(&priv->drm->event_lock, flags);
 }
 
@@ -316,6 +326,8 @@ static void meson_plane_atomic_disable(struct drm_plane *plane,
 	writel_bits_relaxed(VPP_OSD1_POSTBLEND, 0,
 			    priv->io_base + _REG(VPP_MISC));
 
+	meson_plane->enabled = false;
+
 }
 
 static const struct drm_plane_helper_funcs meson_plane_helper_funcs = {
diff --git a/drivers/gpu/drm/meson/meson_viu.c b/drivers/gpu/drm/meson/meson_viu.c
index 2dffb987ec65..0ba87ff95530 100644
--- a/drivers/gpu/drm/meson/meson_viu.c
+++ b/drivers/gpu/drm/meson/meson_viu.c
@@ -296,6 +296,33 @@ static void meson_viu_load_matrix(struct meson_drm *priv)
 				 true);
 }
 
+/* VIU OSD1 Reset as workaround for GXL+ Alpha OSD Bug */
+void meson_viu_osd1_reset(struct meson_drm *priv)
+{
+	uint32_t osd1_fifo_ctrl_stat, osd1_ctrl_stat2;
+
+	/* Save these 2 registers state */
+	osd1_fifo_ctrl_stat = readl_relaxed(
+				priv->io_base + _REG(VIU_OSD1_FIFO_CTRL_STAT));
+	osd1_ctrl_stat2 = readl_relaxed(
+				priv->io_base + _REG(VIU_OSD1_CTRL_STAT2));
+
+	/* Reset OSD1 */
+	writel_bits_relaxed(BIT(0), BIT(0),
+			    priv->io_base + _REG(VIU_SW_RESET));
+	writel_bits_relaxed(BIT(0), 0,
+			    priv->io_base + _REG(VIU_SW_RESET));
+
+	/* Rewrite these registers state lost in the reset */
+	writel_relaxed(osd1_fifo_ctrl_stat,
+		       priv->io_base + _REG(VIU_OSD1_FIFO_CTRL_STAT));
+	writel_relaxed(osd1_ctrl_stat2,
+		       priv->io_base + _REG(VIU_OSD1_CTRL_STAT2));
+
+	/* Reload the conversion matrix */
+	meson_viu_load_matrix(priv);
+}
+
 void meson_viu_init(struct meson_drm *priv)
 {
 	uint32_t reg;
diff --git a/drivers/gpu/drm/meson/meson_viu.h b/drivers/gpu/drm/meson/meson_viu.h
index 073b1910bd1b..0f84bddd2ff0 100644
--- a/drivers/gpu/drm/meson/meson_viu.h
+++ b/drivers/gpu/drm/meson/meson_viu.h
@@ -59,6 +59,7 @@
 #define OSD_REPLACE_EN		BIT(14)
 #define OSD_REPLACE_SHIFT	6
 
+void meson_viu_osd1_reset(struct meson_drm *priv);
 void meson_viu_init(struct meson_drm *priv);
 
 #endif /* __MESON_VIU_H */
-- 
2.19.2
