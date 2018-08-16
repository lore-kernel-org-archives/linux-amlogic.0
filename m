From: b.galvani@gmail.com (Beniamino Galvani)
Date: Thu, 16 Aug 2018 10:15:05 +0200
Subject: [PATCH v2 u-boot 1/2] power: domain: Add the VPU Power Domain
 driver
In-Reply-To: <1533559760-32136-2-git-send-email-narmstrong@baylibre.com>
References: <1533559760-32136-1-git-send-email-narmstrong@baylibre.com>
 <1533559760-32136-2-git-send-email-narmstrong@baylibre.com>
Message-ID: <20180816081505.GA9347@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Mon, Aug 06, 2018 at 02:49:19PM +0200, Neil Armstrong wrote:
> The Amlogic Meson SoCs embeds a specific Power Domain dedicated to the
> Video Processing Unit.
> This patch implements support for this power domain in preparation of the
> future support for the Video display support in U-Boot.
> 
> This driver will depend on changes in the clock driver to handle the setup
> of the VPU and VAPB clocks configured from DT using assigned-clocks entries.
> 
> Reviewed-by: Simon Glass <sjg@chromium.org>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/power/domain/Kconfig             |   7 ++
>  drivers/power/domain/Makefile            |   1 +
>  drivers/power/domain/meson-gx-pwrc-vpu.c | 198 +++++++++++++++++++++++++++++++
>  3 files changed, 206 insertions(+)
>  create mode 100644 drivers/power/domain/meson-gx-pwrc-vpu.c
> 
> diff --git a/drivers/power/domain/Kconfig b/drivers/power/domain/Kconfig
> index 7cfa761..4618847 100644
> --- a/drivers/power/domain/Kconfig
> +++ b/drivers/power/domain/Kconfig
> @@ -16,6 +16,13 @@ config BCM6328_POWER_DOMAIN
>  	  Enable support for manipulating BCM6345 power domains via MMIO
>  	  mapped registers.
>  
> +config MESON_GX_VPU_POWER_DOMAIN
> +	bool "Enable Amlogic Meson GX VPU power domain driver"
> +	depends on ARCH_MESON

Hi,

since the driver uses syscon_node_to_regmap() I think the Kconfig
entry should also 'select SYSCON'.

Beniamino
