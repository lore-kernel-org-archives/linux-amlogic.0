Return-Path: <SRS0=r/fn=PS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7731C43387
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Jan 2019 11:33:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7671206B6
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Jan 2019 11:33:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SjqhH1L4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="s1433isI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7671206B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:In-reply-to:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QfEe7rei8HaSsqHkvgN380ATpcoEWTww4LXbKSKL3j0=; b=SjqhH1L4DebGZBA9EkCnJPMYo
	Ke7zmmFh/oezJkRcq8qHtGUId0HRm/lc29P9MRBdy7Xo1GHK9R/Ub7Hrh6/vpKvBDQUU1neuvIuZM
	NmiNizKEuHmFUS360nXFNQkJb1crmVAzJC8bjOWMABYROou4Mn6t7C99Br5B9fb/iXbDhNMdrinfr
	fz41WarHv/l7ZumdbDGpRuKqcY/tQtq7zIyB7wIEpO1WmG867JimhZBh1nO8s2Fu4rXFScHfSuGij
	mKMUpOLFtvVn/er0s69ibwm7X9RXVNsOzp9gaMmQL5BN7X2n0ioWVfN0Wn5rOrGthv/zjgTt0FsU+
	tEooaBjuQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ghYaN-0006WQ-IN; Thu, 10 Jan 2019 11:33:19 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghYaI-0006VX-UT
 for linux-amlogic@lists.infradead.org; Thu, 10 Jan 2019 11:33:18 +0000
Received: by mail-wm1-x343.google.com with SMTP id y185so13125915wmd.1
 for <linux-amlogic@lists.infradead.org>; Thu, 10 Jan 2019 03:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=qPQkRPBWGLMdgjVsBEx4c9gZ5TM6yu/W/N2PrOaMgSk=;
 b=s1433isIdfa6p2CS2A/Ik0HH/60B5plW5m5JK4z8heX9hL1na/D5PhzJO9MH6S7J+o
 QzI0AB/JZ+6fVB/cwrDEfY9tjlROH9u6O02SKs/JQHmadRYoo7OeJFcqndI4pGv9CP1t
 EJNNUjjJCgAN6NhrydGxa6ROOKAbh4oe/DZpDGnXAxCC9kHpXavRI6eiZjAhUhgS291m
 BjZMZP9OMs/TlUrFInP2Nfh9v+tV1hz0po/B5oCQVXYeo4aVa/Aq5ddCd+OE7ZZ3oa3w
 n8MWdWMm6xFLqcjK7rLPlx2LbCpRVDcNTLizw2wKY+iJjtqanAq0St/VAufjEMAGpBxf
 2YgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=qPQkRPBWGLMdgjVsBEx4c9gZ5TM6yu/W/N2PrOaMgSk=;
 b=pNL3TxhjurDRth11uH/Vx6ab85cfVpjdAkr6MSm/GiOlG24pLNaI3PimmJ0Y6Q778j
 luqalMnkOUyGvpu7q+Fkeh3osYPT3iRLxISZQWi9rCulyYLE7dhUGhdVhRaQEN0RkNbI
 YCEbthcK03YH0Z0NRwLKyQQtutahGXBlvLipWdcs9zwk6N3CiSXlHnOYzRioy/+c3awD
 S97HTu9LbuJcUSYXAOr0YEi8U7R6cMfmhkfe3Gg9mCKM5NajO8dUH32rtYyqF/+JQAZE
 RoYsUJGAIj3Pnk4C3d5XeUcuG+In1nyOpOubGTEI39dQiF+PiUjWndez3CaRdPqmUoTK
 P15Q==
X-Gm-Message-State: AJcUuke+clP8JpoVKgWlAMMHtvUeHQpPAzzU8G7Dezg+g6o8Nlb/FKbX
 79s1GhNTDjYoLxrAwetBRAvsXg==
