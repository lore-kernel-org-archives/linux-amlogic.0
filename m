Return-Path: <SRS0=r/fn=PS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 774E7C43387
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Jan 2019 02:28:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 305DB2075C
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Jan 2019 02:28:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DlkGzwQw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="oUzn7u/a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 305DB2075C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=crkwwbeIkB0+kH8oVf4RVPHdRRRmCiDZKm+jwkIm0XI=; b=DlkGzwQwz6qCYL
	CPuqQc+G6x2iFL86/ySOPLW1obr9Hx8a5QPXt9llBPsRiCB7+AHDwvGxa2XdvGV/P6GigjhALQ6QZ
	KdFQyKh8eTavONWXdNVTXfegqFagE6hc7D7BF9wHUxK/2zI0u1yzHAzFFRvdqI7acjjc9Wd5PeKLO
	wXmnKyiZ1Y362X6cpVdtxZv2kJgx/mjNetUKu8Y01zYp9Ivt1VpTtMuBMMfxWAXpaYqAKamFiz1Ht
	KmbxMx7C321TYKc+k/nXPKrlQ2n+jYfQ4dzH2XT1nQ0auTcbR50wyYkZtUuLKLqXnPP1EEL9q/P7K
	R5fM0CFZqBxTJjAKFKFA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ghQ4s-0003nc-0p; Thu, 10 Jan 2019 02:28:14 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghQ4n-0003mN-F2; Thu, 10 Jan 2019 02:28:11 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x0A2RcFQ021728;
 Wed, 9 Jan 2019 20:27:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1547087258;
 bh=ko73XwOEP4cBfgrt7k+ziRTOtAN4yy0+0SxLyhwXUZU=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=oUzn7u/auA/OYgBlzxLnx1VhGJNUyoUM6kLlIpuhJKkZ3gnmwxRxOSTMdvwIqOHmI
 1kr/J9b8HsTIPgIns7UIwUxTHDJd6oBkILXxkyhR66o572U8L1hY0RWIFv5TJffEf+
 SmNVgeQanuKoDYc/oypwwrQ/NQBgk7pEnCYxo+d8=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x0A2RbFR036543
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 9 Jan 2019 20:27:38 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10; Wed, 9
 Jan 2019 20:27:37 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend Transport;
 Wed, 9 Jan 2019 20:27:37 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x0A2RbvF003845;
 Wed, 9 Jan 2019 20:27:37 -0600
Date: Wed, 9 Jan 2019 20:27:09 -0600
From: Nishanth Menon <nm@ti.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: Remove inconsistent use of 'arm,armv8'
 compatible string
Message-ID: <20190110022709.kh5vlave65jn7m4g@kahuna>
References: <20190109202934.29304-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190109202934.29304-1-robh@kernel.org>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190109_182809_628298_22663E09 
X-CRM114-Status: GOOD (  20.04  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiko Stuebner <heiko@sntech.de>, Maxime Ripard <maxime.ripard@bootlin.com>,
 linux-arm-msm@vger.kernel.org, Liviu Dudau <liviu.dudau@arm.com>,
 David Brown <david.brown@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Wei Xu <xuwei5@hisilicon.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-renesas-soc@vger.kernel.org,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, arm@kernel.org,
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
 Antoine Tenart <antoine.tenart@bootlin.com>, Ray Jui <rjui@broadcom.com>,
 Robert Richter <rrichter@cavium.com>, Simon Horman <horms@verge.net.au>,
 linux-mediatek@lists.infradead.org, Jayachandran C <jnair@caviumnetworks.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Will Deacon <will.deacon@arm.com>,
 Scott Branden <sbranden@broadcom.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Chanho Min <chanho.min@lge.com>,
 Duc Dang <dhdang@apm.com>, linux-kernel@vger.kernel.org,
 Tero Kristo <t-kristo@ti.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Jun Nie <jun.nie@linaro.org>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 14:29-20190109, Rob Herring wrote:
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
[...]

ARM SoC maintainers, At least on a quick look (I could be wrong), I
think we don't have any explicit processor bindings documentation.

However, most of SoC folks seem to key off matches else where I
guess..

Not sure, while at this, you if you are planning on fixing up
Documentation/devicetree/bindings/arm/arm-boards:
compatible = "arm,cortex-a53","arm,armv8";
Documentation/devicetree/bindings/arm/cpu-capacity.txt:
compatible = "arm,cortex-a53","arm,armv8";

Anyways, for TI SoC:

>  arch/arm64/boot/dts/ti/k3-am654.dtsi          |   8 +-
> diff --git a/arch/arm64/boot/dts/ti/k3-am654.dtsi b/arch/arm64/boot/dts/ti/k3-am654.dtsi
> index 2affa6f6617e..b221abf43ac2 100644
> --- a/arch/arm64/boot/dts/ti/k3-am654.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am654.dtsi
> @@ -34,7 +34,7 @@
>  		};
>  
>  		cpu0: cpu@0 {
> -			compatible = "arm,cortex-a53", "arm,armv8";
> +			compatible = "arm,cortex-a53";
>  			reg = <0x000>;
>  			device_type = "cpu";
>  			enable-method = "psci";
> @@ -48,7 +48,7 @@
>  		};
>  
>  		cpu1: cpu@1 {
> -			compatible = "arm,cortex-a53", "arm,armv8";
> +			compatible = "arm,cortex-a53";
>  			reg = <0x001>;
>  			device_type = "cpu";
>  			enable-method = "psci";
> @@ -62,7 +62,7 @@
>  		};
>  
>  		cpu2: cpu@100 {
> -			compatible = "arm,cortex-a53", "arm,armv8";
> +			compatible = "arm,cortex-a53";
>  			reg = <0x100>;
>  			device_type = "cpu";
>  			enable-method = "psci";
> @@ -76,7 +76,7 @@
>  		};
>  
>  		cpu3: cpu@101 {
> -			compatible = "arm,cortex-a53", "arm,armv8";
> +			compatible = "arm,cortex-a53";
>  			reg = <0x101>;
>  			device_type = "cpu";
>  			enable-method = "psci";

Acked-by: Nishanth Menon <nm@ti.com>

-- 
Regards,
Nishanth Menon

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
