From: narmstrong@baylibre.com (Neil Armstrong)
Date: Tue, 4 Apr 2017 10:06:23 +0200
Subject: [PATCH] MAINTAINERS: meson-drm: remove useless git repository
In-Reply-To: <1491292894-9190-1-git-send-email-narmstrong@baylibre.com>
References: <1491292894-9190-1-git-send-email-narmstrong@baylibre.com>
Message-ID: <48909e7e-8d53-7d84-574f-ebd5d6f6dc8e@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 04/04/2017 10:01 AM, Neil Armstrong wrote:
> Meson DRM is switching to drm-misc, so remove the freedesktop drm/meson-drm
> git repository from MAINTAINERS entry.
> 
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d0d9ed8..8d3eb6e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4258,7 +4258,6 @@ W:	http://linux-meson.com/
>  S:	Supported
>  F:	drivers/gpu/drm/meson/
>  F:	Documentation/devicetree/bindings/display/amlogic,meson-vpu.txt
> -T:	git git://anongit.freedesktop.org/drm/drm-meson
>  T:	git git://anongit.freedesktop.org/drm/drm-misc
>  
>  DRM DRIVERS FOR EXYNOS
> 

Applied to drm-misc-next.

Neil
