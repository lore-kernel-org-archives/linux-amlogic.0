Return-Path: <SRS0=wpca=XL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52F16C49ED7
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Sep 2019 13:21:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26F49214D9
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Sep 2019 13:21:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JkqqI9Do"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26F49214D9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5dqLVj5kCzNtT/V5HxyDTWk9mgtCpzKy1zyfW5GNHU0=; b=JkqqI9DoGv9849
	R3wz33mYU4pd2aFDg2DDpyJ2Ag6/qLELKxJ6GfTJrlzq6Z2araW00MRg85Nmoz9zAKDjAH6exFVlU
	kTZa4077usZ2PVSM1cq+9WLpRhek8w6fiYxqM5AuIJvKVzdSB9oC7W3/IMc1FlE7DzXBG8Dnsx/3i
	FEt+saPHlfJDkxFu4j1hDHTQfSXz7L4fIA1yUOTxL+ubKgbyw4x4O/kLTZxJUeg35AQX9duCRyfiC
	YTKTLyOvtQs4ncUZ6HT0DTYuh8Sg0UpJabT0KwDJ7NWBCNELU887gmdxzjsSb+YwQUuNSB5JC1BOw
	FaStJkxwHRkfo0rOT2WA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1i9qw7-00008G-Nu; Mon, 16 Sep 2019 13:20:59 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
 id 1i9qw4-00006s-Pi; Mon, 16 Sep 2019 13:20:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3DF5D337;
 Mon, 16 Sep 2019 06:20:54 -0700 (PDT)
Received: from localhost (unknown [10.37.6.20])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A792B3F67D;
 Mon, 16 Sep 2019 06:20:53 -0700 (PDT)
Date: Mon, 16 Sep 2019 14:20:51 +0100
From: Andrew Murray <andrew.murray@arm.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v2 3/6] PCI: amlogic: meson: Add support for G12A
Message-ID: <20190916132051.GP9720@e119886-lin.cambridge.arm.com>
References: <20190916125022.10754-1-narmstrong@baylibre.com>
 <20190916125022.10754-4-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190916125022.10754-4-narmstrong@baylibre.com>
