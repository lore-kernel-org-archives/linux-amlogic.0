Return-Path: <SRS0=7OpP=DC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C5D8C4727E
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 21:13:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A689F21D42
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 21:13:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vxDRnqLD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A689F21D42
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dMoZ60PsfN8tlFu0HySrBdbdeTaxl0swBbgRu3qPezI=; b=vxDRnqLD2XVBrOYmTHGgUw1GE
	kMVmd6aTE+dB7OXcIu3Z2xnKu6DWp4vnrSkYIVJsYrNaDNMGoZeTT+nr2v/5QDbVwChHQEw9rXG7T
	u1I9QhDpmjGZvqugixLV2eF4lEoxonG0SPB0uk7Xx83RQsYIC7oyif7m3du3p73nqyT8wczTkAtQ/
	r5yhKLe8xuzOoyHGHfLT2voF6/l5pa816axVJ6LYbxxCm792appvDz8YvoGPDgTjplLvhDH46eFMu
	Tr6temkzC/QP3DFp4FoHj7q4Px/o4xhJhb58K1v+1js/SbwKsXNbJlrXO2jRQKwcZ4zQz2JprJx9w
	Zvjj4IGrw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLv2F-0002SL-5B; Fri, 25 Sep 2020 21:13:43 +0000
Received: from mail-io1-f68.google.com ([209.85.166.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLv2C-0002RL-7Q
 for linux-amlogic@lists.infradead.org; Fri, 25 Sep 2020 21:13:41 +0000
Received: by mail-io1-f68.google.com with SMTP id v8so4497248iom.6
 for <linux-amlogic@lists.infradead.org>; Fri, 25 Sep 2020 14:13:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8kwDPxGWO4Zarxs+976VhrgRShKS6L8rrmLcdeo03XU=;
 b=JkUB9ZsKzwVgtsfmlCa1eF9MXYaaTpeTSt8xQYJsC0/CxgvMRU2AGGu2wO+ynvY/6H
 X4OMYcO8C0ERhdqK07JV2dQexrO7UAnbwCWQ1s7mgWYFvuKyh3wSenTTzx2Cw6R9+wvu
 wnnHtG7BjJNZyjlMoNhgHQRubfyXItnDmBhewuuVtd8v5nPJqTJdMHV0uVxKH5jjx1tV
 W8tYol8BEbbt+ucETcxv6S6V65wiROK/alWM1+zqXyFt0dzAhb8uhkhDfKdINDFX2v9Y
 r/BK3EN1KtZtoYq5b7Yz6cdylpklkn3klgwZx9U/JKaAzSBpc8r93OynEJxbolhGvl+e
 LGew==
X-Gm-Message-State: AOAM53329tvPEnDmSkwC8M8QS5SOheeNsApD2vRf9bYnd35VUPgb+UB+
 FXhDpbMU3+Brc0U8N8vF+A==
X-Google-Smtp-Source: ABdhPJzcS6KJxgxXK5xNBZe2qTu3yKbC+yVLPJn/UV/Er3LVgOvC7c2afoKP/sKN6F+XgON+lf0dUQ==
X-Received: by 2002:a5d:97cd:: with SMTP id k13mr367521ios.164.1601068416055; 
 Fri, 25 Sep 2020 14:13:36 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id o13sm2302386ilk.40.2020.09.25.14.13.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2020 14:13:35 -0700 (PDT)
Received: (nullmailer pid 980712 invoked by uid 1000);
 Fri, 25 Sep 2020 21:13:34 -0000
Date: Fri, 25 Sep 2020 15:13:34 -0600
From: Rob Herring <robh@kernel.org>
To: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH] pci: meson: build as module by default
Message-ID: <20200925211334.GA972187@bogus>
References: <20200918181251.32423-1-khilman@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200918181251.32423-1-khilman@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_171340_268790_2B917721 
X-CRM114-Status: GOOD (  19.81  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-pci@vger.kernel.org,
 Yue Wang <yue.wang@amlogic.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org
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
> 
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

You need a remove hook to tear down the PCI bus at least. 

Really I'd like to add a devres hook in pci_host_probe to do that for 
all the drivers.

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

First line is: SPDX-License-Identifier: GPL-2.0

> -- 
> 2.28.0
> 
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
