From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Thu, 13 Apr 2017 22:54:48 +0200
Subject: [PATCH v2] mmc: sdio: fix alignment issue in struct sdio_func
In-Reply-To: <3a6258f3-35e3-e2f5-aa6b-e509f603fa45@gmail.com>
References: <3a6258f3-35e3-e2f5-aa6b-e509f603fa45@gmail.com>
Message-ID: <9c70c0e5-4d3f-a351-98dd-57413740a39b@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Am 29.03.2017 um 22:56 schrieb Heiner Kallweit:
> Certain 64-bit systems (e.g. Amlogic Meson GX) require buffers to be
> used for DMA to be 8-byte-aligned. struct sdio_func has an embedded
> small DMA buffer not meeting this requirement.
> Testing an extension to meson-gx driver for switching to descriptor
> chain mode broke SDIO therefore. Aligning tmpbuf to a 8-byte
> boundary fixed the driver behavior.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> Tested-by: Helmut Klein <hgkr.klein@gmail.com>
> ---
> v2:
> - switch to much simpler version as suggested by Kevin Hilman <khilman@baylibre.com>
> - adjust commit message
> ---
>  include/linux/mmc/sdio_func.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/mmc/sdio_func.h b/include/linux/mmc/sdio_func.h
> index aab032a6..65d90f76 100644
> --- a/include/linux/mmc/sdio_func.h
> +++ b/include/linux/mmc/sdio_func.h
> @@ -53,7 +53,8 @@ struct sdio_func {
>  	unsigned int		state;		/* function state */
>  #define SDIO_STATE_PRESENT	(1<<0)		/* present in sysfs */
>  
> -	u8			tmpbuf[4];	/* DMA:able scratch buffer */
> +	/* take care of proper alignment for DMA on certain 64-bit systems */
> +	u8 __aligned(8)		tmpbuf[4];	/* DMA:able scratch buffer */
>  
>  	unsigned		num_info;	/* number of info strings */
>  	const char		**info;		/* info strings */
> 
Ulf, do you have an opinion on this one? A related patch was just applied to
the brcmfmac WiFi driver -> https://patchwork.kernel.org/patch/9665425/

In sum WiFi over SDIO would be ok an systems requiring 8 byte aligned
DMA buffers (at least systems using the brcmfmac driver).
OK here means that no fallback to bounce buffer mode is necessary.

Rgds, Heiner
