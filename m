Return-Path: <SRS0=yQOf=LQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E191C2B9F4
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Jun 2021 11:09:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 900F161352
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Jun 2021 11:09:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 900F161352
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=STJLjIZxhedAvBzgLRahCwo2A5d2zf00WB/w5uPJ9pg=; b=aMChz8VtUCZyB/tNeMS901dkxG
	wo4x2I2OIGOo3rp7foDTVQDOv+87UGUVzKNwnueRhAXb0HZao/qFy5koo5MD1CJeHpS+Wmo+3teiM
	ZQaPmjoQuVz3ZVQlfeRgA5PQRYm/svq8fosmLdyPkuq7HUASvJz3yopimKt8fWLSB+TKHcHlwLi/d
	DDAn5n9v03URESmEbiLQhvmxVn8FPqZuW4HiIik48YC269Wh8ObK4F+nCTL9qQ6MlLDs6W9+JapuE
	7mmIjXRX3UQ+j0TEMhjJN38gL6Q9HYpJ8gZ4HQ76o5X5mNhHuHbqqOBbyzRuIa5wkdb9PszHku6XA
	FfbP/Y4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lveH7-006s5J-7p; Tue, 22 Jun 2021 11:09:01 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lveH3-006s39-44
 for linux-amlogic@lists.infradead.org; Tue, 22 Jun 2021 11:08:59 +0000
Received: by mail-wr1-x42f.google.com with SMTP id h11so5666727wrx.5
 for <linux-amlogic@lists.infradead.org>; Tue, 22 Jun 2021 04:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Lq66Xjw5phBkXkJlrRj1+NbFKwtWmVfKpej/PiTxwz8=;
 b=lu/XpFbeQPRb3Kmlu2wIqg2ziWjqCteY1wketnLaG+eeKF2gnNuY6/TXszGZKzwLZX
 G0x4PUBL6KuhSN6ZhsePGOG+FKmWhlYahIl0sVH9WQ0N++7uGontZRdwlAvHFHYnL0ct
 YdgcVmIxpxXt48KHwuTpV90rphOmzxZQP3K+hpP5jaappI3/vQG6dH5Z9J/p3SwhLvhj
 qb0TkShFTp4A9RHYZ734dRU/KjTmwDJkhq/u/fO6+CCDEBZOIBF+iEx9aX3bELtzG/D+
 dtk85tcmBV4Y8gH4zabe61pGw1Epk2eLSzXD2PxSrvny1h9HggAmi7Rl9QRaI0NFUK68
 lGcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Lq66Xjw5phBkXkJlrRj1+NbFKwtWmVfKpej/PiTxwz8=;
 b=FSdbDbythXUeUieL0AXivPnWT1pKdZGZb8+/bbclak+M0hT3Zr9q6GTBYLq6LFJKvG
 smdXSZHp8DOycOEYNSes1yFc/hfK8PhT/SCK/vgraORNvNULY4KYDuCViT6v4lzBESYK
 u6TgW2NJgZWY8KDvlpgxXklCTHSnn7H8/YqkFF6YWH11W3prYc+OCgLc6z6/ha20evAQ
 HjuTSCsWd3Z9KKbNbU3VFhDgIdBV26cd9sIyQhIGJM9qATyfqR92iHFZiOhrQnfrMBKu
 oUbYL2NI1dNSOM1fFKXQFkwDKqSMiOHKP6PUWgNkyRNw0Saz3/TWWehwKGH8H5+9wtwj
 IgKA==
X-Gm-Message-State: AOAM532eXJnbkCyJojz9J1ew1+j3sYAVjdgSl09z5rrXHDMap+SX0SRQ
 Ugrk7ZoTWuznEa5bXIWCTUlwVQ==
