Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9954CE7B1C
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Sep 2024 14:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZwIehqU2+WpBdrRQmpxykzuGYrVnQIv5245mjV+5du8=; b=CrsKHv5QpGGL7s
	xcYWxOZyhFmkD0Y8No87Efu6TJRnE1TgONYwHeZluHPvG57bnme0nmDLY8+RLLQ/suF7oL0/BMFFw
	F9SPcx9OhMJQstBhRzbdJshMQzE5LVWAkLYpnKsvNYEMEIDlzMG1pdnlr2BY5X7Ld6wEBVOljyz6Z
	d2DHHDkdt0DwFai76u28vil3sU2xcgUSbVZirRtT5nFHstEXr3JCTzALQwYofa4UxbQqvGMy5B9Kn
	N4H6FGR4r2BhBoDLuyJyp3J+7AA+0MQKzSChDzAD5v2Bit/LKyyBcM9Hz8KAf6drhsSCpEBG8P5QL
	IK3bB71sYWP1F5FleDOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smZom-0000000CViv-3saS;
	Fri, 06 Sep 2024 14:20:08 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smZno-0000000CVZL-2zU9
	for linux-amlogic@lists.infradead.org;
	Fri, 06 Sep 2024 14:19:09 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1smZnh-0002wL-F0; Fri, 06 Sep 2024 16:19:01 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1smZng-005xuF-Dc; Fri, 06 Sep 2024 16:19:00 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1smZng-000ATQ-17;
	Fri, 06 Sep 2024 16:19:00 +0200
Message-ID: <984d928a37b3db11ae53c07da672ccae0d79734f.camel@pengutronix.de>
Subject: Re: [PATCH v4 1/9] reset: amlogic: convert driver to regmap
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Jiucheng Xu <jiucheng.xu@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
  linux-kernel@vger.kernel.org
Date: Fri, 06 Sep 2024 16:19:00 +0200
In-Reply-To: <20240906-meson-rst-aux-v4-1-08824c3d108b@baylibre.com>
References: <20240906-meson-rst-aux-v4-0-08824c3d108b@baylibre.com>
	 <20240906-meson-rst-aux-v4-1-08824c3d108b@baylibre.com>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_071908_761847_C7575C51 
