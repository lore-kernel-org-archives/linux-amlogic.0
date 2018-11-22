From: narmstrong@baylibre.com (Neil Armstrong)
Date: Thu, 22 Nov 2018 11:15:21 +0100
Subject: [PATCH] drm/meson: Fixes for drm_crtc_vblank_on/off support
In-Reply-To: <20181121171525.6593-1-narmstrong@baylibre.com>
References: <20181121171525.6593-1-narmstrong@baylibre.com>
Message-ID: <f8cd32d4-6475-ae07-edf8-9f458279d0e0@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 21/11/2018 18:15, Neil Armstrong wrote:
> Since Linux 4.17, calls to drm_crtc_vblank_on/off are mandatory, and we get
> a warning when ctrc is disabled :
> " driver forgot to call drm_crtc_vblank_off()"
> 
> But, the vsync IRQ was not totally disabled due the transient hardware
> state and specific interrupt line thus adding proper IRQ masking from
> the HHI system control registers.
> 
> Finally, due to changed in the atomic_disable code path with the updated
> fbdev emulation, checking the crct state with an atomic_disable call
> leads to warning in further atomic_begin() with a leftover event not cleared.
> 
> To Summarize :
> - Make sure that the CRTC code will call the enable/disable_vblank hooks.
> - *Really* mask the Vsync IRQ
> - Allways consume the state event in atomic_disable()
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/gpu/drm/meson/meson_crtc.c | 6 +++++-
>  drivers/gpu/drm/meson/meson_venc.c | 3 +++
>  2 files changed, 8 insertions(+), 1 deletion(-)
> 

[...]

Well it doesn't totally solve the issue....

Will resend a fixed version..

Neil
