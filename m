Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A04C433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Feb 2022 10:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hHBZkmDCRR/yR0eKRHRpPAgxYarVvZ0GyiRVtvgJC+I=; b=fDMzcoHyzhQvrI3k/00QWTjw5U
	183r76m350e/3ciDfb5f5vdIsflACNHC/LwjeHQeYH0qAqAExXPFLcNx+uSDTUidaiNqreuPw0VUO
	kabXCpdadH3NCi7DbTs7wgj1+Saqzsb6nXeL4RIhbDWZyQNE0EnTDZtNRGaHj+1Ff6QoEuT7pQwz4
	yPPZeKvY/IEtrjuKlKK7i2fgX42vgOfQ+pkp8sZuwBggaLeGhG5WNBALIfWFM5AST9J4Sf8JpN2Pj
	XZZeusk31iyy51Dds2hGejadXhRcHixiVIIjfJ/KVXVFpeJwLF7Slq9r+I6wVmBBILRX4h1sG0VoH
	rNkK9ZtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nI6o4-003T9T-Fw; Thu, 10 Feb 2022 10:36:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nI6o2-003T8j-2T; Thu, 10 Feb 2022 10:36:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5996161BAC;
 Thu, 10 Feb 2022 10:36:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAFB5C004E1;
 Thu, 10 Feb 2022 10:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644489364;
 bh=v+o/pVXW0jbA4rH4iLmFawzXy6jeZG+7qU8hQVcABk8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fGr/GgaTlNVwq40OWT7jAcnPQ9ivu7mq7xKwRyJeV2t5pJ7AZxBo//9/moMfUE0wY
 2WBL59Hl2t7Ir7+2kzzVisVdKM7cpxq9zNyoXyju/nYuyeo/O+9qlArpcIrU83AbJx
 WDYCT2sla5PdhRZUE3s7VW5ZSiDHor2/iDX/9H+atkM4tH0TCj1PcDBaxG4XKxA7J6
 kLdBymLKKp+hmY5lX0+qoYcCBJJxcPTTUDlo7dhXR9NLuwGkcqAtk3TnU4tRwkse7H
 XpGakSB0bl3G5A2lq7b2KB3/N7b1TOzBFYjOvUgH7KL21orcj5/ifxYmPL85NHoj6T
 VM14GuJQ6NI4g==
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <maz@kernel.org>)
 id 1nI6ny-006sNS-OR; Thu, 10 Feb 2022 10:36:02 +0000
MIME-Version: 1.0
Date: Thu, 10 Feb 2022 10:36:02 +0000
From: Marc Zyngier <maz@kernel.org>
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: meson: remove CPU opps below 1GHz for
 SM1 boards
In-Reply-To: <20220210100638.19130-3-christianshewitt@gmail.com>
References: <20220210100638.19130-1-christianshewitt@gmail.com>
 <20220210100638.19130-3-christianshewitt@gmail.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <8211344a481dd40f260106bdd3f03bfb@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: christianshewitt@gmail.com, robh+dt@kernel.org,
 mark.rutland@arm.com, khilman@baylibre.com, narmstrong@baylibre.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220210_023606_226554_71D13B7E 
X-CRM114-Status: GOOD (  18.78  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 2022-02-10 10:06, Christian Hewitt wrote:
> Amlogic SM1 devices experience CPU stalls and random board wedges when
> the system idles and CPU cores clock down to lower opp points. Recent
> vendor kernels include a change to remove 100-250MHz and other distro
> sources also remove the 500/667MHz points. Unless all 100-667Mhz opps
> are removed or the CPU governor forced to performance stalls are still
> observed, so let's remove them to improve stability and uptime.
> 
> Fixes: 3d9e76483049 ("arm64: dts: meson-sm1-sei610: enable DVFS")
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-sm1.dtsi | 20 --------------------
>  1 file changed, 20 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
> b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
> index 3c07a89bfd27..80737731af3f 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
> @@ -95,26 +95,6 @@
>  		compatible = "operating-points-v2";
>  		opp-shared;
> 
> -		opp-100000000 {
> -			opp-hz = /bits/ 64 <100000000>;
> -			opp-microvolt = <730000>;
> -		};
> -
> -		opp-250000000 {
> -			opp-hz = /bits/ 64 <250000000>;
> -			opp-microvolt = <730000>;
> -		};
> -
> -		opp-500000000 {
> -			opp-hz = /bits/ 64 <500000000>;
> -			opp-microvolt = <730000>;
> -		};
> -
> -		opp-667000000 {
> -			opp-hz = /bits/ 64 <666666666>;
> -			opp-microvolt = <750000>;
> -		};
> -
>  		opp-1000000000 {
>  			opp-hz = /bits/ 64 <1000000000>;
>  			opp-microvolt = <770000>;

That's not nearly enough. If that's an actual issue, the driver
should be updated not to use these OPPs, and you can't assume
that people will just update their DT (mine comes from u-boot,
and it is unlikely I will update it anytime soon).

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
