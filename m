From: jh80.chung@samsung.com (Jaehoon Chung)
Date: Thu, 04 Aug 2016 15:48:50 +0900
Subject: [U-Boot,1/2] mmc: Add Amlogic Meson driver
In-Reply-To: <1463056902-8533-2-git-send-email-carlo@caione.org>
References: <1463056902-8533-2-git-send-email-carlo@caione.org>
Message-ID: <a0c08bbd-1ff6-3234-6daf-e732de8347b7@samsung.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Carlo

On 05/12/2016 09:41 PM, Carlo Caione wrote:
> From: Carlo Caione <carlo@endlessm.com>
> 
> This is a port / rewrite of the Amlogic driver shipped whithin the
> Amlogic SDK for the Meson GXBaby (S905) SoC.

s/whithin/within

And If you want to apply this patch, could you resend the patch on lates u-boot?

> 
> Signed-off-by: Carlo Caione <carlo@endlessm.com>
> ---
>  arch/arm/include/asm/arch-meson/sd_emmc.h | 109 +++++++++++
>  drivers/mmc/Makefile                      |   1 +
>  drivers/mmc/meson_mmc.c                   | 305 ++++++++++++++++++++++++++++++
>  3 files changed, 415 insertions(+)
>  create mode 100644 arch/arm/include/asm/arch-meson/sd_emmc.h
>  create mode 100644 drivers/mmc/meson_mmc.c
> 
> diff --git a/arch/arm/include/asm/arch-meson/sd_emmc.h b/arch/arm/include/asm/arch-meson/sd_emmc.h
> new file mode 100644
> index 0000000..6781dca
> --- /dev/null
> +++ b/arch/arm/include/asm/arch-meson/sd_emmc.h
> @@ -0,0 +1,109 @@
> +/*
> + * (C) Copyright 2016 Carlo Caione <carlo@caione.org>
> + *
> + * SPDX-License-Identifier:    GPL-2.0+
> + */
> +
> +#ifndef __SD_EMMC_H__
> +#define __SD_EMMC_H__
> +
> +#include <mmc.h>
> +
> +#define SDIO_PORT_A			0
> +#define SDIO_PORT_B			1
> +#define SDIO_PORT_C			2
> +
> +#define SD_EMMC_BASE_A			0xd0070000
> +#define SD_EMMC_BASE_B			0xd0072000
> +#define SD_EMMC_BASE_C			0xd0074000
> +
> +#define SD_IRQ_ALL			0x3fff
> +
> +#define SD_EMMC_CLKSRC_24M		24000000
> +#define SD_EMMC_CLKSRC_DIV2		1000000000

Is it right? 1GHz?

> +
> +#define CLK_DIV				0
> +#define CLK_SRC				6
> +#define CLK_CO_PHASE			8
> +#define CLK_ALWAYS_ON			24

Are these for shifting?

> +
> +#define ADDR_USE_PING_BUF		BIT(1)
> +
> +#define SD_EMMC_RXD_ERROR		BIT(0)
> +#define SD_EMMC_TXD_ERROR		BIT(1)
> +#define SD_EMMC_DESC_ERROR		BIT(2)
> +#define SD_EMMC_RESP_CRC_ERROR		BIT(3)
> +#define SD_EMMC_RESP_TIMEOUT_ERROR	BIT(4)
> +#define SD_EMMC_DESC_TIMEOUT_ERROR	BIT(5)
> +
> +#define CFG_BUS_WIDTH			0
> +#define CFG_BUS_WIDTH_MASK		(0x3 << 0)
> +#define CFG_BL_LEN			4
> +#define CFG_BL_LEN_MASK			(0xf << 4)
> +#define CFG_RESP_TIMEOUT		8
> +#define CFG_RESP_TIMEOUT_MASK		(0xf << 8)
> +#define CFG_RC_CC			12
> +#define CFG_RC_CC_MASK			(0xf << 12)
> +
> +#define STATUS_RXD_ERR_MASK		0xff
> +#define STATUS_TXD_ERR			BIT(8)
> +#define STATUS_DESC_ERR			BIT(9)
> +#define STATUS_RESP_ERR			BIT(10)
> +#define STATUS_RESP_TIMEOUT		BIT(11)
> +#define STATUS_DESC_TIMEOUT		BIT(12)
> +#define STATUS_END_OF_CHAIN		BIT(13)
> +
> +#define CMD_CFG_LENGTH_MASK		0x1ff
> +#define CMD_CFG_CMD_INDEX		24
> +#define CMD_CFG_BLOCK_MODE		BIT(9)
> +#define CMD_CFG_R1B			BIT(10)
> +#define CMD_CFG_END_OF_CHAIN		BIT(11)
> +#define CMD_CFG_NO_RESP			BIT(16)
> +#define CMD_CFG_DATA_IO			BIT(18)
> +#define CMD_CFG_DATA_WR			BIT(19)
> +#define CMD_CFG_RESP_NOCRC		BIT(20)
> +#define CMD_CFG_RESP_128		BIT(21)
> +#define CMD_CFG_OWNER			BIT(31)

