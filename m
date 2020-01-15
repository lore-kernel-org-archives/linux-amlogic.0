Return-Path: <SRS0=Q90K=3E=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A514EC3F68F
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Jan 2020 13:31:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 797012077B
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Jan 2020 13:31:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="J6VfJHFT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 797012077B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=triplefau.lt
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nwVYXmTQCw4WihEtJ53IyPNHTyCWWASMs4LsOK2/s6I=; b=J6VfJHFTcILDt7
	ET1gv5IWQpvmsK3LOxIvPqicxBxiSZNWW5ajpHHbr7ogC83XObuPicaKqjC/Q8WLq0u9X89B611D4
	9azM7mg/3mpGEwXuJRsGmRlYQ0d4kiw3JM+ohyihfCYyCQKjy1Cedp9umFJGUM9a1Tonmg0i+NaM2
	DZKEAB1vodhWKlHaaBmEdnhYWvNv94jDXU74eS/HRYvlAJ9YfsP9E+XvkPhmNIC2NJRJKN6EQPOgb
	brrpyf4p18u+06+bHWNBzqC9ZHhK9t786OM55XbJs9IRQgLB15BHXnRiDrp4gw1j1dRolq5C4oe1M
	+k/9Lv2xPmsndVRdl2Zw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irim0-0007tF-7k; Wed, 15 Jan 2020 13:31:52 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irils-0007rB-Cm
 for linux-amlogic@lists.infradead.org; Wed, 15 Jan 2020 13:31:49 +0000
X-Originating-IP: 88.190.179.123
Received: from localhost (unknown [88.190.179.123])
 (Authenticated sender: repk@triplefau.lt)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 02A9720007;
 Wed, 15 Jan 2020 13:31:35 +0000 (UTC)
Date: Wed, 15 Jan 2020 14:40:11 +0100
From: Remi Pommarel <repk@triplefau.lt>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v4 7/7] PCI: amlogic: Use AXG PCIE and shared MIPI/PCIE
 PHYs
Message-ID: <20200115134011.GJ1803@voidbox>
References: <20200115122908.16954-1-repk@triplefau.lt>
 <20200115122908.16954-8-repk@triplefau.lt>
 <e86e613b-0811-bbed-1999-260b83351957@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e86e613b-0811-bbed-1999-260b83351957@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200115_053144_710020_9FF32BDA 
X-CRM114-Status: GOOD (  24.06  )
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
Cc: devicetree@vger.kernel.org, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Yue Wang <yue.wang@amlogic.com>, Rob Herring <robh+dt@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-amlogic@lists.infradead.org,
 Kishon Vijay Abraham I <kishon@ti.com>, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Jan 15, 2020 at 01:30:06PM +0100, Neil Armstrong wrote:
