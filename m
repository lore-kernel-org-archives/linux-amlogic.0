From: narmstrong@baylibre.com (Neil Armstrong)
Date: Mon, 20 Aug 2018 10:36:55 +0200
Subject: [PATCH u-boot 1/3] boards: amlogic: remove ethernet gpio reset
 code from boards
In-Reply-To: <20180814130754.19294-2-b.galvani@gmail.com>
References: <20180814130754.19294-1-b.galvani@gmail.com>
 <20180814130754.19294-2-b.galvani@gmail.com>
Message-ID: <a8358bc8-70e4-6f53-facd-29b3ceea715e@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 14/08/2018 15:07, Beniamino Galvani wrote:
> The reset is already handled by the designware driver using
> information from device tree.
> 
> Signed-off-by: Beniamino Galvani <b.galvani@gmail.com>
> ---
>  board/amlogic/nanopi-k2/nanopi-k2.c | 6 ------
>  board/amlogic/odroid-c2/odroid-c2.c | 6 ------
>  2 files changed, 12 deletions(-)
> 
> diff --git a/board/amlogic/nanopi-k2/nanopi-k2.c b/board/amlogic/nanopi-k2/nanopi-k2.c
> index 339dbb81db..ae29dd6fa4 100644
> --- a/board/amlogic/nanopi-k2/nanopi-k2.c
> +++ b/board/amlogic/nanopi-k2/nanopi-k2.c
> @@ -30,12 +30,6 @@ int misc_init_r(void)
>  
>  	meson_gx_eth_init(PHY_INTERFACE_MODE_RGMII, 0);
>  
> -	/* Reset PHY on GPIOZ_14 */
> -	clrbits_le32(GX_GPIO_EN(3), BIT(14));
> -	clrbits_le32(GX_GPIO_OUT(3), BIT(14));
> -	mdelay(10);
> -	setbits_le32(GX_GPIO_OUT(3), BIT(14));
> -
>  	if (!eth_env_get_enetaddr("ethaddr", mac_addr)) {
>  		len = meson_sm_read_efuse(EFUSE_MAC_OFFSET,
>  					  mac_addr, EFUSE_MAC_SIZE);
> diff --git a/board/amlogic/odroid-c2/odroid-c2.c b/board/amlogic/odroid-c2/odroid-c2.c
> index c47b9ce9cb..2a2755c387 100644
> --- a/board/amlogic/odroid-c2/odroid-c2.c
> +++ b/board/amlogic/odroid-c2/odroid-c2.c
> @@ -30,12 +30,6 @@ int misc_init_r(void)
>  
>  	meson_gx_eth_init(PHY_INTERFACE_MODE_RGMII, 0);
>  
> -	/* Reset PHY on GPIOZ_14 */
> -	clrbits_le32(GX_GPIO_EN(3), BIT(14));
> -	clrbits_le32(GX_GPIO_OUT(3), BIT(14));
> -	mdelay(10);
> -	setbits_le32(GX_GPIO_OUT(3), BIT(14));
> -
>  	if (!eth_env_get_enetaddr("ethaddr", mac_addr)) {
>  		len = meson_sm_read_efuse(EFUSE_MAC_OFFSET,
>  					  mac_addr, EFUSE_MAC_SIZE);
> 


Acked-by: Neil Armstrong <narmstrong@baylibre.com>
