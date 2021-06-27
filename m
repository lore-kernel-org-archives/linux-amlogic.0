Return-Path: <SRS0=mKTp=LV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC6F9C48BC2
	for <linux-amlogic@archiver.kernel.org>; Sun, 27 Jun 2021 15:43:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B67CC619B1
	for <linux-amlogic@archiver.kernel.org>; Sun, 27 Jun 2021 15:43:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B67CC619B1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aGDCZPHvI5KtNrk0JjIWr1iwkxMtsg0FRKB6UlBCyH8=; b=VaQnu+P/xNyL1IzcsriH8wfrY5
	w6n4oHMGrcZj7nzXgslqykH7Lz1eYLv+XaSe8lk0jwO0l8bc8acWWy2tN5arX8NLOTbRgQ70U7AtP
	gmg0E0A548me+Ri9G35moNQuyl7yZrB3JVOTVsh8u+z5pYCpBlvh6SkO4QO5NtzonAFiENgul89MJ
	OVDJDfiFLdSJo0TbAWC+I2ml9MbGrCtR1/bXy4fUkcwlp6aF7PX9NkESxZH+qtPldyQizBRX00eha
	gTWwoqJ3LZ2fTJX9KUZi7VoV64pOBZaxAIEUtd6n6Ikr3ND+Y5lhasIZj4DsxUCmb1Y0YXn7Yt//a
	XwAYumww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lxWvw-005mrR-NU; Sun, 27 Jun 2021 15:42:56 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lxWvu-005mqz-DB; Sun, 27 Jun 2021 15:42:55 +0000
Received: by mail-ot1-x336.google.com with SMTP id
 i12-20020a05683033ecb02903346fa0f74dso15685608otu.10; 
 Sun, 27 Jun 2021 08:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3thVEfEpc7oBCh/Z27+kIvV0g7/BSf4GHimjNmLAI/8=;
 b=rfsm1MHy91CuXvQVQQij4cW7Zsel9ybXCQ4Bg/zbKngnjahskh1NOnTqelKWDLzoH6
 MVjUAgGz86qXRsghK7UD8EUcM4dCNgpIUMkehuyaeUaFnkRn8GRDOWPsjV1dNvU/1Duh
 2xuMGAHr6s8ItFCcy67OKsgJPeezbfx0KDRCb1wEH1KbxjkUhxsZQEqLNMyS/X/WSTSo
 cNH0xXzKtkizwhqgkCLChNXghdcg8U6vRtW9IDyb8Hnpk/Tpn8cWJpLb9f3xMZdEZMbo
 bJuTlID+QmpJkSzV0LsdJyhmJjvIUKk38IMH5Dvu7+1/fyx2u9yxV3Gxv2NP1ebkXjiT
 JX9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3thVEfEpc7oBCh/Z27+kIvV0g7/BSf4GHimjNmLAI/8=;
 b=gGmewbf5/drEkB/3ofIshAwTGUKSjRyeZ3S1Tp48OGTTaE+dloLFow/TfWdGQzB5kP
 G+9FcRbScJGdzhpl5D/YzTpBbWuIffElwHeqqKBOQl+oA8RADKS7Hno20H3pGxDgc+iT
 0Fhyb32GX75CkvRKuW7bQtwQZsRNqgwcq1gmZ3xatOylpPLdJDDZHRh5KLvxI4hzywT0
 4KjG/ZhENVqiLyrDHJQ4C96YQ3xqhnMOA6gtDS9KxIBvMAPPrVeuWMekY0vIlIvNJpUr
 /wdtnVIxMVCBwEP/O76FrOHy3wYvk0P5oOT5zmQdzFpsVXdNHOa7aQB6K0ThWJkg0mgB
 oa7Q==
X-Gm-Message-State: AOAM533m2+ebiOuX2fenXhXn8LhpBMM97+6SQJNoWWtM1XkwAEx/KgC0
 veQfIYfrNqjl7qoBMf8DuwA=
X-Google-Smtp-Source: ABdhPJy4+D9Td70nq0/Ra304FJwRaeQ44Jesy5d+gYrZz3MGsnReGMgyHMry5n5m2z9CRD4GS62+pQ==
X-Received: by 2002:a9d:4d8d:: with SMTP id u13mr16983789otk.367.1624808573453; 
 Sun, 27 Jun 2021 08:42:53 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 26sm2534781ooy.46.2021.06.27.08.42.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Jun 2021 08:42:52 -0700 (PDT)
Subject: Re: [PATCH 4/5] watchdog: meson_gxbb_wdt: add stop_on_unregister
To: Artem Lapkin <email2tema@gmail.com>, narmstrong@baylibre.com
Cc: wim@linux-watchdog.org, khilman@baylibre.com, jbrunet@baylibre.com,
 christianshewitt@gmail.com, martin.blumenstingl@googlemail.com,
 linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 art@khadas.com, nick@khadas.com, gouwa@khadas.com
References: <20210623024429.1346349-1-art@khadas.com>
 <20210623024429.1346349-5-art@khadas.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <5229d62c-b327-254f-800f-1524f27491b3@roeck-us.net>
Date: Sun, 27 Jun 2021 08:42:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210623024429.1346349-5-art@khadas.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210627_084254_519243_1FE24748 
X-CRM114-Status: GOOD (  18.25  )
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
> Added missed watchdog_stop_on_unregister call
> 

This is again personal opinion and needs an acknowledgement
by driver authors. It is only necessary if one wants to support
that the watchdog is force-stopped by killing the watchdog daemon
(which leaves the watchdog running) and subsequently unloading
the driver. The call is not 'missing'; otherwise the core could
just do it. For that reason it should not be added with the argument
that it would be 'missing'. This will require a better argument.
Why is that call needed ? What is the use case ?

Guenter

> Signed-off-by: Artem Lapkin <art@khadas.com>
> ---
>   drivers/watchdog/meson_gxbb_wdt.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
> index 0bf5dccf70b1..2dbe254e5122 100644
> --- a/drivers/watchdog/meson_gxbb_wdt.c
> +++ b/drivers/watchdog/meson_gxbb_wdt.c
> @@ -196,6 +196,7 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
>   
>   	meson_gxbb_wdt_set_timeout(&data->wdt_dev, data->wdt_dev.timeout);
>   	watchdog_set_nowayout(&data->wdt_dev, nowayout);
> +	watchdog_stop_on_unregister(&data->wdt_dev);
>   
>   	return devm_watchdog_register_device(dev, &data->wdt_dev);
>   }
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
