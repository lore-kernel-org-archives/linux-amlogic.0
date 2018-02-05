From: shawnguo@kernel.org (Shawn Guo)
Date: Mon, 5 Feb 2018 14:50:23 +0800
Subject: [PATCH 5/5] drm: Don't pass clip to
 drm_atomic_helper_check_plane_state()
In-Reply-To: <20180123170857.13818-5-ville.syrjala@linux.intel.com>
References: <20180123170857.13818-1-ville.syrjala@linux.intel.com>
 <20180123170857.13818-5-ville.syrjala@linux.intel.com>
Message-ID: <20180205065022.GJ31354@dragon>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Tue, Jan 23, 2018 at 07:08:57PM +0200, Ville Syrjala wrote:
> From: Ville Syrj?l? <ville.syrjala@linux.intel.com>
> 
> Move the plane clip rectangle handling into
> drm_atomic_helper_check_plane_state(). Drivers no longer
> have to worry about such mundane details.
> 
> v2: Convert armada, rcar, and sun4i as well
> 
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Brian Starkey <brian.starkey@arm.com>
> Cc: Mali DP Maintainers <malidp@foss.arm.com>
> Cc: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Gustavo Padovan <gustavo@padovan.org>
> Cc: Sean Paul <seanpaul@chromium.org>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: CK Hu <ck.hu@mediatek.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Sandy Huang <hjc@rock-chips.com>
> Cc: "Heiko St?bner" <heiko@sntech.de>
> Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
> Cc: Sinclair Yeh <syeh@vmware.com>
> Cc: Thomas Hellstrom <thellstrom@vmware.com>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Archit Taneja <architt@codeaurora.org>
> Cc: linux-amlogic at lists.infradead.org
> Cc: linux-arm-msm at vger.kernel.org
> Cc: freedreno at lists.freedesktop.org
> Cc: nouveau at lists.freedesktop.org
> Cc: linux-renesas-soc at vger.kernel.org
> Cc: linux-tegra at vger.kernel.org
> Cc: Russell King <rmk+kernel@armlinux.org.uk>
> Suggested-by: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Ville Syrj?l? <ville.syrjala@linux.intel.com>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Reviewed-by: Thierry Reding <treding@nvidia.com>
> Reviewed-by: Archit Taneja <architt@codeaurora.org> #msm
> ---
...
>  drivers/gpu/drm/zte/zx_plane.c              | 13 +------------

Acked-by: Shawn Guo <shawnguo@kernel.org>
