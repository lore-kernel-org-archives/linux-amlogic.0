From: trini@konsulko.com (Tom Rini)
Date: Thu, 6 Jul 2017 16:16:53 -0400
Subject: [U-Boot,3/3] odroid-c2: enable GPIO
In-Reply-To: <20170625155511.28447-4-b.galvani@gmail.com>
References: <20170625155511.28447-4-b.galvani@gmail.com>
Message-ID: <20170706201653.GA422@bill-the-cat>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Sun, Jun 25, 2017 at 05:55:11PM +0200, Beniamino Galvani wrote:

> GPIOs are now supported on Meson GXBB, enable driver and command in
> the config.
> 
> Signed-off-by: Beniamino Galvani <b.galvani@gmail.com>
> ---
>  configs/odroid-c2_defconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/configs/odroid-c2_defconfig b/configs/odroid-c2_defconfig
> index 547cd52..cf06715 100644
> --- a/configs/odroid-c2_defconfig
> +++ b/configs/odroid-c2_defconfig
> @@ -13,9 +13,11 @@ CONFIG_DEBUG_UART=y
>  # CONFIG_CMD_LOADS is not set
>  CONFIG_CMD_MMC=y
>  # CONFIG_CMD_FPGA is not set
> +CONFIG_CMD_GPIO=y
>  # CONFIG_CMD_SETEXPR is not set
>  CONFIG_OF_CONTROL=y
>  CONFIG_NET_RANDOM_ETHADDR=y
> +CONFIG_DM_GPIO=y
>  CONFIG_DM_MMC=y
>  CONFIG_MMC_MESON_GX=y
>  CONFIG_DM_ETH=y

Some part of this series needs to introduce asm/arch/gpio.h and is not,
so it fails to build.

-- 
Tom
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: Digital signature
URL: <http://lists.infradead.org/pipermail/linux-amlogic/attachments/20170706/e6d6ae22/attachment.sig>
