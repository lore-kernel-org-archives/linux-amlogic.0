Return-Path: <SRS0=mKTp=LV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50681C48BC2
	for <linux-amlogic@archiver.kernel.org>; Sun, 27 Jun 2021 15:29:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01CC361261
	for <linux-amlogic@archiver.kernel.org>; Sun, 27 Jun 2021 15:29:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01CC361261
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=si4ptyVIngAi/CGX7gil9Bp8xIx69MIu1WnToLnjFQE=; b=kkZSGqQRO7O5GEOKdyZD96dk12
	JiCX+U+qxTC9oS96iYF8EOmrSV0b7FgD77yEntixbDSrg/mx6eFuN3bxWJEm16dlFQbfFl3Af9rdW
	bvfQxyvEy9kbHfBDhgRjYGltus9e3JQhBDPZ1/dQulpE6u9qb+KUEeKX0NUh1rk8/5bAIUyqsEUXy
	BQZe0hoOl4IqMS8cv27yggG6Fv5++12oQUSslFU3nRItRFwO91FRPa//EWcptKPPI5On20/F3ZtqB
	kkL5zZGxWgTe3KiRreVcq8OaTfYksmNtMmJq232xala6QdDKlkv++VqD1F87Zl4NtnqOiytualRfH
	Hqxji83A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lxWin-005kbL-SB; Sun, 27 Jun 2021 15:29:21 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lxWil-005kas-DX; Sun, 27 Jun 2021 15:29:20 +0000
Received: by mail-ot1-x32f.google.com with SMTP id
 h24-20020a9d64180000b029036edcf8f9a6so15665793otl.3; 
 Sun, 27 Jun 2021 08:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5gFqnS/CoYLNlikXZlkgnwqo+7RmKH3b1Jf1rQbqAcs=;
 b=czXaaYQlf6ff5fpTB7PrT/Q86P0SWfMniizjxTLZmaSWtQhUoaQoDlBkc1Q1qNKCjL
 4BaaMGzno8CRjXE8AXURgq/j8qhtxBclOzYMMlYwYMhqrGnUDfUTXycfPPhXY7hi1dCi
 ojoGjm0CPn6coxOjqWhN7BwrriQy+pDUkjb2xDvqQH1wNpnozZFWnboQwBGbN42pB+T0
 QlHhYg4jjAgDZe4ffX/6qtGYXCrIHrqUHFiCclyu5Dm6ftOhxA9rV616jT7cSz02EsBt
 stEqMMBWBMTCYCKU+hLyZ93UE02q/0NUEdED/wi5f2QAOIQZuWIB1UOxrlP5kCOHo8ZD
 e9oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5gFqnS/CoYLNlikXZlkgnwqo+7RmKH3b1Jf1rQbqAcs=;
 b=qDOZuxymql6Q57nI4rC5dWDn+ZBAnVpF5ggNcGClfZhLkKxOuOCOlvTpVsFrNT/4qN
 pbh8i1ZohJ84uY7IZIn3IuGtM5ago4ecZoAOxaZhAwBvyL+PkjhipO4JB/VAZM43z5A7
 78mwgMyBxU4sLWuVxH07na5f5WtOv/W0+6aK8qqElItZuzzfo1TN3DvxVoBj4hD8/3N1
 82SdHPPrCFu0SaBp2MSnTUN6ZC/HvSnpOSC3ZeD4jaEOyHcSi8XpaulFZ1mdt2sXm0jP
 7ki01mp7A3ShlumEPpj0QD0kHxG8r9F3wqSnIys0Sco6eTTAKZPU4F1TntB1NeSO+cF9
 ZnhQ==
X-Gm-Message-State: AOAM533udEv9ZF/V5biyi59Aj0LvO3iv9rguZ2po55q6lUgVZqRve2ik
 qZxZP1GtRdiIQc2xja78BlU=
X-Google-Smtp-Source: ABdhPJyTo3B/5vnfM/5AaVmSpxZJ3xyn8xFTPpxA9Kfu2fxbMwY1kUWKm02TFV7syL5ywgeZrHE2aw==
X-Received: by 2002:a05:6830:4a2:: with SMTP id
 l2mr1514306otd.267.1624807756137; 
 Sun, 27 Jun 2021 08:29:16 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 t25sm2308002oij.47.2021.06.27.08.29.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Jun 2021 08:29:15 -0700 (PDT)
Subject: Re: [PATCH 1/5] watchdog: meson_gxbb_wdt: remove
 watchdog_stop_on_reboot
To: Artem Lapkin <email2tema@gmail.com>, narmstrong@baylibre.com
Cc: wim@linux-watchdog.org, khilman@baylibre.com, jbrunet@baylibre.com,
 christianshewitt@gmail.com, martin.blumenstingl@googlemail.com,
 linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 art@khadas.com, nick@khadas.com, gouwa@khadas.com
References: <20210623024429.1346349-1-art@khadas.com>
 <20210623024429.1346349-2-art@khadas.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <f8605141-348e-dcc2-1457-021c0c0ff7bf@roeck-us.net>
Date: Sun, 27 Jun 2021 08:29:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210623024429.1346349-2-art@khadas.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210627_082919_530259_CA8BF591 
X-CRM114-Status: GOOD (  17.23  )
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
> Remove watchdog_stop_on_reboot (still can be activated by
> watchdog.stop_on_reboot=1) i think this driver configuration more useful
> becouse we can get reboot waranty for abnormal situations on shutdown stage
> 

This is personal opinion. Driver authors would have to agree.

Guenter

> Signed-off-by: Artem Lapkin <art@khadas.com>
> ---
>   drivers/watchdog/meson_gxbb_wdt.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
> index 5a9ca10fbcfa..3f86530c33b0 100644
> --- a/drivers/watchdog/meson_gxbb_wdt.c
> +++ b/drivers/watchdog/meson_gxbb_wdt.c
> @@ -186,7 +186,6 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
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
