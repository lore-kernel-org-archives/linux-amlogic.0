From: narmstrong@baylibre.com (Neil Armstrong)
Date: Mon, 9 Jul 2018 20:14:45 +0200
Subject: [PATCH v2 2/2] configs: Update Meson GX configs
In-Reply-To: <20180709153407.29138-3-ldevulder@suse.de>
References: <20180709153407.29138-1-ldevulder@suse.de>
 <20180709153407.29138-3-ldevulder@suse.de>
Message-ID: <edb5646a-6f7e-7e93-93ea-107c628920fc@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 09/07/2018 17:34, Loic Devulder wrote:
> Enable ADC support on the Khadas VIM board.
> 
> Signed-off-by: Loic Devulder <ldevulder@suse.de>
> ---
>  configs/khadas-vim_defconfig | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/configs/khadas-vim_defconfig b/configs/khadas-vim_defconfig
> index 1eb13df4b4..fd1ec8157b 100644
> --- a/configs/khadas-vim_defconfig
> +++ b/configs/khadas-vim_defconfig
> @@ -13,12 +13,15 @@ CONFIG_OF_BOARD_SETUP=y
>  # CONFIG_DISPLAY_BOARDINFO is not set
>  # CONFIG_CMD_BDI is not set
>  # CONFIG_CMD_IMI is not set
> +CONFIG_CMD_ADC=y
>  CONFIG_CMD_GPIO=y
>  # CONFIG_CMD_LOADS is not set
>  CONFIG_CMD_MMC=y
>  CONFIG_CMD_USB=y
>  # CONFIG_CMD_SETEXPR is not set
>  CONFIG_CMD_REGULATOR=y
> +CONFIG_ADC=y
> +CONFIG_SARADC_MESON=y
>  CONFIG_OF_CONTROL=y
>  CONFIG_NET_RANDOM_ETHADDR=y
>  CONFIG_DM_GPIO=y
> 

Acked-by: Neil Armstrong <narmstrong@baylibre.com>
