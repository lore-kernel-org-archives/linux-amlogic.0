Return-Path: <SRS0=tAAW=MW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA618C4338F
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Jul 2021 04:46:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A280E60EB2
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Jul 2021 04:46:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A280E60EB2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PZNpkng2L4Kuy8wh/AVYn+5pcPdfbaM1v42qc4fHlVU=; b=b0b1SxKtAyQNWO
	hkpwpsN/IzGnZXjwpeHNirLQ1nfzuJBDdo++XKmy0zeBym6l8O8myz3fRIWpuuKTwE3SGsKhUnvRW
	GS/7EFY2wHO+XPPoO8fS1Lk7eFvWzxdZlj/GzWxQWRPUKZYG4ALjsliw9pHIUBcLpeQZVd76AokOW
	t6WX+sou050SVzApBExdPISKWMNVMLZV/JFqHP1yvfo0nd+v1kOwglPrprCTjPWWcJ9MfUW1wrquJ
	hvUAg6rapOzgkf7Y+mbNt/aJSuQM0F140d/3gnFgGFRY5pSHvD4rKrqZ2NgzFvLAxyxsp/7hZH5NW
	nA+lZBxO7JCMHMEdqPIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9KPE-0078vG-Ac; Fri, 30 Jul 2021 04:45:56 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9KP0-0078tV-IR; Fri, 30 Jul 2021 04:45:43 +0000
Received: by mail-oi1-x22f.google.com with SMTP id t14so11602878oiw.0;
 Thu, 29 Jul 2021 21:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=zEWrjTmo3MRUFNpFLl3xWErCSGWlUtWoDdfX2AHaVUI=;
 b=RqBAr9ka+yi/PzlKqTMaJt6e0IVUvRZ9aDYZHsCdEm8qpBUoE0TQUUKnV0bKK1KvAs
 Rum1G1L8K/ODaF8c1SRiNiTVLW+Rh8kg9RefwnBGjemoC0sdWnIElUIz3Qn9eztAdR1y
 2H23/nzqWTPr+0orDB9pOQG9NIuI8/2b3K/vaY8u1Oi2HP39xffFLdwj+A0uGtPAQQU6
 F0i/cK3BTknOK03/tLsNM6bnKtwZlQUnml8/dN5wZPHYYp8QwqdTZ9Jg8U1zhx3kVzrR
 vi6/TeeTmp1kDlvSktLjG/xvRZijeyL+wQEXRVzlmqK1M0zv5ErG2CQLIwsS63QBStlg
 4y5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=zEWrjTmo3MRUFNpFLl3xWErCSGWlUtWoDdfX2AHaVUI=;
 b=Njmkv7/nJmhMwoZVKz2OTVG1H1YlsKmCNTsWrXI2C2XhlXl4hzyhAtUCXTc2q5GVxE
 xhioRG997mGv1lYM3rqAeRZyBuEWrNOFYkJzDsIxWWUf4ldMMpOrB/c2VnbivrE8Kljr
 Q9uVwYsdtKgfENLpgXDAHkR792HhZD5ebpOeOfgZr/2JePIbIVCCFfC6ZLKrFEB+b5jM
 e9A6sHo92rbFwRLhWSKnTKj4FU5YLa5YER6EdnFzjlb8K2LS6q74g5Oz6/xOLK03bh2g
 qLMMj+UUOw7eOgzrwuyCR3Uk9DE8MAyQUJTY5nHYlCqksMuPOyAldHAr24EsqBxU4P/S
 alIw==
X-Gm-Message-State: AOAM5338xWWxve4BxBFBquQMwNjW7JCWiQiTqVuUMrHLqugZnd9MBfnJ
 TDJGnSt1r73h1ooE0ds6as0=
X-Google-Smtp-Source: ABdhPJz61dqqcK+n5Axb1Waxu7+0cvefK3q7Pe2mYa5sv6JQBavFLROP0E25WdcZeZP8p8c5E3umew==
X-Received: by 2002:aca:6109:: with SMTP id v9mr510193oib.147.1627620340741;
 Thu, 29 Jul 2021 21:45:40 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 f16sm119238oiw.29.2021.07.29.21.45.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 21:45:40 -0700 (PDT)
Date: Thu, 29 Jul 2021 21:45:38 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Artem Lapkin <email2tema@gmail.com>
Cc: narmstrong@baylibre.com, wim@linux-watchdog.org, khilman@baylibre.com,
 jbrunet@baylibre.com, christianshewitt@gmail.com,
 martin.blumenstingl@googlemail.com, linux-watchdog@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 art@khadas.com, nick@khadas.com, gouwa@khadas.com
Subject: Re: [PATCH v4 1/3] watchdog: meson_gxbb_wdt: add nowayout parameter
Message-ID: <20210730044538.GA2110311@roeck-us.net>
References: <20210730041355.2810397-1-art@khadas.com>
 <20210730041355.2810397-2-art@khadas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210730041355.2810397-2-art@khadas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210729_214542_678287_91D6D267 
X-CRM114-Status: GOOD (  17.68  )
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

On Fri, Jul 30, 2021 at 12:13:53PM +0800, Artem Lapkin wrote:
> Add nowayout module parameter
> 
> Signed-off-by: Artem Lapkin <art@khadas.com>
> ---

<Formletter>  
Change log goes here. If it is missing, I won't know what changed.
That means I will have to dig out older patch versions to compare.
That costs time and would hold up both this patch as well as all other
patches which I still have to review.

For this reason, I will not review patches without change log.
</Formletter>

The change is small and recent enough that I remember, so

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

but please keep this in mind for future submissions.

Thanks,
Guenter

>  drivers/watchdog/meson_gxbb_wdt.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
> index 5a9ca10fbcfa..5aebc3a09652 100644
> --- a/drivers/watchdog/meson_gxbb_wdt.c
> +++ b/drivers/watchdog/meson_gxbb_wdt.c
> @@ -29,6 +29,11 @@
>  #define GXBB_WDT_TCNT_SETUP_MASK		(BIT(16) - 1)
>  #define GXBB_WDT_TCNT_CNT_SHIFT			16
>  
> +static bool nowayout = WATCHDOG_NOWAYOUT;
> +module_param(nowayout, bool, 0);
> +MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started default="
> +		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
> +
>  struct meson_gxbb_wdt {
>  	void __iomem *reg_base;
>  	struct watchdog_device wdt_dev;
> @@ -175,6 +180,7 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
>  	data->wdt_dev.max_hw_heartbeat_ms = GXBB_WDT_TCNT_SETUP_MASK;
>  	data->wdt_dev.min_timeout = 1;
>  	data->wdt_dev.timeout = DEFAULT_TIMEOUT;
> +	watchdog_set_nowayout(&data->wdt_dev, nowayout);
>  	watchdog_set_drvdata(&data->wdt_dev, data);
>  
>  	/* Setup with 1ms timebase */
> -- 
> 2.25.1
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
