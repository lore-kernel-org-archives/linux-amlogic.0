Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 111BFC4332F
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Nov 2022 13:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OLxv8WG8E/btiizU35cRtcEBgXM+Q7MnzfbriqqFt/I=; b=OGSULfKmlEfb3vDrGiQujwQNx1
	ywl0WfIEjwwwYGYwFzSNS/EhZhVoLWtncG92DQpiV46+PGHU37ATwKJ+vyTMl0eVtcydkREpYDmiS
	2OkHvF3LbzLFMuBFBQoO68COi2/OnfEgs2AbQvoYmfy49dqcv6AA1nfhoUpDmPwU1ZvHbndpc9ZzY
	8KcLuFCn9EoPGpaUD/nCc4hZFGisJdezX5FcPb9kcQkhO3GkbUMmmmtE5z5jV7/DGqpDGYlLdRYNc
	r+ABt6ULe3uSp4EBVLOXUZpnmw/sCVWizyWrHTJyYDZBmBA6YyJ2YKGF6GtGKv9Q5MrOrGEpl2oAe
	WzSvJUBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxpp9-00HFJ6-J7; Wed, 23 Nov 2022 13:29:59 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxpob-00HEsw-Oh
	for linux-amlogic@lists.infradead.org; Wed, 23 Nov 2022 13:29:28 +0000
Received: by mail-wm1-x32d.google.com with SMTP id c65-20020a1c3544000000b003cfffd00fc0so1454609wma.1
        for <linux-amlogic@lists.infradead.org>; Wed, 23 Nov 2022 05:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9H+3i/P1OqcDTBIMt18xGpL3JdquHkDFB14T8z2BbIQ=;
        b=sXHVsqm5wjQANTqU+zZ16SOA/NMM/54NLKabd72anKaB2GnZs4uGNb93VDc5T75qVm
         yftnZ1mGO1TJBDludiYxyhyiMMfTfmIpw4a1k1uZ/bxMnS1mAvfLXE7+ueZUUAiJFInB
         GfBKuaaphxyuLU0XK3BI/n24J2CTL5JEMwEMgLdCPFYP1MxU1sOJv7bnhtqqPaxiUtkZ
         w+PzNOEhZYdHUJ70PwsO0M1zMNbxhNw26OiiTH1aqgz/VSyfeUIw59URkwnOKh276XzM
         OvC5kYASCPKvVfObCcQkhFvg7pj/HAGNv2w9TKAqq1snE8ZK6z29C28/a0C8Mo9N9G1i
         ucng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9H+3i/P1OqcDTBIMt18xGpL3JdquHkDFB14T8z2BbIQ=;
        b=A8LRZwomhgNjGeOyHfm+UDq5MP2j1kFXPQEw/tgeZDNbHxhbvZPfdtkIY5phiuml8T
         FY8Kb7r40cTPluiajydPEIdWNpDIN3C0ZsOp6nuphDgIO/8Rj8bJZAZcNEKhC1K5Ww0G
         kgFweBJkg5I/OB7UOk0hOVyllQjj5sMt4TfXDr6n1OAdChL9VLNpiibK/m9DOiQ8cW3n
         WbDs7s0PQcmyj01+qUnopyf0RVVsSLVXZm9OdB+T4tsDWh7NQP6MMr1Ombozzt4pac+T
         4nfhYjMuL7iVmfi1d/2R5B71UBVD9MfX8TfWtspI+LjZIJu2EqgPtHIMWeXyVj34mYen
         69WA==
X-Gm-Message-State: ANoB5pmiTXkAGtbKzGfI8PMuKRS8O2BAAEaMM+ECX3tGwpiMYaTiX7JO
	DB9+SZkI3CbKdeO8IDkXJwrwhfG1yk9t+Q==
