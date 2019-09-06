Return-Path: <SRS0=Pg3q=XB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C453C43140
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Sep 2019 19:31:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42A63206BB
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Sep 2019 19:31:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bzanlYlV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42A63206BB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QvTSOhJHYt7F+9eZreYUUue9GBcs0gpk4SPnKIwKMmM=; b=bzanlYlVOZPH5A
	RKNED5kEdFgK5Tofohbu17y2GAHDou46/5//ue7Unaqt08KEYVERfOooRnDI7Uutm4NXi5wG/TJFL
	nmwL8Mw+ip9uaLQSwGWXJYEH/bzNeBKUsJS1yb+k/Ig3jnbyAbuj4LXAByfhK1NUR+RvID1Smmn5u
	0KiKfYm0R+oIbCMTywUeo3G9yZPHdXftFzfWhcPDC/TrsxRoF97T1qQzq4JLs692pQiCsOrhi1W/m
	WLrSKCkCoRuZ5wMbcZQ8I3TvLSlEp38hIZGgWlc3LC5YIgO5r0ZNqIFLgKjFvUrnhdUkCBLhj+ziQ
	atYvNSX5XsjIihgIxpbQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i6Jwb-0006xv-Us; Fri, 06 Sep 2019 19:30:53 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
 id 1i6JwY-0006wa-Bz; Fri, 06 Sep 2019 19:30:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EC7CD28;
 Fri,  6 Sep 2019 12:30:42 -0700 (PDT)
Received: from localhost (unknown [10.37.6.20])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3C5EB3F718;
 Fri,  6 Sep 2019 12:30:42 -0700 (PDT)
Date: Fri, 6 Sep 2019 20:30:40 +0100
From: Andrew Murray <andrew.murray@arm.com>
To: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [PATCH] PCI: dwc: Use PTR_ERR_OR_ZERO() in five functions
Message-ID: <20190906193040.GG9720@e119886-lin.cambridge.arm.com>
References: <95c9dfae-af81-82ad-e989-1fdf5f29808e@web.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <95c9dfae-af81-82ad-e989-1fdf5f29808e@web.de>
User-Agent: Mutt/1.10.1+81 (426a6c1) (2018-08-26)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190906_123050_500719_4E8FAA92 
X-CRM114-Status: GOOD (  15.85  )
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
Cc: kernel-janitors@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Xiaowei Song <songxiaowei@hisilicon.com>, linux-pci@vger.kernel.org,
 Binghui Wang <wangbinghui@hisilicon.com>, YueHaibing <yuehaibing@huawei.com>,
 LKML <linux-kernel@vger.kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Yue Wang <yue.wang@Amlogic.com>, Kukjin Kim <kgene@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jingoo Han <jingoohan1@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-amlogic@lists.infradead.org,
 zhong jiang <zhongjiang@huawei.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, Sep 06, 2019 at 08:50:07PM +0200, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 6 Sep 2019 20:40:06 +0200
> 
> Simplify these function implementations by using a known function.
> 
> Generated by: scripts/coccinelle/api/ptr_ret.cocci
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Thanks for this, looks good to me:

Reviewed-by: Andrew Murray <andrew.murray@arm.com>

> ---
>  drivers/pci/controller/dwc/pci-exynos.c |  5 +----
>  drivers/pci/controller/dwc/pci-meson.c  | 10 ++--------
>  drivers/pci/controller/dwc/pcie-kirin.c | 10 ++--------
>  3 files changed, 5 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-exynos.c b/drivers/pci/controller/dwc/pci-exynos.c
> index cee5f2f590e2..b6ab1cc5d895 100644
> --- a/drivers/pci/controller/dwc/pci-exynos.c
> +++ b/drivers/pci/controller/dwc/pci-exynos.c
> @@ -92,10 +92,7 @@ static int exynos5440_pcie_get_mem_resources(struct platform_device *pdev,
> 
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	ep->mem_res->elbi_base = devm_ioremap_resource(dev, res);
> -	if (IS_ERR(ep->mem_res->elbi_base))
> -		return PTR_ERR(ep->mem_res->elbi_base);
> -
> -	return 0;
> +	return PTR_ERR_OR_ZERO(ep->mem_res->elbi_base);
>  }
> 
>  static int exynos5440_pcie_get_clk_resources(struct exynos_pcie *ep)
> diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
> index e35e9eaa50ee..713059918002 100644
> --- a/drivers/pci/controller/dwc/pci-meson.c
> +++ b/drivers/pci/controller/dwc/pci-meson.c
> @@ -182,10 +182,7 @@ static int meson_pcie_get_mems(struct platform_device *pdev,
> 
>  	/* Meson SoC has two PCI controllers use same phy register*/
>  	mp->mem_res.phy_base = meson_pcie_get_mem_shared(pdev, mp, "phy");
> -	if (IS_ERR(mp->mem_res.phy_base))
> -		return PTR_ERR(mp->mem_res.phy_base);
> -
> -	return 0;
> +	return PTR_ERR_OR_ZERO(mp->mem_res.phy_base);
>  }
> 
>  static void meson_pcie_power_on(struct meson_pcie *mp)
> @@ -259,10 +256,7 @@ static int meson_pcie_probe_clocks(struct meson_pcie *mp)
>  		return PTR_ERR(res->general_clk);
> 
>  	res->clk = meson_pcie_probe_clock(dev, "pcie", 0);
> -	if (IS_ERR(res->clk))
> -		return PTR_ERR(res->clk);
> -
> -	return 0;
> +	return PTR_ERR_OR_ZERO(res->clk);
>  }
> 
>  static inline void meson_elb_writel(struct meson_pcie *mp, u32 val, u32 reg)
> diff --git a/drivers/pci/controller/dwc/pcie-kirin.c b/drivers/pci/controller/dwc/pcie-kirin.c
> index c19617a912bd..75b1f1dde747 100644
> --- a/drivers/pci/controller/dwc/pcie-kirin.c
> +++ b/drivers/pci/controller/dwc/pcie-kirin.c
> @@ -138,10 +138,7 @@ static long kirin_pcie_get_clk(struct kirin_pcie *kirin_pcie,
>  		return PTR_ERR(kirin_pcie->apb_sys_clk);
> 
>  	kirin_pcie->pcie_aclk = devm_clk_get(dev, "pcie_aclk");
> -	if (IS_ERR(kirin_pcie->pcie_aclk))
> -		return PTR_ERR(kirin_pcie->pcie_aclk);
> -
> -	return 0;
> +	return PTR_ERR_OR_ZERO(kirin_pcie->pcie_aclk);
>  }
> 
>  static long kirin_pcie_get_resource(struct kirin_pcie *kirin_pcie,
> @@ -174,10 +171,7 @@ static long kirin_pcie_get_resource(struct kirin_pcie *kirin_pcie,
> 
>  	kirin_pcie->sysctrl =
>  		syscon_regmap_lookup_by_compatible("hisilicon,hi3660-sctrl");
> -	if (IS_ERR(kirin_pcie->sysctrl))
> -		return PTR_ERR(kirin_pcie->sysctrl);
> -
> -	return 0;
> +	return PTR_ERR_OR_ZERO(kirin_pcie->sysctrl);
>  }
> 
>  static int kirin_pcie_phy_init(struct kirin_pcie *kirin_pcie)
> --
> 2.23.0
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
