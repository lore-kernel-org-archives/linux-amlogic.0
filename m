Return-Path: <SRS0=7OpP=DC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC5BEC4727E
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 17:05:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 819F1208B6
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 17:05:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oXqS8k3V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 819F1208B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=P2Q2skadpMMfoJv/jUQuAoL5QnHDVEzexTKUEKZ7S6Q=; b=oXqS8k3VI2QI1OiCBDhU2gdLn
	qwV+oI+cLVHO3DuxpY0Uw/ZlaXc+0f6EJ+q4yP4G4j7KDJBf6b6chkP+JSZWb3EZGcfJaGKOt4FMv
	O+faEQEoOjsOcylxVVmUAi6pa+rgIOMb3GDvWkb6i+50PG4WVOwsmXZfEvIFA43ek3dMANWQkG0O9
	ctbEQR+PSv8rcr2hcfu2aKSCrBz9GNI1Tw+jEZYrR5arDCnatqm5tmvV3qXxARBaHV4h8XvXxvZaD
	QcTgk+jQgf6aMHifyKvkgyCXfnyfCSuKDeSdIqrDersfvA7sAXuoGszB34gdvV76gSsIkHP4KwYRN
	p8ENotWXw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLr9W-00071l-Rd; Fri, 25 Sep 2020 17:04:58 +0000
Received: from mail-ed1-f65.google.com ([209.85.208.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLr9T-00070m-9r; Fri, 25 Sep 2020 17:04:57 +0000
Received: by mail-ed1-f65.google.com with SMTP id i1so3240645edv.2;
 Fri, 25 Sep 2020 10:04:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=7H2Bk9gpg/w+wUoObaKvu/mtCEHvMrdXma3hhs6oCPA=;
 b=GU5GDl7YXqNvcricdEk/yT+lh0YLXMyVLvPV/nUMplP0PPnf9HoHv6w07QQQ8bfvra
 wnnASr8BZOYvYeeWiG65JgZzz8BeUy+wUwdPM4fw43RW5EzYq8Ud4Wql6zpZsTOiS7V7
 DYLJDdei8yqAS5ny1UvfrxEJeRtlBnUv++m1H232NGzwjliiish9bXZCWsqDyCZ0iSPQ
 PTFoxSEHmuLkxgdoGZEbhQeSsmJcXjArL5KjG6b8htubT03vVsUT6M62yZRRmzJlXnlx
 pNQynDIhVSSBFxV/N2rL+DQIryt7lN8fH+KuWLukCeX4FdeEqQbVnFv0bkq2yKGpWK4t
 P9wA==
X-Gm-Message-State: AOAM531VpjcQvDsq4PUd8whxMCoczBy1S6MhvacDzJQM9dLqLD6Doq5r
 kxhSUOjMzKc2XeAj7MyOgwo=
X-Google-Smtp-Source: ABdhPJzshXZU4mumXpaaqCcRqza8EX1pZ67x1HLojNLckvWgfrfQH6BmnBoLuzW1ylscuLUKq7fF/A==
X-Received: by 2002:a50:c8cd:: with SMTP id k13mr2333610edh.387.1601053492597; 
 Fri, 25 Sep 2020 10:04:52 -0700 (PDT)
Received: from kozik-lap ([194.230.155.132])
 by smtp.googlemail.com with ESMTPSA id 40sm2174254edr.67.2020.09.25.10.04.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 25 Sep 2020 10:04:51 -0700 (PDT)
Date: Fri, 25 Sep 2020 19:04:49 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] mmc: host: fix depends for MMC_MESON_GX w/ COMPILE_TEST
Message-ID: <20200925170449.GA18717@kozik-lap>
References: <20200925164323.29843-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200925164323.29843-1-rdunlap@infradead.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_130455_350501_FA267171 
X-CRM114-Status: GOOD (  18.98  )
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, Sep 25, 2020 at 09:43:23AM -0700, Randy Dunlap wrote:
> Fix build errors for meson-gx-mmc.c when CONFIG_COMMON_CLK is not
> set/enabled. This can happen when COMPILE_TEST is set/enabled.
> 
> ERROR: modpost: "clk_divider_ops" [drivers/mmc/host/meson-gx-mmc.ko] undefined!
> ERROR: modpost: "devm_clk_register" [drivers/mmc/host/meson-gx-mmc.ko] undefined!
> ERROR: modpost: "clk_mux_ops" [drivers/mmc/host/meson-gx-mmc.ko] undefined!
> ERROR: modpost: "__clk_get_name" [drivers/mmc/host/meson-gx-mmc.ko] undefined!
> 
> Fixes: 54d8454436a2 ("mmc: host: Enable compile testing of multiple drivers")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: linux-amlogic@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: linux-mmc@vger.kernel.org
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/mmc/host/Kconfig |    1 +
>  1 file changed, 1 insertion(+)
> 
> --- linux-next-20200925.orig/drivers/mmc/host/Kconfig
> +++ linux-next-20200925/drivers/mmc/host/Kconfig
> @@ -425,6 +425,7 @@ config MMC_SDHCI_IPROC
>  config MMC_MESON_GX
>  	tristate "Amlogic S905/GX*/AXG SD/MMC Host Controller support"
>  	depends on ARCH_MESON|| COMPILE_TEST
> +	depends on COMMON_CLK

I received a report from kbuild about this when I posted the patchset
but somehow I was not able to reproduce it... or I skipped this for
reason I do not remember now, my bad.

Anyway, thanks for fixing, looks ok:
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Also please for the credits (as Kbuild did report it to me):
Reported-by: kernel test robot <lkp@intel.com>

Best regards,
Krzysztof

>  	help
>  	  This selects support for the Amlogic SD/MMC Host Controller
>  	  found on the S905/GX*/AXG family of SoCs.  This controller is

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
