Return-Path: <SRS0=oK7S=DX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6EE1C433DF
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Oct 2020 20:44:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0A5220878
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Oct 2020 20:44:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FFy9wfDf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="nLq4PCLn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F0A5220878
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SQCf2J/FcsV9BeWQ4U30IZeHcVpET2+8o6cre2/1Erw=; b=FFy9wfDfn//DLG7TjcIxhIT9F
	QWGy/fjbMYf4gXHvYFf54PK8+Ny4x44gejv5m/vs9EX3Pd+HcBI/1/ngP2X47MR+Bis2O7fpV79+b
	NkOtfqS6tfgWrdZ1f01uO7rksgFuAsG2UcjgtDm59cZMqHr2K7Eoz37KbCSSiwWwe5Mihexh/ChXU
	L8oSUj1SPhN8+Kh63Dg0mn6o6z15TiQ5WTtdRQ4q6bFcRE1ZIK0w0tauwld32soBJrh5IxBWRdwu2
	QBhLYn115A+r7gQUPcxJrck5RB8YB4rYSlSYRbuqcLLRImVCe9kP+alE2JvQ5zRl4r4wqNT9TxtLC
	Sroe2KEUA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTWaZ-0003Ps-Lu; Fri, 16 Oct 2020 20:44:35 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTWaW-0003Oe-BQ
 for linux-amlogic@lists.infradead.org; Fri, 16 Oct 2020 20:44:33 +0000
Received: by mail-wm1-x343.google.com with SMTP id e2so4370931wme.1
 for <linux-amlogic@lists.infradead.org>; Fri, 16 Oct 2020 13:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=5XhpSIxhw7frhhWif6TnITOoeBwLv9Zj9L9MaPglXfE=;
 b=nLq4PCLnWAcna0PaJ322UevLhxmI/udpFGmNUyov5qb4+VvhuDEP4oBmVmMxHh5GZu
 UJmh6XlDGncgqz7PzVQXuh2ueeTy1Mqk3Ik6k3MkhMlBCfAmvgpHibXuHvVlwybDm2xn
 07BT1QtaWYfjedyh/kDAN7jClMLUdnxFYuzI7VzvsbdrfhoD/DSASiRI1ZSkkrPqDE/G
 /0tt6HL+OxQjlZa2+pHkA0qQqtPv4XqAP5GRfjV9AQjxF3o32HI20G4Wo1SBn0U4bJCQ
 B6vO0bqW2xc559jgjlwxkJwrCpoF8G1nOG1HUGX7XGJ/D8vqblxnDjwUcfJ/XhehkAgr
 N18A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=5XhpSIxhw7frhhWif6TnITOoeBwLv9Zj9L9MaPglXfE=;
 b=HzBM8X2A4MAadC4Dt05JEuljRrWUTqU3OqIdGyS1kUpZ5OaZI+9n8zB2ehss+3vvr1
 b9xzr7GNA68HWcYHFzfE9zq+3XgO5Lk279szuUbSb2obxsXq9InXdEpADR/dD8OuKd2S
 oPMwISTMxIOwO/IjYrFNC7fojmQf23YsKDVGEoXXqYWj2xDI8M7WEAvYN9CI2XEitQ9T
 8eBY/sfJJNG6/rxurA5XtqN26v6emd1wfQZHqWv4jAJsHedWLRCw2rs8UbklyhFyg2xK
 y5Ma6P/DoRZZmVyMacbKX/MFkpIQVDGvIrak5zCTnBHqwH9YpYF1pjZ/cyzsoIC+x4Vo
 QRpQ==
X-Gm-Message-State: AOAM531KLXAASmhRiVmQWJ3MhApbIlOH8ZFto3Rst/BlFgdiKY/B9Lam
 Ehb2oJMxRabu9TQOCZ0EptYgdg==
X-Google-Smtp-Source: ABdhPJz/gQMlKhpXN309WQzLkG+ZLoJIfRABj2DFSggmC6KLOOX5BOV6MOJfENHwQRXwb1ZOdnCpFw==
X-Received: by 2002:a1c:9d87:: with SMTP id g129mr5476965wme.30.1602881068479; 
 Fri, 16 Oct 2020 13:44:28 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id d2sm5001062wrq.34.2020.10.16.13.44.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 13:44:27 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, p.zabel@pengutronix.de
Subject: Re: [PATCH] reset: meson: make it possible to build as a module
In-Reply-To: <20201013133943.412119-1-narmstrong@baylibre.com>
References: <20201013133943.412119-1-narmstrong@baylibre.com>
Date: Fri, 16 Oct 2020 13:44:24 -0700
Message-ID: <7hd01h295j.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_164432_396790_B1ADD413 
X-CRM114-Status: GOOD (  16.22  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> In order to reduce the kernel Image size on multi-platform distributions,
> make it possible to build the reset controller driver as a module.
>
> This partially reverts 8290924e ("reset: meson: make it explicitly non-modular")
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/reset/Kconfig       | 4 ++--
>  drivers/reset/reset-meson.c | 7 ++++++-
>  2 files changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index d9efbfd29646..ab315617565f 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -94,8 +94,8 @@ config RESET_LPC18XX
>  	  This enables the reset controller driver for NXP LPC18xx/43xx SoCs.
>  
>  config RESET_MESON
> -	bool "Meson Reset Driver" if COMPILE_TEST
> -	default ARCH_MESON
> +	tristate "Meson Reset Driver"
> +	default ARCH_MESON || COMPILE_TEST
>  	help
>  	  This enables the reset driver for Amlogic Meson SoCs.
>  
> diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
> index 94d7ba88d7d2..434d5c0f877e 100644
> --- a/drivers/reset/reset-meson.c
> +++ b/drivers/reset/reset-meson.c
> @@ -9,6 +9,7 @@
>  #include <linux/init.h>
>  #include <linux/io.h>
>  #include <linux/of.h>
> +#include <linux/module.h>
>  #include <linux/platform_device.h>
>  #include <linux/reset-controller.h>
>  #include <linux/slab.h>
> @@ -142,4 +143,8 @@ static struct platform_driver meson_reset_driver = {
>  		.of_match_table	= meson_reset_dt_ids,
>  	},
>  };
> -builtin_platform_driver(meson_reset_driver);
> +module_platform_driver(meson_reset_driver);

I tried this as as a module, and it never probed because it's missing
this on the compatible table:

   MODULE_DEVICE_TABLE(of, meson_reset_dt_ids);

With that minor change:

Reviewed-by: Kevin Hilman <khilman@baylibre.com>
Tested-by: Kevin Hilman <khilman@baylibre.com>

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
