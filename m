Return-Path: <SRS0=sMge=MM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E2BFC07E9B
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Jul 2021 08:37:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D695B611EF
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Jul 2021 08:37:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D695B611EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VRP4LoBasTOZnWRTC4Zx1fPi5SpDNR8SK1JdzPhpgbY=; b=XHnkJOPQu5+dz9
	ZFfb0UOhXr+/0+BhRtBW4fsnsytEeASQjiVsllZYzXZGlLhk+w7d+2EdpwkYiLrJrQsJRfQA2myPs
	GlwXzxWmlm5bYN3zme+OD73L64EY8sjqicd11kNE3JixyDu92mvRDkcQlrkJuZs3PfNj60M/y9oQp
	kkkBCBL90RY8M1NnrjzU37Og1aSRSY1wNW+I9FL/hv2b1jAp11aQmLqnTd8GxhrEgojSL7SX+6Ich
	a6MlYU6dX7Rsf4MgPIitdDMX9dh+HXwD5RfiVEehE/Tlr4y2Omtn0KPwJHkr4NCdifsNyvE6x/qpU
	iowXpQR+1gt6X1KEV1HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5lFT-00CEPv-3p; Tue, 20 Jul 2021 08:37:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5lFP-00CEOn-Ry; Tue, 20 Jul 2021 08:37:05 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A3A80611F2;
 Tue, 20 Jul 2021 08:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626770223;
 bh=tk64h37rbGdmfMscy8QNd//U3myF1pAkJYpkjcnjgFQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VGKBr2qu0vtaAN2BSckVMjpj6meSNJepAAzLgh/vVSQOrnNAnf6Cla7PVqUq/E8/P
 LVk7IItDSLURiLi7F1a8ZmOJ0IHixeIx7UgpEu5/iQ+IegrQjAHEFqnkF0GbjAXFPP
 lyEnGfBUmdj3vpG1YQoGxDyHY7ZRBVllEVSGNnQwzoXgW3Bpx8AlScYZinqcvo5OTC
 j1kGEYXtdF1TwVUdT4jwyrpVRnlnCq/X0h9sGIj1okvnsJk3sZfChKPct3NKtQlPO8
 BJxBhbUgFPgCcPMVYSNAtP7gWmfsnj8ybbdrF3vZITmper0cd5wtC3WKbgns//+UdW
 qFhE7HiVoxSfw==
Date: Tue, 20 Jul 2021 14:06:59 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: robh+dt@kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 kishon@ti.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] phy: amlogic: Add a new driver for the HDMI TX
 PHY on Meson8/8b/8m2
Message-ID: <YPaLKwEKcDLWwztM@matsya>
References: <20210629182047.893415-1-martin.blumenstingl@googlemail.com>
 <20210629182047.893415-3-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210629182047.893415-3-martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210720_013703_989942_182A1A38 
X-CRM114-Status: GOOD (  29.56  )
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

