Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC9CACFA466
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Nov 2025 09:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g7H1C4EV5Fmvx1IfEtsM0lPd1TKux+MDpGdLQt34wR4=; b=zFIM4G3e+VtI5p
	PO1jQ19uA79tOoKcF2l+cfBFsUsOz/UKzN9F1jP+/Nym9WpFfVw2p4BbBWMEZkpgMZq65FEdLDvav
	EqLc5PbfK057PCXPxnuU58pSVqsm5Y6JinppZpvW/1Jh6Wh8HGKKjcKcaRU4Abvsvn96MfK9UNUUB
	m3lS/gw4LLGUScuRWQIX/C3ZWl3vFn173Y5WF7Xnrup29d1ReH7Y0b7TEKLw3XILX1Fxb4j8dmS38
	Kidm2YTvHlXzaPcZWOGWM+rBhF2lb7P6sgbHaQTj7JQhkaQSkjCSaY0SvfN2v/4BimCmdLJWjhiV6
	PrhUAc8yRa4UhYlhBJ4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNT9B-0000000BN9X-2CuD;
	Mon, 24 Nov 2025 09:46:13 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNT98-0000000BN8Z-3SKv
	for linux-amlogic@lists.infradead.org;
	Mon, 24 Nov 2025 09:46:12 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-42b47f662a0so2180670f8f.0
        for <linux-amlogic@lists.infradead.org>; Mon, 24 Nov 2025 01:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1763977569; x=1764582369; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+I1OH/e0SJaMpBEtI1yR0MCQld8hsjGMPHYDntH09Zs=;
        b=2pmQeQqx/ox7iJZ0U6o0x/mvovBb+q4qaon4Iv0TDyPvQmXerE7Czt2O3i2C11CNbi
         DxWQ/HDoPnNMQLUxDJkxVzaHPUqkdHdsrfrMbr7p6TK3bFAgfdEH/uSrNdIx6Am3PFoV
         hCYz4O9iXF86NktZmNtqKLRHmCmqf125XhVG2ABei1QRDhQ9yA8PMYR9IZ0AJTgqmtt9
         6M+eYRTmRp0fV3hJ2eWqJwiv0ORKtD/6667bW3H+kL8so+rzlp0y3c+0QITqKd5ZsE3K
         wx6HVupYx+ZocwHWdoAGkqUSQPusF+zQaOIBXis1tIEkSq5twaxySz3smfjrzARNlem3
         DNGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763977569; x=1764582369;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+I1OH/e0SJaMpBEtI1yR0MCQld8hsjGMPHYDntH09Zs=;
        b=KBzHOK9k8wrkAA9dzaNRmhBTwt1QPFjw9Igf7I5J5uoH7ixN1d0m9fvgBhgblRCNxG
         8LbKNXlLJGTCuT5Ll0gg9Kah9RSc/OZB8Hy/Q/iGDKLITE1BaSRZ8fZLssQTqEbLAew8
         mZX9ZxmLXrcgPWfJfFnsY7QkT1bKXbIW28cX0LiKOoXRBJ9eOamQ+hJSRA1zrZ+L9XNg
         TTag/pr1R9fGuADUSXmaw+kOIl9tOkxbDoVFJIFkcHiiXucFbEqL3hoWVxOHwptvl9Of
         6t+FtpItEcqZbHZvPfmiO7FVcWdgejR3dkKdt+wDOm1REx/cESIuUDvhKLWXIFJ2lbNr
         jANg==
X-Forwarded-Encrypted: i=1; AJvYcCWCn2dzDIYX1u1eBaOPRprSkcOytkdd5hfkmX0GoIBDcjhC7cE0FCDc0SOBcCVli/ABK+25Mt64FUZEAW4X@lists.infradead.org
X-Gm-Message-State: AOJu0YxlGHyB0BBHs/L6WyLrO1Xe8FOnnsRnmWo/a35qPnqb6/G0Vzco
	BguUjxGJ/+DpzBGDx77FdoM5Znl4BSwGk9dV06aj9UwA4h64WKFNM+lTKpP3ArGZ9QQ=
X-Gm-Gg: ASbGnctNs/ZPROGHA8wB3WeAviSZDehKLiPAcjYCIC9uaDSuBn0q+ZFWAbBwBpiO9iG
	MyxDc4YsyiM5EZJAZxrU+G5K6EfEkYSCBooexfjyY9Er+pfvVG9Zca0pLWApDP28TuByR7cFyGA
	epm940eGmy3r6qZYvSpNpcXhgTxaZauRGpMtdOnKG3uke8B/H0d9zN/qPfxG3x3IHsgXKCXEHfn
	okJf0epUTR2LshheYdVVG91wKSkpoOXVO33Ijl0Z00ADJKFmCini+yN1VEUkxuVQsT+HLS+pkqz
	LZ/XWHVvPR+BFLtrtsMjr6zBisZgGR1gYpdI7Taxs3E7ekkMPLYQAUPwuIi6Wp05gGP0NCfeTll
	cZzUNCcWSmNC9irIKyBQdx9Q8gAL2SC6ahMoREtYNx26Pt0B7gmOy2cSa3Y0uqoqYzR6h9QtB1E
	sImS+Ln3ahsg==
