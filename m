Return-Path: <SRS0=mKTp=LV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79138C49EA6
	for <linux-amlogic@archiver.kernel.org>; Sun, 27 Jun 2021 15:45:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F7A4619C5
	for <linux-amlogic@archiver.kernel.org>; Sun, 27 Jun 2021 15:45:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F7A4619C5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bX1BzrqTadfwMPlRpCIPv00D0CTWd49F04eWDphcJCw=; b=FbF5OT9dWy4i0Z4BKasJNj1uwc
	/XKY494Zj0EiubEBBYhpm98f76+5vKxc7WCPcS5y8m57s7OZuRy9QlFDY8FCZGRIXOF56MgKevEVU
	1C6L5qNAYzC03KWEWBabz7HtNEF7uDHg3ddJ6sk0Ng0hWLE2p6eG/kVnoK/nlAO1knVITLKyd/i7U
	Y0gVEESm1dbT+iGIPa7G17mlBBfjWrMbKmMuApYByGVaAu2gZv8IG5JObSMVLNqQUoh2sWCY9/EDZ
	ngFV0D7OWBDi0ITy/7fXJQEu0Wafnx/b6RDPWEIVHdqEwAwLXimGOofEXjEeblk4bQTu0ekY6pTIM
	eCAe7bmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lxWyT-005nCF-9W; Sun, 27 Jun 2021 15:45:33 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lxWyQ-005nBY-Ix; Sun, 27 Jun 2021 15:45:31 +0000
Received: by mail-ot1-x32b.google.com with SMTP id
 x17-20020a05683000d1b029045fb1889a9eso15263201oto.5; 
 Sun, 27 Jun 2021 08:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iIEswyTeFsaVzMVOhrH0b0aZFx1DUf1Zvxz83hF4BEw=;
 b=SsRlx/2s9XCeCd74HUMT3QpSr9C3SOpIFMWVuNjLKJXR8BjdG3zmFPQAJYrF8qOZvG
 vWPM2j4/nmb9WFsHXEUi/ND132AXK/h434A5TWt135y/1OhS05hzK0eULzzfYdneax5f
 XXCkBYvX/pA4m1Gk6OItabi3xzTO3JKICW0fReo0uZB2W+ZkmsnfpoI1r9qFCDNjPLWW
 N+nDjTsf60cBgWSC7tKxK4A/TTo3HZV66t9XlRfzFU/fn9APNH7yAhUq9P+KDIu3LW11
 Het6RSQfc6NbqSJ+Hah/Q4VSBP+Kg9jmr6BWdc+eEGaqVdvo5SB0V2qoH/B48RR1cET3
 RtSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iIEswyTeFsaVzMVOhrH0b0aZFx1DUf1Zvxz83hF4BEw=;
 b=EFeRPyEV47ORN8NZvPxpyky64zJ3rCgIaVOcqtQ54ZkxqQbLBfHSdwg3wYJVLgFo0K
 Tzyu0+GfymGBBQcFZYXVwby3uaxbcnZGZAdKsx3ypqthVvECtWcrOSfcccS5YahBrpEx
 uTzGtgM1eTy5VBtS+SqSFz8VNO83VwJuY6yLvkPvxG/p1U1gtf622uzVBt/xhb7R4AWk
 tRUR2056gmTub6cV/H4u9UncXMzl2MknPy4y/7MDqMSo2WbgO0gCEsKeFayvn2Sdur/Q
 aUFTNOHzQjyiqUTVYqu3AAcFj3W1FXlvmX0C0yoPt/oyOcq9Lm/KMPgAeH6z9CdxjwgT
 t4fQ==
X-Gm-Message-State: AOAM5338V+CqQ2FwAXsy2ZBJnZ/LjcG0XQ7MwZ62uBYzNRhRP7BSAk5m
 qCjtRmV7dUfZOWsSq2QB1wU=
X-Google-Smtp-Source: ABdhPJwe21S0j7KPZnAfbinwtBdvM9auuN/8Hf5ReRnIyUyC4v+C+fbhiSnsh90BrieYCsPuS2J71Q==
X-Received: by 2002:a9d:2f0:: with SMTP id 103mr17593622otl.174.1624808728839; 
 Sun, 27 Jun 2021 08:45:28 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 m3sm1805484otf.12.2021.06.27.08.45.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Jun 2021 08:45:28 -0700 (PDT)
Subject: Re: [PATCH 5/5] watchdog: meson_gxbb_wdt: add register device status
 notification
To: Artem Lapkin <email2tema@gmail.com>, narmstrong@baylibre.com
Cc: wim@linux-watchdog.org, khilman@baylibre.com, jbrunet@baylibre.com,
 christianshewitt@gmail.com, martin.blumenstingl@googlemail.com,
 linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 art@khadas.com, nick@khadas.com, gouwa@khadas.com
References: <20210623024429.1346349-1-art@khadas.com>
 <20210623024429.1346349-6-art@khadas.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <cd3a7822-2a17-84b0-7e14-c132ce69ab14@roeck-us.net>
Date: Sun, 27 Jun 2021 08:45:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210623024429.1346349-6-art@khadas.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210627_084530_690102_E1B171B9 
X-CRM114-Status: GOOD (  19.36  )
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
> Print watchdog success driver start status notification
> 

Another personal opinion: The driver author decided that the message is
not needed (which matches my personal opinion). I'd rather see all those
messages either go away or moved to the core. Either case, this one is
misleading: The watchdog is _not_ enabled. The watchdog driver is loaded,
which is different.

Guenter

> Signed-off-by: Artem Lapkin <art@khadas.com>
> ---
>   drivers/watchdog/meson_gxbb_wdt.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
> index 2dbe254e5122..750b304b460d 100644
> --- a/drivers/watchdog/meson_gxbb_wdt.c
> +++ b/drivers/watchdog/meson_gxbb_wdt.c
> @@ -198,7 +198,14 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
>   	watchdog_set_nowayout(&data->wdt_dev, nowayout);
>   	watchdog_stop_on_unregister(&data->wdt_dev);
>   
> -	return devm_watchdog_register_device(dev, &data->wdt_dev);
> +	ret = devm_watchdog_register_device(dev, &data->wdt_dev);
> +	if (ret)
> +		return ret;
> +
> +	dev_info(dev, "Watchdog enabled (timeout=%d sec, nowayout=%d)",
> +		 data->wdt_dev.timeout, nowayout);
> +
> +	return ret;
>   }
>   
>   static struct platform_driver meson_gxbb_wdt_driver = {
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