X-CRM114-Status: GOOD (  23.61  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fr, 2024-09-06 at 15:34 +0200, Jerome Brunet wrote:
> To allow using the same driver for the main reset controller and the
> auxiliary ones embedded in the clock controllers, convert the
> the Amlogic reset driver to regmap.
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/reset/reset-meson.c | 79 ++++++++++++++++++++++++---------------------

This patch should also make RESET_MESON select REGMAP.

>  1 file changed, 43 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
> index 1e9fca3e30e8..9dd38cc209e2 100644
> --- a/drivers/reset/reset-meson.c
> +++ b/drivers/reset/reset-meson.c
> @@ -11,36 +11,43 @@
>  #include <linux/of.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> +#include <linux/regmap.h>
>  #include <linux/reset-controller.h>
>  #include <linux/slab.h>
>  #include <linux/types.h>
>  
> -#define BITS_PER_REG	32
> -
>  struct meson_reset_param {
>  	int reg_count;
>  	int level_offset;
>  };
>  
>  struct meson_reset {
> -	void __iomem *reg_base;
>  	const struct meson_reset_param *param;
>  	struct reset_controller_dev rcdev;
> -	spinlock_t lock;
> +	struct regmap *map;
>  };
>  
> +static void meson_reset_offset_and_bit(struct meson_reset *data,
> +				       unsigned long id,
> +				       unsigned int *offset,
> +				       unsigned int *bit)
> +{
> +	unsigned int stride = regmap_get_reg_stride(data->map);

You know this is always 4. Having a #define for this (that is also used
to initialize regmap_config.reg_stride, and for now nr_resets, below)
instead of going through an exported function would allow the compiler
to optimize this all away:

> +
> +	*offset = (id / (stride * BITS_PER_BYTE)) * stride;
> +	*bit = id % (stride * BITS_PER_BYTE);
> +}
> +
>  static int meson_reset_reset(struct reset_controller_dev *rcdev,
> -			      unsigned long id)
> +			     unsigned long id)
>  {
>  	struct meson_reset *data =
>  		container_of(rcdev, struct meson_reset, rcdev);
> -	unsigned int bank = id / BITS_PER_REG;
> -	unsigned int offset = id % BITS_PER_REG;
> -	void __iomem *reg_addr = data->reg_base + (bank << 2);
> +	unsigned int offset, bit;
>  
> -	writel(BIT(offset), reg_addr);
> +	meson_reset_offset_and_bit(data, id, &offset, &bit);
>  
> -	return 0;
> +	return regmap_write(data->map, offset, BIT(bit));
>  }
>  
>  static int meson_reset_level(struct reset_controller_dev *rcdev,
> @@ -48,25 +55,13 @@ static int meson_reset_level(struct reset_controller_dev *rcdev,
>  {
>  	struct meson_reset *data =
>  		container_of(rcdev, struct meson_reset, rcdev);
> -	unsigned int bank = id / BITS_PER_REG;
> -	unsigned int offset = id % BITS_PER_REG;
> -	void __iomem *reg_addr;
> -	unsigned long flags;
> -	u32 reg;
> +	unsigned int offset, bit;
>  
> -	reg_addr = data->reg_base + data->param->level_offset + (bank << 2);
> +	meson_reset_offset_and_bit(data, id, &offset, &bit);
> +	offset += data->param->level_offset;
>  
> -	spin_lock_irqsave(&data->lock, flags);
> -
> -	reg = readl(reg_addr);
> -	if (assert)
> -		writel(reg & ~BIT(offset), reg_addr);
> -	else
> -		writel(reg | BIT(offset), reg_addr);
> -
> -	spin_unlock_irqrestore(&data->lock, flags);
> -
> -	return 0;
> +	return regmap_update_bits(data->map, offset,
> +				  BIT(bit), assert ? 0 : BIT(bit));

Matter of taste, perhaps, but the BIT() could be moved into
meson_reset_offset_and_bit().

>  }
>  
>  static int meson_reset_assert(struct reset_controller_dev *rcdev,
> @@ -119,30 +114,42 @@ static const struct of_device_id meson_reset_dt_ids[] = {
>  };
>  MODULE_DEVICE_TABLE(of, meson_reset_dt_ids);
>  
> +static const struct regmap_config regmap_config = {
> +	.reg_bits   = 32,
> +	.val_bits   = 32,
> +	.reg_stride = 4,
> +};
> +
>  static int meson_reset_probe(struct platform_device *pdev)
>  {
> +	struct device *dev = &pdev->dev;
>  	struct meson_reset *data;
> +	void __iomem *base;
>  
> -	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
>  	if (!data)
>  		return -ENOMEM;
>  
> -	data->reg_base = devm_platform_ioremap_resource(pdev, 0);
> -	if (IS_ERR(data->reg_base))
> -		return PTR_ERR(data->reg_base);
> +	base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
>  
> -	data->param = of_device_get_match_data(&pdev->dev);
> +	data->param = of_device_get_match_data(dev);
>  	if (!data->param)
>  		return -ENODEV;
>  
> -	spin_lock_init(&data->lock);
> +	data->map = devm_regmap_init_mmio(dev, base, &regmap_config);
> +	if (IS_ERR(data->map))
> +		return dev_err_probe(dev, PTR_ERR(data->map),
> +				     "can't init regmap mmio region\n");
>  
>  	data->rcdev.owner = THIS_MODULE;
> -	data->rcdev.nr_resets = data->param->reg_count * BITS_PER_REG;
> +	data->rcdev.nr_resets = data->param->reg_count * BITS_PER_BYTE
> +		* regmap_config.reg_stride;
>  	data->rcdev.ops = &meson_reset_ops;
> -	data->rcdev.of_node = pdev->dev.of_node;
> +	data->rcdev.of_node = dev->of_node;
>  
> -	return devm_reset_controller_register(&pdev->dev, &data->rcdev);
> +	return devm_reset_controller_register(dev, &data->rcdev);
>  }
>  
>  static struct platform_driver meson_reset_driver = {

regards
Philipp

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
