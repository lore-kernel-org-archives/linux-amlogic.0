Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B709C77B73
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Apr 2023 13:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=80wFwKDRWMME4AkWbvbb3SWSTEa88TYFsTM+U48qog0=; b=1IfsM2v8suB1el
	l5cv2t7Fj6gyEemv9uLYSt0Sifi3IKwcfWph4QnMM9JqQYuUv1G2ZtdrDOS0SNHaHNCXDPzs0TCzA
	bTn4rYjAHL7Y82lC2bnYAw8QS1kkwymgWOyaHSdjBP2qT0PK8YQGFcwUpSb6KPT2l8raiVyt43pyj
	9CTyzmaQv2GdgA+eepX1Ur7HAUHhQdRz4HWJEO9JSqaaeZ15KRhe0+2vHHskmoBKOO82w2Fge0Pxn
	jxDZamxXJT0PSSGP4HtQlhrA+5ByoiS6EIUPab2FJ/V6tx9jvNO+ZcnAqwPnQ4ynsoi/JVxStwMZo
	8DWS/Wfa6WB76x8Y+Glw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp7df-005Ufq-2r;
	Wed, 19 Apr 2023 13:14:23 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp7db-005Uf4-1h;
	Wed, 19 Apr 2023 13:14:21 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 43A745FD04;
	Wed, 19 Apr 2023 16:14:17 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1681910057;
	bh=bZtyAsLkB2jeh9skRuWUvaXRtmeFq3JKcKGoxbvsU7Y=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=oGkpHcUxBwp4MIgweRK2GZMqWGevOFOXJdE4voWUZD4KvqcXwuA0Hj13FU9zhGe0n
	 kqwUJqLv7rzrWeXdN72CFx4MI+/mY0D1cujDVW4rkR15BpVWIe97k0hW6NxPzH6lCN
	 gas64HTcuG2ucyi3ysKZTIa3qYX/icleE3U0s2qy5lZNx/+71FFlOQ9ZxRUsKqRP+f
	 k8SPGwZcXzD4lhUulTpnyYJnCnxHaHq0xYEfeUJbgW8+tm5odba7yxJhZ3WMa+maIX
	 CpH5IrvyhwCnsTRKwX2cvaEgewSVJkaB1fx1oEVfRo8UBkW6cIGD5GeKd0ebklKd7e
	 l7DPvdmLwlPjA==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Wed, 19 Apr 2023 16:14:17 +0300 (MSK)
Date: Wed, 19 Apr 2023 16:14:16 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: =Xianwei Zhao <xianwei.zhao@amlogic.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-amlogic@lists.infradead.org>, <devicetree@vger.kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [RFC PATCH 1/2] arm64: amlogic: add new ARCH_AMLIPC for IPC SoC
Message-ID: <20230419131416.cns3xvkbzjeyrnux@CAB-WSD-L081021>
References: <20230419073834.972273-1-xianwei.zhao@amlogic.com>
 <20230419073834.972273-2-xianwei.zhao@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230419073834.972273-2-xianwei.zhao@amlogic.com>
User-Agent: NeoMutt/20220415
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/04/19 10:42:00 #21127526
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_061419_905782_2CB89F7C 
X-CRM114-Status: GOOD (  22.62  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Apr 19, 2023 at 03:38:33PM +0800, =Xianwei Zhao wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
> 
> The C series SoCs are designed for smart IP camera
> applications, which does not belong to Meson series.
> So, Add ARCH_AMLIPC for the new series.
> 
> There are now multiple amlogic SoC seies supported, so group them under
> their own menu. we can easily add new platforms there in the future.
> Introduce ARCH_AMLOGIC to cover all Amlogic SoC series.
> 
> No functional changes introduced.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  arch/arm64/Kconfig.platforms | 12 ++++++++++++
>  arch/arm64/configs/defconfig |  2 ++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index 89a0b13b058d..bfbc817eef8f 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -162,12 +162,24 @@ config ARCH_MEDIATEK
>  	  This enables support for MediaTek MT27xx, MT65xx, MT76xx
>  	  & MT81xx ARMv8 SoCs
>  
> +menuconfig ARCH_AMLOGIC
> +	bool "NXP SoC support"

NXP? Did you mean "Amlogic"?

> +
> +if ARCH_AMLOGIC
> +
>  config ARCH_MESON
>  	bool "Amlogic Platforms"
>  	help
>  	  This enables support for the arm64 based Amlogic SoCs
>  	  such as the s905, S905X/D, S912, A113X/D or S905X/D2
>  
> +config ARCH_AMLIPC

Do we really need a different ARCH for Amlogic IPC?
I can imagine that it's not the Meson architecture at all.
But maybe a better solution is just to rename ARCH_MESON to ARCH_AMLOGIC?

> +	bool "Amlogic IPC Platforms"
> +	help
> +	  This enables support for the arm64 based Amlogic IPC SoCs
> +	  such as the C302X, C308L
> +endif
> +
>  config ARCH_MVEBU
>  	bool "Marvell EBU SoC Family"
>  	select ARMADA_AP806_SYSCON
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 7790ee42c68a..f231bd1723fd 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -46,7 +46,9 @@ CONFIG_ARCH_LG1K=y
>  CONFIG_ARCH_HISI=y
>  CONFIG_ARCH_KEEMBAY=y
>  CONFIG_ARCH_MEDIATEK=y
> +CONFIG_ARCH_AMLOGIC=y
>  CONFIG_ARCH_MESON=y
> +CONFIG_ARCH_AMLIPC=y
>  CONFIG_ARCH_MVEBU=y
>  CONFIG_ARCH_NXP=y
>  CONFIG_ARCH_LAYERSCAPE=y
> -- 
> 2.37.1
> 
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

-- 
Thank you,
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
