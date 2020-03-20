Return-Path: <SRS0=3jpy=5F=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47E3DC4332B
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Mar 2020 10:03:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16AE120739
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Mar 2020 10:03:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hGtUKpWR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16AE120739
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B3PVqtQjakWpjDsifIQPai0B6/c8ow9avll0WNeF7Aw=; b=hGtUKpWRQ1ymfl
	viUZRL7cP7iuDw96VFFje833J7nLuyYe6tSm8ArG2Vb1X09gBjmPTPJ84TLq+sufCYi3xXFZeXsSy
	aGIMYELTD7+x41+mCDTgt2jIlD9EjLEGKR5Oa/4HLmCvnGPFvv/pUIlZe8ouX5Icrv5kEPg78Jrps
	FpFO9uVVj0yyUNdjXuhmMV31oc1GD/jrsywo3ILep1P+S87Xal33tfk9KbVU3nL+9aqihDo50iNTy
	Z5KGSZx6wzhaJoJM5INuyspLZHtGmkEDdSsgK2ECoR/pUYDWyo7pFOEdlOxL7bo3mfHYBPeihrsQK
	tLyyUu0g2HlK7ADZDmlw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jFEV7-0005fz-Hf; Fri, 20 Mar 2020 10:03:37 +0000
Received: from mail-ed1-f65.google.com ([209.85.208.65])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jFEV5-0005fP-9j; Fri, 20 Mar 2020 10:03:36 +0000
Received: by mail-ed1-f65.google.com with SMTP id i24so6485868eds.1;
 Fri, 20 Mar 2020 03:03:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tSuC6rirFkPp7o5onqQW1YOkCb60MvR5bv8PP1Z/cQg=;
 b=tYbmb2sg4YxZ9RDO2tmatImQVmQQQXaFErfaTrb19TyiC6bt92Jbz56PV3/0mCusN1
 4/v09VZuL6WzBLbZanAu0ewfKFkEFVQnNhp8xks76eu/4RHgjxX/hWQlIF/xNPVtP+4q
 QJivYup1hsQegru3IMeyqQeIEErOo1YK43KaR09XjlNvscHKiLb+5x1b3Hw9SfAq+1M3
 /XKROIQ7cYkUZosBfi/kprgNkJnwLE0JjPgQxhL6FNeUcJ83rWTvqQcubX7PVN41G7vZ
 SBsl/hKifZv3vD3NrPmi+3s+tyjDUjhAeiEy/vHQUZnAmT5jvATHPwxrskIbPBfF+pQD
 2mdA==
X-Gm-Message-State: ANhLgQ3Ax6PIL9UTlLwNy531uDJeVxPK6IjzAlr6lz56sZ7V4z5TnsPu
 PoBGHYu4g2VG+f39RSjYP4c=
X-Google-Smtp-Source: ADFU+vugt2YyfL8cQT7+vpLHG9am8cCqBSB7XauUNUkR7U3UGvGj4jp51sCnSueZSIT/VpkoqnmJXA==
X-Received: by 2002:aa7:c658:: with SMTP id z24mr6922331edr.298.1584698613669; 
 Fri, 20 Mar 2020 03:03:33 -0700 (PDT)
Received: from pi3 ([194.230.155.125])
 by smtp.googlemail.com with ESMTPSA id y14sm330361ejc.85.2020.03.20.03.03.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2020 03:03:32 -0700 (PDT)
Date: Fri, 20 Mar 2020 11:03:29 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
Subject: Re: [RFC PATCH 6/7] arm64: dts: pwm: replace polarity constant with
 macro
Message-ID: <20200320100329.GB16931@pi3>
References: <20200317123231.2843297-1-oleksandr.suvorov@toradex.com>
 <20200317123231.2843297-7-oleksandr.suvorov@toradex.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200317123231.2843297-7-oleksandr.suvorov@toradex.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200320_030335_341053_5053F1AE 
X-CRM114-Status: GOOD (  13.03  )
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
Cc: Heiko Stuebner <heiko@sntech.de>, linux-pwm@vger.kernel.org,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Kever Yang <kever.yang@rock-chips.com>, Soeren Moch <smoch@web.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Philipp Tomsich <philipp.tomsich@theobroma-systems.com>,
 Hugh Cole-Baker <sigmaris@gmail.com>, linux-samsung-soc@vger.kernel.org,
 Katsuhiro Suzuki <katsuhiro@katsuster.net>,
 Kevin Hilman <khilman@baylibre.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Markus Reichl <m.reichl@fivetechno.de>, linux-rockchip@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 devicetree@vger.kernel.org, Nick Xie <nick@khadas.com>,
 Maxime Ripard <mripard@kernel.org>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Paul Barker <pbarker@konsulko.com>, Rob Herring <robh+dt@kernel.org>,
 linux-amlogic@lists.infradead.org, Johan Jonker <jbx6244@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Andrius =?utf-8?B?xaB0aWtvbmFz?= <andrius@stikonas.eu>,
 Igor Opaniuk <igor.opaniuk@toradex.com>, linux-kernel@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Andy Yan <andy.yan@rock-chips.com>, Robin Murphy <robin.murphy@arm.com>,
 Christoph Muellner <christoph.muellner@theobroma-systems.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, Mar 17, 2020 at 02:32:30PM +0200, Oleksandr Suvorov wrote:
> There is the PWM_POLARITY_NORMAL defined and describled in
> <dt-bindings/pwm/pwm.h> and used by pwm drivers.
> 
> This patch converts all '0' constant in pwms parameters into
> PWM_POLARITY_NORMAL.
> 
> Replace with sed regexp:
> 's/(pwms = <&[a-zA-Z_0-9]+ [0-9]+ [0-9]+) 0>/\1 PWM_POLARITY_NORMAL>/'
> 
> Then:
> - include pwm.h in some dts/dtsi to fix building errors about undefined
>   symbols.
> - fix the patman warnings about the code format;
> 
> Signed-off-by: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
> ---
> 
>  arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts      | 2 +-
>  arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts       | 2 +-
>  arch/arm64/boot/dts/amlogic/meson-axg-s400.dts             | 3 ++-
>  arch/arm64/boot/dts/amlogic/meson-axg.dtsi                 | 1 +
>  arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi          | 1 +
>  arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts          | 5 +++--
>  arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts            | 2 +-
>  arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts         | 5 +++--
>  arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi    | 4 ++--
>  arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts       | 4 ++--
>  arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts       | 7 ++++---
>  arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi        | 3 ++-
>  arch/arm64/boot/dts/amlogic/meson-gx.dtsi                  | 1 +
>  arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts       | 3 ++-
>  arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts     | 3 ++-
>  arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi           | 3 ++-
>  arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi       | 3 ++-
>  arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi          | 3 ++-
>  arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts       | 3 ++-
>  .../boot/dts/amlogic/meson-gxl-s905x-hwacom-amazetv.dts    | 3 ++-
>  arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts | 2 +-
>  .../arm64/boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dts | 3 ++-
>  arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi      | 3 ++-
>  arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts      | 5 +++--
>  arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts         | 3 ++-
>  arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi         | 4 +++-
>  arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts     | 2 +-
>  arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts           | 7 ++++---
>  arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi      | 3 ++-

For Exynos:
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
