Return-Path: <SRS0=K5c1=PX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46198C43387
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Jan 2019 02:01:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11F6520651
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Jan 2019 02:01:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hVikhsKz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CBcc8EPA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11F6520651
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ye7hIfA1kIT3IHKF4LCYli7O8iJSRhry3vrHU5mtLu4=; b=hVikhsKzVuR14O
	2lF/2xTYUvJt7BSFzSQQuKijuegv/XH45yhqV7Rev+vNjE2+zy/Xefo9r4DOhr3ssP9P/nmufJYXm
	6xEikZ1MYFNylLMtSW4PekNNyykff1MZQ8NQn6BTrVYUlfh7dp9CdXYuDcPxBAlEFNHsaE/CaR3KW
	Ub4j+e7pdnKvahLuQ9h3R6BOBeon/mkckPzXGAOBm8IRSFdVGZhqf6Ev7SqKzda1E4zDJGC4kU1LN
	QleLJOTWyiy3eV2YAU8yK8qhx2gBfSZgpcYvJYz86unJTPT4NrIRL20EFL8YwfXZRIbIYUuYs6BBF
	6a6woy4QAhomMltS9gfQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjE2G-0004ia-Dz; Tue, 15 Jan 2019 02:01:00 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjE2C-0004hz-QG; Tue, 15 Jan 2019 02:00:58 +0000
Received: by mail-wr1-x442.google.com with SMTP id p4so1162745wrt.7;
 Mon, 14 Jan 2019 18:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k42zP+RS2u0jPZrl7EYU5Qyf6EOPTWKGtLyc/3qa2Kw=;
 b=CBcc8EPAkJ6RJjYP+f79TTwkTmJTjHAjedr0/cxo00sQnZJ514LKHifWAg/vP6int8
 MI49NM10Fcu7nJD2fLvQszYef08AW5h9WFHAylr37fAJedrf1EO9+jq3WKKkRFz7CGTI
 MsQlqe2R98QJNgHJkN/ZX8msBC0DFiGxCtIUYP9LgTLBMdKZKOGW17EF0vXCyNKxl54b
 hfuid8T+dqbongK5I4sWJf0pS0yRnZmyD+7JnzkDmzsQ/j5GLfmIs2MwJ5ZI4vR6bzP9
 FDvUAgNeAqRuBa8YvgXk5UU1dIpVnHh/9ANdHuJUxHNX69PkCVinJtIS/GvDSngarWEU
 JWpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k42zP+RS2u0jPZrl7EYU5Qyf6EOPTWKGtLyc/3qa2Kw=;
 b=JVWgtNk2PBVMiJyOhH8PTBPiYozucpRrilPJEWFAfTCfbNJInKXJBxawqle7ELm9Th
 bgenau32yMJFzQPXCrg9i6l34M1v/TV6jStZGjuE7BGyzd5fi6sUHSccCzKoEUrmmvfK
 73+pwEBM/f3bt5LjdJk9g8Gb8nie9vtCndSvlwxX2C/RG42fNfrQjcwVjKgJSySaARkV
 8v61t65Ljl7fSLX7mgqkfzPu7/VbTXtd2OzmK+giZzzSbTVD1D1o1y/qrKB4d6jvM4Mp
 H3+j0Pd5eSwnbQeTQ4j+kQltvd45GXns7PN9z3xJLf6ubIU8K2hq+IhXOo60Yxs6qW8O
 VJ6g==
X-Gm-Message-State: AJcUukdJkOFNelFMMpK84pws+fPCwql+yBFoQ4NvDZUSVeT+iO8APpTz
 j7HQ6HjBFFn6Wh08JklxjzUKM6/4m6IvijWKWho=
X-Google-Smtp-Source: ALg8bN6pyzU/1Mm7S2nIWzkzAAQT4RtY9BNsettFfzEgw0eoI95m6YQe8YcUCEiimgwhi5o4YBHhiS3E8RtQN6i4IWU=
X-Received: by 2002:adf:db51:: with SMTP id f17mr943045wrj.90.1547517654758;
 Mon, 14 Jan 2019 18:00:54 -0800 (PST)
