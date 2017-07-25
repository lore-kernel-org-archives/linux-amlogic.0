From: daniel.vetter@ffwll.ch (Daniel Vetter)
Date: Tue, 25 Jul 2017 10:01:21 +0200
Subject: [PATCH 7/8] drm: Nuke drm_atomic_helper_connector_dpms
In-Reply-To: <20170725080122.20548-1-daniel.vetter@ffwll.ch>
References: <20170725080122.20548-1-daniel.vetter@ffwll.ch>
Message-ID: <20170725080122.20548-8-daniel.vetter@ffwll.ch>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

It's dead code, the core handles all this directly now.

The only special case is nouveau and tda988x which used one function
for both legacy modeset code and -nv50 atomic world instead of 2
vtables. But amounts to exactly the same.

v2: Rebase over the panel/brideg refactorings in stm/ltdc.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Archit Taneja <architt@codeaurora.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Peter Senna Tschudin <peter.senna@collabora.com>
Cc: Martin Donnelly <martin.donnelly@ge.com>
Cc: Martyn Welch <martyn.welch@collabora.co.uk>
Cc: Daniel Vetter <daniel.vetter@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Sean Paul <seanpaul@chromium.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Inki Dae <inki.dae@samsung.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Stefan Agner <stefan@agner.ch>
Cc: Alison Wang <alison.wang@freescale.com>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: CK Hu <ck.hu@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Carlo Caione <carlo@caione.org>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: Marek Vasut <marex@denx.de>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: Eric Anholt <eric@anholt.net>
Cc: Mark Yao <mark.yao@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Cc: Vincent Abriou <vincent.abriou@st.com>
Cc: Yannick Fertre <yannick.fertre@st.com>
Cc: Philippe Cornu <philippe.cornu@st.com>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: Jyri Sarha <jsarha@ti.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: John Stultz <john.stultz@linaro.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Jeffy Chen <jeffy.chen@rock-chips.com>
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: Yakir Yang <kuankuan.y@gmail.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>
Cc: Romain Perier <romain.perier@collabora.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Xinliang Liu <z.liuxinliang@hisilicon.com>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Rongrong Zou <zourongrong@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Hai Li <hali@codeaurora.org>
Cc: "Noralf Tr?nnes" <noralf@tronnes.org>
Cc: linux-arm-kernel at lists.infradead.org
Cc: linux-samsung-soc at vger.kernel.org
Cc: intel-gfx at lists.freedesktop.org
Cc: linux-mediatek at lists.infradead.org
Cc: linux-amlogic at lists.infradead.org
Cc: nouveau at lists.freedesktop.org
Cc: linux-renesas-soc at vger.kernel.org
Cc: linux-rockchip at lists.infradead.org
Cc: linux-tegra at vger.kernel.org
Cc: virtualization at lists.linux-foundation.org
Cc: zain wang <wzz@rock-chips.com>
Cc: Baoyou Xie <baoyou.xie@linaro.org>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |  1 -
 drivers/gpu/drm/bridge/analogix-anx78xx.c          |  1 -
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |  1 -
 drivers/gpu/drm/bridge/dumb-vga-dac.c              |  1 -
 .../drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c   |  1 -
 drivers/gpu/drm/bridge/nxp-ptn3460.c               |  1 -
 drivers/gpu/drm/bridge/panel.c                     |  1 -
 drivers/gpu/drm/bridge/parade-ps8622.c             |  1 -
 drivers/gpu/drm/bridge/sii902x.c                   |  1 -
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |  1 -
 drivers/gpu/drm/bridge/tc358767.c                  |  1 -
 drivers/gpu/drm/bridge/ti-tfp410.c                 |  1 -
 drivers/gpu/drm/drm_atomic_helper.c                | 79 ----------------------
 drivers/gpu/drm/exynos/exynos_drm_dpi.c            |  1 -
 drivers/gpu/drm/exynos/exynos_drm_dsi.c            |  1 -
 drivers/gpu/drm/exynos/exynos_drm_vidi.c           |  1 -
 drivers/gpu/drm/exynos/exynos_hdmi.c               |  1 -
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c          |  1 -
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c   |  1 -
 drivers/gpu/drm/i2c/tda998x_drv.c                  | 10 +--
 drivers/gpu/drm/i915/intel_crt.c                   |  1 -
 drivers/gpu/drm/i915/intel_dp.c                    |  1 -
 drivers/gpu/drm/i915/intel_dp_mst.c                |  1 -
 drivers/gpu/drm/i915/intel_dsi.c                   |  1 -
 drivers/gpu/drm/i915/intel_dvo.c                   |  1 -
 drivers/gpu/drm/i915/intel_hdmi.c                  |  1 -
 drivers/gpu/drm/i915/intel_lvds.c                  |  1 -
 drivers/gpu/drm/i915/intel_sdvo.c                  |  1 -
 drivers/gpu/drm/i915/intel_tv.c                    |  1 -
 drivers/gpu/drm/imx/imx-ldb.c                      |  1 -
 drivers/gpu/drm/imx/imx-tve.c                      |  1 -
 drivers/gpu/drm/imx/parallel-display.c             |  1 -
 drivers/gpu/drm/mediatek/mtk_dsi.c                 |  1 -
 drivers/gpu/drm/mediatek/mtk_hdmi.c                |  1 -
 drivers/gpu/drm/meson/meson_venc_cvbs.c            |  1 -
 drivers/gpu/drm/msm/dsi/dsi_manager.c              |  1 -
 drivers/gpu/drm/msm/edp/edp_connector.c            |  1 -
 drivers/gpu/drm/msm/hdmi/hdmi_connector.c          |  1 -
 drivers/gpu/drm/msm/mdp/mdp4/mdp4_lvds_connector.c |  1 -
 drivers/gpu/drm/mxsfb/mxsfb_out.c                  |  1 -
 drivers/gpu/drm/nouveau/nouveau_connector.c        | 12 +---
 drivers/gpu/drm/nouveau/nv50_display.c             |  1 -
 drivers/gpu/drm/omapdrm/omap_connector.c           |  1 -
 drivers/gpu/drm/pl111/pl111_connector.c            |  1 -
 drivers/gpu/drm/rcar-du/rcar_du_lvdscon.c          |  1 -
 drivers/gpu/drm/rockchip/cdn-dp-core.c             |  1 -
 drivers/gpu/drm/rockchip/dw-mipi-dsi.c             |  1 -
 drivers/gpu/drm/rockchip/inno_hdmi.c               |  1 -
 drivers/gpu/drm/sti/sti_dvo.c                      |  1 -
 drivers/gpu/drm/sti/sti_hda.c                      |  1 -
 drivers/gpu/drm/sti/sti_hdmi.c                     |  1 -
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |  1 -
 drivers/gpu/drm/sun4i/sun4i_rgb.c                  |  1 -
 drivers/gpu/drm/sun4i/sun4i_tv.c                   |  1 -
 drivers/gpu/drm/tegra/dsi.c                        |  1 -
 drivers/gpu/drm/tegra/hdmi.c                       |  1 -
 drivers/gpu/drm/tegra/rgb.c                        |  1 -
 drivers/gpu/drm/tegra/sor.c                        |  1 -
 drivers/gpu/drm/tilcdc/tilcdc_panel.c              |  1 -
 drivers/gpu/drm/tilcdc/tilcdc_tfp410.c             |  1 -
 drivers/gpu/drm/tinydrm/core/tinydrm-pipe.c        |  1 -
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |  1 -
 drivers/gpu/drm/vc4/vc4_vec.c                      |  1 -
 drivers/gpu/drm/virtio/virtgpu_display.c           |  1 -
 drivers/gpu/drm/zte/zx_hdmi.c                      |  1 -
 drivers/gpu/drm/zte/zx_tvenc.c                     |  1 -
 drivers/gpu/drm/zte/zx_vga.c                       |  1 -
 include/drm/drm_atomic_helper.h                    |  2 -
 68 files changed, 3 insertions(+), 164 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index ff9792d350c8..682c090fa3ed 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -786,7 +786,6 @@ adv7511_connector_detect(struct drm_connector *connector, bool force)
 }
 
 static struct drm_connector_funcs adv7511_connector_funcs = {
-	.dpms = drm_atomic_helper_connector_dpms,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.detect = adv7511_connector_detect,
 	.destroy = drm_connector_cleanup,
diff --git a/drivers/gpu/drm/bridge/analogix-anx78xx.c b/drivers/gpu/drm/bridge/analogix-anx78xx.c
index dc045e0c32fc..9385eb0b1ee4 100644
--- a/drivers/gpu/drm/bridge/analogix-anx78xx.c
+++ b/drivers/gpu/drm/bridge/analogix-anx78xx.c
@@ -1002,7 +1002,6 @@ static enum drm_connector_status anx78xx_detect(struct drm_connector *connector,
 }
 
 static const struct drm_connector_funcs anx78xx_connector_funcs = {
-	.dpms = drm_atomic_helper_connector_dpms,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.detect = anx78xx_detect,
 	.destroy = drm_connector_cleanup,
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 4c758ed51939..5dd3f1cd074a 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1005,7 +1005,6 @@ analogix_dp_detect(struct drm_connector *connector, bool force)
 }
 
 static const struct drm_connector_funcs analogix_dp_connector_funcs = {
-	.dpms = drm_atomic_helper_connector_dpms,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.detect = analogix_dp_detect,
 	.destroy = drm_connector_cleanup,
diff --git a/drivers/gpu/drm/bridge/dumb-vga-dac.c b/drivers/gpu/drm/bridge/dumb-vga-dac.c
index 8a52539e618e..de5e7dee7ad6 100644
--- a/drivers/gpu/drm/bridge/dumb-vga-dac.c
+++ b/drivers/gpu/drm/bridge/dumb-vga-dac.c
@@ -92,7 +92,6 @@ dumb_vga_connector_detect(struct drm_connector *connector, bool force)
 }
 
 static const struct drm_connector_funcs dumb_vga_con_funcs = {
-	.dpms			= drm_atomic_helper_connector_dpms,
 	.detect			= dumb_vga_connector_detect,
 	.fill_modes		= drm_helper_probe_single_connector_modes,
 	.destroy		= drm_connector_cleanup,
diff --git a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
index 11f11086a68f..7ccadba7c98c 100644
--- a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
+++ b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
@@ -193,7 +193,6 @@ static enum drm_connector_status ge_b850v3_lvds_detect(
 }
 
 static const struct drm_connector_funcs ge_b850v3_lvds_connector_funcs = {
-	.dpms = drm_atomic_helper_connector_dpms,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.detect = ge_b850v3_lvds_detect,
 	.destroy = drm_connector_cleanup,
diff --git a/drivers/gpu/drm/bridge/nxp-ptn3460.c b/drivers/gpu/drm/bridge/nxp-ptn3460.c
index f0b5d0fc8594..d64a3283822a 100644
--- a/drivers/gpu/drm/bridge/nxp-ptn3460.c
+++ b/drivers/gpu/drm/bridge/nxp-ptn3460.c
@@ -238,7 +238,6 @@ static const struct drm_connector_helper_funcs ptn3460_connector_helper_funcs =
 };
 
 static const struct drm_connector_funcs ptn3460_connector_funcs = {
-	.dpms = drm_atomic_helper_connector_dpms,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.destroy = drm_connector_cleanup,
 	.reset = drm_atomic_helper_connector_reset,
diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index 685c1a480201..59288b248dc5 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -50,7 +50,6 @@ panel_bridge_connector_helper_funcs = {
 };
 
 static const struct drm_connector_funcs panel_bridge_connector_funcs = {
-	.dpms = drm_atomic_helper_connector_dpms,
 	.reset = drm_atomic_helper_connector_reset,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.destroy = drm_connector_cleanup,
diff --git a/drivers/gpu/drm/bridge/parade-ps8622.c b/drivers/gpu/drm/bridge/parade-ps8622.c
index 4f7725d4a309..81198f5e9afa 100644
--- a/drivers/gpu/drm/bridge/parade-ps8622.c
+++ b/drivers/gpu/drm/bridge/parade-ps8622.c
@@ -476,7 +476,6 @@ static const struct drm_connector_helper_funcs ps8622_connector_helper_funcs = {
 };
 
 static const struct drm_connector_funcs ps8622_connector_funcs = {
-	.dpms = drm_atomic_helper_connector_dpms,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.destroy = drm_connector_cleanup,
 	.reset = drm_atomic_helper_connector_reset,
diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
index 9efb7b8fad57..b1ab4ab09532 100644
--- a/drivers/gpu/drm/bridge/sii902x.c
+++ b/drivers/gpu/drm/bridge/sii902x.c
@@ -124,7 +124,6 @@ sii902x_connector_detect(struct drm_connector *connector, bool force)
 }
 
 static const struct drm_connector_funcs sii902x_connector_funcs = {
-	.dpms = drm_atomic_helper_connector_dpms,
 	.detect = sii902x_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.destroy = drm_connector_cleanup,
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 60faf2d2bc6b..91ac849604a8 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -1920,7 +1920,6 @@ static void dw_hdmi_connector_force(struct drm_connector *connector)
 }
 
 static const struct drm_connector_funcs dw_hdmi_connector_funcs = {
-	.dpms = drm_atomic_helper_connector_dpms,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.detect = dw_hdmi_connector_detect,
 	.destroy = drm_connector_cleanup,
diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 12a35f9c3adc..503252d6a74d 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -1160,7 +1160,6 @@ static const struct drm_connector_helper_funcs tc_connector_helper_funcs = {
 };
 
 static const struct drm_connector_funcs tc_connector_funcs = {
-	.dpms = drm_atomic_helper_connector_dpms,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.destroy = drm_connector_cleanup,
 	.reset = drm_atomic_helper_connector_reset,
diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
index 7ea2a15e8807..acb857030951 100644
--- a/drivers/gpu/drm/bridge/ti-tfp410.c
+++ b/drivers/gpu/drm/bridge/ti-tfp410.c
@@ -102,7 +102,6 @@ tfp410_connector_detect(struct drm_connector *connector, bool force)
 }
 
 static const struct drm_connector_funcs tfp410_con_funcs = {
-	.dpms			= drm_atomic_helper_connector_dpms,
 	.detect			= tfp410_connector_detect,
 	.fill_modes		= drm_helper_probe_single_connector_modes,
 	.destroy		= drm_connector_cleanup,
diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 1ca0dcca6230..877733ae44ac 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -3102,85 +3102,6 @@ int drm_atomic_helper_page_flip_target(struct drm_crtc *crtc,
 EXPORT_SYMBOL(drm_atomic_helper_page_flip_target);
 
 /**
- * drm_atomic_helper_connector_dpms() - connector dpms helper implementation
- * @connector: affected connector
- * @mode: DPMS mode
- *
- * This is the main helper function provided by the atomic helper framework for
- * implementing the legacy DPMS connector interface. It computes the new desired
- * &drm_crtc_state.active state for the corresponding CRTC (if the connector is
- * enabled) and updates it.
- *
- * Returns:
- * Returns 0 on success, negative errno numbers on failure.
- */
-int drm_atomic_helper_connector_dpms(struct drm_connector *connector,
-				     int mode)
-{
-	struct drm_mode_config *config = &connector->dev->mode_config;
-	struct drm_atomic_state *state;
-	struct drm_crtc_state *crtc_state;
-	struct drm_crtc *crtc;
-	struct drm_connector *tmp_connector;
-	struct drm_connector_list_iter conn_iter;
-	int ret;
-	bool active = false;
-	int old_mode = connector->dpms;
-
-	if (mode != DRM_MODE_DPMS_ON)
-		mode = DRM_MODE_DPMS_OFF;
-
-	connector->dpms = mode;
-	crtc = connector->state->crtc;
-
-	if (!crtc)
-		return 0;
-
-	state = drm_atomic_state_alloc(connector->dev);
-	if (!state)
-		return -ENOMEM;
-
-	state->acquire_ctx = crtc->dev->mode_config.acquire_ctx;
-retry:
-	crtc_state = drm_atomic_get_crtc_state(state, crtc);
-	if (IS_ERR(crtc_state)) {
-		ret = PTR_ERR(crtc_state);
-		goto fail;
-	}
-
-	WARN_ON(!drm_modeset_is_locked(&config->connection_mutex));
-
-	drm_connector_list_iter_begin(connector->dev, &conn_iter);
-	drm_for_each_connector_iter(tmp_connector, &conn_iter) {
-		if (tmp_connector->state->crtc != crtc)
-			continue;
-
-		if (tmp_connector->dpms == DRM_MODE_DPMS_ON) {
-			active = true;
-			break;
-		}
-	}
-	drm_connector_list_iter_end(&conn_iter);
-	crtc_state->active = active;
-
-	ret = drm_atomic_commit(state);
-fail:
-	if (ret == -EDEADLK)
-		goto backoff;
-	if (ret != 0)
-		connector->dpms = old_mode;
-	drm_atomic_state_put(state);
-	return ret;
-
-backoff:
-	drm_atomic_state_clear(state);
-	drm_atomic_legacy_backoff(state);
-
-	goto retry;
-}
-EXPORT_SYMBOL(drm_atomic_helper_connector_dpms);
-
-/**
  * drm_atomic_helper_best_encoder - Helper for
  * 	&drm_connector_helper_funcs.best_encoder callback
  * @connector: Connector control structure
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dpi.c b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
index 63abcd280fa0..76d80e5de521 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dpi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
@@ -59,7 +59,6 @@ static void exynos_dpi_connector_destroy(struct drm_connector *connector)
 }
 
 static const struct drm_connector_funcs exynos_dpi_connector_funcs = {
-	.dpms = drm_atomic_helper_connector_dpms,
 	.detect = exynos_dpi_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.destroy = exynos_dpi_connector_destroy,
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index f580be170089..4ea7cc7cb3de 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1537,7 +1537,6 @@ static void exynos_dsi_connector_destroy(struct drm_connector *connector)
 }
 
 static const struct drm_connector_funcs exynos_dsi_connector_funcs = {
-	.dpms = drm_atomic_helper_connector_dpms,
 	.detect = exynos_dsi_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.destroy = exynos_dsi_connector_destroy,
diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index cb8a72842537..9186a654c3b5 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -289,7 +289,6 @@ static void vidi_connector_destroy(struct drm_connector *connector)
 }
 
 static const struct drm_connector_funcs vidi_connector_funcs = {
-	.dpms = drm_atomic_helper_connector_dpms,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.detect = vidi_detect,
 	.destroy = vidi_connector_destroy,
diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index c953927fb0cb..0e2a472c3021 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -835,7 +835,6 @@ static void hdmi_connector_destroy(struct drm_connector *connector)
 }
 
 static const struct drm_connector_funcs hdmi_connector_funcs = {
-	.dpms = drm_atomic_helper_connector_dpms,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.detect = hdmi_detect,
 	.destroy = hdmi_connector_destroy,
diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c
index dcbf3c06e1d8..edd7d8127d19 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c
@@ -63,7 +63,6 @@ static const struct drm_connector_funcs fsl_dcu_drm_connector_funcs = {
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 	.destroy = fsl_dcu_drm_connector_destroy,
-	.dpms = drm_atomic_helper_connector_dpms,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.reset = drm_atomic_helper_connector_reset,
 };
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
index 12a18557c5fd..ec4dd9df9150 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
@@ -47,7 +47,6 @@ static const struct drm_connector_helper_funcs
 };
 
 static const struct drm_connector_funcs hibmc_connector_funcs = {
-	.dpms = drm_atomic_helper_connector_dpms,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.destroy = drm_connector_cleanup,
 	.reset = drm_atomic_helper_connector_reset,
diff --git a/drivers/gpu/drm/i2c/tda998x_drv.c b/drivers/gpu/drm/i2c/tda998x_drv.c
index d1e7ac540199..54e3255dde13 100644
--- a/drivers/gpu/drm/i2c/tda998x_drv.c
+++ b/drivers/gpu/drm/i2c/tda998x_drv.c
@@ -969,14 +969,6 @@ static int tda998x_audio_codec_init(struct tda998x_priv *priv,
 
 /* DRM connector functions */
 
-static int tda998x_connector_dpms(struct drm_connector *connector, int mode)
-{
-	if (drm_core_check_feature(connector->dev, DRIVER_ATOMIC))
-		return drm_atomic_helper_connector_dpms(connector, mode);
-	else
-		return drm_helper_connector_dpms(connector, mode);
-}
-
 static int tda998x_connector_fill_modes(struct drm_connector *connector,
 					uint32_t maxX, uint32_t maxY)
 {
@@ -1014,7 +1006,7 @@ static void tda998x_connector_destroy(struct drm_connector *connector)
 }
 
 static const struct drm_connector_funcs tda998x_connector_funcs = {
-	.dpms = tda998x_connector_dpms,
+	.dpms = drm_helper_connector_dpms,
 	.reset = drm_atomic_helper_connector_reset,
 	.fill_modes = tda998x_connector_fill_modes,
 	.detect = tda998x_connector_detect,
diff --git a/drivers/gpu/drm/i915/intel_crt.c b/drivers/gpu/drm/i915/intel_crt.c
index 84c3a6dc7c2a..70e0ff41070c 100644
--- a/drivers/gpu/drm/i915/intel_crt.c
+++ b/drivers/gpu/drm/i915/intel_crt.c
@@ -802,7 +802,6 @@ void intel_crt_reset(struct drm_encoder *encoder)
  */
 
 static const struct drm_connector_funcs intel_crt_connector_funcs = {
-	.dpms = drm_atomic_helper_connector_dpms,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.late_register = intel_connector_register,
 	.early_unregister = intel_connector_unregister,
diff --git a/drivers/gpu/drm/i915/intel_dp.c b/drivers/gpu/drm/i915/intel_dp.c
index 19b082ea57ef..76c8a0bd17f9 100644
--- a/drivers/gpu/drm/i915/intel_dp.c
+++ b/drivers/gpu/drm/i915/intel_dp.c
@@ -5007,7 +5007,6 @@ void intel_dp_encoder_reset(struct drm_encoder *encoder)
 }
 
 static const struct drm_connector_funcs intel_dp_connector_funcs = {
-	.dpms = drm_atomic_helper_connector_dpms,
 	.force = intel_dp_force,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.atomic_get_property = intel_digital_connector_atomic_get_property,
diff --git a/drivers/gpu/drm/i915/intel_dp_mst.c b/drivers/gpu/drm/i915/intel_dp_mst.c
index 59a6dfd48ed4..58568559711a 100644
--- a/drivers/gpu/drm/i915/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/intel_dp_mst.c
@@ -346,7 +346,6 @@ intel_dp_mst_connector_destroy(struct drm_connector *connector)
 }
 
 static const struct drm_connector_funcs intel_dp_mst_connector_funcs = {
-	.dpms = drm_atomic_helper_connector_dpms,
 	.detect = intel_dp_mst_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.late_register = intel_connector_register,
diff --git a/drivers/gpu/drm/i915/intel_dsi.c b/drivers/gpu/drm/i915/intel_dsi.c
index 375e7cfcf207..b0b3adf016f8 100644
--- a/drivers/gpu/drm/i915/intel_dsi.c
+++ b/drivers/gpu/drm/i915/intel_dsi.c
@@ -1653,7 +1653,6 @@ static const struct drm_connector_helper_funcs intel_dsi_connector_helper_funcs
 };
 
 static const struct drm_connector_funcs intel_dsi_connector_funcs = {
-	.dpms = drm_atomic_helper_connector_dpms,
 	.late_register = intel_connector_register,
 	.early_unregister = intel_connector_unregister,
 	.destroy = intel_dsi_connector_destroy,
diff --git a/drivers/gpu/drm/i915/intel_dvo.c b/drivers/gpu/drm/i915/intel_dvo.c
index 6b1970542911..baf369d2de30 100644
--- a/drivers/gpu/drm/i915/intel_dvo.c
+++ b/drivers/gpu/drm/i915/intel_dvo.c
@@ -344,7 +344,6 @@ static void intel_dvo_destroy(struct drm_connector *connector)
 }
 
 static const struct drm_connector_funcs intel_dvo_connector_funcs = {
-	.dpms = drm_atomic_helper_connector_dpms,
 	.detect = intel_dvo_detect,
 	.late_register = intel_connector_register,
 	.early_unregister = intel_connector_unregister,
diff --git a/drivers/gpu/drm/i915/intel_hdmi.c b/drivers/gpu/drm/i915/intel_hdmi.c
index 3074190b9455..2ef1ee85129d 100644
--- a/drivers/gpu/drm/i915/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/intel_hdmi.c
@@ -1761,7 +1761,6 @@ static void intel_hdmi_destroy(struct drm_connector *connector)
 }
 
 static const struct drm_connector_funcs intel_hdmi_connector_funcs = {
-	.dpms = drm_atomic_helper_connector_dpms,
 	.detect = intel_hdmi_detect,
 	.force = intel_hdmi_force,
 	.fill_modes = drm_helper_probe_single_connector_modes,
diff --git a/drivers/gpu/drm/i915/intel_lvds.c b/drivers/gpu/drm/i915/intel_lvds.c
index 6579299f5d00..61d557948e21 100644
--- a/drivers/gpu/drm/i915/intel_lvds.c
+++ b/drivers/gpu/drm/i915/intel_lvds.c
@@ -595,7 +595,6 @@ static const struct drm_connector_helper_funcs intel_lvds_connector_helper_funcs
 };
 
 static const struct drm_connector_funcs intel_lvds_connector_funcs = {
-	.dpms = drm_atomic_helper_connector_dpms,
 	.detect = intel_lvds_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.atomic_get_property = intel_digital_connector_atomic_get_property,
diff --git a/drivers/gpu/drm/i915/intel_sdvo.c b/drivers/gpu/drm/i915/intel_sdvo.c
index a8eee1984ddf..bea8152ae859 100644
--- a/drivers/gpu/drm/i915/intel_sdvo.c
+++ b/drivers/gpu/drm/i915/intel_sdvo.c
@@ -2193,7 +2193,6 @@ intel_sdvo_connector_duplicate_state(struct drm_connector *connector)
 }
 
 static const struct drm_connector_funcs intel_sdvo_connector_funcs = {
-	.dpms = drm_atomic_helper_connector_dpms,
 	.detect = intel_sdvo_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.atomic_get_property = intel_sdvo_connector_atomic_get_property,
diff --git a/drivers/gpu/drm/i915/intel_tv.c b/drivers/gpu/drm/i915/intel_tv.c
index e4ef2919b682..906893c006d8 100644
--- a/drivers/gpu/drm/i915/intel_tv.c
+++ b/drivers/gpu/drm/i915/intel_tv.c
@@ -1407,7 +1407,6 @@ intel_tv_destroy(struct drm_connector *connector)
 }
 
 static const struct drm_connector_funcs intel_tv_connector_funcs = {
-	.dpms = drm_atomic_helper_connector_dpms,
 	.late_register = intel_connector_register,
 	.early_unregister = intel_connector_unregister,
 	.destroy = intel_tv_destroy,
diff --git a/drivers/gpu/drm/imx/imx-ldb.c b/drivers/gpu/drm/imx/imx-ldb.c
index 8b05ecb8fdef..56dd7a9a8e25 100644
--- a/drivers/gpu/drm/imx/imx-ldb.c
+++ b/drivers/gpu/drm/imx/imx-ldb.c
@@ -389,7 +389,6 @@ static int imx_ldb_encoder_atomic_check(struct drm_encoder *encoder,
 
 
 static const struct drm_connector_funcs imx_ldb_connector_funcs = {
-	.dpms = drm_atomic_helper_connector_dpms,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.destroy = imx_drm_connector_destroy,
 	.reset = drm_atomic_helper_connector_reset,
diff --git a/drivers/gpu/drm/imx/imx-tve.c b/drivers/gpu/drm/imx/imx-tve.c
index 4826bb781723..bc27c2699464 100644
--- a/drivers/gpu/drm/imx/imx-tve.c
+++ b/drivers/gpu/drm/imx/imx-tve.c
@@ -341,7 +341,6 @@ static int imx_tve_atomic_check(struct drm_encoder *encoder,
 }
 
 static const struct drm_connector_funcs imx_tve_connector_funcs = {
-	.dpms = drm_atomic_helper_connector_dpms,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.destroy = imx_drm_connector_destroy,
 	.reset = drm_atomic_helper_connector_reset,
diff --git a/drivers/gpu/drm/imx/parallel-display.c b/drivers/gpu/drm/imx/parallel-display.c
index 8aca20209cb8..8def97d75030 100644
--- a/drivers/gpu/drm/imx/parallel-display.c
+++ b/drivers/gpu/drm/imx/parallel-display.c
@@ -135,7 +135,6 @@ static int imx_pd_encoder_atomic_check(struct drm_encoder *encoder,
 }
 
 static const struct drm_connector_funcs imx_pd_connector_funcs = {
-	.dpms = drm_atomic_helper_connector_dpms,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.destroy = imx_drm_connector_destroy,
 	.reset = drm_atomic_helper_connector_reset,
diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index a31bd2a82de5..7e5e24c2152a 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -766,7 +766,6 @@ static const struct drm_encoder_helper_funcs mtk_dsi_encoder_helper_funcs = {
 };
 
 static const struct drm_connector_funcs mtk_dsi_connector_funcs = {
-	.dpms = drm_atomic_helper_connector_dpms,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.destroy = drm_connector_cleanup,
 	.reset = drm_atomic_helper_connector_reset,
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index f2437cd1e0f9..690c67507cbc 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1261,7 +1261,6 @@ static struct drm_encoder *mtk_hdmi_conn_best_enc(struct drm_connector *conn)
 }
 
 static const struct drm_connector_funcs mtk_hdmi_connector_funcs = {
-	.dpms = drm_atomic_helper_connector_dpms,
 	.detect = hdmi_conn_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.destroy = hdmi_conn_destroy,
diff --git a/drivers/gpu/drm/meson/meson_venc_cvbs.c b/drivers/gpu/drm/meson/meson_venc_cvbs.c
index 00775b397dba..79d95ca8a0c0 100644
--- a/drivers/gpu/drm/meson/meson_venc_cvbs.c
+++ b/drivers/gpu/drm/meson/meson_venc_cvbs.c
@@ -118,7 +118,6 @@ static int meson_cvbs_connector_mode_valid(struct drm_connector *connector,
 }
 
 static const struct drm_connector_funcs meson_cvbs_connector_funcs = {
-	.dpms			= drm_atomic_helper_connector_dpms,
 	.detect			= meson_cvbs_connector_detect,
 	.fill_modes		= drm_helper_probe_single_connector_modes,
 	.destroy		= meson_cvbs_connector_destroy,
diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index a879ffa534b4..855248132b2b 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -626,7 +626,6 @@ static void dsi_mgr_bridge_mode_set(struct drm_bridge *bridge,
 }
 
 static const struct drm_connector_funcs dsi_mgr_connector_funcs = {
-	.dpms = drm_atomic_helper_connector_dpms,
 	.detect = dsi_mgr_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.destroy = dsi_mgr_connector_destroy,
diff --git a/drivers/gpu/drm/msm/edp/edp_connector.c b/drivers/gpu/drm/msm/edp/edp_connector.c
index 5960628ceb93..6f3fc6b0f0a3 100644
--- a/drivers/gpu/drm/msm/edp/edp_connector.c
+++ b/drivers/gpu/drm/msm/edp/edp_connector.c
@@ -92,7 +92,6 @@ static int edp_connector_mode_valid(struct drm_connector *connector,
 }
 
 static const struct drm_connector_funcs edp_connector_funcs = {
-	.dpms = drm_atomic_helper_connector_dpms,
 	.detect = edp_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.destroy = edp_connector_destroy,
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_connector.c b/drivers/gpu/drm/msm/hdmi/hdmi_connector.c
index a2515b466ce5..71536d9c7fe8 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_connector.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_connector.c
@@ -407,7 +407,6 @@ static int msm_hdmi_connector_mode_valid(struct drm_connector *connector,
 }
 
 static const struct drm_connector_funcs hdmi_connector_funcs = {
-	.dpms = drm_atomic_helper_connector_dpms,
 	.detect = hdmi_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.destroy = hdmi_connector_destroy,
diff --git a/drivers/gpu/drm/msm/mdp/mdp4/mdp4_lvds_connector.c b/drivers/gpu/drm/msm/mdp/mdp4/mdp4_lvds_connector.c
index 353429b05733..e3b1c86b7aae 100644
--- a/drivers/gpu/drm/msm/mdp/mdp4/mdp4_lvds_connector.c
+++ b/drivers/gpu/drm/msm/mdp/mdp4/mdp4_lvds_connector.c
@@ -91,7 +91,6 @@ static int mdp4_lvds_connector_mode_valid(struct drm_connector *connector,
 }
 
 static const struct drm_connector_funcs mdp4_lvds_connector_funcs = {
-	.dpms = drm_atomic_helper_connector_dpms,
 	.detect = mdp4_lvds_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.destroy = mdp4_lvds_connector_destroy,
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_out.c b/drivers/gpu/drm/mxsfb/mxsfb_out.c
index f7d729aa09bd..e5edf016a439 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_out.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_out.c
@@ -74,7 +74,6 @@ static void mxsfb_panel_connector_destroy(struct drm_connector *connector)
 }
 
 static const struct drm_connector_funcs mxsfb_panel_connector_funcs = {
-	.dpms			= drm_atomic_helper_connector_dpms,
 	.detect			= mxsfb_panel_connector_detect,
 	.fill_modes		= drm_helper_probe_single_connector_modes,
 	.destroy		= mxsfb_panel_connector_destroy,
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index 2468e81918fd..5137155bf3c0 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -1072,17 +1072,9 @@ nouveau_connector_helper_funcs = {
 	.best_encoder = nouveau_connector_best_encoder,
 };
 
-static int
-nouveau_connector_dpms(struct drm_connector *connector, int mode)
-{
-	if (drm_drv_uses_atomic_modeset(connector->dev))
-		return drm_atomic_helper_connector_dpms(connector, mode);
-	return drm_helper_connector_dpms(connector, mode);
-}
-
 static const struct drm_connector_funcs
 nouveau_connector_funcs = {
-	.dpms = nouveau_connector_dpms,
+	.dpms = drm_helper_connector_dpms,
 	.reset = nouveau_conn_reset,
 	.detect = nouveau_connector_detect,
 	.force = nouveau_connector_force,
@@ -1097,7 +1089,7 @@ nouveau_connector_funcs = {
 
 static const struct drm_connector_funcs
 nouveau_connector_funcs_lvds = {
-	.dpms = nouveau_connector_dpms,
+	.dpms = drm_helper_connector_dpms,
 	.reset = nouveau_conn_reset,
 	.detect = nouveau_connector_detect_lvds,
 	.force = nouveau_connector_force,
diff --git a/drivers/gpu/drm/nouveau/nv50_display.c b/drivers/gpu/drm/nouveau/nv50_display.c
index 80a96eb08bbf..d442def6c965 100644
--- a/drivers/gpu/drm/nouveau/nv50_display.c
+++ b/drivers/gpu/drm/nouveau/nv50_display.c
@@ -3118,7 +3118,6 @@ nv50_mstc_destroy(struct drm_connector *connector)
 
 static const struct drm_connector_funcs
 nv50_mstc = {
-	.dpms = drm_atomic_helper_connector_dpms,
 	.reset = nouveau_conn_reset,
 	.detect = nv50_mstc_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
diff --git a/drivers/gpu/drm/omapdrm/omap_connector.c b/drivers/gpu/drm/omapdrm/omap_connector.c
index c24b6b783e9a..d1ec76ef5cc6 100644
--- a/drivers/gpu/drm/omapdrm/omap_connector.c
+++ b/drivers/gpu/drm/omapdrm/omap_connector.c
@@ -195,7 +195,6 @@ static int omap_connector_mode_valid(struct drm_connector *connector,
 }
 
 static const struct drm_connector_funcs omap_connector_funcs = {
-	.dpms = drm_atomic_helper_connector_dpms,
 	.reset = drm_atomic_helper_connector_reset,
 	.detect = omap_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
diff --git a/drivers/gpu/drm/pl111/pl111_connector.c b/drivers/gpu/drm/pl111/pl111_connector.c
index 3f213d7e7692..d335f9a29ce4 100644
--- a/drivers/gpu/drm/pl111/pl111_connector.c
+++ b/drivers/gpu/drm/pl111/pl111_connector.c
@@ -69,7 +69,6 @@ const struct drm_connector_funcs connector_funcs = {
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.destroy = pl111_connector_destroy,
 	.detect = pl111_connector_detect,
-	.dpms = drm_atomic_helper_connector_dpms,
 	.reset = drm_atomic_helper_connector_reset,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_lvdscon.c b/drivers/gpu/drm/rcar-du/rcar_du_lvdscon.c
index ee91481131ad..b373ad48ef5f 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_lvdscon.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_lvdscon.c
@@ -46,7 +46,6 @@ static void rcar_du_lvds_connector_destroy(struct drm_connector *connector)
 }
 
 static const struct drm_connector_funcs connector_funcs = {
-	.dpms = drm_atomic_helper_connector_dpms,
 	.reset = drm_atomic_helper_connector_reset,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.destroy = rcar_du_lvds_connector_destroy,
diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
index 9b0b0588bbed..a57da051f516 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
@@ -254,7 +254,6 @@ static void cdn_dp_connector_destroy(struct drm_connector *connector)
 }
 
 static const struct drm_connector_funcs cdn_dp_atomic_connector_funcs = {
-	.dpms = drm_atomic_helper_connector_dpms,
 	.detect = cdn_dp_connector_detect,
 	.destroy = cdn_dp_connector_destroy,
 	.fill_modes = drm_helper_probe_single_connector_modes,
diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi.c
index 21b9737662ae..9a20b9dc27c8 100644
--- a/drivers/gpu/drm/rockchip/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi.c
@@ -1080,7 +1080,6 @@ static void dw_mipi_dsi_drm_connector_destroy(struct drm_connector *connector)
 }
 
 static const struct drm_connector_funcs dw_mipi_dsi_atomic_connector_funcs = {
-	.dpms = drm_atomic_helper_connector_dpms,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.destroy = dw_mipi_dsi_drm_connector_destroy,
 	.reset = drm_atomic_helper_connector_reset,
diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index 7149968aa25a..bd87768dd549 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -593,7 +593,6 @@ static void inno_hdmi_connector_destroy(struct drm_connector *connector)
 }
 
 static struct drm_connector_funcs inno_hdmi_connector_funcs = {
-	.dpms = drm_atomic_helper_connector_dpms,
 	.fill_modes = inno_hdmi_probe_single_connector_modes,
 	.detect = inno_hdmi_connector_detect,
 	.destroy = inno_hdmi_connector_destroy,
diff --git a/drivers/gpu/drm/sti/sti_dvo.c b/drivers/gpu/drm/sti/sti_dvo.c
index a51cd9f754db..852bf2293b05 100644
--- a/drivers/gpu/drm/sti/sti_dvo.c
+++ b/drivers/gpu/drm/sti/sti_dvo.c
@@ -412,7 +412,6 @@ static int sti_dvo_late_register(struct drm_connector *connector)
 }
 
 static const struct drm_connector_funcs sti_dvo_connector_funcs = {
-	.dpms = drm_atomic_helper_connector_dpms,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.detect = sti_dvo_connector_detect,
 	.destroy = drm_connector_cleanup,
diff --git a/drivers/gpu/drm/sti/sti_hda.c b/drivers/gpu/drm/sti/sti_hda.c
index d6ed909d9d75..cf65e32b5090 100644
--- a/drivers/gpu/drm/sti/sti_hda.c
+++ b/drivers/gpu/drm/sti/sti_hda.c
@@ -647,7 +647,6 @@ static int sti_hda_late_register(struct drm_connector *connector)
 }
 
 static const struct drm_connector_funcs sti_hda_connector_funcs = {
-	.dpms = drm_atomic_helper_connector_dpms,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.destroy = drm_connector_cleanup,
 	.reset = drm_atomic_helper_connector_reset,
diff --git a/drivers/gpu/drm/sti/sti_hdmi.c b/drivers/gpu/drm/sti/sti_hdmi.c
index 21f11dfae472..30f02d2fdd03 100644
--- a/drivers/gpu/drm/sti/sti_hdmi.c
+++ b/drivers/gpu/drm/sti/sti_hdmi.c
@@ -1113,7 +1113,6 @@ static int sti_hdmi_late_register(struct drm_connector *connector)
 }
 
 static const struct drm_connector_funcs sti_hdmi_connector_funcs = {
-	.dpms = drm_atomic_helper_connector_dpms,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.detect = sti_hdmi_connector_detect,
 	.destroy = drm_connector_cleanup,
diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
index 83b7a2a025f2..f5d0d6bd1084 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
@@ -306,7 +306,6 @@ sun4i_hdmi_connector_detect(struct drm_connector *connector, bool force)
 }
 
 static const struct drm_connector_funcs sun4i_hdmi_connector_funcs = {
-	.dpms			= drm_atomic_helper_connector_dpms,
 	.detect			= sun4i_hdmi_connector_detect,
 	.fill_modes		= drm_helper_probe_single_connector_modes,
 	.destroy		= drm_connector_cleanup,
diff --git a/drivers/gpu/drm/sun4i/sun4i_rgb.c b/drivers/gpu/drm/sun4i/sun4i_rgb.c
index 422b191faa77..550bb262943f 100644
--- a/drivers/gpu/drm/sun4i/sun4i_rgb.c
+++ b/drivers/gpu/drm/sun4i/sun4i_rgb.c
@@ -120,7 +120,6 @@ sun4i_rgb_connector_destroy(struct drm_connector *connector)
 }
 
 static struct drm_connector_funcs sun4i_rgb_con_funcs = {
-	.dpms			= drm_atomic_helper_connector_dpms,
 	.fill_modes		= drm_helper_probe_single_connector_modes,
 	.destroy		= sun4i_rgb_connector_destroy,
 	.reset			= drm_atomic_helper_connector_reset,
diff --git a/drivers/gpu/drm/sun4i/sun4i_tv.c b/drivers/gpu/drm/sun4i/sun4i_tv.c
index 338b9e5bb2a3..7b45ac9383ea 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tv.c
@@ -546,7 +546,6 @@ sun4i_tv_comp_connector_destroy(struct drm_connector *connector)
 }
 
 static struct drm_connector_funcs sun4i_tv_comp_connector_funcs = {
-	.dpms			= drm_atomic_helper_connector_dpms,
 	.fill_modes		= drm_helper_probe_single_connector_modes,
 	.destroy		= sun4i_tv_comp_connector_destroy,
 	.reset			= drm_atomic_helper_connector_reset,
diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index 3dea1216bafd..e4b5aedfdbd4 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -815,7 +815,6 @@ tegra_dsi_connector_duplicate_state(struct drm_connector *connector)
 }
 
 static const struct drm_connector_funcs tegra_dsi_connector_funcs = {
-	.dpms = drm_atomic_helper_connector_dpms,
 	.reset = tegra_dsi_connector_reset,
 	.detect = tegra_output_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index 718d8db406a6..a621b0da4092 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -902,7 +902,6 @@ tegra_hdmi_connector_detect(struct drm_connector *connector, bool force)
 }
 
 static const struct drm_connector_funcs tegra_hdmi_connector_funcs = {
-	.dpms = drm_atomic_helper_connector_dpms,
 	.reset = drm_atomic_helper_connector_reset,
 	.detect = tegra_hdmi_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegra/rgb.c
index a131b44e2d6f..78ec5193741d 100644
--- a/drivers/gpu/drm/tegra/rgb.c
+++ b/drivers/gpu/drm/tegra/rgb.c
@@ -88,7 +88,6 @@ static void tegra_dc_write_regs(struct tegra_dc *dc,
 }
 
 static const struct drm_connector_funcs tegra_rgb_connector_funcs = {
-	.dpms = drm_atomic_helper_connector_dpms,
 	.reset = drm_atomic_helper_connector_reset,
 	.detect = tegra_output_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index fb2709c0c461..e0642d05a8d3 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -1340,7 +1340,6 @@ tegra_sor_connector_duplicate_state(struct drm_connector *connector)
 }
 
 static const struct drm_connector_funcs tegra_sor_connector_funcs = {
-	.dpms = drm_atomic_helper_connector_dpms,
 	.reset = tegra_sor_connector_reset,
 	.detect = tegra_sor_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_panel.c b/drivers/gpu/drm/tilcdc/tilcdc_panel.c
index 28c3e2f44f64..1813a3623ce6 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_panel.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_panel.c
@@ -189,7 +189,6 @@ static struct drm_encoder *panel_connector_best_encoder(
 
 static const struct drm_connector_funcs panel_connector_funcs = {
 	.destroy            = panel_connector_destroy,
-	.dpms               = drm_atomic_helper_connector_dpms,
 	.fill_modes         = drm_helper_probe_single_connector_modes,
 	.reset              = drm_atomic_helper_connector_reset,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_tfp410.c b/drivers/gpu/drm/tilcdc/tilcdc_tfp410.c
index aabfad882e23..1e2dfb1b1d6b 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_tfp410.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_tfp410.c
@@ -202,7 +202,6 @@ static struct drm_encoder *tfp410_connector_best_encoder(
 
 static const struct drm_connector_funcs tfp410_connector_funcs = {
 	.destroy            = tfp410_connector_destroy,
-	.dpms               = drm_atomic_helper_connector_dpms,
 	.detect             = tfp410_connector_detect,
 	.fill_modes         = drm_helper_probe_single_connector_modes,
 	.reset              = drm_atomic_helper_connector_reset,
diff --git a/drivers/gpu/drm/tinydrm/core/tinydrm-pipe.c b/drivers/gpu/drm/tinydrm/core/tinydrm-pipe.c
index ec43fb7ad9e4..79b6687977d3 100644
--- a/drivers/gpu/drm/tinydrm/core/tinydrm-pipe.c
+++ b/drivers/gpu/drm/tinydrm/core/tinydrm-pipe.c
@@ -71,7 +71,6 @@ static void tinydrm_connector_destroy(struct drm_connector *connector)
 }
 
 static const struct drm_connector_funcs tinydrm_connector_funcs = {
-	.dpms = drm_atomic_helper_connector_dpms,
 	.reset = drm_atomic_helper_connector_reset,
 	.detect = tinydrm_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 406d6d83b6c6..b249b79ce04a 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -265,7 +265,6 @@ static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
 }
 
 static const struct drm_connector_funcs vc4_hdmi_connector_funcs = {
-	.dpms = drm_atomic_helper_connector_dpms,
 	.detect = vc4_hdmi_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.destroy = vc4_hdmi_connector_destroy,
diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index 369fea5a13a1..3a9a302247a2 100644
--- a/drivers/gpu/drm/vc4/vc4_vec.c
+++ b/drivers/gpu/drm/vc4/vc4_vec.c
@@ -366,7 +366,6 @@ static int vc4_vec_connector_get_modes(struct drm_connector *connector)
 }
 
 static const struct drm_connector_funcs vc4_vec_connector_funcs = {
-	.dpms = drm_atomic_helper_connector_dpms,
 	.detect = vc4_vec_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.destroy = vc4_vec_connector_destroy,
diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/virtio/virtgpu_display.c
index ffd22e5ab43a..b6d52055a11f 100644
--- a/drivers/gpu/drm/virtio/virtgpu_display.c
+++ b/drivers/gpu/drm/virtio/virtgpu_display.c
@@ -252,7 +252,6 @@ static void virtio_gpu_conn_destroy(struct drm_connector *connector)
 }
 
 static const struct drm_connector_funcs virtio_gpu_connector_funcs = {
-	.dpms = drm_atomic_helper_connector_dpms,
 	.detect = virtio_gpu_conn_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.destroy = virtio_gpu_conn_destroy,
diff --git a/drivers/gpu/drm/zte/zx_hdmi.c b/drivers/gpu/drm/zte/zx_hdmi.c
index 7e834e3eeed9..b8abb1b496ff 100644
--- a/drivers/gpu/drm/zte/zx_hdmi.c
+++ b/drivers/gpu/drm/zte/zx_hdmi.c
@@ -300,7 +300,6 @@ zx_hdmi_connector_detect(struct drm_connector *connector, bool force)
 }
 
 static const struct drm_connector_funcs zx_hdmi_connector_funcs = {
-	.dpms = drm_atomic_helper_connector_dpms,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.detect = zx_hdmi_connector_detect,
 	.destroy = drm_connector_cleanup,
diff --git a/drivers/gpu/drm/zte/zx_tvenc.c b/drivers/gpu/drm/zte/zx_tvenc.c
index b56dc69843fc..0de1a71ca4e0 100644
--- a/drivers/gpu/drm/zte/zx_tvenc.c
+++ b/drivers/gpu/drm/zte/zx_tvenc.c
@@ -269,7 +269,6 @@ static struct drm_connector_helper_funcs zx_tvenc_connector_helper_funcs = {
 };
 
 static const struct drm_connector_funcs zx_tvenc_connector_funcs = {
-	.dpms = drm_atomic_helper_connector_dpms,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.destroy = drm_connector_cleanup,
 	.reset = drm_atomic_helper_connector_reset,
diff --git a/drivers/gpu/drm/zte/zx_vga.c b/drivers/gpu/drm/zte/zx_vga.c
index 1e0811f775cb..3e7e33cd3dfa 100644
--- a/drivers/gpu/drm/zte/zx_vga.c
+++ b/drivers/gpu/drm/zte/zx_vga.c
@@ -138,7 +138,6 @@ zx_vga_connector_detect(struct drm_connector *connector, bool force)
 }
 
 static const struct drm_connector_funcs zx_vga_connector_funcs = {
-	.dpms = drm_atomic_helper_connector_dpms,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.detect = zx_vga_connector_detect,
 	.destroy = drm_connector_cleanup,
diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
index 619089a027ec..d2b56cc657e9 100644
--- a/include/drm/drm_atomic_helper.h
+++ b/include/drm/drm_atomic_helper.h
@@ -136,8 +136,6 @@ int drm_atomic_helper_page_flip_target(
 				uint32_t flags,
 				uint32_t target,
 				struct drm_modeset_acquire_ctx *ctx);
-int drm_atomic_helper_connector_dpms(struct drm_connector *connector,
-				     int mode);
 struct drm_encoder *
 drm_atomic_helper_best_encoder(struct drm_connector *connector);
 
-- 
2.13.3
