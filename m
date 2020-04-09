Return-Path: <SRS0=UAFA=5Z=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B52E3C2BA2B
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Apr 2020 12:15:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FE3720A8B
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Apr 2020 12:15:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Tn+t+bIL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7FE3720A8B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dDr5RQbTaxD4mpe11y8g936tzqJeDBEgbnc35CN4V8w=; b=Tn+t+bILXf8j5o
	Des82CvsuaZo+ihMwEHqK3kb7cvfw4Zl0/W005JSk7D/UTf5G6v9RZvanlfRi4MlMoAGxf5olUYEf
	HiFj7qL8aJ/4/bml4YqWVapLi65SV4aUN0aHznuPx1UeIqhT7GbTys8EAvrS/LrNR22yqXgTtzsAS
	qtM6+pjbZ9UB4kLbw+WJd6MlU61HL95yvNSlBRKRC69p/T0p3v1sC7nxnNUZu4mwvNUBCaXWRIaQi
	GLDGtnJJHN64iXZ8O1qUon2BilXFvIyWwJCvu3sLj1GnPDYTE62xJ6sCWTy/O7ykXeNbEY0ZdIi+O
	BGn2vsxT5yw6XOylRuIg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jMW5L-0006gu-L4; Thu, 09 Apr 2020 12:15:07 +0000
Received: from mail-ed1-f66.google.com ([209.85.208.66])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jMW5H-0005a4-4U; Thu, 09 Apr 2020 12:15:06 +0000
Received: by mail-ed1-f66.google.com with SMTP id cb27so1665333edb.11;
 Thu, 09 Apr 2020 05:15:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=gYvBs+A4oEEcIMW3rEpNzM655tFmA/5YHjSipVpMudE=;
 b=TsBCDTltWMIh3xwMZPemqsSFadcR5uCJ3d6qXX0VuhkRatxfUM6f9Ka86VsNoL07BX
 PFsqjLmNlOAjXVERv74nvup8pUX51L29QZSLc9Nqo4kt7v09VewTD54H2g8CSK76pIP4
 HrPFKfh1VqBNiyunzlACneGLn/e4jp90+6dZoPlgan02sfRMTb97DqcUtUQagdFP3247
 46kC5XnggUYg5eQ2TzUdclhp4pT1x45Izn0M8fQgh3qG+TbC5IvE5+EwEjZlzb5i9UMI
 m3NgXlhxB6ty+DJo65olL5ibcmmdqpZjyp/4wVqa4/uDI6+3XoIMUYnNxsMo3Rh5VcNy
 PAmQ==
X-Gm-Message-State: AGi0PuYtZN6UmMCFzHK9MvWvGVIuIZkESRItzm9tG+Xqnwx4dEaxOkPa
 sZbMyzCR4Ofn0jqLHZR25wA=
X-Google-Smtp-Source: APiQypJUJiiLoo3HAf51vgJTKYVBHwPZEVH7hjM1r+1VFWyM0ypQpU23tWpSatmkBm3yArwlL/zmtg==
X-Received: by 2002:a17:906:66c1:: with SMTP id
 k1mr11490807ejp.208.1586434500891; 
 Thu, 09 Apr 2020 05:15:00 -0700 (PDT)
Received: from kozik-lap ([194.230.155.125])
 by smtp.googlemail.com with ESMTPSA id m1sm532752ejr.81.2020.04.09.05.14.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 09 Apr 2020 05:14:59 -0700 (PDT)
Date: Thu, 9 Apr 2020 14:14:56 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
Subject: Re: [RFC PATCH v2 6/6] arm: dts: pwm: replace flag 0 with PWM_NOFLAGS
Message-ID: <20200409121456.GB802@kozik-lap>
References: <20200405192246.3741784-1-oleksandr.suvorov@toradex.com>
 <20200405192246.3741784-7-oleksandr.suvorov@toradex.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200405192246.3741784-7-oleksandr.suvorov@toradex.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200409_051503_228463_B36A094A 