On 29-06-21, 20:20, Martin Blumenstingl wrote:
> Amlogic Meson8/8b/8m2 have a built-in HDMI PHY in the HHI register
> region. Unfortunately only few register bits are documented. For
> HHI_HDMI_PHY_CNTL0 the magic numbers are taken from the 3.10 vendor
> kernel.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  drivers/phy/amlogic/Kconfig              |  10 ++
>  drivers/phy/amlogic/Makefile             |   1 +
>  drivers/phy/amlogic/phy-meson8-hdmi-tx.c | 162 +++++++++++++++++++++++
>  3 files changed, 173 insertions(+)
>  create mode 100644 drivers/phy/amlogic/phy-meson8-hdmi-tx.c
> 
> diff --git a/drivers/phy/amlogic/Kconfig b/drivers/phy/amlogic/Kconfig
> index db5d0cd757e3..486ca23aba32 100644
> --- a/drivers/phy/amlogic/Kconfig
> +++ b/drivers/phy/amlogic/Kconfig
> @@ -2,6 +2,16 @@
>  #
>  # Phy drivers for Amlogic platforms
>  #
> +config PHY_MESON8_HDMI_TX
> +	tristate "Meson8, Meson8b and Meson8m2 HDMI TX PHY driver"
> +	depends on (ARCH_MESON && ARM) || COMPILE_TEST
> +	depends on OF
> +	select MFD_SYSCON
> +	help
> +	  Enable this to support the HDMI TX PHYs found in Meson8,
> +	  Meson8b and Meson8m2 SoCs.
> +	  If unsure, say N.
> +
>  config PHY_MESON8B_USB2
>  	tristate "Meson8, Meson8b, Meson8m2 and GXBB USB2 PHY driver"
>  	default ARCH_MESON
> diff --git a/drivers/phy/amlogic/Makefile b/drivers/phy/amlogic/Makefile
> index 8fa07fbd0d92..c0886c850bb0 100644
> --- a/drivers/phy/amlogic/Makefile
> +++ b/drivers/phy/amlogic/Makefile
> @@ -1,4 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> +obj-$(CONFIG_PHY_MESON8_HDMI_TX)		+= phy-meson8-hdmi-tx.o
>  obj-$(CONFIG_PHY_MESON8B_USB2)			+= phy-meson8b-usb2.o
>  obj-$(CONFIG_PHY_MESON_GXL_USB2)		+= phy-meson-gxl-usb2.o
>  obj-$(CONFIG_PHY_MESON_G12A_USB2)		+= phy-meson-g12a-usb2.o
> diff --git a/drivers/phy/amlogic/phy-meson8-hdmi-tx.c b/drivers/phy/amlogic/phy-meson8-hdmi-tx.c
> new file mode 100644
> index 000000000000..ba5a4de54811
> --- /dev/null
> +++ b/drivers/phy/amlogic/phy-meson8-hdmi-tx.c
> @@ -0,0 +1,162 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Meson8, Meson8b and Meson8m2 HDMI TX PHY.
> + *
> + * Copyright (C) 2021 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/clk.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/regmap.h>
> +
> +#define HHI_HDMI_PHY_CNTL0				0x0
> +	#define HHI_HDMI_PHY_CNTL0_HDMI_CTL1		GENMASK(31, 16)
> +	#define HHI_HDMI_PHY_CNTL0_HDMI_CTL0		GENMASK(15, 0)
> +
> +#define HHI_HDMI_PHY_CNTL1				0x4
> +	#define HHI_HDMI_PHY_CNTL1_CLOCK_ENABLE		BIT(1)
> +	#define HHI_HDMI_PHY_CNTL1_SOFT_RESET		BIT(0)
> +
> +#define HHI_HDMI_PHY_CNTL2				0x8
> +
> +struct phy_meson8_hdmi_tx_priv {
> +	struct regmap		*hhi;
> +	struct clk		*tmds_clk;
> +	unsigned int		reg_offset;
> +};
> +
> +static int phy_meson8_hdmi_tx_init(struct phy *phy)
> +{
> +	struct phy_meson8_hdmi_tx_priv *priv = phy_get_drvdata(phy);
> +
> +	return clk_prepare_enable(priv->tmds_clk);
> +}
> +
> +static int phy_meson8_hdmi_tx_exit(struct phy *phy)
> +{
> +	struct phy_meson8_hdmi_tx_priv *priv = phy_get_drvdata(phy);
> +
> +	clk_disable_unprepare(priv->tmds_clk);
> +
> +	return 0;
> +}
> +
> +static int phy_meson8_hdmi_tx_power_on(struct phy *phy)
> +{
> +	struct phy_meson8_hdmi_tx_priv *priv = phy_get_drvdata(phy);
> +	unsigned int i;
> +	u16 hdmi_ctl0;
> +
> +	if (clk_get_rate(priv->tmds_clk) >= 2970UL * 1000 * 1000)
> +		hdmi_ctl0 = 0x1e8b;
> +	else
> +		hdmi_ctl0 = 0x4d0b;

magic numbers..? I guess these are register offsets, would be better to
define..

> +
> +	regmap_write(priv->hhi, priv->reg_offset + HHI_HDMI_PHY_CNTL0,
> +		     FIELD_PREP(HHI_HDMI_PHY_CNTL0_HDMI_CTL1, 0x08c3) |
> +		     FIELD_PREP(HHI_HDMI_PHY_CNTL0_HDMI_CTL0, hdmi_ctl0));
> +
> +	regmap_write(priv->hhi, priv->reg_offset + HHI_HDMI_PHY_CNTL1, 0x0);
> +
> +	/* Reset three times, just like the vendor driver does */
> +	for (i = 0; i < 3; i++) {
> +		regmap_write(priv->hhi, priv->reg_offset + HHI_HDMI_PHY_CNTL1,
> +			     HHI_HDMI_PHY_CNTL1_CLOCK_ENABLE |
> +			     HHI_HDMI_PHY_CNTL1_SOFT_RESET);
> +		usleep_range(1000, 2000);
> +
> +		regmap_write(priv->hhi, priv->reg_offset + HHI_HDMI_PHY_CNTL1,
> +			     HHI_HDMI_PHY_CNTL1_CLOCK_ENABLE);
> +		usleep_range(1000, 2000);
> +	}
> +
> +	return 0;
> +}
> +
> +static int phy_meson8_hdmi_tx_power_off(struct phy *phy)
> +{
> +	struct phy_meson8_hdmi_tx_priv *priv = phy_get_drvdata(phy);
> +
> +	regmap_write(priv->hhi, priv->reg_offset + HHI_HDMI_PHY_CNTL0,
> +		     FIELD_PREP(HHI_HDMI_PHY_CNTL0_HDMI_CTL1, 0x0841) |
> +		     FIELD_PREP(HHI_HDMI_PHY_CNTL0_HDMI_CTL0, 0x8d00));

more magic..

> +
> +	return 0;
> +}
> +
> +static const struct phy_ops phy_meson8_hdmi_tx_ops = {
> +	.init		= phy_meson8_hdmi_tx_init,
> +	.exit		= phy_meson8_hdmi_tx_exit,
> +	.power_on	= phy_meson8_hdmi_tx_power_on,
> +	.power_off	= phy_meson8_hdmi_tx_power_off,
> +	.owner		= THIS_MODULE,
> +};
> +
> +static int phy_meson8_hdmi_tx_probe(struct platform_device *pdev)
> +{
> +	struct device_node *np = pdev->dev.of_node;
> +	struct phy_meson8_hdmi_tx_priv *priv;
> +	struct phy_provider *phy_provider;
> +	struct phy *phy;
> +	u32 reg[2];
> +	int ret;
> +
> +	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	ret = device_property_read_u32_array(&pdev->dev, "reg", reg,
> +					     ARRAY_SIZE(reg));

we have reg as single property, why array with 2 entries here?

> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "Failed to parse the 'reg' property\n");
> +
> +	priv->reg_offset = reg[0];

