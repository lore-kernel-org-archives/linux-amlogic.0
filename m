Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E7DCC77B73
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Apr 2023 10:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T/JBb8ygF2L2FxttVklKO/A7eWQEHenegV/Jb4svznI=; b=bwQWTeksMYlihbHMUkv1Bgq7ck
	U+AVAh5UASrPwrppXB/2liDSJq6xkRCvMrR9Xq5IlHDM36qJLgYW7+azL7bixcik54FVzHJqEwZ3i
	oZMxtZeTG+THOxu/Gh2ZkcJnD8Iu4y5RCbKj8LlYs45HYpZob+VN5JwhplxEMJCzHcxeT+2fPgbvs
	4b70y0b4LSUA32EkcLbYnYQJ1fqyj8NLPPorACq189A/yMkJ0rs0VRnZgLJ+Uw4c4A1cDHHP5PryO
	PgI7lbCrljc0CnBe4Re8RaP9PMdp/iUTnnl4mKHdHBR/dFH2FnO0kuf6HT38HPlJqh/vzYrxVfN7n
	SDeI3nxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp4xV-004tAv-0B;
	Wed, 19 Apr 2023 10:22:41 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp4xS-004t9R-0P
	for linux-amlogic@lists.infradead.org;
	Wed, 19 Apr 2023 10:22:39 +0000
Received: by mail-wm1-x32a.google.com with SMTP id eo4-20020a05600c82c400b003f05a99a841so1167547wmb.3
        for <linux-amlogic@lists.infradead.org>; Wed, 19 Apr 2023 03:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681899756; x=1684491756;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fU2wrMIC42PqEyjIjG+AcTqJMu7tdAgxZ3YGA63S+ss=;
        b=RweJHU7K9YVIDRY8mwPkF0JFg0GxNdl0lmXPL7bK3kiIdciBN9YA/Gh8LWECNT83yo
         RXe2GiJ3d//2Xa4JrXfrgPvdw+spLWr6FLHiH0VMAaXngZ9xK4fxT+3w/JO6wm1dHc5f
         P8DDymRsMcE+mSRstLK/H8DVn96DQrZbFQjEXOi0vrCg0+OrjqOOz3q1F8L8YtJSsyQo
         ZUqLsuNjGPmTEHP1SSXj/Fjwozq+fCTgSsFP1REckJvCYVP+/ENvaM8lfCoEmmUEft3i
         k6juegJ0t7BX2Q1H2+4y0NnzV+14pnVHoHDAU9V/Iqh7FE7paFYYcKv8TSSOuvVMzw6Z
         lA3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681899756; x=1684491756;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fU2wrMIC42PqEyjIjG+AcTqJMu7tdAgxZ3YGA63S+ss=;
        b=KGIgmdnRd12LEshQRsENHbsczKj2OvVWafyvReVbMJbG8fPc3OCJNYR28lEWsS9z36
         gAMTrtsk9PDZUWhMFcHdD4SH1v65KDWBxxe747Rm28f28J38Z0JYqrkoBKDkYcnsdEQK
         doScnliHBTEfvxjLAfxApXDneTQ3lab2Wchl0FrfH++cQROB1XaBbZgXKv4++984qali
         cPnlQEtOPDU10joxLDRqeQ3Hx7/f2QjIPdwFWXnaWjiy40w8U5hbDb8Cn52wznS/WGm4
         JWn2q7DYIALX9jJNAxixR5p4iHViml2Z7q869Hm7Xdjwsdja/yaPeAFj6jczUz3s6CGi
         7A2A==
X-Gm-Message-State: AAQBX9dIhGXXnhwzOADMLrPmesqB1XF6HlBb5W9/biqDEa5kiSfnHBgj
	FmeJqfWhvpJmpXe0ceeFR8fj2A==
