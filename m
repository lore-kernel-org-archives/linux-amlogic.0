Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25B9DC25B10
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 May 2024 14:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vwALGXW4lPdRzm5qF/1XQkCFhsmhzKmu35jkOSeUsoU=; b=r59hOvLr0YG44b
	JHMK//+OFjRGEYFvV5ClDBKXGdyIOlBTcdRl1Cm5nAL3C3FRAdsePBl27sTGkfHqJIv/WhQ5iEjJy
	nlUNRdVQ+yFRCVpRNl3tnuXNu0C4aG61grXmtXhix9ntF/Q/eTfo/AjLvtgNTMqBTb8iBjvys6d6f
	tL1St5ddv5ZJEo6ZgCEFQHaGbUOR+r4qwAj7oyBXfyhXFiZAJqgS1g1pzp63SGR/uu756ehDa0zqo
	CpvfGBdmtN++LFGbRe8s4qRpcMyq2omiCPff9ubBjkvbJZTvTBt08Bd/20RYm0FTdPafxTI/4By1J
	RYfHIQDbKUQfbQzQaxpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2tj5-0000000GpLu-3mVH;
	Fri, 03 May 2024 14:17:27 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2tj0-0000000GpG7-1BMG
	for linux-amlogic@lists.infradead.org;
	Fri, 03 May 2024 14:17:25 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-41c7ac71996so36473765e9.3
        for <linux-amlogic@lists.infradead.org>; Fri, 03 May 2024 07:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1714745838; x=1715350638; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=mi/mhU22fI9RIiTkHOJlpI4wXPcoOgAYplYoLc68pRk=;
        b=ut6rVoVW6/cqkRhtT825ectIZlC/OouxyZXPKMaeOK5NfL2Ukux6hrUNez0rU9zqRC
         0AjsbxH5A60wf000SQYV0P23uAgAfBIdEYEVunl8g3jtkRAOCLweGeNYPUQ8B6T9Bi0n
         4pXZtzRIAG5DGSr67wIULvcwNLhVw9pZ/z06BrKdkAzFrfHwUnz92T0ONbVNIG4vMynC
         lb6MAfbOBFUZHNxR3GW1MPyTV0EBvAsfHkrYEqYSER8cHdsIt/Q/7Y/4NlLRxBHnb7dD
         eKGb2kTnsyGew/iMyuZmCraBI/6QDdK1meQrwKggV/Jn2WmcQ9EyAsr7Or0c8lDTIiMp
         JvRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714745838; x=1715350638;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mi/mhU22fI9RIiTkHOJlpI4wXPcoOgAYplYoLc68pRk=;
        b=AoPLV80fNy8QPHSR380cJFFjeV/D8pMWtplwPymtGbQnH9/Lcl8bz+yF3EJrwbFlU2
         dTOHBH92RJI+Oj4Wo7Dve5tYi+mkspIE98uKwxSCipNd+wn5iTXQlskGQaJ1j3xcFbmY
         i0ANWh9DC3ReWc8FI/TWNeGwturRssWA9p2/HUYh4TFdEy5DuketYGbuh55a9vOBS+hl
         mbijpF64vJ5M6dlIKKtJvSKPIokrHdNaYWE5yPYKd/KMOQhHslY35TJ9HxsJqG+/3XF7
         R3lJcTxIkd3YVaz+QWzmbFBp+P2JATpRqR6nQqVk7v7Cv+pBa+d7bcKUOJTRHsy2YdRB
         +YMQ==
X-Gm-Message-State: AOJu0YyeZW2MK4g5gfygE/UQRkyNYYQnuySMNjho5+ALU21iUatStsW4
	w0er7bjGoi3MxiabRsmp/Uol35+7DxXmKyNry9aroKUeIJdeUx8k7kJr20QQKvE=
X-Google-Smtp-Source: AGHT+IGl8A3CNGIOXabjv5H9Oz2zuPwg61o4PRCCpsIbyOo0AUsxBa9pb1Pfsk4BzFD31YbUj0yF7g==
X-Received: by 2002:a05:600c:4706:b0:41a:b56c:2929 with SMTP id v6-20020a05600c470600b0041ab56c2929mr2348971wmo.34.1714745837574;
        Fri, 03 May 2024 07:17:17 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1b85:e590:355b:9957])
        by smtp.gmail.com with ESMTPSA id r12-20020a05600c458c00b0041bfa2171efsm5781969wmo.40.2024.05.03.07.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 07:17:17 -0700 (PDT)
References: <20240430064438.2094701-1-xianwei.zhao@amlogic.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong
 <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, Michael
 Turquette <mturquette@baylibre.com>, Stephen  Boyd <sboyd@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v8 0/5] Add C3 SoC PLLs and Peripheral clock
Date: Fri, 03 May 2024 16:12:34 +0200
In-reply-to: <20240430064438.2094701-1-xianwei.zhao@amlogic.com>
Message-ID: <1jv83v2d5f.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_071722_370568_69DD57AA 
X-CRM114-Status: GOOD (  17.26  )
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