X-Google-Smtp-Source: AA0mqf5qo107bgBHg43TWC/me0CgnM0LrfAKC9HPPHv9dXSEJr7c9ehwdPmJ06kVrcwyfR922FqB9g==
X-Received: by 2002:a05:600c:3d1b:b0:3cf:670e:63cc with SMTP id bh27-20020a05600c3d1b00b003cf670e63ccmr24484967wmb.150.1669210162043;
        Wed, 23 Nov 2022 05:29:22 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:e551:24c3:152c:7c05? ([2a01:e0a:982:cbb0:e551:24c3:152c:7c05])
        by smtp.gmail.com with ESMTPSA id bg3-20020a05600c3c8300b003c71358a42dsm3206629wmb.18.2022.11.23.05.29.21
        for <linux-amlogic@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 05:29:21 -0800 (PST)
Message-ID: <19a56e46-ec12-f436-4304-7a442d0438a2@linaro.org>
Date: Wed, 23 Nov 2022 14:29:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH V5 0/4] Add S4 SoC PLL and Peripheral clock controller
Content-Language: en-US
To: linux-amlogic@lists.infradead.org
References: <20221123021346.18136-1-yu.tu@amlogic.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20221123021346.18136-1-yu.tu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_052925_877946_396BD351 
X-CRM114-Status: GOOD (  10.59  )
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

On 23/11/2022 03:13, Yu Tu wrote:
> 1. Add PLL and Peripheral clock controller driver for S4 SOC.
> 
> Yu Tu (4):
>    clk: meson: S4: add support for Amlogic S4 SoC PLL clock driver and
>      bindings
>    arm64: dts: meson: add S4 Soc PLL clock controller in DT
>    clk: meson: s4: add s4 SoC peripheral clock controller driver and
>      bindings
>    arm64: dts: meson: add S4 Soc Peripheral clock controller in DT

My correct e-mail is neil.armstrong@linaro.org and not narmstrong@linaro.org,
please fix it for future versions.

Thanks,
Neil

> 
> V4 -> V5: change format and clock flags and adjust the patch series as suggested
> by Jerome.
> V3 -> V4: change format and clock flags.
> V2 -> V3: Use two clock controller.
> V1 -> V2: Change format as discussed in the email.
> 
> Link:https://lore.kernel.org/all/20220823022630.25007-1-yu.tu@amlogic.com/
> 
>   .../clock/amlogic,s4-peripherals-clkc.yaml    |  105 +
>   .../bindings/clock/amlogic,s4-pll-clkc.yaml   |   51 +
>   MAINTAINERS                                   |    1 +
>   arch/arm64/boot/dts/amlogic/meson-s4.dtsi     |   34 +
>   drivers/clk/meson/Kconfig                     |   25 +
>   drivers/clk/meson/Makefile                    |    2 +
>   drivers/clk/meson/s4-peripherals.c            | 3783 +++++++++++++++++
>   drivers/clk/meson/s4-peripherals.h            |  218 +
>   drivers/clk/meson/s4-pll.c                    |  875 ++++
>   drivers/clk/meson/s4-pll.h                    |   88 +
>   .../clock/amlogic,s4-peripherals-clkc.h       |  131 +
>   .../dt-bindings/clock/amlogic,s4-pll-clkc.h   |   30 +
>   12 files changed, 5343 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/clock/amlogic,s4-peripherals-clkc.yaml
>   create mode 100644 Documentation/devicetree/bindings/clock/amlogic,s4-pll-clkc.yaml
>   create mode 100644 drivers/clk/meson/s4-peripherals.c
>   create mode 100644 drivers/clk/meson/s4-peripherals.h
>   create mode 100644 drivers/clk/meson/s4-pll.c
>   create mode 100644 drivers/clk/meson/s4-pll.h
>   create mode 100644 include/dt-bindings/clock/amlogic,s4-peripherals-clkc.h
>   create mode 100644 include/dt-bindings/clock/amlogic,s4-pll-clkc.h
> 
> 
> base-commit: 5eeec1fd8360d57899d29a607ff81d0094e6cf59


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