X-Google-Smtp-Source: AKy350adVq+0Enif94wp4RhcZ0STlydhZB7rHzAw+LUwH+tkkZJ5nZxGpmn1sKzin3LOW8z9QJJ8Jg==
X-Received: by 2002:a05:600c:284:b0:3f1:819d:d046 with SMTP id 4-20020a05600c028400b003f1819dd046mr1102778wmk.5.1681899756569;
        Wed, 19 Apr 2023 03:22:36 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:1360:9fbb:dfd6:2db4? ([2a01:e0a:982:cbb0:1360:9fbb:dfd6:2db4])
        by smtp.gmail.com with ESMTPSA id s9-20020a5d6a89000000b002cf1c435afcsm15475539wru.11.2023.04.19.03.22.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Apr 2023 03:22:36 -0700 (PDT)
Message-ID: <2804f8ba-e0c5-554b-645b-20320fda89ae@linaro.org>
Date: Wed, 19 Apr 2023 12:22:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [RFC PATCH 1/2] arm64: amlogic: add new ARCH_AMLIPC for IPC SoC
Content-Language: en-US
To: =Xianwei Zhao <xianwei.zhao@amlogic.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230419073834.972273-1-xianwei.zhao@amlogic.com>
 <20230419073834.972273-2-xianwei.zhao@amlogic.com>
Organization: Linaro Developer Services
In-Reply-To: <20230419073834.972273-2-xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_032238_167501_EE62F328 
X-CRM114-Status: GOOD (  22.55  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

On 19/04/2023 09:38, =Xianwei Zhao wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
> 
> The C series SoCs are designed for smart IP camera
> applications, which does not belong to Meson series.
> So, Add ARCH_AMLIPC for the new series.
> 
> There are now multiple amlogic SoC seies supported, so group them under
> their own menu. we can easily add new platforms there in the future.
> Introduce ARCH_AMLOGIC to cover all Amlogic SoC series.

There's no strong reason to add a new ARCH here, apart willing to kill
the MESON name, but it's usual to keep a arch naming from the first
SoC family supported, it doesn't mean the new aren't supported or
whatever, it's only a simple config name.

I understand the new SoCs are a new family, but they still share a lot of
IPs and driver that are present and supported on the Meson SoCs.

Please concentrate on adding the DTs and compatibles, changing the
current config and driver names is low priority unless there's a really
strong reason.

It's perfectly ok to drop meson for new configs, new driver & new bindings,
and it's already the case for the A1 SPIFC driver and most new G12/SM1
compatibles.

Neil

> 
> No functional changes introduced.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>   arch/arm64/Kconfig.platforms | 12 ++++++++++++
>   arch/arm64/configs/defconfig |  2 ++
>   2 files changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index 89a0b13b058d..bfbc817eef8f 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -162,12 +162,24 @@ config ARCH_MEDIATEK
>   	  This enables support for MediaTek MT27xx, MT65xx, MT76xx
>   	  & MT81xx ARMv8 SoCs
>   
> +menuconfig ARCH_AMLOGIC
> +	bool "NXP SoC support"
> +
> +if ARCH_AMLOGIC
> +
>   config ARCH_MESON
>   	bool "Amlogic Platforms"
>   	help
>   	  This enables support for the arm64 based Amlogic SoCs
>   	  such as the s905, S905X/D, S912, A113X/D or S905X/D2
>   
> +config ARCH_AMLIPC
> +	bool "Amlogic IPC Platforms"
> +	help
> +	  This enables support for the arm64 based Amlogic IPC SoCs
> +	  such as the C302X, C308L
> +endif
> +
>   config ARCH_MVEBU
>   	bool "Marvell EBU SoC Family"
>   	select ARMADA_AP806_SYSCON
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 7790ee42c68a..f231bd1723fd 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -46,7 +46,9 @@ CONFIG_ARCH_LG1K=y
>   CONFIG_ARCH_HISI=y
>   CONFIG_ARCH_KEEMBAY=y
>   CONFIG_ARCH_MEDIATEK=y
> +CONFIG_ARCH_AMLOGIC=y
>   CONFIG_ARCH_MESON=y
> +CONFIG_ARCH_AMLIPC=y
>   CONFIG_ARCH_MVEBU=y
>   CONFIG_ARCH_NXP=y
>   CONFIG_ARCH_LAYERSCAPE=y


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