and mystery deepens, no use of reg[1],  leftover artifacts?

> +
> +	priv->hhi = syscon_node_to_regmap(np->parent);
> +	if (IS_ERR(priv->hhi))
> +		return PTR_ERR(priv->hhi);
> +
> +	priv->tmds_clk = devm_clk_get(&pdev->dev, NULL);
> +	if (IS_ERR(priv->tmds_clk))
> +		return PTR_ERR(priv->tmds_clk);
> +
> +	phy = devm_phy_create(&pdev->dev, np, &phy_meson8_hdmi_tx_ops);
> +	if (IS_ERR(phy))
> +		return PTR_ERR(phy);
> +
> +	phy_set_drvdata(phy, priv);
> +
> +	phy_provider = devm_of_phy_provider_register(&pdev->dev,
> +						     of_phy_simple_xlate);
> +
> +	return PTR_ERR_OR_ZERO(phy_provider);
> +}
> +
> +static const struct of_device_id phy_meson8_hdmi_tx_of_match[] = {
> +	{ .compatible = "amlogic,meson8-hdmi-tx-phy" },
> +	{ .compatible = "amlogic,meson8b-hdmi-tx-phy" },
> +	{ .compatible = "amlogic,meson8m2-hdmi-tx-phy" },
> +	{ /* sentinel */ }

I see that all three are handled similarly, no difference!

Maybe also add a amlogic,meson8-hdmi compatible and use that?

-- 
~Vinod

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
