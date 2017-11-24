From: thierry.reding@gmail.com (Thierry Reding)
Date: Fri, 24 Nov 2017 14:41:28 +0100
Subject: [PATCH 00/15] drm: More plane clipping polish
In-Reply-To: <20171123190502.28449-1-ville.syrjala@linux.intel.com>
References: <20171123190502.28449-1-ville.syrjala@linux.intel.com>
Message-ID: <20171124134128.GB15999@ulmo>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Thu, Nov 23, 2017 at 09:04:47PM +0200, Ville Syrjala wrote:
> From: Ville Syrj?l? <ville.syrjala@linux.intel.com>
> 
> This series first unifies all users of drm_atomic_helper_check_plane_state()
> to populate the clip rectangle with drm_mode_get_hv_timing(), and once
> everything is unified the clip rectangle handling is sucked into
> drm_atomic_helper_check_plane_state() away from driver code.
> 
> Entire series available here:
> git://github.com/vsyrjala/linux.git atomic_plane_helper_clip
> 
> Cc: Archit Taneja <architt@codeaurora.org>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Brian Starkey <brian.starkey@arm.com>
> Cc: CK Hu <ck.hu@mediatek.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: freedreno at lists.freedesktop.org
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: linux-amlogic at lists.infradead.org
> Cc: linux-arm-msm at vger.kernel.org
> Cc: linux-tegra at vger.kernel.org
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Mali DP Maintainers <malidp@foss.arm.com>
> Cc: Mark Yao <mark.yao@rock-chips.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Noralf Tr?nnes <noralf@tronnes.org>
> Cc: nouveau at lists.freedesktop.org
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sinclair Yeh <syeh@vmware.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Thomas Hellstrom <thellstrom@vmware.com>
> Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
> 
> Ville Syrj?l? (15):
>   drm/i915: Reject odd pipe source width with double wide/dual link
>   drm/i915: Use drm_mode_get_hv_timing() to populate plane clip
>     rectangle
>   drm/arm/hdlcd: Use drm_mode_get_hv_timing() to populate plane clip
>     rectangle
>   drm/arm/mali-dp: Use drm_mode_get_hv_timing() to populate plane clip
>     rectangle
>   drm/simple_kms_helper: Use drm_mode_get_hv_timing() to populate plane
>     clip rectangle
>   drm/imx: Use drm_mode_get_hv_timing() to populate plane clip rectangle
>   drm/mediatek: Use drm_mode_get_hv_timing() to populate plane clip
>     rectangle
>   drm/meson: Use drm_mode_get_hv_timing() to populate plane clip
>     rectangle
>   drm/msm/mdp5: Use drm_mode_get_hv_timing() to populate plane clip
>     rectangle
>   drm/nouveau/kms/nv50: Use drm_mode_get_hv_timing() to populate plane
>     clip rectangle
>   drm/rockchip: Use drm_mode_get_hv_timing() to populate plane clip
>     rectangle
>   drm/tegra/dc: Use drm_mode_get_hv_timing() to populate plane clip
>     rectangle
>   drm/vmwgfx: Use drm_mode_get_hv_timing() to populate plane clip
>     rectangle
>   drm/zte: Use drm_mode_get_hv_timing() to populate plane clip rectangle
>   drm: Don't pass clip to drm_atomic_helper_check_plane_state()
> 
>  drivers/gpu/drm/arm/hdlcd_crtc.c            |  6 +-----
>  drivers/gpu/drm/arm/malidp_planes.c         |  5 +----
>  drivers/gpu/drm/armada/armada_overlay.c     |  2 +-
>  drivers/gpu/drm/drm_atomic_helper.c         | 12 +++++++-----
>  drivers/gpu/drm/drm_plane_helper.c          | 11 +++--------
>  drivers/gpu/drm/drm_simple_kms_helper.c     |  5 -----
>  drivers/gpu/drm/i915/intel_atomic_plane.c   |  8 --------
>  drivers/gpu/drm/i915/intel_display.c        | 12 +++++++-----
>  drivers/gpu/drm/i915/intel_drv.h            |  1 -
>  drivers/gpu/drm/i915/intel_sprite.c         |  8 ++++++--
>  drivers/gpu/drm/imx/ipuv3-plane.c           |  7 +------
>  drivers/gpu/drm/mediatek/mtk_drm_plane.c    |  6 +-----
>  drivers/gpu/drm/meson/meson_plane.c         |  6 +-----
>  drivers/gpu/drm/msm/mdp/mdp5/mdp5_plane.c   | 14 ++------------
>  drivers/gpu/drm/nouveau/nv50_display.c      |  8 --------
>  drivers/gpu/drm/rockchip/rockchip_drm_vop.c |  8 +-------
>  drivers/gpu/drm/tegra/dc.c                  |  8 +-------
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c         |  8 +-------
>  drivers/gpu/drm/zte/zx_plane.c              | 15 +--------------
>  include/drm/drm_atomic_helper.h             |  1 -
>  include/drm/drm_plane_helper.h              |  1 -
>  21 files changed, 35 insertions(+), 117 deletions(-)

The series:

Reviewed-by: Thierry Reding <treding@nvidia.com>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-amlogic/attachments/20171124/16bb87d7/attachment.sig>
