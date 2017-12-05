From: yixun.lan@amlogic.com (Yixun Lan)
Date: Tue, 5 Dec 2017 23:23:07 +0800
Subject: [PATCH net-next] net: phy: meson-gxl: cleanup by defining the
 control registers
In-Reply-To: <20171205093334.8261-1-jbrunet@baylibre.com>
References: <20171205093334.8261-1-jbrunet@baylibre.com>
Message-ID: <970919cd-cf0f-1782-22b8-46746a92fc43@amlogic.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

HI Jerome:


On 12/05/17 17:33, Jerome Brunet wrote:
> From: Neil Armstrong <narmstrong@baylibre.com>
> 
> Define registers and bits in meson-gxl PHY driver to make a bit
> more human friendly. No functional change
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/net/phy/meson-gxl.c | 111 +++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 93 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/net/phy/meson-gxl.c b/drivers/net/phy/meson-gxl.c
> index 1ea69b7585d9..82c11556605e 100644
> --- a/drivers/net/phy/meson-gxl.c
> +++ b/drivers/net/phy/meson-gxl.c
> @@ -22,32 +22,107 @@
>  #include <linux/ethtool.h>
>  #include <linux/phy.h>
>  #include <linux/netdevice.h>
> +#include <linux/bitfield.h>
> +
> +#define TSTCNTL		0x14
> +#define TSTREAD1	0x15
> +#define TSTREAD2	0x16
> +#define TSTWRITE	0x17
> +
> +#define TSTCNTL_READ		BIT(15)
> +#define TSTCNTL_WRITE		BIT(14)
> +#define TSTCNTL_REG_BANK_SEL	GENMASK(12, 11)
> +#define TSTCNTL_TEST_MODE	BIT(10)
> +#define TSTCNTL_READ_ADDRESS	GENMASK(9, 5)
> +#define TSTCNTL_WRITE_ADDRESS	GENMASK(4, 0)
> +
> +#define BANK_ANALOG_DSP		0
> +#define BANK_BIST		3
> +
> +/* Analog/DSP Registers */
> +#define A6_CONFIG_REG		0x17
> +
> +/* BIST Registers */
> +#define FR_PLL_CONTROL		0x1b
> +#define FR_PLL_DIV0		0x1c
> +#define FR_PLL_DIV1		0x1d
> +
> +#define A6_CONFIG_PLLMULX4ICH		BIT(15)
> +#define A6_CONFIG_PLLBIASSEL		BIT(14)
> +#define A6_CONFIG_PLLINTRATIO		GENMASK(13, 12)
> +#define A6_CONFIG_PLLBUFITRIM		GENMASK(11, 9)
> +#define A6_CONFIG_PLLCHTRIM		GENMASK(8, 5)
> +#define A6_CONFIG_PLLCHBIASSEL		BIT(4)
> +#define A6_CONFIG_PLLRSTVCOPD		BIT(3)
> +#define A6_CONFIG_PLLCPOFF		BIT(2)
> +#define A6_CONFIG_PLLPD			BIT(1)
> +#define A6_CONFIG_PLL_SRC		BIT(0)
> +
> +static inline int meson_gxl_write_reg(struct phy_device *phydev,
> +				      unsigned int bank, unsigned int reg,
> +				      uint16_t value)
> +{
> +	int ret;
> +
> +	/* Enable Analog and DSP register Bank access by
> +	 * toggling TSTCNTL_TEST_MODE bit in the TSTCNTL register
> +	 */
> +	ret = phy_write(phydev, TSTCNTL, 0);
> +	if (ret)
> +		goto out;
> +	ret = phy_write(phydev, TSTCNTL, TSTCNTL_TEST_MODE);
> +	if (ret)
> +		goto out;
> +	ret = phy_write(phydev, TSTCNTL, 0);
> +	if (ret)
> +		goto out;
> +	ret = phy_write(phydev, TSTCNTL, TSTCNTL_TEST_MODE);
> +	if (ret)
> +		goto out;
> +
how about just do the above enable procedure once?
from the datasheet, the access won't be disabled if don't reset, or
write to register TSTCNTL with TEST_MODE=0

> +	ret = phy_write(phydev, TSTWRITE, value);
> +	if (ret)
> +		goto out;
> +
> +	ret = phy_write(phydev, TSTCNTL, TSTCNTL_WRITE |
> +			FIELD_PREP(TSTCNTL_REG_BANK_SEL, bank) |
> +			TSTCNTL_TEST_MODE |
> +			FIELD_PREP(TSTCNTL_WRITE_ADDRESS, reg));
> +
> +out:
> +	/* Close the bank access on our way out */
> +	phy_write(phydev, TSTCNTL, 0);
> +	return ret;
> +}
> +
>  
>  static int meson_gxl_config_init(struct phy_device *phydev)
>  {
> -	/* Enable Analog and DSP register Bank access by */
> -	phy_write(phydev, 0x14, 0x0000);
> -	phy_write(phydev, 0x14, 0x0400);
> -	phy_write(phydev, 0x14, 0x0000);
> -	phy_write(phydev, 0x14, 0x0400);
> +	int ret;
>  
> -	/* Write Analog register 23 */
> -	phy_write(phydev, 0x17, 0x8E0D);
> -	phy_write(phydev, 0x14, 0x4417);
> +	/* Write PLL Configuration 1 */
> +	ret = meson_gxl_write_reg(phydev, BANK_ANALOG_DSP, A6_CONFIG_REG,
> +				  A6_CONFIG_PLLMULX4ICH |
> +				  FIELD_PREP(A6_CONFIG_PLLBUFITRIM, 7) |
> +				  A6_CONFIG_PLLRSTVCOPD |
> +				  A6_CONFIG_PLLCPOFF |
> +				  A6_CONFIG_PLL_SRC);
> +	if (ret)
> +		return ret;
>  
> -	/* Enable fractional PLL */
> -	phy_write(phydev, 0x17, 0x0005);
> -	phy_write(phydev, 0x14, 0x5C1B);
> +	/* Enable fractional PLL configuration */
> +	ret = meson_gxl_write_reg(phydev, BANK_BIST, FR_PLL_CONTROL, 0x5);
> +	if (ret)
> +		return ret;
>  
> -	/* Program fraction FR_PLL_DIV1 */
> -	phy_write(phydev, 0x17, 0x029A);
> -	phy_write(phydev, 0x14, 0x5C1D);
> +	ret = meson_gxl_write_reg(phydev, BANK_BIST, FR_PLL_DIV1, 0x029a);
> +	if (ret)
> +		return ret;
>  
> -	/* Program fraction FR_PLL_DIV1 */
> -	phy_write(phydev, 0x17, 0xAAAA);
> -	phy_write(phydev, 0x14, 0x5C1C);
> +	/* Program fraction FR_PLL_DIV0 */
> +	ret = meson_gxl_write_reg(phydev, BANK_BIST, FR_PLL_DIV0, 0xaaaa);
>  
> -	return 0;
> +	return ret;
>  }
>  
>  static struct phy_driver meson_gxl_phy[] = {
> 