X-Google-Smtp-Source: ABdhPJwjDHkvFKgWlzcHBiFhM7t70Wscz+aLHos8OuzpYf1kseMkyODFDMtCSJ5qqjmtXYvMLmoTXg==
X-Received: by 2002:a5d:6a0d:: with SMTP id m13mr3965814wru.318.1624360133978; 
 Tue, 22 Jun 2021 04:08:53 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:de9f:b167:e2fd:3d94?
 ([2001:861:44c0:66c0:de9f:b167:e2fd:3d94])
 by smtp.gmail.com with ESMTPSA id b7sm7101142wrw.20.2021.06.22.04.08.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jun 2021 04:08:53 -0700 (PDT)
Subject: Re: [PATCH] watchdog: meson_gxbb_wdt: improve
To: Artem Lapkin <email2tema@gmail.com>
Cc: wim@linux-watchdog.org, linux@roeck-us.net, khilman@baylibre.com,
 jbrunet@baylibre.com, christianshewitt@gmail.com,
 martin.blumenstingl@googlemail.com, linux-watchdog@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, art@khadas.com, nick@khadas.com,
 gouwa@khadas.com
References: <20210622095639.1280774-1-art@khadas.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <bfa12322-bc49-2337-2988-199e87e34b87@baylibre.com>
Date: Tue, 22 Jun 2021 13:08:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210622095639.1280774-1-art@khadas.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_040857_189276_75207B75 
X-CRM114-Status: GOOD (  20.47  )
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

Hi Art,

On 22/06/2021 11:56, Artem Lapkin wrote:
> Improve meson_gxbb_wdt watchdog driver
> 1) added module param timeout and nowayout same as other modules
> 2) print watchdog driver start status
> 3) add watchdog_stop_on_unregister
> 4) remove watchdog_stop_on_reboot ( still can be activated by
> watchdog.stop_on_reboot=1 ) i think this driver configuration more useful
> becouse we can get reboot waranty for abnormal situations on shutdown stage

Can you split the patch in 4 distinct changes ?

Neil

> 
> Signed-off-by: Artem Lapkin <art@khadas.com>
> ---
>  drivers/watchdog/meson_gxbb_wdt.c | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
> index 5a9ca10fbcfa..15c889932c13 100644
> --- a/drivers/watchdog/meson_gxbb_wdt.c
> +++ b/drivers/watchdog/meson_gxbb_wdt.c
> @@ -35,6 +35,17 @@ struct meson_gxbb_wdt {
>  	struct clk *clk;
>  };
>  
> +static bool nowayout = WATCHDOG_NOWAYOUT;
> +static unsigned int timeout = DEFAULT_TIMEOUT;
> +
> +module_param(nowayout, bool, 0);
> +MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started default="
> +			__MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
> +
> +module_param(timeout, uint, 0);
> +MODULE_PARM_DESC(timeout, "Watchdog heartbeat in seconds="
> +			__MODULE_STRING(DEFAULT_TIMEOUT) ")");
> +
>  static int meson_gxbb_wdt_start(struct watchdog_device *wdt_dev)
>  {
>  	struct meson_gxbb_wdt *data = watchdog_get_drvdata(wdt_dev);
> @@ -174,7 +185,7 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
>  	data->wdt_dev.ops = &meson_gxbb_wdt_ops;
>  	data->wdt_dev.max_hw_heartbeat_ms = GXBB_WDT_TCNT_SETUP_MASK;
>  	data->wdt_dev.min_timeout = 1;
> -	data->wdt_dev.timeout = DEFAULT_TIMEOUT;
> +	data->wdt_dev.timeout = timeout;
>  	watchdog_set_drvdata(&data->wdt_dev, data);
>  
>  	/* Setup with 1ms timebase */
> @@ -186,7 +197,12 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
>  
>  	meson_gxbb_wdt_set_timeout(&data->wdt_dev, data->wdt_dev.timeout);
>  
> -	watchdog_stop_on_reboot(&data->wdt_dev);
> +	watchdog_set_nowayout(&data->wdt_dev, nowayout);
> +	watchdog_stop_on_unregister(&data->wdt_dev);
> +
> +	dev_info(dev, "Watchdog enabled (timeout=%d sec, nowayout=%d)",
> +		data->wdt_dev.timeout, nowayout);
> +
>  	return devm_watchdog_register_device(dev, &data->wdt_dev);
>  }
>  
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
