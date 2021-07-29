Return-Path: <SRS0=5MM3=MV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92A0BC4338F
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Jul 2021 14:14:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30F8760EB2
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Jul 2021 14:14:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 30F8760EB2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KOmYHnqJQ0MmxCswqAgfSem4kcZmpiYAefvbKANk9sk=; b=xfb4IscrzFQzt6ZP273ojLsgMP
	sB9U6JCD7Aa9V6VmXQotaZy18NY79MYiQRjo2Xd1q+GkPg9KCFd6GFJFjXblB3bgLRySVB2U9ULTc
	Bfu2tlazE5B1R/LekAaeyqBZ/5XrNhKcV3MPu6t1dvQeCQxXweCFekZzl2FW0Ap7OX+M98At3TCK1
	xEU6o54rjqirgY0JEharkQ6tJHVgGj8G8WM4A3fA+WOBsmepG+duy3BgAXYx/g9Q+CkdjlePu+HN6
	N4ihG3qUxA4pe9XmQsmeH9N2bzSstsQ7OaMh5Q5kvr+ltcpYKO6wA9ljoa9MUPdeCNaYR5wkjRuRP
	MqJbYQLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m96o7-004UcM-9b; Thu, 29 Jul 2021 14:14:43 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m96o4-004Ubl-5z; Thu, 29 Jul 2021 14:14:41 +0000
Received: by mail-ot1-x331.google.com with SMTP id
 f20-20020a9d6c140000b02904bb9756274cso5984952otq.6; 
 Thu, 29 Jul 2021 07:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QDLjPZN8ZUez+18AHDdRnCP4XJMffoaOJtiTB2SHTCI=;
 b=otThYwEsPlAaugJoVzvywiMf8KME+8FYj0brlZtsYJ66ELMdDgEfrnznqSYJcUNpz2
 uR2IzF9iyYQ7w7gO4KrS2ueA/mcVzMY89P9R0zW1UpBBT/eWB/ql4L2Dq/rFjepyzolv
 1zjxJNSS/z5Lwxsu340dt9wYApRtUPQXEE5Y2WS8cPLt8RsPmP0izyz3/rkCsHX1cRg2
 AJCTCkzT3e6Z5PqH1AhPDebmFUQT8S30myOdINTJWiiNRpdpRNb0EcpiVJ7Asow2QGcq
 raTXNnPCHUQ/ukOVepAjP1GlRs5bTjffMRETCXOnIiqxZqv+0rQi+2x9ODeAkxPU3gIJ
 gbnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QDLjPZN8ZUez+18AHDdRnCP4XJMffoaOJtiTB2SHTCI=;
 b=DoK0DDVDq4oU22V04uLAue9vLMLOxlkuWMn56UIjD8el6DDEjzWTb+rfmjDcSmCAVT
 K3iEL+6ttzvkLnkZPLVHxPjNA1m78KqjYNKCXLw8qM/5VjZIlQE8vq3YZ0qgsONGGWql
 a9JFqH3BYMrAPjIIc6jrtgKFT/3OGY1J8ur0TiTN1XagP4ddLekxLGaNbweD/m6I1XSm
 rISKvvvvZeviESDxkQA6XuAgQg0TsnJzBE0qM/PZik0adSuB/bn52fX3fCMpe31ZmpfD
 OGVcLydFfE4AnlAao3Aix4U9Mhv/jFrBY/cVhycZ1KbLpnj0c8kMdbEkWNEz4vgkRKqO
 NGXA==
X-Gm-Message-State: AOAM533aurds+F5T4aTcuMc9wmNP2UP8LCQmUPRRmnB6QKouWNTXw/6K
 nvSOcdBZ0muFEMLOJCTPZcs=
X-Google-Smtp-Source: ABdhPJwPmNU2yxHwvQAda+MoQNIG1Z/7IFYXidLj/URXoQIWClCZj1xCTsyMw48FrNSbwFET4AR2Tw==
X-Received: by 2002:a9d:3a08:: with SMTP id j8mr3526915otc.247.1627568079002; 
 Thu, 29 Jul 2021 07:14:39 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 z14sm538315otm.66.2021.07.29.07.14.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jul 2021 07:14:38 -0700 (PDT)
Subject: Re: [PATCH] watchdog: meson_gxbb_wdt: add timeout parameter
To: Artem Lapkin <email2tema@gmail.com>, narmstrong@baylibre.com
Cc: wim@linux-watchdog.org, khilman@baylibre.com, jbrunet@baylibre.com,
 christianshewitt@gmail.com, martin.blumenstingl@googlemail.com,
 linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 art@khadas.com, nick@khadas.com, gouwa@khadas.com
References: <20210729072308.1908904-1-art@khadas.com>
 <20210729072308.1908904-3-art@khadas.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <33af8802-1a24-27af-0c21-08741707be83@roeck-us.net>
Date: Thu, 29 Jul 2021 07:14:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729072308.1908904-3-art@khadas.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210729_071440_277243_61DCFEDB 
X-CRM114-Status: GOOD (  18.36  )
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
> Add timeout module parameter
> 
> Signed-off-by: Artem Lapkin <art@khadas.com>
> ---
>   drivers/watchdog/meson_gxbb_wdt.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
> index 5aebc3a09..3f3866878 100644
> --- a/drivers/watchdog/meson_gxbb_wdt.c
> +++ b/drivers/watchdog/meson_gxbb_wdt.c
> @@ -34,6 +34,11 @@ module_param(nowayout, bool, 0);
>   MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started default="
>   		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
>   
> +static unsigned int timeout = DEFAULT_TIMEOUT;

DEFAULT_TIMEOUT is already set below. The default for the module parameter
should be 0. This way the watchdog core takes the value from devicetree
unless a module parameter is provided.

Guenter

> +module_param(timeout, uint, 0);
> +MODULE_PARM_DESC(timeout, "Watchdog heartbeat in seconds="
> +		 __MODULE_STRING(DEFAULT_TIMEOUT) ")");
> +
>   struct meson_gxbb_wdt {
>   	void __iomem *reg_base;
>   	struct watchdog_device wdt_dev;
> @@ -180,6 +185,7 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
>   	data->wdt_dev.max_hw_heartbeat_ms = GXBB_WDT_TCNT_SETUP_MASK;
>   	data->wdt_dev.min_timeout = 1;
>   	data->wdt_dev.timeout = DEFAULT_TIMEOUT;
> +	watchdog_init_timeout(&data->wdt_dev, timeout, dev);
>   	watchdog_set_nowayout(&data->wdt_dev, nowayout);
>   	watchdog_set_drvdata(&data->wdt_dev, data);
>   
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