X-Google-Smtp-Source: ALg8bN7zYJPPNroeL+xWYkR1mwYvCJ2s0pWArHBpsfZIuob6XQQA+d5lZHYhHEPnxRRu4HDVL7lulA==
X-Received: by 2002:a1c:1383:: with SMTP id 125mr9892521wmt.71.1547119992948; 
 Thu, 10 Jan 2019 03:33:12 -0800 (PST)
Received: from localhost ([2620:10d:c092:180::1:f5ef])
 by smtp.gmail.com with ESMTPSA id v12sm23337899wmd.27.2019.01.10.03.33.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 10 Jan 2019 03:33:12 -0800 (PST)
References: <20190101194414.24766-1-martin.blumenstingl@googlemail.com>
 <20190101194414.24766-2-martin.blumenstingl@googlemail.com>
User-agent: mu4e 1.0; emacs 25.3.2
From: Loys Ollivier <lollivier@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 1/1] mmc: core: don't override the CD GPIO level when
 "cd-inverted" is set
In-reply-to: <20190101194414.24766-2-martin.blumenstingl@googlemail.com>
Date: Thu, 10 Jan 2019 12:33:09 +0100
Message-ID: <8636q0u4qy.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190110_033315_024437_22AE1211 
X-CRM114-Status: GOOD (  18.98  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: ulf.hansson@linaro.org, bgolaszewski@baylibre.com, linus.walleij@linaro.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux@roeck-us.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Martin,

On Tue 01 Jan 2019 at 19:44, Martin Blumenstingl wrote:

> Since commit 89a5e15bcba87d ("gpio/mmc/of: Respect polarity in the device
> tree") gpiolib-of parses the "cd-gpios" property and flips the polarity
> if "cd-inverted" is also set. This results in the "cd-inverted" property
> being evaluated twice, which effectively makes it a no-op:
> - first in drivers/gpio/gpiolib-of.c (of_xlate_and_get_gpiod_flags) when
>   setting up the CD GPIO
> - then again in drivers/mmc/core/slot-gpio.c (mmc_gpio_get_cd) when
>   reading the CD GPIO value at runtime
>
> On boards which are using device-tree with the "cd-inverted" property
> being set any inserted card are not detected anymore. This is due to the
> MMC core treating the CD GPIO with the wrong polarity.
>
> Disable "override_cd_active_level" for the card detection GPIO which is
> parsed using mmc_of_parse. This fixes SD card detection on the boards
> which are currently using the "cd-inverted" device-tree property (tested
> on Meson8b Odroid-C1 and Meson8b EC-100).
>
> This does not remove the CD GPIO inversion logic from the MMC core
> because there's at least one driver (sdhci-pci-core for Intel BayTrail
> based boards) which still passes "override_cd_active_level = true" to
> mmc_gpiod_request_cd(). Due to lack of hardware for testing this is left
> untouched.
> In the future the GPIO inversion logic for both, card and read-only
> detection can be removed once no driver is using it anymore.
>
> Fixes: 89a5e15bcba87d ("gpio/mmc/of: Respect polarity in the device tree")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  drivers/mmc/core/host.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
> index f57f5de54206..cf58ccaf22d5 100644
> --- a/drivers/mmc/core/host.c
> +++ b/drivers/mmc/core/host.c
> @@ -234,7 +234,7 @@ int mmc_of_parse(struct mmc_host *host)
>  		if (device_property_read_bool(dev, "broken-cd"))
>  			host->caps |= MMC_CAP_NEEDS_POLL;
>  
> -		ret = mmc_gpiod_request_cd(host, "cd", 0, true,
> +		ret = mmc_gpiod_request_cd(host, "cd", 0, false,
>  					   cd_debounce_delay_ms * 1000,
>  					   &cd_gpio_invert);
>  		if (!ret)

Test on libretech-cc, sd is fixed with that patch.

Tested-by: Loys Ollivier <loys.ollivier@gmail.com>
-- 
-L

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