On Tue 30 Apr 2024 at 14:44, Xianwei Zhao <xianwei.zhao@amlogic.com> wrote:

> Changes since V7 [1]:
>  - Remove included head file not used.
>  - Link to v7: https://lore.kernel.org/all/20240424050928.1997820-1-xianwei.zhao@amlogic.com
>

Overall this v8 looks good. Please address the remaining comments.

There is no need to rush sending a v9. Please allow some time for other
to review this. I will not apply a v9 until the -rc1 is out anyway.

> Changes since V6 [12]:
>  - Add pad src for rtc clock.
>  - Add SCMI clock controller support, move some clock node in SCMI,such as GP1 PLL DDR USB etc.
>  - Fix some spelling mistake.
>  - Use lower case for bindings and update some input clocks desc.
>  - Update some clock comments.
>  - Delete prefix "AML_" for macro definition.
>  - Addd some clock annotation and some clock flag CRITICAL.
>  - Add maximum for regmap_config.
>  - Delete some unused register definition and unused clock inputs. 
>  - Drop patch subject redundant "bindings". Suggested by Krzysztof.
>  - Not reference header file "clk.h" and replace comment. Suggested by Jerome.
>  - Modify description about board in Kconfig file help item. Suggested by Jerome.
>  - Link to v6: https://lore.kernel.org/all/20231106085554.3237511-1-xianwei.zhao@amlogic.com
>
> Changes since V5 [3]:
>  - Fix some typo and modify formart for MARCO. Suggested by Jerome.
>  - Add pad clock for peripheral input clock in bindings.
>  - Add some description for explaining why ddr_dpll_pt_clk and cts_msr_clk are out of tree.
> Changes since V4 [10]:
>  - Change some fw_name of clocks. Suggested by Jerome.
>  - Delete minItem of clocks.
>  - Add CLk_GET_RATE_NOCACHE flags for gp1_pll
>  - Fix some format. and fix width as 8 for mclk_pll_dco.
>  - exchange gate and divder for fclk_50m clock.
>  - add CLK_SET_RATE_PARENT for axi_a_divder & axi_b_divder.
>  - add CLK_IS_CRITICAL for axi_clk
>  - Optimized macro define for pwm clk.
>  - add cts_oscin_clk mux between 24M and 32k
>  - add some missing gate clock, such as ddr_pll.
> Changes since V3 [7]:
>  - Modify Kconfig desc and PLL yaml clk desc.
>  - Fix some format.Suggested by Yixun and Jerome.
>  - Add flag CLK_GET_RATE_NOCACHE for sys_clk.
>  - Optimized macro define for pwm clk.
>  - Use flag CLK_IS_CRITICAL for axi_clk.
>  - Add some description for some clocks.
>  - Use FCLK_50M instead of FCLK_DIV40.
> Changes since V2 [4]:
>  - Modify some format, include clk name & inline, and so on.
>  - Define marco for pwm clock.
>  - Add GP1_PLL clock.
>  - Modify yaml use raw instead of macro.
> Changes since V1 [2]:
>  - Fix errors when check binding by using "make dt_binding_check".
>  - Delete macro definition.
>
> Xianwei Zhao (5):
>   dt-bindings: clock: add Amlogic C3 PLL clock controller
>   dt-bindings: clock: add Amlogic C3 SCMI clock controller support
>   dt-bindings: clock: add Amlogic C3 peripherals clock controller
>   clk: meson: c3: add support for the C3 SoC PLL clock
>   clk: meson: c3: add c3 clock peripherals controller driver
>
>  .../clock/amlogic,c3-peripherals-clkc.yaml    |  120 +
>  .../bindings/clock/amlogic,c3-pll-clkc.yaml   |   59 +
>  drivers/clk/meson/Kconfig                     |   29 +
>  drivers/clk/meson/Makefile                    |    2 +
>  drivers/clk/meson/c3-peripherals.c            | 2365 +++++++++++++++++
>  drivers/clk/meson/c3-pll.c                    |  746 ++++++
>  .../clock/amlogic,c3-peripherals-clkc.h       |  212 ++
>  .../dt-bindings/clock/amlogic,c3-pll-clkc.h   |   40 +
>  .../dt-bindings/clock/amlogic,c3-scmi-clkc.h  |   27 +
>  9 files changed, 3600 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,c3-peripherals-clkc.yaml
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,c3-pll-clkc.yaml
>  create mode 100644 drivers/clk/meson/c3-peripherals.c
>  create mode 100644 drivers/clk/meson/c3-pll.c
>  create mode 100644 include/dt-bindings/clock/amlogic,c3-peripherals-clkc.h
>  create mode 100644 include/dt-bindings/clock/amlogic,c3-pll-clkc.h
>  create mode 100644 include/dt-bindings/clock/amlogic,c3-scmi-clkc.h
>
>
> base-commit: ba535bce57e71463a86f8b33a0ea88c26e3a6418


-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
