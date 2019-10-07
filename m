Return-Path: <SRS0=9NnP=YA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22B53C47404
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Oct 2019 18:09:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB699206C0
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Oct 2019 18:09:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o6zt/5af";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="1g4svc2i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB699206C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+6NASEIRe7z3a7L2SyVcQesMzzX36l06sb8gVTx/PHs=; b=o6zt/5afvqL/Cw
	ChBwxOVHBNxs6SmmFyZKoDk35T6u/fKPK+Z1CvHKvtz2naVB2lADYbvjTzjA9aJviwHmE3B3dKRe1
	MZ6ZUHbqpmC35B0Y/+dbhg/usg4vF6Uu9occtBbkv8TmW3MRY7fuPIEpvprc3nAO79bGY5BOVKEch
	0wz+Z5A+I+arSLobgWcdiTJ31fjWCAGlaXHIfHZa4mhTjUPHvD7/v3C1f1TIIBxuo+bEnxopRc2aX
	Rv5WNytPCJDJaYTN4dcd1ncplC/JWUBGZRBQbYilXyxGE3erb4HnX7mEh5mLibRHUwB+87Ot9NjiK
	KfuX5Om4Z2xwCfdb0Rkw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iHXRn-0004Fz-1y; Mon, 07 Oct 2019 18:09:27 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iHXRd-00045U-L1
 for linux-amlogic@lists.infradead.org; Mon, 07 Oct 2019 18:09:19 +0000
Received: by mail-pg1-x544.google.com with SMTP id 23so8697514pgk.3
 for <linux-amlogic@lists.infradead.org>; Mon, 07 Oct 2019 11:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=GeChysEpyXENIdkz70FTwZQNrGJAliQm6LKcOJ4pwgg=;
 b=1g4svc2i2jhyiyQgS7H2WqaqlY4rawaEfSSoyLIcO9cblF0u1gFFqp/KTw35+0FZfc
 MwzkbFI30GsMRmv2OloegWaVbSjb8KDnm+dfMEbweYWsOm1wGCxZsUSg/z+13uH3xzh1
 RupL3Su0rST4Jq9HoZjj9nGm9XoyTwDep1/8UQyx/IVu9uLc6qpUfKWUlHyLvUMgJXNW
 aB2X3gCDtmoi4cYwtVghiMaLgJrHmdzn/5lss3HRCyoE4uQU4faG8oZ0vBV7mGtmCjn5
 1yBEDl3LzEuJXvBb0Jp2SepKw/cROrKcSFBMbcUwB1odwRJ0Wn5DcdTOh2g1tJhlI8t4
 bchA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=GeChysEpyXENIdkz70FTwZQNrGJAliQm6LKcOJ4pwgg=;
 b=D05fGaiRfwHsNgQeWu+cNbKVVMR+zZ+AsDk4U+tLuHts/Rfi1YxSrizeXC+KUHe3CC
 x0KfrIt1r1rhPb6RYGkHabD1pQ3zmi16U/S99VKlftbX9BDbpT4wzWTLKsygRJnP6fNi
 gP/hKEEBu50uVKAOU2qKwkvIhYEEsPt3vlKGCZKYHBAHoTXz+DASuodlXKlBO1TPgouo
 XREofj/yWGDNT4bgdn3iRZ0hQsIRl9pmMOWFTs/5JU2ldCR/WIQN8lrjYXFcG4iD+Xw1
 q6OcOepp0A/5NYeraFRCC+4ECFh1E3IelIzwmhv+kk/H5k01/Sp+N/tYz5HfXeixPfL1
 utRg==
X-Gm-Message-State: APjAAAXyrm/0MOJIJJYdnIcJyDwTtOLtA3LPfkjGiUbibxr4okJlJIB1
 DwNf1InImTITXdH10S+IbU1SHw==
X-Google-Smtp-Source: APXvYqyCq2Sjyl//q7G2IzZThRFyehP3F/3geHI2eKnTCZnkHRsOjKjZK4tPTO1jHMEhvfanawQuGw==
X-Received: by 2002:a65:688a:: with SMTP id e10mr31994989pgt.221.1570471756657; 
 Mon, 07 Oct 2019 11:09:16 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:bd18:5fe6:bf81:d473])
 by smtp.gmail.com with ESMTPSA id s73sm155793pjb.15.2019.10.07.11.09.15
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 07 Oct 2019 11:09:16 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: YueHaibing <yuehaibing@huawei.com>, a.zummo@towertech.it,
 alexandre.belloni@bootlin.com, joel@jms.id.au, andrew@aj.id.au,
 nicolas.ferre@microchip.com, ludovic.desroches@microchip.com,
 computersforpeace@gmail.com, gregory.0xf0@gmail.com, f.fainelli@gmail.com,
 bcm-kernel-feedback-list@broadcom.com, linus.walleij@linaro.org,
 baruch@tkos.co.il, paul@crapouillou.net, vz@mleia.com, slemieux.tyco@gmail.com,
 eddie.huang@mediatek.com, sean.wang@mediatek.com, matthias.bgg@gmail.com,
 patrice.chotard@st.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 mripard@kernel.org, wens@csie.org, thierry.reding@gmail.com,
 jonathanh@nvidia.com, linux@prisktech.co.nz, michal.simek@xilinx.com
Subject: Re: [PATCH -next 16/34] rtc: meson: use
 devm_platform_ioremap_resource() to simplify code
In-Reply-To: <20191006102953.57536-17-yuehaibing@huawei.com>
References: <20191006102953.57536-1-yuehaibing@huawei.com>
 <20191006102953.57536-17-yuehaibing@huawei.com>
Date: Mon, 07 Oct 2019 11:09:15 -0700
Message-ID: <7hk19gfmwk.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191007_110917_710403_39372F9D 
X-CRM114-Status: GOOD (  12.15  )
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
Cc: linux-rtc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

YueHaibing <yuehaibing@huawei.com> writes:

> Use devm_platform_ioremap_resource() to simplify the code a bit.
> This is detected by coccinelle.
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Reviewed-by: Kevin Hilman <khilman@baylibre.com>

> ---
>  drivers/rtc/rtc-meson.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/rtc/rtc-meson.c b/drivers/rtc/rtc-meson.c
> index e08b981..9bd8478 100644
> --- a/drivers/rtc/rtc-meson.c
> +++ b/drivers/rtc/rtc-meson.c
> @@ -292,7 +292,6 @@ static int meson_rtc_probe(struct platform_device *pdev)
>  	};
>  	struct device *dev = &pdev->dev;
>  	struct meson_rtc *rtc;
> -	struct resource *res;
>  	void __iomem *base;
>  	int ret;
>  	u32 tm;
> @@ -312,8 +311,7 @@ static int meson_rtc_probe(struct platform_device *pdev)
>  	rtc->rtc->ops = &meson_rtc_ops;
>  	rtc->rtc->range_max = U32_MAX;
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	base = devm_ioremap_resource(dev, res);
> +	base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(base))
>  		return PTR_ERR(base);
>  
> -- 
> 2.7.4

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
