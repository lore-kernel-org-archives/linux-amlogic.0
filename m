From: p.zabel@pengutronix.de (Philipp Zabel)
Date: Tue, 25 Jul 2017 10:59:17 +0200
Subject: [PATCH 7/8] drm: Nuke drm_atomic_helper_connector_dpms
In-Reply-To: <20170725080122.20548-8-daniel.vetter@ffwll.ch>
References: <20170725080122.20548-1-daniel.vetter@ffwll.ch>
 <20170725080122.20548-8-daniel.vetter@ffwll.ch>
Message-ID: <1500973157.4101.13.camel@pengutronix.de>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Tue, 2017-07-25 at 10:01 +0200, Daniel Vetter wrote:
> It's dead code, the core handles all this directly now.
> 
> The only special case is nouveau and tda988x which used one function
> for both legacy modeset code and -nv50 atomic world instead of 2
> vtables. But amounts to exactly the same.
> 
> v2: Rebase over the panel/brideg refactorings in stm/ltdc.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
[...]
>  drivers/gpu/drm/imx/imx-ldb.c                      |  1 -
>  drivers/gpu/drm/imx/imx-tve.c                      |  1 -
>  drivers/gpu/drm/imx/parallel-display.c             |  1 -
>  drivers/gpu/drm/mediatek/mtk_dsi.c                 |  1 -
>  drivers/gpu/drm/mediatek/mtk_hdmi.c                |  1 -

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