User-Agent: Mutt/1.10.1+81 (426a6c1) (2018-08-26)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190916_062056_929668_A299C938 
X-CRM114-Status: GOOD (  24.79  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: maz@kernel.org, lorenzo.pieralisi@arm.com, gouwa@khadas.com,
 khilman@baylibre.com, nick@khadas.com, linux-kernel@vger.kernel.org,
 kishon@ti.com, repk@triplefau.lt, linux-pci@vger.kernel.org,
 bhelgaas@google.com, linux-amlogic@lists.infradead.org, yue.wang@Amlogic.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Sep 16, 2019 at 02:50:19PM +0200, Neil Armstrong wrote:
> Add support for the Amlogic G12A SoC using a separate shared PHY.
> 
> This adds support for fetching a PHY phandle and call the PHY init,
> reset and power on/off calls instead of writing in the PHY register or
> toggling the PHY reset line.
> 
> The MIPI clock and the PHY memory resource are only required for the
> Amlogic AXG SoC PCIe PHY setup, thus these elements are ignored for
> the Amlogic G12A having a separate shared PHY.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/pci/controller/dwc/pci-meson.c | 128 ++++++++++++++++++++-----
>  1 file changed, 105 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
> index ab79990798f8..3772b02a5c55 100644
> --- a/drivers/pci/controller/dwc/pci-meson.c
> +++ b/drivers/pci/controller/dwc/pci-meson.c
> @@ -16,6 +16,7 @@
>  #include <linux/reset.h>
>  #include <linux/resource.h>
>  #include <linux/types.h>
> +#include <linux/phy/phy.h>
>  
>  #include "pcie-designware.h"
>  
> @@ -96,12 +97,18 @@ struct meson_pcie_rc_reset {
>  	struct reset_control *apb;
>  };
>  
> +struct meson_pcie_param {
> +	bool has_shared_phy;
> +};
> +
>  struct meson_pcie {
>  	struct dw_pcie pci;
>  	struct meson_pcie_mem_res mem_res;
>  	struct meson_pcie_clk_res clk_res;
>  	struct meson_pcie_rc_reset mrst;
>  	struct gpio_desc *reset_gpio;
> +	struct phy *phy;
> +	const struct meson_pcie_param *param;
>  };
>  
>  static struct reset_control *meson_pcie_get_reset(struct meson_pcie *mp,
> @@ -123,10 +130,12 @@ static int meson_pcie_get_resets(struct meson_pcie *mp)
>  {
>  	struct meson_pcie_rc_reset *mrst = &mp->mrst;
>  
> -	mrst->phy = meson_pcie_get_reset(mp, "phy", PCIE_SHARED_RESET);
> -	if (IS_ERR(mrst->phy))
> -		return PTR_ERR(mrst->phy);
> -	reset_control_deassert(mrst->phy);
> +	if (!mp->param->has_shared_phy) {
> +		mrst->phy = meson_pcie_get_reset(mp, "phy", PCIE_SHARED_RESET);
> +		if (IS_ERR(mrst->phy))
> +			return PTR_ERR(mrst->phy);
> +		reset_control_deassert(mrst->phy);
> +	}
>  
>  	mrst->port = meson_pcie_get_reset(mp, "port", PCIE_NORMAL_RESET);
>  	if (IS_ERR(mrst->port))
> @@ -180,27 +189,52 @@ static int meson_pcie_get_mems(struct platform_device *pdev,
>  	if (IS_ERR(mp->mem_res.cfg_base))
>  		return PTR_ERR(mp->mem_res.cfg_base);
>  
> -	/* Meson SoC has two PCI controllers use same phy register*/
> -	mp->mem_res.phy_base = meson_pcie_get_mem_shared(pdev, mp, "phy");
> -	if (IS_ERR(mp->mem_res.phy_base))
> -		return PTR_ERR(mp->mem_res.phy_base);
> +	/* Meson AXG SoC has two PCI controllers use same phy register */
> +	if (!mp->param->has_shared_phy) {
> +		mp->mem_res.phy_base =
> +			meson_pcie_get_mem_shared(pdev, mp, "phy");
> +		if (IS_ERR(mp->mem_res.phy_base))
> +			return PTR_ERR(mp->mem_res.phy_base);
> +	}
>  
>  	return 0;
>  }
>  
> -static void meson_pcie_power_on(struct meson_pcie *mp)
> +static int meson_pcie_power_on(struct meson_pcie *mp)
>  {
> -	writel(MESON_PCIE_PHY_POWERUP, mp->mem_res.phy_base);
> +	int ret = 0;
> +
> +	if (mp->param->has_shared_phy) {
> +		ret = phy_init(mp->phy);
> +		if (ret)
> +			return ret;
> +
> +		ret = phy_power_on(mp->phy);
> +		if (ret) {
> +			phy_exit(mp->phy);
> +			return ret;
> +		}
> +	} else
> +		writel(MESON_PCIE_PHY_POWERUP, mp->mem_res.phy_base);
> +
> +	return 0;
>  }
>  
> -static void meson_pcie_reset(struct meson_pcie *mp)
> +static int meson_pcie_reset(struct meson_pcie *mp)
>  {
>  	struct meson_pcie_rc_reset *mrst = &mp->mrst;
> -
> -	reset_control_assert(mrst->phy);
> -	udelay(PCIE_RESET_DELAY);
> -	reset_control_deassert(mrst->phy);
> -	udelay(PCIE_RESET_DELAY);
> +	int ret = 0;
> +
> +	if (mp->param->has_shared_phy) {
> +		ret = phy_reset(mp->phy);
> +		if (ret)
> +			return ret;
> +	} else {
> +		reset_control_assert(mrst->phy);
> +		udelay(PCIE_RESET_DELAY);
> +		reset_control_deassert(mrst->phy);
> +		udelay(PCIE_RESET_DELAY);
> +	}
>  
>  	reset_control_assert(mrst->port);
>  	reset_control_assert(mrst->apb);
> @@ -208,6 +242,8 @@ static void meson_pcie_reset(struct meson_pcie *mp)
>  	reset_control_deassert(mrst->port);
>  	reset_control_deassert(mrst->apb);
>  	udelay(PCIE_RESET_DELAY);
> +
> +	return 0;
>  }
>  
>  static inline struct clk *meson_pcie_probe_clock(struct device *dev,
> @@ -250,9 +286,11 @@ static int meson_pcie_probe_clocks(struct meson_pcie *mp)
>  	if (IS_ERR(res->port_clk))
>  		return PTR_ERR(res->port_clk);
>  
> -	res->mipi_gate = meson_pcie_probe_clock(dev, "mipi", 0);
> -	if (IS_ERR(res->mipi_gate))
> -		return PTR_ERR(res->mipi_gate);
> +	if (!mp->param->has_shared_phy) {
> +		res->mipi_gate = meson_pcie_probe_clock(dev, "mipi", 0);
> +		if (IS_ERR(res->mipi_gate))
> +			return PTR_ERR(res->mipi_gate);
> +	}
>  
>  	res->general_clk = meson_pcie_probe_clock(dev, "general", 0);
>  	if (IS_ERR(res->general_clk))
> @@ -524,6 +562,7 @@ static const struct dw_pcie_ops dw_pcie_ops = {
>  
>  static int meson_pcie_probe(struct platform_device *pdev)
>  {
> +	const struct meson_pcie_param *match_data;
>  	struct device *dev = &pdev->dev;
>  	struct dw_pcie *pci;
>  	struct meson_pcie *mp;
> @@ -537,6 +576,19 @@ static int meson_pcie_probe(struct platform_device *pdev)
>  	pci->dev = dev;
>  	pci->ops = &dw_pcie_ops;
>  
> +	match_data = of_device_get_match_data(dev);
> +	if (!match_data) {
> +		dev_err(dev, "failed to get match data\n");
> +		return -ENODEV;
> +	}
> +	mp->param = match_data;
> +
> +	if (mp->param->has_shared_phy) {
> +		mp->phy = devm_phy_get(dev, "pcie");
> +		if (IS_ERR(mp->phy))
> +			return PTR_ERR(mp->phy);
> +	}
> +
>  	mp->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
>  	if (IS_ERR(mp->reset_gpio)) {
>  		dev_err(dev, "get reset gpio failed\n");
> @@ -555,13 +607,22 @@ static int meson_pcie_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> -	meson_pcie_power_on(mp);
> -	meson_pcie_reset(mp);
> +	ret = meson_pcie_power_on(mp);
> +	if (ret) {
> +		dev_err(dev, "phy power on failed, %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = meson_pcie_reset(mp);
> +	if (ret) {
> +		dev_err(dev, "reset failed, %d\n", ret);
> +		goto err_phy;
> +	}
>  
>  	ret = meson_pcie_probe_clocks(mp);
>  	if (ret) {
>  		dev_err(dev, "init clock resources failed, %d\n", ret);
> -		return ret;
> +		goto err_phy;
>  	}
>  
>  	platform_set_drvdata(pdev, mp);
> @@ -569,15 +630,36 @@ static int meson_pcie_probe(struct platform_device *pdev)
>  	ret = meson_add_pcie_port(mp, pdev);
>  	if (ret < 0) {
>  		dev_err(dev, "Add PCIe port failed, %d\n", ret);
> -		return ret;
> +		goto err_phy;
>  	}
>  
>  	return 0;
> +
> +err_phy:
> +	if (mp->param->has_shared_phy) {
> +		phy_power_off(mp->phy);
> +		phy_exit(mp->phy);
> +	}

Interestingly for AXG, if the probe fails we don't seem to do the opposite
of MESON_PCIE_PHY_POWERUP. Though I can see this is a pre-existing issue that
has little impact and probably rarely gets hit, so:

Reviewed-by: Andrew Murray <andrew.murray@arm.com>

However it would be *super really nice* to write a meson_pcie_power_off that
mirrors meson_pcie_power_on that you could call here instead.

Thanks,

Andrew Murray 

> +
> +	return ret;
>  }
>  
> +static struct meson_pcie_param meson_pcie_axg_param = {
> +	.has_shared_phy = false,
> +};
> +
> +static struct meson_pcie_param meson_pcie_g12a_param = {
> +	.has_shared_phy = true,
> +};
> +
>  static const struct of_device_id meson_pcie_of_match[] = {
>  	{
>  		.compatible = "amlogic,axg-pcie",
> +		.data = &meson_pcie_axg_param,
> +	},
> +	{
> +		.compatible = "amlogic,g12a-pcie",
> +		.data = &meson_pcie_g12a_param,
>  	},
>  	{},
>  };
> -- 
> 2.22.0
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