> On 15/01/2020 13:29, Remi Pommarel wrote:
> > Now that PCIE PHY has been introduced for AXG, the whole has_shared_phy
> > logic can be mutualized between AXG and G12A platforms.
> > 
> > This also makes use of the optional MIPI/PCIE shared fonctionality PHY
> > found on AXG platforms, which need to be used in order to have reliable
> > PCIE communications.
> > 
> > Signed-off-by: Remi Pommarel <repk@triplefau.lt>
> > ---
> >  drivers/pci/controller/dwc/pci-meson.c | 140 ++++++++-----------------
> >  1 file changed, 46 insertions(+), 94 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
> > index 3772b02a5c55..309e75f554ac 100644
> > --- a/drivers/pci/controller/dwc/pci-meson.c
> > +++ b/drivers/pci/controller/dwc/pci-meson.c
> > @@ -66,7 +66,6 @@
> >  #define PORT_CLK_RATE			100000000UL
> >  #define MAX_PAYLOAD_SIZE		256
> >  #define MAX_READ_REQ_SIZE		256
> > -#define MESON_PCIE_PHY_POWERUP		0x1c
> >  #define PCIE_RESET_DELAY		500
> >  #define PCIE_SHARED_RESET		1
> >  #define PCIE_NORMAL_RESET		0
> > @@ -81,26 +80,19 @@ enum pcie_data_rate {
> >  struct meson_pcie_mem_res {
> >  	void __iomem *elbi_base;
> >  	void __iomem *cfg_base;
> > -	void __iomem *phy_base;
> >  };
> >  
> >  struct meson_pcie_clk_res {
> >  	struct clk *clk;
> > -	struct clk *mipi_gate;
> >  	struct clk *port_clk;
> >  	struct clk *general_clk;
> >  };
> >  
> >  struct meson_pcie_rc_reset {
> > -	struct reset_control *phy;
> >  	struct reset_control *port;
> >  	struct reset_control *apb;
> >  };
> >  
> > -struct meson_pcie_param {
> > -	bool has_shared_phy;
> > -};
> > -
> >  struct meson_pcie {
> >  	struct dw_pcie pci;
> >  	struct meson_pcie_mem_res mem_res;
> > @@ -108,7 +100,7 @@ struct meson_pcie {
> >  	struct meson_pcie_rc_reset mrst;
> >  	struct gpio_desc *reset_gpio;
> >  	struct phy *phy;
> > -	const struct meson_pcie_param *param;
> > +	struct phy *shared_phy;
> >  };
> >  
> >  static struct reset_control *meson_pcie_get_reset(struct meson_pcie *mp,
> > @@ -130,13 +122,6 @@ static int meson_pcie_get_resets(struct meson_pcie *mp)
> >  {
> >  	struct meson_pcie_rc_reset *mrst = &mp->mrst;
> >  
> > -	if (!mp->param->has_shared_phy) {
> > -		mrst->phy = meson_pcie_get_reset(mp, "phy", PCIE_SHARED_RESET);
> > -		if (IS_ERR(mrst->phy))
> > -			return PTR_ERR(mrst->phy);
> > -		reset_control_deassert(mrst->phy);
> > -	}
> > -
> >  	mrst->port = meson_pcie_get_reset(mp, "port", PCIE_NORMAL_RESET);
> >  	if (IS_ERR(mrst->port))
> >  		return PTR_ERR(mrst->port);
> > @@ -162,22 +147,6 @@ static void __iomem *meson_pcie_get_mem(struct platform_device *pdev,
> >  	return devm_ioremap_resource(dev, res);
> >  }
> >  
> > -static void __iomem *meson_pcie_get_mem_shared(struct platform_device *pdev,
> > -					       struct meson_pcie *mp,
> > -					       const char *id)
> > -{
> > -	struct device *dev = mp->pci.dev;
> > -	struct resource *res;
> > -
> > -	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, id);
> > -	if (!res) {
> > -		dev_err(dev, "No REG resource %s\n", id);
> > -		return ERR_PTR(-ENXIO);
> > -	}
> > -
> > -	return devm_ioremap(dev, res->start, resource_size(res));
> > -}
> > -
> >  static int meson_pcie_get_mems(struct platform_device *pdev,
> >  			       struct meson_pcie *mp)
> >  {
> > @@ -189,14 +158,6 @@ static int meson_pcie_get_mems(struct platform_device *pdev,
> >  	if (IS_ERR(mp->mem_res.cfg_base))
> >  		return PTR_ERR(mp->mem_res.cfg_base);
> >  
> > -	/* Meson AXG SoC has two PCI controllers use same phy register */
> > -	if (!mp->param->has_shared_phy) {
> > -		mp->mem_res.phy_base =
> > -			meson_pcie_get_mem_shared(pdev, mp, "phy");
> > -		if (IS_ERR(mp->mem_res.phy_base))
> > -			return PTR_ERR(mp->mem_res.phy_base);
> > -	}
> > -
> >  	return 0;
> >  }
> >  
> > @@ -204,20 +165,40 @@ static int meson_pcie_power_on(struct meson_pcie *mp)
> >  {
> >  	int ret = 0;
> >  
> > -	if (mp->param->has_shared_phy) {
> > -		ret = phy_init(mp->phy);
> > -		if (ret)
> > -			return ret;
> > +	ret = phy_init(mp->phy);
> > +	if (ret)
> > +		goto err;
> >  
> > -		ret = phy_power_on(mp->phy);
> > -		if (ret) {
> > -			phy_exit(mp->phy);
> > -			return ret;
> > -		}
> > -	} else
> > -		writel(MESON_PCIE_PHY_POWERUP, mp->mem_res.phy_base);
> > +	ret = phy_init(mp->shared_phy);
> > +	if (ret)
> > +		goto exit;
> > +
> > +	ret = phy_power_on(mp->phy);
> > +	if (ret)
> > +		goto shared_exit;
> > +
> > +	ret = phy_power_on(mp->shared_phy);
> > +	if (ret)
> > +		goto power_off;
> >  
> >  	return 0;
> > +
> > +power_off:
> > +	phy_power_off(mp->phy);
> > +shared_exit:
> > +	phy_exit(mp->shared_phy);
> > +exit:
> > +	phy_exit(mp->phy);
> > +err:
> > +	return ret;
> > +}
> > +
> > +static void meson_pcie_power_off(struct meson_pcie *mp)
> > +{
> > +	phy_power_off(mp->shared_phy);
> > +	phy_power_off(mp->phy);
> > +	phy_exit(mp->shared_phy);
> > +	phy_exit(mp->phy);
> >  }
> >  
> >  static int meson_pcie_reset(struct meson_pcie *mp)
> > @@ -225,16 +206,13 @@ static int meson_pcie_reset(struct meson_pcie *mp)
> >  	struct meson_pcie_rc_reset *mrst = &mp->mrst;
> >  	int ret = 0;
> >  
> > -	if (mp->param->has_shared_phy) {
> > -		ret = phy_reset(mp->phy);
> > -		if (ret)
> > -			return ret;
> > -	} else {
> > -		reset_control_assert(mrst->phy);
> > -		udelay(PCIE_RESET_DELAY);
> > -		reset_control_deassert(mrst->phy);
> > -		udelay(PCIE_RESET_DELAY);
> > -	}
> > +	ret = phy_reset(mp->phy);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = phy_reset(mp->shared_phy);
> > +	if (ret)
> > +		return ret;
> >  
> >  	reset_control_assert(mrst->port);
> >  	reset_control_assert(mrst->apb);
> > @@ -286,12 +264,6 @@ static int meson_pcie_probe_clocks(struct meson_pcie *mp)
> >  	if (IS_ERR(res->port_clk))
> >  		return PTR_ERR(res->port_clk);
> >  
> > -	if (!mp->param->has_shared_phy) {
> > -		res->mipi_gate = meson_pcie_probe_clock(dev, "mipi", 0);
> > -		if (IS_ERR(res->mipi_gate))
> > -			return PTR_ERR(res->mipi_gate);
> > -	}
> > -
> >  	res->general_clk = meson_pcie_probe_clock(dev, "general", 0);
> >  	if (IS_ERR(res->general_clk))
> >  		return PTR_ERR(res->general_clk);
> > @@ -562,7 +534,6 @@ static const struct dw_pcie_ops dw_pcie_ops = {
> >  
> >  static int meson_pcie_probe(struct platform_device *pdev)
> >  {
> > -	const struct meson_pcie_param *match_data;
> >  	struct device *dev = &pdev->dev;
> >  	struct dw_pcie *pci;
> >  	struct meson_pcie *mp;
> > @@ -576,18 +547,13 @@ static int meson_pcie_probe(struct platform_device *pdev)
> >  	pci->dev = dev;
> >  	pci->ops = &dw_pcie_ops;
> >  
> > -	match_data = of_device_get_match_data(dev);
> > -	if (!match_data) {
> > -		dev_err(dev, "failed to get match data\n");
> > -		return -ENODEV;
> > -	}
> > -	mp->param = match_data;
> > +	mp->phy = devm_phy_get(dev, "pcie");
> > +	if (IS_ERR(mp->phy))
> > +		return PTR_ERR(mp->phy);
> >  
> > -	if (mp->param->has_shared_phy) {
> > -		mp->phy = devm_phy_get(dev, "pcie");
> > -		if (IS_ERR(mp->phy))
> > -			return PTR_ERR(mp->phy);
> > -	}
> > +	mp->shared_phy = devm_phy_optional_get(dev, "shared");
> > +	if (IS_ERR(mp->shared_phy))
> > +		return PTR_ERR(mp->shared_phy);
> 
> This "shared" phy doesn't appear in patch 3 (bindings) !
> 
> Not sure it's the best way to do this, maybe you could chain the MIPI
> phy from the PCIE phy instead, so it's the PCIE phy to enable/power/reset the
> MIPI PHY instead of the PCIe driver.

Sure will do.

> 
> But still, here you don't really model the MIPI PHY, it uses way more than
> a register in HHI... so at least you should add all the resources needed
> if you wanted to model a true MIPI PHY. i.e. MIPI PHY registers, clocks, resets
> & co if you want to model the MIPI PHY as is.

As discussed on IRC, I will rename this as mipi-analog-phy to match the
datasheet and at some point if some platform ever needed MIPI feature,
a mipi-digital-phy driver that handles the registers that are not in
HHI as well as the clocks, resets, ... could be added.

Thanks,

-- 
Remi

> 
> Neil
> 
> >  
> >  	mp->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> >  	if (IS_ERR(mp->reset_gpio)) {
> > @@ -636,30 +602,16 @@ static int meson_pcie_probe(struct platform_device *pdev)
> >  	return 0;
> >  
> >  err_phy:
> > -	if (mp->param->has_shared_phy) {
> > -		phy_power_off(mp->phy);
> > -		phy_exit(mp->phy);
> > -	}
> > -
> > +	meson_pcie_power_off(mp);
> >  	return ret;
> >  }
> >  
> > -static struct meson_pcie_param meson_pcie_axg_param = {
> > -	.has_shared_phy = false,
> > -};
> > -
> > -static struct meson_pcie_param meson_pcie_g12a_param = {
> > -	.has_shared_phy = true,
> > -};
> > -
> >  static const struct of_device_id meson_pcie_of_match[] = {
> >  	{
> >  		.compatible = "amlogic,axg-pcie",
> > -		.data = &meson_pcie_axg_param,
> >  	},
> >  	{
> >  		.compatible = "amlogic,g12a-pcie",
> > -		.data = &meson_pcie_g12a_param,
> >  	},
> >  	{},
> >  };
> > 
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
