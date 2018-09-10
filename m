From: narmstrong@baylibre.com (Neil Armstrong)
Date: Mon, 10 Sep 2018 15:54:53 +0200
Subject: Regression in drm: drm/fbdev doesn't initialize if set to triple
 buffer
In-Reply-To: <d104b771-2999-d56b-ec4e-b792211d55d1@gmail.com>
References: <d104b771-2999-d56b-ec4e-b792211d55d1@gmail.com>
Message-ID: <2bca95ba-90d3-ec32-8600-aa48d32c8314@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi,

Thanks for reporting this issue.

On 08/09/2018 18:48, MOHAMMAD RASIM wrote:
> Hi,
> 
> I've an issue where the drm_meson driver doesn't work, it used to work in earlier 4.18 release and stopped working after about 4.18-rc3.
> 
> My board is videostrong k2 pro (S905 SoC), I use the meson-gxbb-p201 device tree.
> 
> on the latest 4.19 tree the board boots fine but the drm driver doesn't work, and spits the following error in dmesg
> 
> [??? 2.489825] meson-drm d0100000.vpu: Queued 3 outputs on vpu
> [??? 2.494685] meson-drm d0100000.vpu: Failed to create d0100000.vpu debugfs directory
> [??? 2.502051] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
> [??? 2.508668] [drm] No driver support for vblank timestamp query.
> [??? 2.573756] meson-drm d0100000.vpu: bound c883a000.hdmi-tx (ops meson_dw_hdmi_ops)
> [??? 2.695917] meson-drm d0100000.vpu: [drm:drm_fb_helper_fbdev_setup] *ERROR* Failed to set fbdev configuration
> [??? 2.700310] meson-drm d0100000.vpu: master bind failed: -22
> [??? 2.705747] meson-drm: probe of d0100000.vpu failed with error -22
> 
> Digging deeper into the problem revealed that the problem is related to the CONFIG_DRM_FBDEV_OVERALLOC option, If I set it to 100 or 200 it works fine and the drm driver works ( or by passing drm_kms_helper.drm_fbdev_overalloc=200 in the bootargs). The problem reappears when setting it to 300.
> 
> Bisecting shows that the first bad commit that introduced this regression is this: 244007ecb6bb94fa4e9b9a969fa86f2ad86ec543

This commit points when the DRM driver has been switched to the generic fbdev emulation.

Do you use the CONFIG_DRM_FBDEV_OVERALLOC to use the fbdev libMali ?

if yes, it won't work anymore since the generic fbdev emulation does not export the fbdev smem physical address anymore.

The solution is to switch to the GBM libMali and drop any fbdev legacy code.

> 
> Another problem that I face and might be related is that the sometimes the boot get stuck on the following lines:
> 
> [??? 2.501539] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
> [??? 2.508158] [drm] No driver support for vblank timestamp query.
> 
> This problem is random and can't always reproduced, sometimes it takes a few reboots to get the board to boot pass those lines.

Weird, can you elaborate on you complete linux version, patches and HW ?

> 
> Regards
> 

Neil
