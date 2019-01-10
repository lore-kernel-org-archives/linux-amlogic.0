Return-Path: <SRS0=r/fn=PS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98565C43387
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Jan 2019 07:09:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 632BD20665
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Jan 2019 07:09:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W2qzAKgO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 632BD20665
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lge.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:
	In-Reply-To:References:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7P8nKGFykV8r25tqP3G1e5SgaLEPED4FGRWjcWNYfDc=; b=W2qzAKgOdcnVt2
	/3siXdn4zPYu5rWkY5HOnMm6oiETBhCa+gIzWYxP/4clTG1Tc/CV15vavCPzhlSVJZFWiTsM+iSRg
	krzjMjeZyAfEsp3Y07XexXskW5P3pn3v1skO00eXGzRW+KrUZCkyYoE1CIiZhJ97pE8BUbKrOuPxJ
	1x22bwXwAl8pGX55uJd5jyqnipDgFhhSntrLOlidYoOmLBSEunzhTjYTE2MvyHfLdL+21v4sDtqtr
	gy0MqICmcTIidhALAnNxyacy/YYSneVt3NJgIdqpawUJHpAHdGC8WKs2gKQiCHPS8k99J1vMFTVb9
	VXw0aUsvtBBCbBHwzWXg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ghUTR-0001uf-HV; Thu, 10 Jan 2019 07:09:53 +0000
Received: from lgeamrelo12.lge.com ([156.147.23.52] helo=lgeamrelo11.lge.com)
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghUTM-0001si-Q3
 for linux-amlogic@lists.infradead.org; Thu, 10 Jan 2019 07:09:52 +0000
Received: from unknown (HELO lgeamrelo02.lge.com) (156.147.1.126)
 by 156.147.23.52 with ESMTP; 10 Jan 2019 16:09:41 +0900
X-Original-SENDERIP: 156.147.1.126
X-Original-MAILFROM: chanho.min@lge.com
Received: from unknown (HELO WMRRD11NA101CK) (10.178.33.136)
 by 156.147.1.126 with ESMTP; 10 Jan 2019 16:09:40 +0900
X-Original-SENDERIP: 10.178.33.136
X-Original-MAILFROM: chanho.min@lge.com
From: "Chanho Min" <chanho.min@lge.com>
To: "'Rob Herring'" <robh@kernel.org>,
	<arm@kernel.org>
References: <20190109202934.29304-1-robh@kernel.org>
In-Reply-To: <20190109202934.29304-1-robh@kernel.org>
Subject: RE: [PATCH] arm64: dts: Remove inconsistent use of 'arm,
 armv8' compatible string
Date: Thu, 10 Jan 2019 16:09:39 +0900
Message-ID: <059a01d4a8b3$74b6dae0$5e2490a0$@lge.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQInnpwvZnXKcrnDm0ntb2w5Dahy7KUCKAJw
Content-Language: ko
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190109_230949_314839_FB4BB058 
X-CRM114-Status: UNSURE (   6.79  )
X-CRM114-Notice: Please train this message.
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
Cc: 'Nishanth Menon' <nm@ti.com>, 'Andrew Lunn' <andrew@lunn.ch>,
 'Heiko Stuebner' <heiko@sntech.de>,
 'Maxime Ripard' <maxime.ripard@bootlin.com>, linux-arm-msm@vger.kernel.org,
 'Liviu Dudau' <liviu.dudau@arm.com>, 'David Brown' <david.brown@linaro.org>,
 'Thierry Reding' <thierry.reding@gmail.com>, 'Wei Xu' <xuwei5@hisilicon.com>,
 'Manivannan Sadhasivam' <manivannan.sadhasivam@linaro.org>,
 'Mark Rutland' <mark.rutland@arm.com>, seungho1.park@lge.com,
 linux-renesas-soc@vger.kernel.org,
 'Lorenzo Pieralisi' <lorenzo.pieralisi@arm.com>,
 linux-rockchip@lists.infradead.org, 'Kevin Hilman' <khilman@baylibre.com>,
 'Gregory Clement' <gregory.clement@bootlin.com>,
 'Magnus Damm' <magnus.damm@gmail.com>,
 'Michal Simek' <michal.simek@xilinx.com>,
 'Krzysztof Kozlowski' <krzk@kernel.org>,
 'Jonathan Hunter' <jonathanh@nvidia.com>, linux-samsung-soc@vger.kernel.org,
 'Chen-Yu Tsai' <wens@csie.org>, 'Kukjin Kim' <kgene@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, 'Baolin Wang' <baolin.wang@linaro.org>,
 'Andy Gross' <andy.gross@linaro.org>, 'Orson Zhai' <orsonzhai@gmail.com>,
 'Tsahee Zidenberg' <tsahee@annapurnalabs.com>, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, 'Jason Cooper' <jason@lakedaemon.net>,
 'Antoine Tenart' <antoine.tenart@bootlin.com>, 'Ray Jui' <rjui@broadcom.com>,
 'Robert Richter' <rrichter@cavium.com>, 'Simon Horman' <horms@verge.net.au>,
 linux-mediatek@lists.infradead.org,
 'Jayachandran C' <jnair@caviumnetworks.com>,
 'Matthias Brugger' <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, 'Will Deacon' <will.deacon@arm.com>,
 'Scott Branden' <sbranden@broadcom.com>,
 'Masahiro Yamada' <yamada.masahiro@socionext.com>,
 'Chunyan Zhang' <zhang.lyra@gmail.com>, 'Duc Dang' <dhdang@apm.com>,
 linux-kernel@vger.kernel.org, 'Tero Kristo' <t-kristo@ti.com>,
 'Dinh Nguyen' <dinguyen@kernel.org>,
 'Jisheng Zhang' <Jisheng.Zhang@synaptics.com>,
 'Sudeep Holla' <sudeep.holla@arm.com>, 'Jun Nie' <jun.nie@linaro.org>,
 'Sebastian Hesselbarth' <sebastian.hesselbarth@gmail.com>,
 'Shawn Guo' <shawnguo@kernel.org>,
 =?utf-8?Q?'Andreas_F=C3=A4rber'?= <afaerber@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

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
>  arch/arm64/boot/dts/lg/lg1312.dtsi            |   8 +-
>  arch/arm64/boot/dts/lg/lg1313.dtsi            |   8 +-

For lg soc,

Acked-by: Chanho Min <chanho.min@lge.com>

Chanho,


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