X-CRM114-Status: GOOD (  15.74  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Heiko Stuebner <heiko@sntech.de>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>, Sekhar Nori <nsekhar@ti.com>,
 Stefan Agner <stefan@agner.ch>, linux-kernel@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Fabio Estevam <festevam@gmail.com>, linux-samsung-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Kukjin Kim <kgene@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 devicetree@vger.kernel.org, David Lechner <david@lechnology.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Maxime Ripard <mripard@kernel.org>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Paul Barker <pbarker@konsulko.com>, Rob Herring <robh+dt@kernel.org>,
 Tony Lindgren <tony@atomide.com>, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, Igor Opaniuk <igor.opaniuk@toradex.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-renesas-soc@vger.kernel.org,
 Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
 =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
 Shawn Guo <shawnguo@kernel.org>, Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sun, Apr 05, 2020 at 10:22:46PM +0300, Oleksandr Suvorov wrote:
> The raw value '0' in the 3rd cell of the "pwms" property means there are
> no flags to be set.
> 
> This patch converts '0' value into PWM_NOFLAGS.
> 
> Signed-off-by: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
> ---
> 
> Changes in v2:
> - remove the driver part of patchset as dangerous and senseless.
> - use PWM_NOFLAGS instead of PWM_POLARITY_NORMAL to avoid possible
>   conflict with enum pwm_polarity in <linux/pwm.h>. Also, this name
>   reflects the sense of this value more precisely.
> 
>  arch/arm/boot/dts/am335x-cm-t335.dts               | 2 +-
>  arch/arm/boot/dts/am335x-evm.dts                   | 2 +-
>  arch/arm/boot/dts/am3517-evm.dts                   | 2 +-
>  arch/arm/boot/dts/at91-dvk_su60_somc_lcm.dtsi      | 2 +-
>  arch/arm/boot/dts/at91-kizbox2-common.dtsi         | 6 +++---
>  arch/arm/boot/dts/at91-kizbox3_common.dtsi         | 8 ++++----
>  arch/arm/boot/dts/at91-kizboxmini-common.dtsi      | 6 +++---
>  arch/arm/boot/dts/at91-nattis-2-natte-2.dts        | 2 +-
>  arch/arm/boot/dts/at91-sama5d4_ma5d4evk.dts        | 2 +-
>  arch/arm/boot/dts/at91sam9n12ek.dts                | 2 +-
>  arch/arm/boot/dts/at91sam9x5dm.dtsi                | 2 +-
>  arch/arm/boot/dts/berlin2cd-google-chromecast.dts  | 4 ++--
>  arch/arm/boot/dts/da850-evm.dts                    | 2 +-
>  arch/arm/boot/dts/da850-lego-ev3.dts               | 4 ++--
>  arch/arm/boot/dts/exynos4412-midas.dtsi            | 2 +-
>  arch/arm/boot/dts/exynos4412-odroidu3.dts          | 2 +-
>  arch/arm/boot/dts/exynos5250-snow-common.dtsi      | 2 +-
>  arch/arm/boot/dts/exynos5410-odroidxu.dts          | 2 +-
>  arch/arm/boot/dts/exynos5420-peach-pit.dts         | 2 +-
>  arch/arm/boot/dts/exynos5422-odroidhc1.dts         | 2 +-
>  arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi | 2 +-
>  arch/arm/boot/dts/exynos5422-odroidxu4.dts         | 2 +-
>  arch/arm/boot/dts/exynos54xx-odroidxu-leds.dtsi    | 4 ++--
>  arch/arm/boot/dts/exynos5800-peach-pi.dts          | 2 +-
>  arch/arm/boot/dts/imx53-tx53-x13x.dts              | 5 +++--
>  arch/arm/boot/dts/imx6dl-tx6dl-comtft.dts          | 2 +-
>  arch/arm/boot/dts/imx6q-display5.dtsi              | 2 +-
>  arch/arm/boot/dts/imx6q-tx6q-1010-comtft.dts       | 2 +-
>  arch/arm/boot/dts/imx6q-tx6q-1020-comtft.dts       | 2 +-
>  arch/arm/boot/dts/imx6qdl-tx6-lvds.dtsi            | 4 ++--
>  arch/arm/boot/dts/imx7-colibri.dtsi                | 4 +++-
>  arch/arm/boot/dts/imx7d-nitrogen7.dts              | 3 ++-
>  arch/arm/boot/dts/imx7d-pico.dtsi                  | 3 ++-
>  arch/arm/boot/dts/imx7d-sdb.dts                    | 3 ++-
>  arch/arm/boot/dts/imx7ulp-evk.dts                  | 3 ++-
>  arch/arm/boot/dts/iwg20d-q7-common.dtsi            | 2 +-
>  arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi   | 2 +-
>  arch/arm/boot/dts/meson8b-ec100.dts                | 4 ++--
>  arch/arm/boot/dts/meson8b-mxq.dts                  | 4 ++--
>  arch/arm/boot/dts/meson8b-odroidc1.dts             | 4 ++--
>  arch/arm/boot/dts/motorola-mapphone-common.dtsi    | 3 ++-
>  arch/arm/boot/dts/omap3-gta04.dtsi                 | 2 +-
>  arch/arm/boot/dts/omap3-n900.dts                   | 2 +-
>  arch/arm/boot/dts/rk3288-veyron-edp.dtsi           | 2 +-
>  arch/arm/boot/dts/rk3288-veyron.dtsi               | 2 +-
>  arch/arm/boot/dts/rv1108-evb.dts                   | 2 +-
>  arch/arm/boot/dts/s3c6410-mini6410.dts             | 2 +-
>  arch/arm/boot/dts/s5pv210-aries.dtsi               | 2 +-
>  arch/arm/boot/dts/s5pv210-smdkv210.dts             | 2 +-


I understand you are going to push it through arm-soc, so:
For Exynos/S3C/S5P:
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Otherwise if you expect individual maintainers to pick it up, please
split per architecture.

Best regards,
Krzysztof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
