Return-Path: <SRS0=mKTp=LV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4FFCC48BC2
	for <linux-amlogic@archiver.kernel.org>; Sun, 27 Jun 2021 15:32:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8061F61261
	for <linux-amlogic@archiver.kernel.org>; Sun, 27 Jun 2021 15:32:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8061F61261
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=totC1K04KxrLlDV/9shu3h0sUBtfadpdt33sJY6y53k=; b=39yj2tfDaO/OdFY/60bXR2AxGv
	SdY2YUKqnmmK+hMdRSLyjNRkl5QSrBb36RDaKNJ5O7Jjl6h6O0FyQlcd3qvwiummQC+ynGz8XP7r2
	R5POZkoWZ900uaLZIWYNG+k+JXJypA4pUNknsP1SFaMU6qQuuPxPRiSzNK/9+JvqNs0gOKGxhgPII
	Fcwav4dpMU7NFmpcTS7Ipe6DBcAtXFqYv8f4Njp3QydYpbKRmEEMy+J1VX9P0mm8/Nq1cj29+kjad
	j+11z2LkMrBFAt/Avi5u+BwrpbI438/FGDf2PIn3OsCpyvUE3AJVAoyRQZZQro1wSImR+8xZkRJLq
	K9ia9PYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lxWm7-005lI1-Of; Sun, 27 Jun 2021 15:32:47 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lxWm4-005lGo-6s; Sun, 27 Jun 2021 15:32:45 +0000
Received: by mail-oi1-x229.google.com with SMTP id d19so18556679oic.7;
 Sun, 27 Jun 2021 08:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=59hequDqZ0EZ8M0y3xtHrgqpE3wu/Nxv4aJHXZdBkE0=;
 b=ZmKffNrAS6Am31vp81Nr5z9YoX5qBKEMg0qjI07jV5SmAO8U7KKIJUw55pGIwY4487
 IT5vy3B4xijfN14HGhix6A1Tv/m5hRbnDdRu7INCP4PC9aECh/xqad+ZYow4vrlwQIyR
 C0ZAsqsubBIPWuqsLNkgYQgs0jBDw2oLGs0a97PkOi+zzXf3Nwt0m7UqSDABo+BFUIlY
 6k1xnaE3+Sah7ZVVtPoNfqXcfYwY49U70I31Kcwm2Hv8Clct0iTtMSrB20tS+PbTj9/J
 WOU+hbmceS/gtADYoCfVZ672XDyrBSpJcu4nDfl6yQTZZQZ9Ix/5jHwMNQcYsCSBxNZA
 U/ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=59hequDqZ0EZ8M0y3xtHrgqpE3wu/Nxv4aJHXZdBkE0=;
 b=CndK8y76bHGuiYox18xNajtmR2Ls//VCriKJO7W7tqN8P5+0YrrlDDaSixUczwARsv
 /0Q8xINDP8rHBYUpTdoYjlZ+/BAPJ6mwIMWolV6awT3TiWjf/QRJlvI0jusm70wyZh7o
 xtqN73WCbfuHFsQVdeSFzFoROpAsuaKC+narIJ6SHBQoGYka+vEvmNbq9FrdZcvz/iMj
 e1dc4QDh3e7aItZ37xXvuA7TKopn57Cq37OwOT9CYcpmOhfG87nTf7lIYic+6wEhKO3a
 B9Hud6Kxaar++quAUCLqlow5h8i/5OJZzxWu9nZEJVIM3C13YrOn7YzLxqtXoCEc7QT3
 TvxQ==
X-Gm-Message-State: AOAM533h4cIRqBS7ABEUUHWngIugVpYzZnHgFJJQqeSVhiKsUVW0CtQo
 8SIVdWr6jpM/fATHnOlI488=
X-Google-Smtp-Source: ABdhPJz/m9LPxwXU9P6BNkse7ot38gJ9WqZx+oTpUKJzoj/34NxviIaZLf8P2yg/7O06hph6WNM8ug==
X-Received: by 2002:aca:a812:: with SMTP id r18mr7474599oie.35.1624807963007; 
 Sun, 27 Jun 2021 08:32:43 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 w132sm2605164oig.38.2021.06.27.08.32.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Jun 2021 08:32:42 -0700 (PDT)
Subject: Re: [PATCH 2/5] watchdog: meson_gxbb_wdt: add timeout module param
To: Artem Lapkin <email2tema@gmail.com>, narmstrong@baylibre.com
Cc: wim@linux-watchdog.org, khilman@baylibre.com, jbrunet@baylibre.com,
 christianshewitt@gmail.com, martin.blumenstingl@googlemail.com,
 linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 art@khadas.com, nick@khadas.com, gouwa@khadas.com
References: <20210623024429.1346349-1-art@khadas.com>
 <20210623024429.1346349-3-art@khadas.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <f4bac702-9121-fc84-e138-27f3f662f443@roeck-us.net>
Date: Sun, 27 Jun 2021 08:32:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210623024429.1346349-3-art@khadas.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210627_083244_324710_1970F37F 
X-CRM114-Status: GOOD (  19.66  )
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
> Added timeout module param same as in other modules
> 
> Signed-off-by: Artem Lapkin <art@khadas.com>
> ---
>   drivers/watchdog/meson_gxbb_wdt.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
> index 3f86530c33b0..ecd1fc6f48ba 100644
> --- a/drivers/watchdog/meson_gxbb_wdt.c
> +++ b/drivers/watchdog/meson_gxbb_wdt.c
> @@ -29,6 +29,11 @@
>   #define GXBB_WDT_TCNT_SETUP_MASK		(BIT(16) - 1)
>   #define GXBB_WDT_TCNT_CNT_SHIFT			16
>   
> +static unsigned int timeout = DEFAULT_TIMEOUT;
> +module_param(timeout, uint, 0);
> +MODULE_PARM_DESC(timeout, "Watchdog heartbeat in seconds="
> +		 __MODULE_STRING(DEFAULT_TIMEOUT) ")");
> +
>   struct meson_gxbb_wdt {
>   	void __iomem *reg_base;
>   	struct watchdog_device wdt_dev;
> @@ -174,7 +179,7 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
>   	data->wdt_dev.ops = &meson_gxbb_wdt_ops;
>   	data->wdt_dev.max_hw_heartbeat_ms = GXBB_WDT_TCNT_SETUP_MASK;
>   	data->wdt_dev.min_timeout = 1;
> -	data->wdt_dev.timeout = DEFAULT_TIMEOUT;
> +	data->wdt_dev.timeout = timeout;

This is wrong. A timeout module parameter should be set with a call to
watchdog_init_timeout(), the initial value should be 0, and data->wdt_dev.timeout
should be kept as-is. This ensures that the module parameter is validated.

Guenter

>   	watchdog_set_drvdata(&data->wdt_dev, data);
>   
>   	/* Setup with 1ms timebase */
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