Add the description for which register.
e,g
/* GCLOCK register */
#define ...

> +
> +struct meson_mmc_regs {
> +	uint32_t gclock;
> +	uint32_t gdelay;
> +	uint32_t gadjust;
> +	uint32_t reserved_0c;
> +	uint32_t gcalout;
> +	uint32_t reserved_14[11];
> +	uint32_t gstart;
> +	uint32_t gcfg;
> +	uint32_t gstatus;
> +	uint32_t girq_en;
> +	uint32_t gcmd_cfg;
> +	uint32_t gcmd_arg;
> +	uint32_t gcmd_dat;
> +	uint32_t gcmd_rsp0;
> +	uint32_t gcmd_rsp1;
> +	uint32_t gcmd_rsp2;
> +	uint32_t gcmd_rsp3;
> +	uint32_t reserved_6c;
> +	uint32_t gcurr_cfg;
> +	uint32_t gcurr_arg;
> +	uint32_t gcurr_dat;
> +	uint32_t gcurr_rsp;
> +	uint32_t gnext_cfg;
> +	uint32_t gnext_arg;
> +	uint32_t gnext_dat;
> +	uint32_t gnext_rsp;
> +	uint32_t grxd;
> +	uint32_t gtxd;
> +	uint32_t reserved_98[90];
> +	uint32_t gdesc[128];
> +	uint32_t gping[128];
> +	uint32_t gpong[128];
> +};

Don't use this style..Use the define.
It's difficult to debug..devloper don't know which offset is used before calculating.
And add the descriptions..

