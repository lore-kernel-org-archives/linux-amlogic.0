From: shawnguo@kernel.org (Shawn Guo)
Date: Tue, 25 Jul 2017 22:42:38 +0800
Subject: [PATCH 7/8] drm: Nuke drm_atomic_helper_connector_dpms
In-Reply-To: <20170725080122.20548-8-daniel.vetter@ffwll.ch>
References: <20170725080122.20548-1-daniel.vetter@ffwll.ch>
 <20170725080122.20548-8-daniel.vetter@ffwll.ch>
Message-ID: <20170725144237.GF29754@dragon>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Tue, Jul 25, 2017 at 10:01:21AM +0200, Daniel Vetter wrote:
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
>  drivers/gpu/drm/zte/zx_hdmi.c                      |  1 -
>  drivers/gpu/drm/zte/zx_tvenc.c                     |  1 -
>  drivers/gpu/drm/zte/zx_vga.c                       |  1 -

Acked-by: Shawn Guo <shawnguo@kernel.org>
