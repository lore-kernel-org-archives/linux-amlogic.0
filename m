Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A5F8C77B61
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 May 2023 09:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FQnSdTKGqpvK0yXEpwo4oFx1RWy8+K4dBLzNMgZadhg=; b=rhv2iJTsaVpJnu
	oAsbijRoyiBwCjxoT3KOlNUmnOBiHM6MU+aS1K2loFCRlx60LwvEgq+S+JAeHg1bEd5l4/wOzDYfI
	4Y7+9lHwe7mF0yLvQm9+UL4x0WwxhnLwpscttR0JgXzBlyKJK+6ELRr2VL1xrg2OWJceX1VvgKxxv
	NQhAZxU5sUEvWNFMCyNmPwCGKEuRavBJpBrwRsOiBadcd9QvyvKAU+zHrtE+MLWQZNM4s+y0Dq/Qh
	n869XjtKTswT+RSiBtoWcTSDLnSPAFbh0AGrsNP1+4UB1tH8MirpCGTqWQCLYuq8DjBqxEBLx0OcB
	q2wDx8RNZtjfn4vzn94g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptQJH-00FZ5o-06;
	Mon, 01 May 2023 09:59:07 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptQJD-00FZ58-2r
	for linux-amlogic@lists.infradead.org;
	Mon, 01 May 2023 09:59:05 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-958bb7731a9so482706266b.0
        for <linux-amlogic@lists.infradead.org>; Mon, 01 May 2023 02:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682935141; x=1685527141;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1iC542I8sMMVaQ/GKCt5KrdijPnyOsGoeQvZFa5279s=;
        b=FTD6ea9xiiKA9CmBhw8FW4LKyQUFRuC89lG4rnIisz/8N1dldoe8cPSsN6MLa1SYwr
         gfhVVv/XY3zv2PTMgGAwn4219JxsRMUUboFHWzvlPp/1GDb6GWLfB1/MqA8nt07Q5ZsH
         MLj27lA648g3YAnkS95kNomb2Px4hkVKw5X25rSLrVFuRfVner1KSLcm7q4OM+oeM8p8
         J73jFRvf45UThva8feihLugrk5xVJLSBN/C6FBMh5I1CEMemSkN7uLtjYiWKcxkwA1An
         1CjWGNGp9ivABvGTzo+bp/8Uepj1BIfduNN8ZwDwET0gAVDW7/RRJEU4SyD8ZOmFCl0A
         cMWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682935141; x=1685527141;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1iC542I8sMMVaQ/GKCt5KrdijPnyOsGoeQvZFa5279s=;
        b=i8VopbxCv5/kAqk2qqW1jU9V13dZJCqy1y+WrIzi4n/9Wrt3WIsGkXyqQtpKhu8CsS
         tdzAx9oEK5Y/9SAx5MDsUnRXEGb6mjDCqXuXrAm3kzAVWqKEoGKTSEPSfNDl+PZcaD+l
         KAoJR9vlsPi7SKVqA8f1mOqahqoDTpsrWzRgCTHnaTkWTi/zvIOXV+jS54rwptob9Eyb
         w3EjXzLwAvXEVIRp2/BUvZiszB9HcbN2VVZRYFZSzfaQ7RhshCVFiTmBWa+triTH2pfI
         GTMHEH0ccVybZO9Wd9B7ldKDPDcbNulE3MOF5Mik+GcjfWQ09A0xK2dALcTXGs4TI9pw
         ukXQ==
X-Gm-Message-State: AC+VfDyVU+FtT2o0V7NupDU8SdU4a5smu5JXFYCkK0OXUx36N1OGtNdc
	pmshi2/DtLK4EHF8XcdPENYLgA==
X-Google-Smtp-Source: ACHHUZ5tqLgVByqmgtfFg0+IfGabRKnA3PjKgolnSWjhoxA7MZt9uWHkPm73ChEJKMLqaehLn0+ANA==
X-Received: by 2002:a17:907:7245:b0:94e:b3a1:3ed9 with SMTP id ds5-20020a170907724500b0094eb3a13ed9mr12018150ejc.49.1682935140884;
        Mon, 01 May 2023 02:59:00 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:637a:fd0c:58fd:9f00? ([2a02:810d:15c0:828:637a:fd0c:58fd:9f00])
        by smtp.gmail.com with ESMTPSA id oz5-20020a170906cd0500b0094f58a85bc5sm14534591ejb.180.2023.05.01.02.58.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 May 2023 02:59:00 -0700 (PDT)
Message-ID: <36e7a445-7d19-911a-1a94-ffc30172e1a3@linaro.org>
Date: Mon, 1 May 2023 11:58:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH V2] arm64: dts: add support for C3 based Amlogic AW409
Content-Language: en-US
To: Xianwei Zhao <xianwei.zhao@amlogic.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230427085859.793802-1-xianwei.zhao@amlogic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230427085859.793802-1-xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230501_025903_951133_BE610099 
X-CRM114-Status: GOOD (  18.84  )
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

On 27/04/2023 10:58, Xianwei Zhao wrote:
> Amlogic C3 is an advanced edge AI processor designed for smart IP camera
> applications.
> 
> Add basic support for the C3 based Amlogic AW409 board, which describes
> the following components: CPU, GIC, IRQ, Timer, UART. It's capable of
> booting up into the serial console.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> 
> ---
> V1 -> V2: Remove new arch, and use ARCH_MESON;
>           Modify node name, and delete superfluous blank lines.
> ---
>  arch/arm64/boot/dts/amlogic/Makefile          |  1 +
>  .../amlogic/amlogic-c3-c302x-aw409-256m.dts   | 29 +++++++
>  arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi   | 86 +++++++++++++++++++
>  3 files changed, 116 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/amlogic/amlogic-c3-c302x-aw409-256m.dts
>  create mode 100644 arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
> 
> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
> index cd1c5b04890a..bcec872c2444 100644
> --- a/arch/arm64/boot/dts/amlogic/Makefile
> +++ b/arch/arm64/boot/dts/amlogic/Makefile
> @@ -74,3 +74,4 @@ dtb-$(CONFIG_ARCH_MESON) += meson-sm1-odroid-hc4.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-sm1-sei610.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-sm1-x96-air-gbit.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-sm1-x96-air.dtb
> +dtb-$(CONFIG_ARCH_MESON) += amlogic-c3-c302x-aw409-256m.dtb

Looks wrongly ordered. 'a' is before 'm'.

> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-c3-c302x-aw409-256m.dts b/arch/arm64/boot/dts/amlogic/amlogic-c3-c302x-aw409-256m.dts
> new file mode 100644
> index 000000000000..edce8850b338
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-c3-c302x-aw409-256m.dts
> @@ -0,0 +1,29 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2021 Amlogic, Inc. All rights reserved.
> + */
> +
> +/dts-v1/;
> +
> +#include "amlogic-c3.dtsi"
> +
> +/ {
> +	model = "Amlogic C302 aw409 Development Board";
> +	compatible = "amlogic,aw409", "amlogic,c3";

Missing bindings.

Please run scripts/checkpatch.pl and fix reported warnings.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
