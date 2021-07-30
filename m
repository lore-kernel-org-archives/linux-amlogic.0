Return-Path: <SRS0=tAAW=MW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFC75C4338F
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Jul 2021 04:47:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A883460F01
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Jul 2021 04:47:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A883460F01
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ymqwIpt8MH8Lo199iRHkyFaUiPP1Eq8TzrdxGW/bAyg=; b=jzDnkNl5imIamO
	UcyJdoWKNrQQuhnQXdflNAzUA33NjcdS67DtSeGt8YZLh6ve4XvgKplppVYR9oEY59aXHaJs4+/DW
	r3tyF9amHrcL/klG0HW0OvALIqvFEjcVNpRXspGRvB6046ovnxs46AkMDg0k27l0xKqbBsth1ybcl
	I0l5s7liEcCCyOH+XYKNBiublC44xAZibBJF9iiO1eihjBYBKa0IagdAzLNEqE5uODEY7K5bOG4mQ
	1+TBGj8NYbw6N8r8mbH8WVXacQPFdOcFmFXRTqghisW8y459jkIry2jKx6dvCsNlYB6j5uAhWFIA6
	pvL356NrcfJ7e839YWvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9KQk-0079IG-NO; Fri, 30 Jul 2021 04:47:30 +0000
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9KQW-0079DS-0S; Fri, 30 Jul 2021 04:47:17 +0000
Received: by mail-oi1-x233.google.com with SMTP id t14so11606969oiw.0;
 Thu, 29 Jul 2021 21:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Y7ZpOvIt7dv/sT3oUB6j+2TGcOL+AesItuKdAylARmM=;
 b=M0GoLMOhouF+COHwbJRh2Pbyyxf8xSDbFIwkS9zgQSCr8itlPtLotYA2hsSkU6YiV0
 4PB7PeJCbO8yZD/yNEvdsxCcz34fb5V0vrx/j9gpsrKPkhZqHpNApEzoZQi2JcIo0sNR
 +Xbc4fepUrXHKHubRvasUQjLVhkQ0NgL22cnk7YT6o9YJbJOOqDOi4eb189Ztu6r3sqb
 SfVVxtO0jOwk2s8A2JOGJYAX1xg+3NQZw4xMWtQtWpjfwkG73OHQzR0rMFG+4PVBviip
 cmebgvRcpcFwxirwES3xCOo8GCbK5TJxKTYkkgB5iwhAK8hQRSp0aUB3YpArDtaepkfe
 0w1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=Y7ZpOvIt7dv/sT3oUB6j+2TGcOL+AesItuKdAylARmM=;
 b=DsyxcwEXF01LcqhLEJ2lk/1scVX8Zwjc7ZKNanwMri6asvuX6SdAJFNhii2PZ8QdM0
 Q49fnc/V38rEtGydYTYXi4Kh/7a9HP8bGiOsOCjjBZE49RQz7tNODDUg1ybLGFw1SCZc
 Q5wtaEImfr4MTSsrKkr7EvLnhxFsj6GwopLltyyCOQy97oijEpSVcg3VJevy0k6zGD2u
 o/8pVD4ITgzXqvCUc9xRYxHtQPyYDhQoVURG/6Bu8Wnh3EtQEZuxXnW23Z6FsB6IvA4x
 wR7GWYdOL/9q9fuo5DjpWKCxbparONTnxEQmNb1G0vkQeFfpTVnm6KKQV3e7SrIVVhFQ
 1Jkw==
X-Gm-Message-State: AOAM531kxixl1a7Rkl7i+uuKeI0xF5jPByVpcP1iVVImKykGBRzwnBpu
 NuccJsqFir0ZAqk37qzRaSk=
X-Google-Smtp-Source: ABdhPJzg7wjaigC6Amb+qywNvTHMKTpLuOLNO88X0yH4wrxQesdg6+s/BV5vrALnyQChQLO4080RDg==
X-Received: by 2002:a05:6808:198c:: with SMTP id
 bj12mr516545oib.71.1627620434839; 
 Thu, 29 Jul 2021 21:47:14 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id u7sm83374oop.11.2021.07.29.21.47.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 21:47:14 -0700 (PDT)
Date: Thu, 29 Jul 2021 21:47:13 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Artem Lapkin <email2tema@gmail.com>
Cc: narmstrong@baylibre.com, wim@linux-watchdog.org, khilman@baylibre.com,
 jbrunet@baylibre.com, christianshewitt@gmail.com,
 martin.blumenstingl@googlemail.com, linux-watchdog@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 art@khadas.com, nick@khadas.com, gouwa@khadas.com
Subject: Re: [PATCH v4 2/3] watchdog: meson_gxbb_wdt: add timeout parameter
Message-ID: <20210730044713.GB2110311@roeck-us.net>
References: <20210730041355.2810397-1-art@khadas.com>
 <20210730041355.2810397-3-art@khadas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210730041355.2810397-3-art@khadas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210729_214716_093788_B3816476 
X-CRM114-Status: GOOD (  17.22  )
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

On Fri, Jul 30, 2021 at 12:13:54PM +0800, Artem Lapkin wrote:
> Add timeout module parameter
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

As before, the change log is small and recent enough that I remember,
so you are lucky.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Thanks,
Guenter

>  drivers/watchdog/meson_gxbb_wdt.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
> index 5aebc3a09652..945f5e65db57 100644
> --- a/drivers/watchdog/meson_gxbb_wdt.c
> +++ b/drivers/watchdog/meson_gxbb_wdt.c
> @@ -34,6 +34,11 @@ module_param(nowayout, bool, 0);
>  MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started default="
>  		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
>  
> +static unsigned int timeout;
> +module_param(timeout, uint, 0);
> +MODULE_PARM_DESC(timeout, "Watchdog heartbeat in seconds="
> +		 __MODULE_STRING(DEFAULT_TIMEOUT) ")");
> +
>  struct meson_gxbb_wdt {
>  	void __iomem *reg_base;
>  	struct watchdog_device wdt_dev;
> @@ -180,6 +185,7 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
>  	data->wdt_dev.max_hw_heartbeat_ms = GXBB_WDT_TCNT_SETUP_MASK;
>  	data->wdt_dev.min_timeout = 1;
>  	data->wdt_dev.timeout = DEFAULT_TIMEOUT;
> +	watchdog_init_timeout(&data->wdt_dev, timeout, dev);
>  	watchdog_set_nowayout(&data->wdt_dev, nowayout);
>  	watchdog_set_drvdata(&data->wdt_dev, data);
>  
> -- 
> 2.25.1
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
