Return-Path: <SRS0=mKTp=LV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52FBEC48BC2
	for <linux-amlogic@archiver.kernel.org>; Sun, 27 Jun 2021 15:37:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05ABC6142B
	for <linux-amlogic@archiver.kernel.org>; Sun, 27 Jun 2021 15:37:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05ABC6142B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JMLQwH28bkeA5tgpLMoY/3y5bRXwqLmX6RkbhszIJlw=; b=wOBpCCuzH6OXjYmUwAfdH2i9Cg
	WfNeemHHfEPZ+DQiPXZOEMnZCAYzxSbbtBBztznbm9zGjO4qJPiMkIky9UmIF9tRIv4Dsrma33ze/
	2RL9gUlIdadPhgHkZyhi74pwCyK3ofpppknl7UFoPGYdVU3KSt6MLVRWPXPXsNbmhTdrRMR53TBdE
	L3vKmkDNUcemoYVBd3h7n8QZrVmbsniCid60Gi6pW316SILFLUCvGVrN2Jv5gBQ8+AXNVNzCd9vcL
	Ge5evmurpeQ8s8/qmMMQvoMSZxBrvcgQx62pYhnv+R2+bA+mikboVPFfwWBQKG80BQVjpiRXVAgMS
	6clzHqxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lxWqP-005mFZ-AP; Sun, 27 Jun 2021 15:37:13 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lxWqN-005mF2-5K; Sun, 27 Jun 2021 15:37:12 +0000
Received: by mail-ot1-x330.google.com with SMTP id
 59-20020a9d0ac10000b0290462f0ab0800so7774357otq.11; 
 Sun, 27 Jun 2021 08:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lMhRlO1Xkh8gfckvHOGgFo9jg3Vn08GwQISseZ644bQ=;
 b=kVxSs3rDEIY4IoeHD1OwLDA4DzO0TPRJo/PnBA8j2iHHsvsj26rfq3aR6V1aROpWyD
 m0ULNbCauErLUUyTKvLqNXnyqCb8iiXWsNQJesH4zQaM1Pr8ZCun+aDiyPBc2tOjS2Y8
 fz4r5E7fx4dcEr7mQwSuh5ZasyYf1fRiHAK6hcptJMyOHHvV/JgM2ZltcxPF3zC85h3Q
 K3tx44j/djjxd+kHwU/U9cm6TaIgQ37RKOpg9yd5WbSen0yKCp4Sd646ac7uh/wKQ2PU
 SKJ6gccrYBPk25xDNTCuqeM485gz7Rxm6RSD9ElF5slOxqHgZm/NF9aRJtpUs8mrPVn5
 W+Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lMhRlO1Xkh8gfckvHOGgFo9jg3Vn08GwQISseZ644bQ=;
 b=dqR98cdfTFLAn3kliga4fnhKZ6DLMMHnKg4ZDbcULLXXZHf4n94lH4cOKTWQkLNKxE
 QM8EipECSbatofkMOsJKI1P0cZGhiC6X8fdUXRQzx0j39cnf2KsDd8eFRnye7NRRvF7b
 ZgjEgcrJMh4at0Yw0tM0JJVpt38r7ws2Mbi/f2aliob9EjmAFTt/CS1cle0YSKL2Zo+H
 rKPu3YleiW7u+B99aHdGrITYvu+Sa2i48eFl0bb7pNxpcOyDBc2esss5Wo2CocRMAl7W
 l+gDIqq+BW000zTSw+2rfbbI0VOLfEUlx1w+DWdkv02+vc5Hxt+8bwly3EyeCdxmF6eU
 dG/A==
X-Gm-Message-State: AOAM532nPSOuPI7ehXJkx29X+xvbEYTkRZi0BO6rMN4Qnna5DBzi+uA0
 BibLNMNGp/7kKP9t5BQ6Ngg=
X-Google-Smtp-Source: ABdhPJwQKc0UelUXUyRAC8U7ItqvSjkrlD1Mxlh5OGIWJN9uNLdvRYLgDukmfrAmcTgM2L+Qt1ZkTQ==
X-Received: by 2002:a05:6830:270b:: with SMTP id
 j11mr17422450otu.161.1624808230297; 
 Sun, 27 Jun 2021 08:37:10 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 j7sm2621507oij.25.2021.06.27.08.37.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Jun 2021 08:37:09 -0700 (PDT)
Subject: Re: [PATCH 3/5] watchdog: meson_gxbb_wdt: add nowayout module param
To: Artem Lapkin <email2tema@gmail.com>, narmstrong@baylibre.com
Cc: wim@linux-watchdog.org, khilman@baylibre.com, jbrunet@baylibre.com,
 christianshewitt@gmail.com, martin.blumenstingl@googlemail.com,
 linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 art@khadas.com, nick@khadas.com, gouwa@khadas.com
References: <20210623024429.1346349-1-art@khadas.com>
 <20210623024429.1346349-4-art@khadas.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <69f72ce6-dd62-3ffe-b620-50ceb6b318e0@roeck-us.net>
Date: Sun, 27 Jun 2021 08:37:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210623024429.1346349-4-art@khadas.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210627_083711_268275_9E2867A7 
X-CRM114-Status: GOOD (  16.75  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 6/22/21 7:44 PM, Artem Lapkin wrote:
> Added nowayout module param same as in other moduels

Please use complete sentences and words, check your spelling (modules),
and refrain from irrelevant statements such as "same as in other moduels".

"Add nowayout module parameter" is sufficient here.

> 
> Signed-off-by: Artem Lapkin <art@khadas.com>
> ---
>   drivers/watchdog/meson_gxbb_wdt.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
> index ecd1fc6f48ba..0bf5dccf70b1 100644
> --- a/drivers/watchdog/meson_gxbb_wdt.c
> +++ b/drivers/watchdog/meson_gxbb_wdt.c
> @@ -34,6 +34,11 @@ module_param(timeout, uint, 0);
>   MODULE_PARM_DESC(timeout, "Watchdog heartbeat in seconds="
>   		 __MODULE_STRING(DEFAULT_TIMEOUT) ")");
>   
> +static bool nowayout = WATCHDOG_NOWAYOUT;
> +module_param(nowayout, bool, 0);
> +MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started default="

'(' missing before 'default'

> +		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
> +
>   struct meson_gxbb_wdt {
>   	void __iomem *reg_base;
>   	struct watchdog_device wdt_dev;
> @@ -190,6 +195,7 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
>   		data->reg_base + GXBB_WDT_CTRL_REG);
>   
>   	meson_gxbb_wdt_set_timeout(&data->wdt_dev, data->wdt_dev.timeout);
> +	watchdog_set_nowayout(&data->wdt_dev, nowayout);
>   
>   	return devm_watchdog_register_device(dev, &data->wdt_dev);
>   }
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