> +
> +struct meson_mmc_platdata {
> +	struct mmc_config cfg;
> +	struct meson_mmc_regs *sd_emmc_reg;
> +	char *w_buf;
> +};
> +
> +#endif
> diff --git a/drivers/mmc/Makefile b/drivers/mmc/Makefile
> index 585aaf3..08ac9ba 100644
> --- a/drivers/mmc/Makefile
> +++ b/drivers/mmc/Makefile
> @@ -21,6 +21,7 @@ obj-$(CONFIG_FTSDC021) += ftsdc021_sdhci.o
>  obj-$(CONFIG_GENERIC_MMC) += mmc.o
>  obj-$(CONFIG_GENERIC_ATMEL_MCI) += gen_atmel_mci.o
>  obj-$(CONFIG_KONA_SDHCI) += kona_sdhci.o
> +obj-$(CONFIG_MMC_MESON) += meson_mmc.o
>  obj-$(CONFIG_MMC_SPI) += mmc_spi.o
>  obj-$(CONFIG_MMC_SUNXI) += sunxi_mmc.o
>  obj-$(CONFIG_MV_SDHCI) += mv_sdhci.o
> diff --git a/drivers/mmc/meson_mmc.c b/drivers/mmc/meson_mmc.c
> new file mode 100644
> index 0000000..af224ec
> --- /dev/null
> +++ b/drivers/mmc/meson_mmc.c
> @@ -0,0 +1,305 @@
> +/*
> + * (C) Copyright 2016 Carlo Caione <carlo@caione.org>
> + *
> + * SPDX-License-Identifier:    GPL-2.0+
> + */
> +
> +#include <common.h>
> +#include <fdtdec.h>
> +#include <malloc.h>
> +#include <mmc.h>
> +#include <asm/io.h>
> +#include <asm/arch/sd_emmc.h>
> +#include <dm/device.h>
> +
> +static void meson_mmc_config_clock(struct mmc *mmc,
> +				   struct meson_mmc_regs *meson_mmc_reg)
> +{
> +	uint32_t meson_mmc_clk = 0;
> +	unsigned int clk, clk_src, clk_div;
> +
> +	if (mmc->clock > 12000000) {
> +		clk = SD_EMMC_CLKSRC_DIV2;
> +		clk_src = 1;
> +	} else {
> +		clk = SD_EMMC_CLKSRC_24M;
> +		clk_src = 0;
> +	}
> +	clk_div = clk / mmc->clock;
> +
> +	if (mmc->clock < mmc->cfg->f_min)
> +		mmc->clock = mmc->cfg->f_min;
> +	if (mmc->clock > mmc->cfg->f_max)
> +		mmc->clock = mmc->cfg->f_max;

In mmc_set_clock(), mmc->clock is already assigned..
Doesn't need this.

> +
> +	/* Keep the clock always on */
> +	meson_mmc_clk |= (1 << CLK_ALWAYS_ON);
> +
> +	/* 180 phase */
> +	meson_mmc_clk |= (2 << CLK_CO_PHASE);

Don't use the magic number, what do 1 and 2 mean?

> +
> +	/* clock settings */
> +	meson_mmc_clk |= (clk_src << CLK_SRC);
> +	meson_mmc_clk |= (clk_div << CLK_DIV);

How many bits do use for clk_div? bit[0:11]?

> +
> +	writel(meson_mmc_clk, &meson_mmc_reg->gclock);
> +}
> +
> +static void meson_mmc_set_ios(struct mmc *mmc)
> +{
> +	struct meson_mmc_platdata *pdata;
> +	struct meson_mmc_regs *meson_mmc_reg;
> +	unsigned int bus_width;
> +	uint32_t meson_mmc_cfg = 0;
> +
> +	pdata = mmc->priv;
> +	meson_mmc_reg = pdata->sd_emmc_reg;
> +
> +	meson_mmc_config_clock(mmc, meson_mmc_reg);
> +
> +	meson_mmc_cfg = readl(&meson_mmc_reg->gcfg);
> +
> +	if (mmc->bus_width == 1)
> +		bus_width = 0;
> +	else
> +		bus_width = mmc->bus_width / 4;
> +
> +	/* 1-bit mode */
> +	meson_mmc_cfg &= ~CFG_BUS_WIDTH_MASK;
> +	meson_mmc_cfg |= (bus_width << CFG_BUS_WIDTH);
> +
> +	/* 512 bytes block lenght */
> +	meson_mmc_cfg &= ~CFG_BL_LEN_MASK;
> +	meson_mmc_cfg |= (9 << CFG_BL_LEN);
> +
> +	/* Response timeout 256 clk */
> +	meson_mmc_cfg &= ~CFG_RESP_TIMEOUT_MASK;
> +	meson_mmc_cfg |= (7 << CFG_RESP_TIMEOUT);
> +
> +	/* Command-command gap 1024 clk */
> +	meson_mmc_cfg &= ~CFG_RC_CC_MASK;
> +	meson_mmc_cfg |= (4 << CFG_RC_CC);

Ditto...what are 9, 7, 4?
Don't use the magic number in entire your codes.

> +
> +	writel(meson_mmc_cfg, &meson_mmc_reg->gcfg);
> +
> +	return;

not needs "return"

> +}
> +
> +static int meson_mmc_init(struct mmc *mmc)
> +{
> +	mmc_set_clock(mmc, 400000);
> +
> +	return 0;
> +}
> +
> +static void meson_mmc_setup_cmd(struct mmc *mmc, struct mmc_data *data,
> +				struct mmc_cmd *cmd,
> +				struct meson_mmc_regs *meson_mmc_reg)
> +{
> +	uint32_t meson_mmc_cmd = 0;
> +
> +	meson_mmc_cmd = ((0x80 | cmd->cmdidx) << CMD_CFG_CMD_INDEX);
> +
> +	if (cmd->resp_type & MMC_RSP_PRESENT) {
> +		if (cmd->resp_type & MMC_RSP_136)
> +			meson_mmc_cmd |= CMD_CFG_RESP_128;
> +
> +		if (cmd->resp_type & MMC_RSP_BUSY)
> +			meson_mmc_cmd |= CMD_CFG_R1B;

There is no case with MMC_RSP_136 and MMC_RSP_BUSY together.

> +
> +		if (!(cmd->resp_type & MMC_RSP_CRC))
> +			meson_mmc_cmd |= CMD_CFG_RESP_NOCRC;
> +	} else {
> +		meson_mmc_cmd |= CMD_CFG_NO_RESP;
> +	}
> +
> +	if (data) {
> +		meson_mmc_cmd |= CMD_CFG_DATA_IO;
> +
> +		if (data->flags == MMC_DATA_WRITE)
> +			meson_mmc_cmd |= CMD_CFG_DATA_WR;
> +
> +		if (data->blocks > 1) {
> +			meson_mmc_cmd |= CMD_CFG_BLOCK_MODE;
> +			meson_mmc_cmd |= data->blocks;
> +		} else {
> +			meson_mmc_cmd |= (data->blocksize & CMD_CFG_LENGTH_MASK);
> +		}
> +	}
> +
> +	meson_mmc_cmd |= CMD_CFG_OWNER;
> +	meson_mmc_cmd |= CMD_CFG_END_OF_CHAIN;
> +
> +	writel(meson_mmc_cmd, &meson_mmc_reg->gcmd_cfg);
> +
> +	return;
> +}
> +
> +static void meson_mmc_setup_addr(struct mmc *mmc, struct mmc_data *data,
> +				 struct meson_mmc_regs *meson_mmc_reg)
> +{
> +	struct meson_mmc_platdata *pdata;
> +	unsigned int data_size = 0;
> +	uint32_t meson_mmc_data_addr = 0;
> +
> +	pdata = mmc->priv;
> +
> +	if (data) {
> +		data_size = data->blocks * data->blocksize;
> +
> +		if (data->flags == MMC_DATA_READ) {
> +			if (data_size < 0x200) {
> +				meson_mmc_data_addr = (ulong) meson_mmc_reg->gping;
> +				meson_mmc_data_addr |= ADDR_USE_PING_BUF;
> +			} else {
> +				invalidate_dcache_range((ulong) data->dest,
> +							(ulong) (data->dest + data_size));
> +				meson_mmc_data_addr = (ulong) data->dest;
> +			}
> +		}
> +
> +		if (data->flags == MMC_DATA_WRITE) {

data->flags is only two..MMC_DATA_WRITE ..otherwise MMC_DATA_READ.

> +			pdata->w_buf = calloc(data_size, sizeof(char));
> +			memcpy(pdata->w_buf, data->src, data_size);
> +			flush_dcache_range((ulong) pdata->w_buf,
> +					   (ulong) (pdata->w_buf + data_size));
> +			meson_mmc_data_addr = (ulong) pdata->w_buf;
> +		}
> +	}
> +
> +	writel(meson_mmc_data_addr, &meson_mmc_reg->gcmd_dat);
> +
> +	return;
> +}
> +
> +static void meson_mmc_read_response(struct mmc *mmc, struct mmc_data *data,
> +				    struct mmc_cmd *cmd,
> +				    struct meson_mmc_regs *meson_mmc_reg)
> +{
> +	unsigned int data_size = 0;
> +
> +	if (data) {
> +		data_size = data->blocks * data->blocksize;
> +		if ((data_size < 0x200) && (data->flags == MMC_DATA_READ))
> +			memcpy(data->dest, (const void *)meson_mmc_reg->gping, data_size);
> +	}
> +
> +	if (cmd->resp_type & MMC_RSP_136) {
> +		cmd->response[0] = readl(&meson_mmc_reg->gcmd_rsp3);
> +		cmd->response[1] = readl(&meson_mmc_reg->gcmd_rsp2);
> +		cmd->response[2] = readl(&meson_mmc_reg->gcmd_rsp1);
> +		cmd->response[3] = readl(&meson_mmc_reg->gcmd_rsp0);
> +	} else {
> +		cmd->response[0] = readl(&meson_mmc_reg->gcmd_rsp0);
> +	}
> +}
> +
> +static int meson_mmc_send_cmd(struct mmc *mmc, struct mmc_cmd *cmd,
> +			      struct mmc_data *data)
> +{
> +	struct meson_mmc_platdata *pdata;
> +	struct meson_mmc_regs *meson_mmc_reg;
> +	uint32_t meson_mmc_irq = 0;
> +	int ret = 0;
> +
> +	pdata = mmc->priv;
> +	meson_mmc_reg = pdata->sd_emmc_reg;
> +
> +	meson_mmc_setup_cmd(mmc, data, cmd, meson_mmc_reg);
> +	meson_mmc_setup_addr(mmc, data, meson_mmc_reg);
> +
> +	writel(SD_IRQ_ALL, &meson_mmc_reg->gstatus);
> +	writel(cmd->cmdarg, &meson_mmc_reg->gcmd_arg);
> +
> +	while (1) {
> +		meson_mmc_irq = readl(&meson_mmc_reg->gstatus);
> +		if (meson_mmc_irq & STATUS_END_OF_CHAIN)
> +			break;
> +	}

I don't like this style...potential infinte loop.

> +
> +	if (meson_mmc_irq & STATUS_RXD_ERR_MASK)
> +		ret |= SD_EMMC_RXD_ERROR;
> +	if (meson_mmc_irq & STATUS_TXD_ERR)
> +		ret |= SD_EMMC_TXD_ERROR;
> +	if (meson_mmc_irq & STATUS_DESC_ERR)
> +		ret |= SD_EMMC_DESC_ERROR;
> +	if (meson_mmc_irq & STATUS_RESP_ERR)
> +		ret |= SD_EMMC_RESP_CRC_ERROR;
> +	if (meson_mmc_irq & STATUS_RESP_TIMEOUT)
> +		ret |= SD_EMMC_RESP_TIMEOUT_ERROR;
> +	if (meson_mmc_irq & STATUS_DESC_TIMEOUT)
> +		ret |= SD_EMMC_DESC_TIMEOUT_ERROR;

What are these ret values? Do you use the your specific error values?

> +
> +	meson_mmc_read_response(mmc, data, cmd, meson_mmc_reg);
> +
> +	if (data && data->flags == MMC_DATA_WRITE)
> +		free(pdata->w_buf);
> +
> +	if (ret) {
> +		if (meson_mmc_irq & STATUS_RESP_TIMEOUT)
> +			return TIMEOUT;

Strange this..why return at here...not above?

Best Regards,
Jaehoon Chung

> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct mmc_ops meson_mmc_ops = {
> +	.send_cmd	= meson_mmc_send_cmd,
> +	.set_ios	= meson_mmc_set_ios,
> +	.init		= meson_mmc_init,
> +};
> +
> +static int meson_mmc_ofdata_to_platdata(struct udevice *dev)
> +{
> +	struct meson_mmc_platdata *pdata = dev->platdata;
> +	fdt_addr_t addr;
> +
> +	addr = dev_get_addr(dev);
> +	if (addr == FDT_ADDR_T_NONE)
> +		return -EINVAL;
> +
> +	pdata->sd_emmc_reg = (struct meson_mmc_regs *)addr;
> +
> +	return 0;
> +}
> +
> +static int meson_mmc_probe(struct udevice *dev)
> +{
> +	struct meson_mmc_platdata *pdata = dev->platdata;
> +	struct mmc_uclass_priv *upriv = dev_get_uclass_priv(dev);
> +	struct mmc *mmc;
> +	struct mmc_config *cfg;
> +
> +	cfg = &pdata->cfg;
> +	cfg->ops = &meson_mmc_ops;
> +
> +	cfg->voltages = MMC_VDD_33_34 | MMC_VDD_32_33 |
> +			MMC_VDD_31_32 | MMC_VDD_165_195;
> +	cfg->host_caps = MMC_MODE_8BIT | MMC_MODE_4BIT |
> +			 MMC_MODE_HS_52MHz | MMC_MODE_HS;
> +	cfg->f_min = 400000;
> +	cfg->f_max = 50000000;
> +	cfg->b_max = 256;
> +
> +	mmc = mmc_create(cfg, pdata);
> +	if (!mmc)
> +		return -ENOMEM;
> +
> +	upriv->mmc = mmc;
> +	return 0;
> +}
> +
> +static const struct udevice_id meson_mmc_match[] = {
> +	{ .compatible = "amlogic,meson-mmc" },
> +	{ /* sentinel */ }
> +};
> +
> +U_BOOT_DRIVER(meson_mmc) = {
> +	.name = "meson_mmc",
> +	.id = UCLASS_MMC,
> +	.of_match = meson_mmc_match,
> +	.probe = meson_mmc_probe,
> +	.ofdata_to_platdata = meson_mmc_ofdata_to_platdata,
> +	.platdata_auto_alloc_size = sizeof(struct meson_mmc_platdata),
> +};
> 
