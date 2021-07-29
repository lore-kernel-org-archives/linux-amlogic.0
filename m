Return-Path: <SRS0=5MM3=MV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77306C4338F
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Jul 2021 14:24:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 366FB60560
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Jul 2021 14:24:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 366FB60560
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:Cc:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RoahqrHpn328gJoD/gu2Uj80aAlPTnzjxGYpgeaHSL8=; b=l8MulKaaEEhla+ZGOXLpihrwZp
	aSVIB00PRzoS7YJm1XCpi2zgQOn/ybWfyq7+1FT3esi0bNdi/Sg7vt5rA1TDXZUq82Men7jwxfg1J
	06hN4FyrPQhd3r2nI1ggpMCtFV5VuLayLHv/c+OcSvxRv07HvlVbknUWIQCp6RHBiQEy7JGaSe2Sr
	+t+8+7ZqWkCOo9R9HgOnSbT1pi2rhek1g0jYSZs6j1C9Y2558sqMVcNFE1qLLlAgP36Eop6RMLa/R
	B2i7keZScvD9VfHVabV96f/UwZbch6Hur+L4UiwGpqi0sIPc68MO1KObuwGStyGgGPbueGuDXibRi
	eLYibHUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m96x0-004W5Q-Rg; Thu, 29 Jul 2021 14:23:54 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m96wy-004W4O-8b; Thu, 29 Jul 2021 14:23:53 +0000
Received: by mail-oi1-x229.google.com with SMTP id u10so8651291oiw.4;
 Thu, 29 Jul 2021 07:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:to:cc:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fiD6HbW+e+TGDOFNYS8Y96H7vqs9aDLEoWQKG8o0zGQ=;
 b=MgxKN/d5WX76jENbSN9xRgPKAbzAdtl74HziXPAq8oivgiZCzHmEtvZrPQ1W2yFn1C
 Kr/0b6NTyQHejpNslrDBIMYgdqL0VpgPocswtIxI9t+Mly1GI4u2mpY40nS5/514B5Sh
 4iNOnYZGShmoF4daj3Foaq8BmgimQi+rhC8vrDvu6EdyQga6vI/E6HtrShzXVwo4ba83
 4BZhUHq15lhAPXZOE9lZiX/9W6JCgykTpCAH1Ph//b/ycEDos8Q3LToecwDH6XvZB1qh
 5Gl7ByzgigfoiAMRY33ClmDJWiO5/6SlgLrPHEAYcjwuXCgwloKK0Jl5S/IxAMyREBaZ
 pTKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fiD6HbW+e+TGDOFNYS8Y96H7vqs9aDLEoWQKG8o0zGQ=;
 b=le6OftDoiNaS8javVQZHdRXOXZW/jBhIk8pyjHwzRSj59vmjip7Y+dMjLPe16wQq6o
 k+tmA+uGDbs54fqbnn8kKZFlK51UE8KV+9PHqB1lh0In7ygOqaJdmy8i5uAeyYe7kTZz
 /Xtd8jj3BfMyEhWbrsBA+c1J0FZfCsWGTx2ZVmsmtAx462MUvICR0Zrhw31XFusnB+AU
 xw7jRMmSo6bS8IhAQyUMbm9JkHYa+80T6lNlZ3cgRH2nRldNQeFxjcRpEH0ujeIVKOsl
 JdiVp4AiTAQeLdtu5kK5i5X+Obvz7jvzNQRap8NKQ0NP9K5BueVzMmWN81QpEPmgM7jY
 U7vQ==
X-Gm-Message-State: AOAM531/XmKQ+1OMbQ53d9S2SIAV8nRSrmRsO2KIfWAEh320evRgca3g
 RPG9Sqq1QsY0w6o+0eeKGyI=
X-Google-Smtp-Source: ABdhPJxBYqe33kHLvYIGhIXmLU1VTcuoRKIbNBrIBWkB4ze2skumAOv3JCVZcFCVLopzeiS464sIVQ==
X-Received: by 2002:a05:6808:1281:: with SMTP id
 a1mr1308106oiw.123.1627568631116; 
 Thu, 29 Jul 2021 07:23:51 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 i205sm228201oif.14.2021.07.29.07.23.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jul 2021 07:23:50 -0700 (PDT)
To: Artem Lapkin <email2tema@gmail.com>, narmstrong@baylibre.com
Cc: wim@linux-watchdog.org, khilman@baylibre.com, jbrunet@baylibre.com,
 christianshewitt@gmail.com, martin.blumenstingl@googlemail.com,
 linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 art@khadas.com, nick@khadas.com, gouwa@khadas.com
References: <20210729072308.1908904-1-art@khadas.com>
 <20210729072308.1908904-4-art@khadas.com>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] watchdog: meson_gxbb_wdt: remove stop_on_reboot
Message-ID: <024cd37a-39a0-d43b-9a2f-cec43eb3b9e8@roeck-us.net>
Date: Thu, 29 Jul 2021 07:23:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729072308.1908904-4-art@khadas.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210729_072352_394075_FC2699E6 
X-CRM114-Status: GOOD (  18.24  )
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

On 7/29/21 12:23 AM, Artem Lapkin wrote:
> Remove watchdog_stop_on_reboot()
> 

This warrants a much longer explanation to even be considered.
Your explanation/reasoning needs to be here. Others won't have
the benefit of reading the summary e-mail, even more so since
you declined to number and sequence the series.

Personally' I don't find it acceptable, but I'll be happy to
listen to input from others. Such changes should be based on
real problems, not on personal opinions. If we accept this patch,
someone else might come in later reverting it with the personal
opinion that some reboots take longer than the watchdog timeout.

Guenter

> Signed-off-by: Artem Lapkin <art@khadas.com>
> ---
>   drivers/watchdog/meson_gxbb_wdt.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
> index 3f3866878..cafc6cdc0 100644
> --- a/drivers/watchdog/meson_gxbb_wdt.c
> +++ b/drivers/watchdog/meson_gxbb_wdt.c
> @@ -198,7 +198,6 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
>   
>   	meson_gxbb_wdt_set_timeout(&data->wdt_dev, data->wdt_dev.timeout);
>   
> -	watchdog_stop_on_reboot(&data->wdt_dev);
>   	return devm_watchdog_register_device(dev, &data->wdt_dev);
>   }
>   
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