MIME-Version: 1.0
References: <20190109202934.29304-1-robh@kernel.org>
In-Reply-To: <20190109202934.29304-1-robh@kernel.org>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Tue, 15 Jan 2019 10:00:18 +0800
Message-ID: <CAAfSe-vLbU8Z4nfsRc+SEdQeC=DmRqUZTBbQAOfefdL6aY=h9g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: Remove inconsistent use of 'arm,armv8'
 compatible string
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190114_180056_881783_E34456E6 
X-CRM114-Status: GOOD (  15.12  )
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
 Thierry Reding <thierry.reding@gmail.com>, Wei Xu <xuwei5@hisilicon.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Mark Rutland <mark.rutland@arm.com>, linux-renesas-soc@vger.kernel.org,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 "arm@kernel.org" <arm@kernel.org>, linux-rockchip@lists.infradead.org,
 Kevin Hilman <khilman@baylibre.com>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Magnus Damm <magnus.damm@gmail.com>, Michal Simek <michal.simek@xilinx.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-samsung-soc@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Kukjin Kim <kgene@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 Baolin Wang <baolin.wang@linaro.org>, Andy Gross <andy.gross@linaro.org>,
 Orson Zhai <orsonzhai@gmail.com>, Tsahee Zidenberg <tsahee@annapurnalabs.com>,
 DTML <devicetree@vger.kernel.org>, linux-tegra@vger.kernel.org,
 Jason Cooper <jason@lakedaemon.net>,
 Antoine Tenart <antoine.tenart@bootlin.com>, Ray Jui <rjui@broadcom.com>,
 Robert Richter <rrichter@cavium.com>, Simon Horman <horms@verge.net.au>,
 linux-mediatek@lists.infradead.org, Jayachandran C <jnair@caviumnetworks.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Will Deacon <will.deacon@arm.com>, Scott Branden <sbranden@broadcom.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Chanho Min <chanho.min@lge.com>, Duc Dang <dhdang@apm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
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

On Thu, 10 Jan 2019 at 04:29, Rob Herring <robh@kernel.org> wrote:
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
>  arch/arm64/boot/dts/hisilicon/hi3660.dtsi     |  16 +--
>  arch/arm64/boot/dts/hisilicon/hi3670.dtsi     |  16 +--
>  arch/arm64/boot/dts/hisilicon/hi6220.dtsi     |  16 +--
>  arch/arm64/boot/dts/hisilicon/hip05.dtsi      |  32 ++---
>  arch/arm64/boot/dts/hisilicon/hip06.dtsi      |  32 ++---
>  arch/arm64/boot/dts/hisilicon/hip07.dtsi      | 128 +++++++++---------
>  arch/arm64/boot/dts/lg/lg1312.dtsi            |   8 +-
>  arch/arm64/boot/dts/lg/lg1313.dtsi            |   8 +-
>  arch/arm64/boot/dts/marvell/armada-372x.dtsi  |   2 +-
>  arch/arm64/boot/dts/marvell/armada-37xx.dtsi  |   2 +-
>  .../boot/dts/marvell/armada-ap806-dual.dtsi   |   4 +-
>  .../boot/dts/marvell/armada-ap806-quad.dtsi   |   8 +-
>  .../marvell/armada-ap810-ap0-octa-core.dtsi   |  16 +--
>  arch/arm64/boot/dts/mediatek/mt7622.dtsi      |   4 +-
>  arch/arm64/boot/dts/nvidia/tegra132.dtsi      |   4 +-
>  arch/arm64/boot/dts/nvidia/tegra186.dtsi      |  12 +-
>  arch/arm64/boot/dts/nvidia/tegra194.dtsi      |  16 +--
>  arch/arm64/boot/dts/qcom/ipq8074.dtsi         |   8 +-
>  arch/arm64/boot/dts/qcom/msm8916.dtsi         |   8 +-
>  arch/arm64/boot/dts/qcom/msm8992.dtsi         |   2 +-
>  arch/arm64/boot/dts/qcom/msm8994.dtsi         |   2 +-
>  arch/arm64/boot/dts/realtek/rtd1295.dtsi      |   8 +-
>  arch/arm64/boot/dts/renesas/r8a774a1.dtsi     |  12 +-
>  arch/arm64/boot/dts/renesas/r8a7795.dtsi      |  16 +--
>  arch/arm64/boot/dts/renesas/r8a7796.dtsi      |  12 +-
>  arch/arm64/boot/dts/renesas/r8a77965.dtsi     |   4 +-
>  arch/arm64/boot/dts/renesas/r8a77970.dtsi     |   4 +-
>  arch/arm64/boot/dts/renesas/r8a77980.dtsi     |   8 +-
>  arch/arm64/boot/dts/renesas/r8a77990.dtsi     |   4 +-
>  arch/arm64/boot/dts/renesas/r8a77995.dtsi     |   2 +-
>  arch/arm64/boot/dts/rockchip/px30.dtsi        |   8 +-
>  arch/arm64/boot/dts/rockchip/rk3328.dtsi      |   8 +-
>  arch/arm64/boot/dts/rockchip/rk3368.dtsi      |  16 +--
>  arch/arm64/boot/dts/rockchip/rk3399.dtsi      |  12 +-
>  .../boot/dts/socionext/uniphier-ld11.dtsi     |   4 +-
>  .../boot/dts/socionext/uniphier-ld20.dtsi     |   8 +-
>  .../boot/dts/socionext/uniphier-pxs3.dtsi     |   8 +-
>  arch/arm64/boot/dts/sprd/sc9836.dtsi          |   8 +-
>  arch/arm64/boot/dts/sprd/sc9860.dtsi          |  16 +--

For sprd soc:
Acked-by: Chunyan Zhang <zhang.lyra@gmail.com>

Thanks,
Chunyan

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
