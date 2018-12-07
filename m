Return-Path: <SRS0=njkK=OQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98B25C07E85
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Dec 2018 05:15:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0545920882
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Dec 2018 05:15:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lioJjwMP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="y+avLIy3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0545920882
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9y6vg3bbCAdeKMNFQ9vAG1VF4HBfaZ4LsDgeqZ1+vxE=; b=lioJjwMPnUGV1h
	4H8vxXhhAnGcGmoGGeWNaJwUR/kaVthWf7T7ZZa337ui746c8DTogl+NTDcySUROdQheODWbo29Hg
	2XeVj1rZKJkjUAodYNkcOumlt6J9PsUgiTA6ImokjDBiv7HsapzWqby1cIL0WNoMrX6SPDk6bB1t2
	kLq9pbHFh/5JM47pEcB7TNXJabKQzBUw384pXOWMrspOF2VMcc+0HsZ7zoZJpmibNUuceelQ3+5AG
	TvZvQAYm+eD0vA/bSQuG2/DC1h7jxFeXqoMehMlUgLbdrZ3+nWzx5vp6ANEV89VNNdDK26GCLwggd
	2EBly0AnOIICrALcGtzw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gV8Tu-0003bi-39; Fri, 07 Dec 2018 05:15:18 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gV8Tn-0002F9-Dt
 for linux-amlogic@lists.infradead.org; Fri, 07 Dec 2018 05:15:16 +0000
Received: by mail-pl1-x642.google.com with SMTP id y1so1261726plp.9
 for <linux-amlogic@lists.infradead.org>; Thu, 06 Dec 2018 21:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=dmii4nzEM2Nm2cM0ickB4B0RFnQObvVQise/kPSzOOQ=;
 b=y+avLIy34s+Qe4YVSK7aSK2TRatfZNPbERiW/5C21AzahbRikXZdIcwMgBiOb7Wu7/
 GlQrH2K0vkwCJZt8n2DqaMJsauYW+b2L4apoJRsqMZvNGiUx7t17m532mUAqEHh5N5Sv
 Avhf95gY2oCvoVOOsLxTgDJMMH34TegeZksReyZ2AIzd3d2vfc2w3EH5loI9W4mdGj+Z
 tGDSp498L7c7oosyCbPo4aD0T2/U7WOtZo/gr6yYeLmpFaE9ZJwfrNBIwI1SN/5cWSZf
 7czPf4B6i4BfbDTe9VvAIF/qMP/bKRB6ZSY4jj97Qc9pHHrRGxhxuA/9tFg0RBBN+GCC
 sRxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=dmii4nzEM2Nm2cM0ickB4B0RFnQObvVQise/kPSzOOQ=;
 b=sWbVhZnR3SbDihF2Iy9zbeKGgUipR65dV5KazklqmOiNW/dVhxWkMznVeo5NeTD4/S
 qQMmMROtmuz7dhiGImpDjjr0tFXC5rHgCK1i9iernxypXw33chRl8By9Zzj0AJlWyXGr
 V9rjN6U2dGJTu9hy2x2+gp21ZjH6wiu42dmv6ml9DcZQBx4dtJJ9bdFSHa47UQeUAr7y
 78XatoCkiiniNV9Xzlonk4l/pHOaePGrTEtDtc0FuDPCFokgoRCdcmvhRdSKV6EPzGeo
 yLaWEI5Ds+SPVxQhx147NuHmWuUsgoxUfFEuIOIlROEpAc34nOBEupnIs2Urxmq2T/Yp
 RpVw==
X-Gm-Message-State: AA+aEWaugxc/eF1eaS24ylU37d3QPriQLPeMFpX/t3AAWIjDWdiZ69YC
 zzW6l8ermxgcuIoXAusyPikzrA==
X-Google-Smtp-Source: AFSGD/UyFADuL/eE2Vw+BT24ITvRvMbr2HYwMBE/5HeD04PTBfx1rkLYmKaZvQP6XulVK7uOza/A+Q==
X-Received: by 2002:a17:902:4225:: with SMTP id
 g34mr877599pld.152.1544159699851; 
 Thu, 06 Dec 2018 21:14:59 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.googlemail.com with ESMTPSA id p2sm2375244pfb.28.2018.12.06.21.14.58
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 06 Dec 2018 21:14:58 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Carlo Caione <ccaione@baylibre.com>, jbrunet@baylibre.com,
 narmstrong@baylibre.com, u-boot@lists.denx.de,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH] pinctrl: meson: axg: Fix GPIO pin offsets
In-Reply-To: <20181206080811.30320-1-ccaione@baylibre.com>
References: <20181206080811.30320-1-ccaione@baylibre.com>
Date: Thu, 06 Dec 2018 21:14:58 -0800
Message-ID: <7hpnudyl2l.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181206_211511_516301_4A90FECB 
X-CRM114-Status: GOOD (  14.43  )
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
Cc: Carlo Caione <ccaione@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Carlo Caione <ccaione@baylibre.com> writes:

