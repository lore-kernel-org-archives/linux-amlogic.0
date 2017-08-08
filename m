From: narmstrong@baylibre.com (Neil Armstrong)
Date: Tue, 08 Aug 2017 16:39:24 +0200
Subject: [PATCH] MAINTAINERS: add entry for meson ao cec driver
In-Reply-To: <323ef568-a88f-5bc1-390c-fd630dfc4535@xs4all.nl>
References: <323ef568-a88f-5bc1-390c-fd630dfc4535@xs4all.nl>
Message-ID: <5989CD1C.7080308@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Le 08/08/2017 16:18, Hans Verkuil a ?crit :
> Add entry to the MAINTAINERS file for the meson ao cec driver.
> 
> Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
> ---
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9826a918d37a..ed568e1ac856 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8671,6 +8671,16 @@ F:	drivers/leds/leds-menf21bmc.c
>  F:	drivers/hwmon/menf21bmc_hwmon.c
>  F:	Documentation/hwmon/menf21bmc
> 
> +MESON AO CEC DRIVER FOR AMLOGIC SOCS
> +M:	Neil Armstrong <narmstrong@baylibre.com>
> +L:	linux-media at lists.freedesktop.org
> +L:	linux-amlogic at lists.infradead.org
> +W:	http://linux-meson.com/
> +S:	Supported
> +F:	drivers/media/platform/meson/ao-cec.c
> +F:	Documentation/devicetree/bindings/media/meson-ao-cec.txt
> +T:	git git://linuxtv.org/media_tree.git
> +
>  METAG ARCHITECTURE
>  M:	James Hogan <james.hogan@imgtec.com>
>  L:	linux-metag at vger.kernel.org
> 

Hi Hans,

Thanks !

Acked-by: Neil Armstrong <narmstrong@baylibre.com>
