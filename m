Return-Path: <SRS0=DVbv=PT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 445BBC43387
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Jan 2019 15:33:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1679120836
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Jan 2019 15:33:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CjZWnKAX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1679120836
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hisilicon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4MfmbnP7RNsJ5QnSseFyn7u2r9gjiZf1zv6R07ucbug=; b=CjZWnKAXisaz4S
	qRppIRhcg654rmNUfmWnmV6IYGAT80Bf/QlRhmQ5zGlmlDzgOXiM7RWCN17pcpz189QoJEkQQswBS
	cgdQNZDZwJwCbPrNL0YWE3dhFDDMpKkWN7a6B4ew+bPkYTlHiqJ8N6G+SkqFQUzkQIGz0LLm/reFm
	vmFO1YLlN3TW4QyYU1CJj1GresQlXRPfOUpvHCHkkMvwHacku+LyAjvK0tnMFGCQ1Xx39Q80ukaVA
	tuS+/OIqohIIQOZ7bDI+lSsYdXWTC347qXNKzMrxN/k1n+O66kTHALiq/myxUWGsUaD75guI14cTJ
	lfls0UX4N2oU/HStMocQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ghynu-0002d0-DL; Fri, 11 Jan 2019 15:33:02 +0000
Received: from lhrrgout.huawei.com ([185.176.76.210] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghynk-0002O2-24; Fri, 11 Jan 2019 15:32:58 +0000
Received: from LHREML713-CAH.china.huawei.com (unknown [172.18.7.107])
 by Forcepoint Email with ESMTP id 13C39125A3909D61D286;
 Fri, 11 Jan 2019 15:32:45 +0000 (GMT)
Received: from [127.0.0.1] (10.202.226.42) by LHREML713-CAH.china.huawei.com
 (10.201.108.36) with Microsoft SMTP Server id 14.3.408.0; Fri, 11 Jan 2019
 15:32:41 +0000
Subject: Re: [PATCH] arm64: dts: Remove inconsistent use of 'arm,armv8'
 compatible string
To: Rob Herring <robh@kernel.org>, <arm@kernel.org>
References: <20190109202934.29304-1-robh@kernel.org>
From: Wei Xu <xuwei5@hisilicon.com>
Message-ID: <5C38B715.8030008@hisilicon.com>
Date: Fri, 11 Jan 2019 15:32:37 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:38.0) Gecko/20100101
 Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <20190109202934.29304-1-robh@kernel.org>
X-Originating-IP: [10.202.226.42]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190111_073252_533648_1FAEE6B9 
X-CRM114-Status: GOOD (  12.99  )
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
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 linux-rockchip@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Magnus Damm <magnus.damm@gmail.com>, Michal Simek <michal.simek@xilinx.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-samsung-soc@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Kukjin Kim <kgene@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 Baolin Wang <baolin.wang@linaro.org>, Andy Gross <andy.gross@linaro.org>,
 Orson Zhai <orsonzhai@gmail.com>, Tsahee Zidenberg <tsahee@annapurnalabs.com>,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 Jason Cooper <jason@lakedaemon.net>,
 Antoine Tenart <antoine.tenart@bootlin.com>, Ray
 Jui <rjui@broadcom.com>, Robert Richter <rrichter@cavium.com>,
 Simon Horman <horms@verge.net.au>, linux-mediatek@lists.infradead.org,
 Jayachandran C <jnair@caviumnetworks.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Scott Branden <sbranden@broadcom.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Chanho Min <chanho.min@lge.com>,
 Duc Dang <dhdang@apm.com>, linux-kernel@vger.kernel.org,
 Tero Kristo <t-kristo@ti.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Jun Nie <jun.nie@linaro.org>, Sebastian
 Hesselbarth <sebastian.hesselbarth@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Rob,

On 2019/1/9 20:29, Rob Herring wrote:
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

For hisilicon,

Acked-by: Wei Xu <xuwei5@hisilicon.com>

Thanks!

Best Regards,
Wei


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
