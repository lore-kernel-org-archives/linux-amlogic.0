From: noralf@tronnes.org (=?UTF-8?Q?Noralf_Tr=c3=b8nnes?=)
Date: Wed, 26 Jul 2017 21:00:53 +0200
Subject: [PATCH 7/8] drm: Nuke drm_atomic_helper_connector_dpms
In-Reply-To: <20170725080122.20548-8-daniel.vetter@ffwll.ch>
References: <20170725080122.20548-1-daniel.vetter@ffwll.ch>
 <20170725080122.20548-8-daniel.vetter@ffwll.ch>
Message-ID: <96fd05d9-6cab-4a40-6a63-d0b9a5872434@tronnes.org>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org


Den 25.07.2017 10.01, skrev Daniel Vetter:
> It's dead code, the core handles all this directly now.
>
> The only special case is nouveau and tda988x which used one function
> for both legacy modeset code and -nv50 atomic world instead of 2
> vtables. But amounts to exactly the same.
>
> v2: Rebase over the panel/brideg refactorings in stm/ltdc.
>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
...
> diff --git a/drivers/gpu/drm/tinydrm/core/tinydrm-pipe.c b/drivers/gpu/drm/tinydrm/core/tinydrm-pipe.c
> index ec43fb7ad9e4..79b6687977d3 100644
> --- a/drivers/gpu/drm/tinydrm/core/tinydrm-pipe.c
> +++ b/drivers/gpu/drm/tinydrm/core/tinydrm-pipe.c
> @@ -71,7 +71,6 @@ static void tinydrm_connector_destroy(struct drm_connector *connector)
>   }
>   
>   static const struct drm_connector_funcs tinydrm_connector_funcs = {
> -	.dpms = drm_atomic_helper_connector_dpms,
>   	.reset = drm_atomic_helper_connector_reset,
>   	.detect = tinydrm_connector_detect,
>   	.fill_modes = drm_helper_probe_single_connector_modes,

Acked-by: Noralf Tr?nnes <noralf@tronnes.org>