> The pin number (first and last) in the bank definition is missing the
> pin base offset shifting. This is causing a miscalculation when
> retrieving the register and pin offsets in the GPIO driver causing the
> 'gpio' command to drive the wrong pins / GPIOs in the second GPIO chip
> (the AO bank is driven correctly because the shifting is already 0).
>
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>

This looks like it could use a Fixes: tag for stable.

Kevin

> ---
>  drivers/pinctrl/meson/pinctrl-meson-axg.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/pinctrl/meson/pinctrl-meson-axg.c b/drivers/pinctrl/meson/pinctrl-meson-axg.c
> index a54fbce910..3bbbe817b4 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson-axg.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson-axg.c
> @@ -14,7 +14,7 @@
>  
>  #include "pinctrl-meson-axg.h"
>  
> -#define EE_OFF	14
> +#define EE_OFF	15
>  
>  /* emmc */
>  static const unsigned int emmc_nand_d0_pins[] = {BOOT_0};
> @@ -893,17 +893,17 @@ static struct meson_pmx_func meson_axg_aobus_functions[] = {
>  };
>  
>  static struct meson_bank meson_axg_periphs_banks[] = {
> -	/*   name    first      last      pullen  pull    dir     out     in  */
> -	BANK("Z",    GPIOZ_0,	GPIOZ_10, 3,  0,  3,  0,  9,  0,  10, 0,  11, 0),
> -	BANK("BOOT", BOOT_0,	BOOT_14,  4,  0,  4,  0,  12, 0,  13, 0,  14, 0),
> -	BANK("A",    GPIOA_0,	GPIOA_20, 0,  0,  0,  0,  0,  0,  1,  0,  2,  0),
> -	BANK("X",    GPIOX_0,	GPIOX_22, 2,  0,  2,  0,  6,  0,  7,  0,  8,  0),
> -	BANK("Y",    GPIOY_0,	GPIOY_15, 1,  0,  1,  0,  3,  0,  4,  0,  5,  0),
> +	/*   name    first                      last                    pullen  pull    dir     out     in  */
> +	BANK("Z",    PIN(GPIOZ_0, EE_OFF),	PIN(GPIOZ_10, EE_OFF), 3,  0,  3,  0,  9,  0,  10, 0,  11, 0),
> +	BANK("BOOT", PIN(BOOT_0, EE_OFF),	PIN(BOOT_14, EE_OFF),  4,  0,  4,  0,  12, 0,  13, 0,  14, 0),
> +	BANK("A",    PIN(GPIOA_0, EE_OFF),	PIN(GPIOA_20, EE_OFF), 0,  0,  0,  0,  0,  0,  1,  0,  2,  0),
> +	BANK("X",    PIN(GPIOX_0, EE_OFF),	PIN(GPIOX_22, EE_OFF), 2,  0,  2,  0,  6,  0,  7,  0,  8,  0),
> +	BANK("Y",    PIN(GPIOY_0, EE_OFF),	PIN(GPIOY_15, EE_OFF), 1,  0,  1,  0,  3,  0,  4,  0,  5,  0),
>  };
>  
>  static struct meson_bank meson_axg_aobus_banks[] = {
> -	/*   name    first      last       pullen  pull    dir     out     in  */
> -	BANK("AO",   GPIOAO_0,  GPIOAO_13, 0,  16,  0, 0,  0,  0,  0, 16,  1,  0),
> +	/*   name    first              last              pullen  pull    dir     out     in  */
> +	BANK("AO",   PIN(GPIOAO_0, 0),  PIN(GPIOAO_13, 0), 0,  16,  0, 0,  0,  0,  0, 16,  1,  0),
>  };
>  
>  static struct meson_pmx_bank meson_axg_periphs_pmx_banks[] = {
> @@ -931,11 +931,11 @@ static struct meson_axg_pmx_data meson_axg_aobus_pmx_banks_data = {
>  
>  struct meson_pinctrl_data meson_axg_periphs_pinctrl_data = {
>  	.name		= "periphs-banks",
> -	.pin_base	= 11,
> +	.pin_base	= 15,
>  	.groups		= meson_axg_periphs_groups,
>  	.funcs		= meson_axg_periphs_functions,
>  	.banks		= meson_axg_periphs_banks,
> -	.num_pins	= 100,
> +	.num_pins	= 86,
>  	.num_groups	= ARRAY_SIZE(meson_axg_periphs_groups),
>  	.num_funcs	= ARRAY_SIZE(meson_axg_periphs_functions),
>  	.num_banks	= ARRAY_SIZE(meson_axg_periphs_banks),
> -- 
> 2.19.1
>
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
