From: narmstrong@baylibre.com (Neil Armstrong)
Date: Wed, 6 Dec 2017 14:43:56 +0100
Subject: [PATCH 4/4] meson: use the clock driver
In-Reply-To: <20171203091713.22029-5-b.galvani@gmail.com>
References: <20171203091713.22029-1-b.galvani@gmail.com>
 <20171203091713.22029-5-b.galvani@gmail.com>
Message-ID: <9b2970dc-8a88-f86e-0bf0-6711a10c8109@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 03/12/2017 10:17, Beniamino Galvani wrote:
> Use the clk framework to initialize clocks from drivers that need them
> instead of having hardcoded frequencies and initializations from board
> code.
> 
> Signed-off-by: Beniamino Galvani <b.galvani@gmail.com>
> ---
>  arch/arm/include/asm/arch-meson/gxbb.h | 10 ----------
>  arch/arm/include/asm/arch-meson/i2c.h  | 11 -----------
>  board/amlogic/odroid-c2/odroid-c2.c    |  4 +---
>  board/amlogic/p212/p212.c              |  3 +--
>  drivers/i2c/meson_i2c.c                | 20 +++++++++++++++++---
>  5 files changed, 19 insertions(+), 29 deletions(-)
>  delete mode 100644 arch/arm/include/asm/arch-meson/i2c.h
> 
> diff --git a/arch/arm/include/asm/arch-meson/gxbb.h b/arch/arm/include/asm/arch-meson/gxbb.h
> index 95a6fe6998..48a2ab7425 100644
> --- a/arch/arm/include/asm/arch-meson/gxbb.h
> +++ b/arch/arm/include/asm/arch-meson/gxbb.h
> @@ -40,14 +40,4 @@
>  /* Ethernet memory power domain */
>  #define GXBB_MEM_PD_REG_0_ETH_MASK	(BIT(2) | BIT(3))
>  
> -/* Clock gates */
> -#define GXBB_GCLK_MPEG_0	GXBB_HIU_ADDR(0x50)
> -#define GXBB_GCLK_MPEG_1	GXBB_HIU_ADDR(0x51)
> -#define GXBB_GCLK_MPEG_2	GXBB_HIU_ADDR(0x52)
> -#define GXBB_GCLK_MPEG_OTHER	GXBB_HIU_ADDR(0x53)
> -#define GXBB_GCLK_MPEG_AO	GXBB_HIU_ADDR(0x54)
> -
> -#define GXBB_GCLK_MPEG_0_I2C   BIT(9)
> -#define GXBB_GCLK_MPEG_1_ETH	BIT(3)
> -
>  #endif /* __GXBB_H__ */
> diff --git a/arch/arm/include/asm/arch-meson/i2c.h b/arch/arm/include/asm/arch-meson/i2c.h
> deleted file mode 100644
> index 783bc3786f..0000000000
> --- a/arch/arm/include/asm/arch-meson/i2c.h
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -/*
> - * Copyright 2017 - Beniamino Galvani <b.galvani@gmail.com>
> - *
> - * SPDX-License-Identifier:	GPL-2.0+
> - */
> -#ifndef _MESON_I2C_H_
> -#define _MESON_I2C_H_
> -
> -#define MESON_I2C_CLK_RATE	167000000
> -
> -#endif
> diff --git a/board/amlogic/odroid-c2/odroid-c2.c b/board/amlogic/odroid-c2/odroid-c2.c
> index a5ea8dc5af..833f01b4cf 100644
> --- a/board/amlogic/odroid-c2/odroid-c2.c
> +++ b/board/amlogic/odroid-c2/odroid-c2.c
> @@ -34,9 +34,7 @@ int misc_init_r(void)
>  				     GXBB_ETH_REG_0_PHY_CLK_EN |
>  				     GXBB_ETH_REG_0_CLK_EN);
>  
> -	/* Enable power and clock gate */
> -	setbits_le32(GXBB_GCLK_MPEG_0, GXBB_GCLK_MPEG_0_I2C);
> -	setbits_le32(GXBB_GCLK_MPEG_1, GXBB_GCLK_MPEG_1_ETH);
> +	/* Enable power */
>  	clrbits_le32(GXBB_MEM_PD_REG_0, GXBB_MEM_PD_REG_0_ETH_MASK);
>  
>  	/* Reset PHY on GPIOZ_14 */
> diff --git a/board/amlogic/p212/p212.c b/board/amlogic/p212/p212.c
> index ece8096c5c..907bbb286e 100644
> --- a/board/amlogic/p212/p212.c
> +++ b/board/amlogic/p212/p212.c
> @@ -36,8 +36,7 @@ int misc_init_r(void)
>  	out_le32(GXBB_ETH_REG_2, 0x10110181);
>  	out_le32(GXBB_ETH_REG_3, 0xe40908ff);
>  
> -	/* Enable power and clock gate */
> -	setbits_le32(GXBB_GCLK_MPEG_1, GXBB_GCLK_MPEG_1_ETH);
> +	/* Enable power */
>  	clrbits_le32(GXBB_MEM_PD_REG_0, GXBB_MEM_PD_REG_0_ETH_MASK);
>  
>  	if (!eth_env_get_enetaddr("ethaddr", mac_addr)) {
> diff --git a/drivers/i2c/meson_i2c.c b/drivers/i2c/meson_i2c.c
> index 2434d9ed53..1d92b09c32 100644
> --- a/drivers/i2c/meson_i2c.c
> +++ b/drivers/i2c/meson_i2c.c
> @@ -4,8 +4,8 @@
>   * SPDX-License-Identifier:	GPL-2.0+
>   */
>  #include <common.h>
> -#include <asm/arch/i2c.h>
>  #include <asm/io.h>
> +#include <clk.h>
>  #include <dm.h>
>  #include <i2c.h>
>  
> @@ -43,6 +43,7 @@ struct i2c_regs {
>  };
>  
>  struct meson_i2c {
> +	struct clk clk;
>  	struct i2c_regs *regs;
>  	struct i2c_msg *msg;
>  	bool last;
> @@ -209,9 +210,13 @@ static int meson_i2c_xfer(struct udevice *bus, struct i2c_msg *msg,
>  static int meson_i2c_set_bus_speed(struct udevice *bus, unsigned int speed)
>  {
>  	struct meson_i2c *i2c = dev_get_priv(bus);
> -	unsigned int clk_rate = MESON_I2C_CLK_RATE;
> +	ulong clk_rate;
>  	unsigned int div;
>  
> +	clk_rate = clk_get_rate(&i2c->clk);
> +	if (IS_ERR_VALUE(clk_rate))
> +		return -EINVAL;
> +
>  	div = DIV_ROUND_UP(clk_rate, speed * 4);
>  
>  	/* clock divider has 12 bits */
> @@ -226,7 +231,7 @@ static int meson_i2c_set_bus_speed(struct udevice *bus, unsigned int speed)
>  	clrsetbits_le32(&i2c->regs->ctrl, REG_CTRL_CLKDIVEXT_MASK,
>  			(div >> 10) << REG_CTRL_CLKDIVEXT_SHIFT);
>  
> -	debug("meson i2c: set clk %u, src %u, div %u\n", speed, clk_rate, div);
> +	debug("meson i2c: set clk %u, src %lu, div %u\n", speed, clk_rate, div);
>  
>  	return 0;
>  }
> @@ -234,6 +239,15 @@ static int meson_i2c_set_bus_speed(struct udevice *bus, unsigned int speed)
>  static int meson_i2c_probe(struct udevice *bus)
>  {
>  	struct meson_i2c *i2c = dev_get_priv(bus);
> +	int ret;
> +
> +	ret = clk_get_by_index(bus, 0, &i2c->clk);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = clk_enable(&i2c->clk);
> +	if (ret)
> +		return ret;
>  
>  	i2c->regs = dev_read_addr_ptr(bus);
>  	clrbits_le32(&i2c->regs->ctrl, REG_CTRL_START);
> 

You must now rebase it to master since tom merged the Khadas and LibreTech-CC patches.

Thanks for the patchset, it looks very good.

Neil
