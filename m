From: narmstrong@baylibre.com (Neil Armstrong)
Date: Wed, 6 Dec 2017 14:40:39 +0100
Subject: [PATCH 2/4] ARM: meson: add clock measurement function
In-Reply-To: <20171203091713.22029-3-b.galvani@gmail.com>
References: <20171203091713.22029-1-b.galvani@gmail.com>
 <20171203091713.22029-3-b.galvani@gmail.com>
Message-ID: <410a57c8-590b-f802-d71e-b2e994535c18@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 03/12/2017 10:17, Beniamino Galvani wrote:
> Add add a function to measure the current clock rate.
> 
> Signed-off-by: Beniamino Galvani <b.galvani@gmail.com>
> ---
>  arch/arm/include/asm/arch-meson/clock.h | 34 +++++++++++++++++++++++++
>  arch/arm/mach-meson/Makefile            |  2 +-
>  arch/arm/mach-meson/clock.c             | 45 +++++++++++++++++++++++++++++++++
>  3 files changed, 80 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/include/asm/arch-meson/clock.h
>  create mode 100644 arch/arm/mach-meson/clock.c
> 
> diff --git a/arch/arm/include/asm/arch-meson/clock.h b/arch/arm/include/asm/arch-meson/clock.h
> new file mode 100644
> index 0000000000..b43b23386c
> --- /dev/null
> +++ b/arch/arm/include/asm/arch-meson/clock.h
> @@ -0,0 +1,34 @@
> +/*
> + * Copyright 2017 - Beniamino Galvani <b.galvani@gmail.com>
> + *
> + * SPDX-License-Identifier:	GPL-2.0+
> + */
> +#ifndef _MESON_CLOCK_H_
> +#define _MESON_CLOCK_H_
> +
> +/* CBUS clock measure registers */
> +#define MSR_CLK_DUTY		0xc1108758
> +#define MSR_CLK_REG0		0xc110875c
> +#define MSR_CLK_REG1		0xc1108760
> +#define MSR_CLK_REG2		0xc1108764
> +
> +#define CLK_GP0_PLL		4
> +#define CLK_GP1_PLL		5
> +#define CLK_81			7
> +#define CLK_MMC			23
> +#define CLK_MOD_ETH_TX		40
> +#define CLK_MOD_ETH_RX_RMII	41
> +#define CLK_FCLK_DIV5		43
> +#define CLK_SD_EMMC_CLK_C	51
> +#define CLK_SD_EMMC_CLK_B	52
> +
> +/* Clock gates */
> +#define HHI_GCLK_MPEG0		0x140
> +#define HHI_GCLK_MPEG1		0x144
> +#define HHI_GCLK_MPEG2		0x148
> +#define HHI_GCLK_OTHER		0x150
> +#define HHI_GCLK_AO		0x154
> +
> +ulong meson_measure_clk_rate(unsigned int clk);
> +
> +#endif
> diff --git a/arch/arm/mach-meson/Makefile b/arch/arm/mach-meson/Makefile
> index bf49b8b1e5..e7ea4fc5b0 100644
> --- a/arch/arm/mach-meson/Makefile
> +++ b/arch/arm/mach-meson/Makefile
> @@ -4,4 +4,4 @@
>  # SPDX-License-Identifier:	GPL-2.0+
>  #
>  
> -obj-y += board.o sm.o
> +obj-y += board.o clock.o sm.o
> diff --git a/arch/arm/mach-meson/clock.c b/arch/arm/mach-meson/clock.c
> new file mode 100644
> index 0000000000..73be11e90d
> --- /dev/null
> +++ b/arch/arm/mach-meson/clock.c
> @@ -0,0 +1,45 @@
> +/*
> + * (C) Copyright 2016 Beniamino Galvani <b.galvani@gmail.com>
> + *
> + * SPDX-License-Identifier:	GPL-2.0+
> + *
> + * Clock rate measuring.
> + */
> +
> +#include <common.h>
> +#include <asm/arch/clock.h>
> +#include <asm/io.h>
> +
> +ulong meson_measure_clk_rate(unsigned int clk)
> +{
> +	ulong start;
> +	ulong mhz;
> +
> +	writel(0, MSR_CLK_REG0);
> +
> +	/* Set the measurement gate to 64uS */
> +	clrsetbits_le32(MSR_CLK_REG0, 0xffff, 64 - 1);
> +	clrbits_le32(MSR_CLK_REG0,
> +		     BIT(17) |		/* disable continuous measurement */
> +		     BIT(18));		/* disable interrupts */

You can maybe document these bits somehow.

> +	clrsetbits_le32(MSR_CLK_REG0,
> +			GENMASK(20, 26),
> +			clk << 20);	/* select the clock */
> +	setbits_le32(MSR_CLK_REG0,
> +		     BIT(19) |		/* enable the clock */
> +		     BIT(16));		/* enable measuring */

Same here.

> +
> +	start = get_timer(0);
> +	while (readl(MSR_CLK_REG0) & BIT(31)) {
> +		if (get_timer(start) > 100) {
> +			debug("could not measure clk %u rate\n", clk);
> +			return -ETIMEDOUT;
> +		}
> +	}
> +
> +	/* Disable measuring */
> +	clrbits_le32(MSR_CLK_REG0, BIT(16));
> +
> +	mhz = ((readl(MSR_CLK_REG2) + 31) & 0xfffff) >> 6;
> +	return mhz * 1000000;
> +}
> 

I'm skeptical about this, but it simplifies a lot the clock driver !

Anyway, it can be changed later if we want to control the PLLs and so on.

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