X-Google-Smtp-Source: AGHT+IHffWkX/Jj2vv2LF1SqqQ/0xrDubJ3urk0u5EZ0rxXKVAimRLIjEeCTq1HtkDUWFcvXmAc7fg==
X-Received: by 2002:a05:6000:4010:b0:42b:3dbe:3a37 with SMTP id ffacd0b85a97d-42cc1302285mr12809439f8f.10.1763977568979;
        Mon, 24 Nov 2025 01:46:08 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:4e2e:74ae:77df:106f])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42cb7fba20esm27521911f8f.37.2025.11.24.01.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 01:46:08 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>,  Chuan Liu
 <chuan.liu@amlogic.com>,  Neil Armstrong <neil.armstrong@linaro.org>,
  Kevin Hilman <khilman@baylibre.com>,  "Stephen Boyd" <sboyd@kernel.org>,
  Michael Turquette <mturquette@baylibre.com>,  "Dmitry Rokosov"
 <ddrokosov@sberdevices.ru>,  robh+dt <robh+dt@kernel.org>,  Rob Herring
 <robh@kernel.org>,  devicetree <devicetree@vger.kernel.org>,  linux-clk
 <linux-clk@vger.kernel.org>,  linux-amlogic
 <linux-amlogic@lists.infradead.org>,  linux-kernel
 <linux-kernel@vger.kernel.org>,  linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v5 0/5] add support for T7 family clock controller
In-Reply-To: <20251121105934.1759745-1-jian.hu@amlogic.com> (Jian Hu's message
	of "Fri, 21 Nov 2025 18:59:29 +0800")
References: <20251121105934.1759745-1-jian.hu@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 24 Nov 2025 10:46:08 +0100
Message-ID: <1jy0nvu5jz.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_014610_911181_3162B241 
X-CRM114-Status: GOOD (  15.14  )
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

On Fri 21 Nov 2025 at 18:59, Jian Hu <jian.hu@amlogic.com> wrote:

> It introduces three clock controllers:
> - SCMI clock controller: these clocks are managed by the SCP and handled through SCMI.
> - PLL clock controller.
> - peripheral clock controller.
>
> Changes v5 since v4 at [4]:
> - rename rtc and cec dualdiv clocks
> - rename dsp clocks
> - rename anakin clocks
> - rename fdiv2_divn to 25m and fix its parent
> - add flag for T7_COMP_GATE
> - use T7_COMP_SEL/DIV/GATE to define glitch clocks
> - add CLK_SET_RATE_NO_REPARENT for t7_eth_rmii_sel and rtc
> - move module_platform_driver after clock driver

Looks good to me, just a few minor comments.

It is too late of this cycle. Please check the comments and re-send on
the next -rc1

>
> Changes v4 since v3 at [3]:
> - drop amlogic_t7_pll_probe, use meson_clkc_mmio_probe instead
> - add CLK_DIVIDER_MAX_AT_ZERO for pcie_pll_od clk
> - add frac for hifi_dco_pll_dco
> - add l_detect for mclk_pll_dco
> - drop v3 5/6 patch, and use MESON_PCLK
> - drop SPI_PWM_CLK_XX macro and use MESON_COMP_XX
> - drop the register's prefix
>
> Changes v3 since v2 at [2]:
> - update T7 PLL YAML
> - add 't7_' prefix for t7 clock name and variable in t7-pll.c and t7-peripherals.c
> - correct v1 patch link
> - add new macro MESON_PCLK_V2
> - update the driver,header,yaml file license
>
> Changes v2 since v1 at [1]:
> - add CLK_MESON import
> - add const for clkc_regmap_config in PLL driver
> - fix eth_rmii_sel parent
> - update T7 PLL YAML file
>
> [1]: https://lore.kernel.org/all/20241231060047.2298871-1-jian.hu@amlogic.com
> [2]: https://lore.kernel.org/all/20250108094025.2664201-1-jian.hu@amlogic.com
> [3]: https://lore.kernel.org/all/20250509074825.1933254-1-jian.hu@amlogic.com
> [4]: https://lore.kernel.org/all/20251030094345.2571222-1-jian.hu@amlogic.com
> Jian Hu (5):
>   dt-bindings: clock: add Amlogic T7 PLL clock controller
>   dt-bindings: clock: add Amlogic T7 SCMI clock controller
>   dt-bindings: clock: add Amlogic T7 peripherals clock controller
>   clk: meson: t7: add support for the T7 SoC PLL clock
>   clk: meson: t7: add t7 clock peripherals controller driver
>
>  .../clock/amlogic,t7-peripherals-clkc.yaml    |  116 ++
>  .../bindings/clock/amlogic,t7-pll-clkc.yaml   |  114 ++
>  drivers/clk/meson/Kconfig                     |   27 +
>  drivers/clk/meson/Makefile                    |    2 +
>  drivers/clk/meson/t7-peripherals.c            | 1266 +++++++++++++++++
>  drivers/clk/meson/t7-pll.c                    | 1068 ++++++++++++++
>  .../clock/amlogic,t7-peripherals-clkc.h       |  228 +++
>  .../dt-bindings/clock/amlogic,t7-pll-clkc.h   |   56 +
>  include/dt-bindings/clock/amlogic,t7-scmi.h   |   47 +
>  9 files changed, 2924 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,t7-peripherals-clkc.yaml
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml
>  create mode 100644 drivers/clk/meson/t7-peripherals.c
>  create mode 100644 drivers/clk/meson/t7-pll.c
>  create mode 100644 include/dt-bindings/clock/amlogic,t7-peripherals-clkc.h
>  create mode 100644 include/dt-bindings/clock/amlogic,t7-pll-clkc.h
>  create mode 100644 include/dt-bindings/clock/amlogic,t7-scmi.h

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
