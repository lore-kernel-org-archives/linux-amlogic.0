From: narmstrong@baylibre.com (Neil Armstrong)
Date: Thu, 16 Feb 2017 17:40:08 +0100
Subject: [PATCH v3 0/2] drm: Support framebuffer panning
In-Reply-To: <cover.9f4059bcaf1fdad78828633aa7815ba80384b24e.1487175046.git-series.maxime.ripard@free-electrons.com>
References: <cover.9f4059bcaf1fdad78828633aa7815ba80384b24e.1487175046.git-series.maxime.ripard@free-electrons.com>
Message-ID: <6f108ce7-1e36-0177-2c23-c62fab6ebaad@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 02/15/2017 05:19 PM, Maxime Ripard wrote:
> Hi,
> 
> This is a respin of the previous serie called "Support fast framebuffer
> panning for i.MX6" made by Stefan 6 monthes ago. The imx6 bits have been
> removed, and the comments that were made at that time fixed (hopefully).
> 
> Let me know what you think,
> Maxime
> 
> Changes from v2:
>   - Renamed the CONFIG_DRM_CMA_FBDEV_BUFFER_NUM to
>     CONFIG_DRM_FBDEV_OVERALLOC, and changed it for a percentage
>   - Moved the overallocation code into the core fbdev helpers to not rely
>     on CMA anymore
>   - Changed the locks taken by drm_fb_helper_ioctl to the mode_config mutex
>     intead of calling drm_modeset_lock_all
>   - Don't test against drm_crtc's enabled anymore, but rely on the error
>     code of drm_crtc_vblank_get instead
>   - Defined drm_fb_helper_ioctl when DRM_FBDEV_EMULATION is not set in
>     order to fix a compilation error
>   - Don't wait for all CRTC's vblank but only the one given in the ioctl
>     argument
> 
> Changes from v1:
>   - Added drm_fb_helper_ioctl to DRM_FB_HELPER_DEFAULT_OPS
>   - Expanded a bit the kerneldoc for drm_fb_helper_ioctl
>   - Added some locking to drm_fb_helper_ioctl
>   - Checked that the framebuffer is indeed attached before allowing ioctl
>   - Added a module parameter to specify the number of framebuffers to
>     allocate
> 
> Initial cover letter: Support fast framebuffer panning for i.MX6
> 
> im currently working on supporting double/tripple buffering for the
> framebuffer emulation on the i.MX6.  While working on it I noticed that the
> mainline kernel does not support some features in the generic drm
> framebuffer emulation for framebuffer panning and vsync synchronisation.
> They are needed for simple framebuffer applications and some OpenGL
> libraries using double buffering with FBIOPUT_VSCREENINFO,
> FBIO_WAITFORVSYNC and FBIOPAN_DISPLAY.
> 
> Stefan Christ (1):
>   drm/fb-helper: implement ioctl FBIO_WAITFORVSYNC
> 
> Xinliang Liu (1):
>   drm/fb-helper: Add multi buffer support for cma fbdev
> 
>  drivers/gpu/drm/Kconfig         |  9 ++++-
>  drivers/gpu/drm/drm_fb_helper.c | 73 ++++++++++++++++++++++++++++++++++-
>  include/drm/drm_fb_helper.h     | 12 +++++-
>  3 files changed, 93 insertions(+), 1 deletion(-)
> 
> base-commit: 0879b944c95d65f7523d178d3addaebe84e510ec
> 
Hi Maxime,

Just tested these patches on Amlogic GXBB to provide 3D Mali acceleration on framebuffer.

Tested-by: Neil Armstrong <narmstrong@baylibre.com>

Thanks,
Neil
