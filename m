Return-Path: <SRS0=0gED=DF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBA1EC2D0A8
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Sep 2020 16:34:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56E60207F7
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Sep 2020 16:34:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MFRCZOR4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56E60207F7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SuXVBb/R9g2ygKD8nXRsCnZmK4pJZIjL8N5R3h4UKLY=; b=MFRCZOR43EbCjLAmL0TLauxOm
	OpQXWSaCQ8LWK8EEPWmE6f+d6pKnkaNeikEIvru481EsEqQrzzQdz0LA3e8A147iaXlMggSnxXBbA
	GD12NRBj5/lI9dKqrI2+4ucT7wNz5+j0u0MhJy+SOJ+FvBQHnLUnEAGSaOMVwmsmwJ2OmZd2MQrJG
	V0bzBq4jQVD+2ozqthB1lYY6lfIK7Rfxk94ys0n26lGsFxczaO8umHBQ6syTRXGCEHC4jo14/o4SA
	jDRDRkSrGCWOIBkj7rToh1kyfydm0EjpjLoCE5FGWm+ik5l0pJXN2/eTsMNWj2V2GL7RtIVE7ObYS
	Uj4GviKvQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMw70-0000Jq-G0; Mon, 28 Sep 2020 16:34:50 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMw6y-0000J9-9f
 for linux-amlogic@lists.infradead.org; Mon, 28 Sep 2020 16:34:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 89EA631B;
 Mon, 28 Sep 2020 09:34:46 -0700 (PDT)
Received: from e121166-lin.cambridge.arm.com (e121166-lin.cambridge.arm.com
 [10.1.196.255])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A45063F6CF;
 Mon, 28 Sep 2020 09:34:45 -0700 (PDT)
Date: Mon, 28 Sep 2020 17:34:40 +0100
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH] pci: meson: build as module by default
Message-ID: <20200928163440.GA16986@e121166-lin.cambridge.arm.com>
References: <20200918181251.32423-1-khilman@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200918181251.32423-1-khilman@baylibre.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200928_123448_384763_56A6360E 
X-CRM114-Status: GOOD (  17.81  )
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
Cc: linux-pci@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Yue Wang <yue.wang@amlogic.com>, linux-kernel@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, Sep 18, 2020 at 11:12:51AM -0700, Kevin Hilman wrote:
> Enable pci-meson to build as a module whenever ARCH_MESON is enabled.
> 
> Cc: Yue Wang <yue.wang@amlogic.com>
> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
> ---
> Tested on Khadas VIM3 and Khadas VIM3 using NVMe SSD devices.
> 
>  drivers/pci/controller/dwc/Kconfig     | 3 ++-
>  drivers/pci/controller/dwc/pci-meson.c | 8 +++++++-
>  2 files changed, 9 insertions(+), 2 deletions(-)

Applied to pci/meson, thanks.

Lorenzo

> diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
> index 044a3761c44f..bc049865f8e0 100644
> --- a/drivers/pci/controller/dwc/Kconfig
> +++ b/drivers/pci/controller/dwc/Kconfig
> @@ -237,8 +237,9 @@ config PCIE_HISI_STB
>  	  Say Y here if you want PCIe controller support on HiSilicon STB SoCs
>  
>  config PCI_MESON
> -	bool "MESON PCIe controller"
> +	tristate "MESON PCIe controller"
>  	depends on PCI_MSI_IRQ_DOMAIN
> +	default m if ARCH_MESON
>  	select PCIE_DW_HOST
>  	help
>  	  Say Y here if you want to enable PCI controller support on Amlogic
> diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
> index 4f183b96afbb..7a1fb55ee44a 100644
> --- a/drivers/pci/controller/dwc/pci-meson.c
> +++ b/drivers/pci/controller/dwc/pci-meson.c
> @@ -17,6 +17,7 @@
>  #include <linux/resource.h>
>  #include <linux/types.h>
>  #include <linux/phy/phy.h>
> +#include <linux/module.h>
>  
>  #include "pcie-designware.h"
>  
> @@ -589,6 +590,7 @@ static const struct of_device_id meson_pcie_of_match[] = {
>  	},
>  	{},
>  };
> +MODULE_DEVICE_TABLE(of, meson_pcie_of_match);
>  
>  static struct platform_driver meson_pcie_driver = {
>  	.probe = meson_pcie_probe,
> @@ -598,4 +600,8 @@ static struct platform_driver meson_pcie_driver = {
>  	},
>  };
>  
> -builtin_platform_driver(meson_pcie_driver);
> +module_platform_driver(meson_pcie_driver);
> +
> +MODULE_AUTHOR("Yue Wang <yue.wang@amlogic.com>");
> +MODULE_DESCRIPTION("Amlogic PCIe Controller driver");
> +MODULE_LICENSE("Dual BSD/GPL");
> -- 
> 2.28.0
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
