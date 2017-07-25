From: narmstrong@baylibre.com (Neil Armstrong)
Date: Tue, 25 Jul 2017 10:04:19 +0200
Subject: [PATCH 7/8] drm: Nuke drm_atomic_helper_connector_dpms
In-Reply-To: <20170725080122.20548-8-daniel.vetter@ffwll.ch>
References: <20170725080122.20548-1-daniel.vetter@ffwll.ch>
 <20170725080122.20548-8-daniel.vetter@ffwll.ch>
Message-ID: <5976FB83.20005@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org



Le 25/07/2017 10:01, Daniel Vetter a ?crit :
> It's dead code, the core handles all this directly now.
> 
> The only special case is nouveau and tda988x which used one function
> for both legacy modeset code and -nv50 atomic world instead of 2
> vtables. But amounts to exactly the same.
> 
> v2: Rebase over the panel/brideg refactorings in stm/ltdc.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Archit Taneja <architt@codeaurora.org>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Peter Senna Tschudin <peter.senna@collabora.com>
> Cc: Martin Donnelly <martin.donnelly@ge.com>
> Cc: Martyn Welch <martyn.welch@collabora.co.uk>
> Cc: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Sean Paul <seanpaul@chromium.org>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Inki Dae <inki.dae@samsung.com>
> Cc: Joonyoung Shim <jy0922.shim@samsung.com>
> Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Kukjin Kim <kgene@kernel.org>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: Alison Wang <alison.wang@freescale.com>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: CK Hu <ck.hu@mediatek.com>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Carlo Caione <carlo@caione.org>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Cc: Eric Anholt <eric@anholt.net>
> Cc: Mark Yao <mark.yao@rock-chips.com>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
> Cc: Vincent Abriou <vincent.abriou@st.com>
> Cc: Yannick Fertre <yannick.fertre@st.com>
> Cc: Philippe Cornu <philippe.cornu@st.com>
> Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: Jyri Sarha <jsarha@ti.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: John Stultz <john.stultz@linaro.org>
> Cc: Lars-Peter Clausen <lars@metafoo.de>
> Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> Cc: Jeffy Chen <jeffy.chen@rock-chips.com>
> Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> Cc: Yakir Yang <kuankuan.y@gmail.com>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: Jose Abreu <Jose.Abreu@synopsys.com>
> Cc: Romain Perier <romain.perier@collabora.com>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: Xinliang Liu <z.liuxinliang@hisilicon.com>
> Cc: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Rongrong Zou <zourongrong@gmail.com>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Hai Li <hali@codeaurora.org>
> Cc: "Noralf Tr?nnes" <noralf@tronnes.org>
> Cc: linux-arm-kernel at lists.infradead.org
> Cc: linux-samsung-soc at vger.kernel.org
> Cc: intel-gfx at lists.freedesktop.org
> Cc: linux-mediatek at lists.infradead.org
> Cc: linux-amlogic at lists.infradead.org
> Cc: nouveau at lists.freedesktop.org
> Cc: linux-renesas-soc at vger.kernel.org
> Cc: linux-rockchip at lists.infradead.org
> Cc: linux-tegra at vger.kernel.org
> Cc: virtualization at lists.linux-foundation.org
> Cc: zain wang <wzz@rock-chips.com>
> Cc: Baoyou Xie <baoyou.xie@linaro.org>
> Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |  1 -
>  drivers/gpu/drm/bridge/analogix-anx78xx.c          |  1 -
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |  1 -
>  drivers/gpu/drm/bridge/dumb-vga-dac.c              |  1 -
>  .../drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c   |  1 -
>  drivers/gpu/drm/bridge/nxp-ptn3460.c               |  1 -
>  drivers/gpu/drm/bridge/panel.c                     |  1 -
>  drivers/gpu/drm/bridge/parade-ps8622.c             |  1 -
>  drivers/gpu/drm/bridge/sii902x.c                   |  1 -
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |  1 -
>  drivers/gpu/drm/bridge/tc358767.c                  |  1 -
>  drivers/gpu/drm/bridge/ti-tfp410.c                 |  1 -
>  drivers/gpu/drm/drm_atomic_helper.c                | 79 ----------------------
>  drivers/gpu/drm/exynos/exynos_drm_dpi.c            |  1 -
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c            |  1 -
>  drivers/gpu/drm/exynos/exynos_drm_vidi.c           |  1 -
>  drivers/gpu/drm/exynos/exynos_hdmi.c               |  1 -
>  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c          |  1 -
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c   |  1 -
>  drivers/gpu/drm/i2c/tda998x_drv.c                  | 10 +--
>  drivers/gpu/drm/i915/intel_crt.c                   |  1 -
>  drivers/gpu/drm/i915/intel_dp.c                    |  1 -
>  drivers/gpu/drm/i915/intel_dp_mst.c                |  1 -
>  drivers/gpu/drm/i915/intel_dsi.c                   |  1 -
>  drivers/gpu/drm/i915/intel_dvo.c                   |  1 -
>  drivers/gpu/drm/i915/intel_hdmi.c                  |  1 -
>  drivers/gpu/drm/i915/intel_lvds.c                  |  1 -
>  drivers/gpu/drm/i915/intel_sdvo.c                  |  1 -
>  drivers/gpu/drm/i915/intel_tv.c                    |  1 -
>  drivers/gpu/drm/imx/imx-ldb.c                      |  1 -
>  drivers/gpu/drm/imx/imx-tve.c                      |  1 -
>  drivers/gpu/drm/imx/parallel-display.c             |  1 -
>  drivers/gpu/drm/mediatek/mtk_dsi.c                 |  1 -
>  drivers/gpu/drm/mediatek/mtk_hdmi.c                |  1 -
>  drivers/gpu/drm/meson/meson_venc_cvbs.c            |  1 -
>  drivers/gpu/drm/msm/dsi/dsi_manager.c              |  1 -
>  drivers/gpu/drm/msm/edp/edp_connector.c            |  1 -
>  drivers/gpu/drm/msm/hdmi/hdmi_connector.c          |  1 -
>  drivers/gpu/drm/msm/mdp/mdp4/mdp4_lvds_connector.c |  1 -
>  drivers/gpu/drm/mxsfb/mxsfb_out.c                  |  1 -
>  drivers/gpu/drm/nouveau/nouveau_connector.c        | 12 +---
>  drivers/gpu/drm/nouveau/nv50_display.c             |  1 -
>  drivers/gpu/drm/omapdrm/omap_connector.c           |  1 -
>  drivers/gpu/drm/pl111/pl111_connector.c            |  1 -
>  drivers/gpu/drm/rcar-du/rcar_du_lvdscon.c          |  1 -
>  drivers/gpu/drm/rockchip/cdn-dp-core.c             |  1 -
>  drivers/gpu/drm/rockchip/dw-mipi-dsi.c             |  1 -
>  drivers/gpu/drm/rockchip/inno_hdmi.c               |  1 -
>  drivers/gpu/drm/sti/sti_dvo.c                      |  1 -
>  drivers/gpu/drm/sti/sti_hda.c                      |  1 -
>  drivers/gpu/drm/sti/sti_hdmi.c                     |  1 -
>  drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |  1 -
>  drivers/gpu/drm/sun4i/sun4i_rgb.c                  |  1 -
>  drivers/gpu/drm/sun4i/sun4i_tv.c                   |  1 -
>  drivers/gpu/drm/tegra/dsi.c                        |  1 -
>  drivers/gpu/drm/tegra/hdmi.c                       |  1 -
>  drivers/gpu/drm/tegra/rgb.c                        |  1 -
>  drivers/gpu/drm/tegra/sor.c                        |  1 -
>  drivers/gpu/drm/tilcdc/tilcdc_panel.c              |  1 -
>  drivers/gpu/drm/tilcdc/tilcdc_tfp410.c             |  1 -
>  drivers/gpu/drm/tinydrm/core/tinydrm-pipe.c        |  1 -
>  drivers/gpu/drm/vc4/vc4_hdmi.c                     |  1 -
>  drivers/gpu/drm/vc4/vc4_vec.c                      |  1 -
>  drivers/gpu/drm/virtio/virtgpu_display.c           |  1 -
>  drivers/gpu/drm/zte/zx_hdmi.c                      |  1 -
>  drivers/gpu/drm/zte/zx_tvenc.c                     |  1 -
>  drivers/gpu/drm/zte/zx_vga.c                       |  1 -
>  include/drm/drm_atomic_helper.h                    |  2 -
>  68 files changed, 3 insertions(+), 164 deletions(-)
> 

> diff --git a/drivers/gpu/drm/meson/meson_venc_cvbs.c b/drivers/gpu/drm/meson/meson_venc_cvbs.c
> index 00775b397dba..79d95ca8a0c0 100644
> --- a/drivers/gpu/drm/meson/meson_venc_cvbs.c
> +++ b/drivers/gpu/drm/meson/meson_venc_cvbs.c
> @@ -118,7 +118,6 @@ static int meson_cvbs_connector_mode_valid(struct drm_connector *connector,
>  }
>  
>  static const struct drm_connector_funcs meson_cvbs_connector_funcs = {
> -	.dpms			= drm_atomic_helper_connector_dpms,
>  	.detect			= meson_cvbs_connector_detect,
>  	.fill_modes		= drm_helper_probe_single_connector_modes,
>  	.destroy		= meson_cvbs_connector_destroy,

For meson driver :
Acked-by: Neil Armstrong <narmstrong@baylibre.com>

For the rest:
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
