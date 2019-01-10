Return-Path: <SRS0=r/fn=PS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9780DC43387
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Jan 2019 07:48:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 603B720685
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Jan 2019 07:48:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LGnNgCL4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="NPixrvzA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 603B720685
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/QLuwvwMXfbiwX0tuqG/3Jnoy3kCG+90C296TWm2c20=; b=LGnNgCL4kDBV4s
	rTAbvpDvoHYFFq1H+6Emv5erB30yC3O3YsWVQ/fuobk5HG+NHFhQUJSqGMuJnKU7nXG0CkE9pXQNH
	oa2Z1OKh0NqKy5dKdOxJVDEacAzBrCb80sJWVcCkxvrOBWcfpTJ4wTXcxgK6++WGla5aCkZx6A1xa
	yzaYZtdOWbuAzEmJeofpCZi/ktYBjnynVd4zfNmzTgHmtleB8lpmFmjiQpxpcZZfojj6E4kthmJYh
	/fLcNSjUJTYreIoG0GQTxRe7liYAlD9nYz/5b6XX0oOXckObvRBa8IZbECotOk3adjWr68NNnLPBP
	5DYsciHz9HJawxdbtIBQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ghV56-0001KW-1E; Thu, 10 Jan 2019 07:48:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghV53-0001K3-Ub; Thu, 10 Jan 2019 07:48:47 +0000
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F0C09217F9;
 Thu, 10 Jan 2019 07:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1547106525;
 bh=J2fVqTqV1nxHdqL7i6VPQEH6ojTFabssQEUnF+x1hzo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=NPixrvzAgMYb403ZNyzI+hMyHc7+FCk2Z9jPoR2WYXLury72I28cOgrd9hyjDoJS3
 sXqiP4rBzjGHtFHNAk3W9aEr8gRddvqOsIwe323SdmscpX3kFvWioq0GxRvLMA/hC6
 LnjHW7jElK4aSO4pLFf3mcqH/hPGNVbJzWRsEgcU=
Received: by mail-lj1-f175.google.com with SMTP id q2-v6so8777378lji.10;
 Wed, 09 Jan 2019 23:48:44 -0800 (PST)
X-Gm-Message-State: AJcUukddX0jyp9OMnvsbbTdgdBpFrgUrgBniFsSlViFatcR6ZnmHDzHt
 UVb+CVGLOrBgTpXuCz/+xdMup2lnVLjt5xQJyKY=
X-Google-Smtp-Source: ALg8bN6IXL7hPdtq6qv1ra299Jk8Bfq7tL00eysp2cSmCW1EI8wpX1Dm8g+vLeKRTLciT6t1uyRZiNZapCu21qgTm+c=
X-Received: by 2002:a2e:5d12:: with SMTP id
 r18-v6mr5859292ljb.89.1547106520765; 
 Wed, 09 Jan 2019 23:48:40 -0800 (PST)
MIME-Version: 1.0
References: <20190109202934.29304-1-robh@kernel.org>
In-Reply-To: <20190109202934.29304-1-robh@kernel.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Thu, 10 Jan 2019 08:48:29 +0100
X-Gmail-Original-Message-ID: <CAJKOXPdWJH8OiF4T9n6cNj5Af5OuTq9zi9n=+Ldztt1TDeoMxA@mail.gmail.com>
Message-ID: <CAJKOXPdWJH8OiF4T9n6cNj5Af5OuTq9zi9n=+Ldztt1TDeoMxA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: Remove inconsistent use of 'arm,armv8'
 compatible string
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190109_234846_023985_CFBA4163 
X-CRM114-Status: GOOD (  16.62  )
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
Cc: Nishanth Menon <nm@ti.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiko Stuebner <heiko@sntech.de>, Maxime Ripard <maxime.ripard@bootlin.com>,
 linux-arm-msm@vger.kernel.org, Liviu Dudau <liviu.dudau@arm.com>,
 David Brown <david.brown@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Will Deacon <will.deacon@arm.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Mark Rutland <mark.rutland@arm.com>, linux-renesas-soc@vger.kernel.org,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, arm@kernel.org,
 linux-rockchip@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Magnus Damm <magnus.damm@gmail.com>, Michal Simek <michal.simek@xilinx.com>,
 Wei Xu <xuwei5@hisilicon.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, Baolin Wang <baolin.wang@linaro.org>,
 Andy Gross <andy.gross@linaro.org>, Orson Zhai <orsonzhai@gmail.com>,
 Tsahee Zidenberg <tsahee@annapurnalabs.com>, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>,
 Antoine Tenart <antoine.tenart@bootlin.com>, Ray Jui <rjui@broadcom.com>,
 Robert Richter <rrichter@cavium.com>, Simon Horman <horms@verge.net.au>,
 linux-mediatek@lists.infradead.org, Jayachandran C <jnair@caviumnetworks.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Scott Branden <sbranden@broadcom.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Chanho Min <chanho.min@lge.com>,
 Duc Dang <dhdang@apm.com>, linux-kernel@vger.kernel.org,
 Tero Kristo <t-kristo@ti.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Jun Nie <jun.nie@linaro.org>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, 9 Jan 2019 at 21:29, Rob Herring <robh@kernel.org> wrote:
>
> The 'arm,armv8' compatible string is only for software models. It adds
> little value otherwise and is inconsistently used as a fallback on some
> platforms. Remove it from those platforms.
>
> This fixes warnings generated by the DT schema.
>
> Reported-by: Michal Simek <michal.simek@xilinx.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Will Deacon <will.deacon@arm.com>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> armsoc folks, Please apply directly.
>
> Note that there's still a case left in msm8998 that needs a new
> compatible string.
>
> Rob
>
>  arch/arm64/boot/dts/actions/s700.dtsi         |   8 +-
>  arch/arm64/boot/dts/actions/s900.dtsi         |   8 +-
>  arch/arm64/boot/dts/al/alpine-v2.dtsi         |   8 +-
>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi |   8 +-
>  arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi  |   8 +-
>  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  |   8 +-
>  .../boot/dts/altera/socfpga_stratix10.dtsi    |   8 +-
>  arch/arm64/boot/dts/amlogic/meson-axg.dtsi    |   8 +-
>  arch/arm64/boot/dts/amlogic/meson-g12a.dtsi   |   8 +-
>  arch/arm64/boot/dts/amlogic/meson-gx.dtsi     |   8 +-
>  arch/arm64/boot/dts/amlogic/meson-gxm.dtsi    |   8 +-
>  arch/arm64/boot/dts/apm/apm-shadowcat.dtsi    |  16 +--
>  arch/arm64/boot/dts/apm/apm-storm.dtsi        |  16 +--
>  arch/arm64/boot/dts/arm/juno-r1.dts           |  12 +-
>  arch/arm64/boot/dts/arm/juno-r2.dts           |  12 +-
>  arch/arm64/boot/dts/arm/juno.dts              |  12 +-
>  .../boot/dts/arm/vexpress-v2f-1xv7-ca53x2.dts |   4 +-
>  .../boot/dts/broadcom/northstar2/ns2.dtsi     |   8 +-
>  .../boot/dts/broadcom/stingray/stingray.dtsi  |  16 +--
>  arch/arm64/boot/dts/cavium/thunder-88xx.dtsi  |  96 ++++++-------
>  arch/arm64/boot/dts/cavium/thunder2-99xx.dtsi |   8 +-
>  arch/arm64/boot/dts/exynos/exynos5433.dtsi    |  16 +--
>  arch/arm64/boot/dts/exynos/exynos7.dtsi       |   8 +-

For Exynos:
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
