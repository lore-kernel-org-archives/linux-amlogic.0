Return-Path: <SRS0=H3eD=OU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 780ABC5CFFE
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Dec 2018 14:39:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 307842054F
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Dec 2018 14:39:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kHokpXql";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="CpMJl7pq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 307842054F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cc7uqVrVMlxxatAmMudHJAueoFxWeyc/WPIV9c3lW2Q=; b=kHokpXqlz+jPVe
	6nAur04tENJoTxVeTqFDUKYcXU/hZCGyTISWlMtO1s0nq7Zp9CtgjuTw1DkSvBndngZJBRIlG6hO4
	GPjkJlyh9B36uTTgssewA4s/gbwFO5iqRvhk37WaoE3T1kNanDiWb6EW2k0OAxGZ+wfGmE1DzrRdS
	04uWi1O80ZwfLnVkmF7K4l5WjI4XCZlmMMyom8c1Gov4XyTDseFBuD6LnjoOfAd+VWwUGU9K0o12Z
	kiIOuWBST23J8p8ps1QzQB4bPcmo7A/U4sSnlTJSRxFNlb+VeaPvJfX/lFYHI4ky+h+L6YUmyuFzI
	BVxN5/mLhcWxUZ7i7hXA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gWjCF-0008D0-0I; Tue, 11 Dec 2018 14:39:39 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gWjCB-0008BO-0i
 for linux-amlogic@lists.infradead.org; Tue, 11 Dec 2018 14:39:37 +0000
Received: by mail-wm1-x343.google.com with SMTP id y185so9160868wmd.1
 for <linux-amlogic@lists.infradead.org>; Tue, 11 Dec 2018 06:39:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=QD3eJs/RaEFfBBcOak7at7J5XZS3rHC6GMqA/4qo2JE=;
 b=CpMJl7pqUmM5M5gdmlDWsZSyzrLV2h5NybK4gJFeQxAT/PnGYf4x9sTQFM+cwMrM/L
 mJLvm32K99KXFv7zwWiHuAAJWi0ARa04mVliBSaV5zTJ/85tSF4HBuUhydsFwIwgq1PC
 fRtCSYx7/tJ6gBoND4XqVgXgBhAZhUQ7hdrMdypuUdc501Kc9HUrVNf4kT0WxS0ftCUP
 tMZJ8tlldoRp9cSYW2OLMYHTOSU1b0Nj71AqOLDVaH1thu4Gb9+ZInppJ+UaQLKPZAGo
 vUJnqJiKXbinCjaE/dDiEKMv7m3I6q0Fx9NLocKlShqnJueoQQvg5K74LT/RqF34xQhh
 FkMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=QD3eJs/RaEFfBBcOak7at7J5XZS3rHC6GMqA/4qo2JE=;
 b=J+CdF0vmZDwZwwHyN6iLTTOTXlH4/n5V0VbaX8h+eX+y5QeHmX+oRR8lv131x0fBEi
 LUP3TNnLwGBgo0DmQvZIq+BEDWRFuWptqujPBC6Ci9d3j+6J1XhL0LE6rzVkBNce5lHn
 J0l7PI2/swZLGqqyO+RQMTMl6ud+F1b0J9RquZxUvt7oATT0864N9ttNaLD5Nhtj+MmJ
 QL9WwNLa1IExNoHTLqO/Mf50B1TNyQxCTeKk1q0/aKA7D5rxsbA7Ys2xKPo4JCdpTRnf
 jzvvxMbPr5BQ/ntIBavaFhpFOT/F9EoSlT4hNxnqOfBI0IYpkCC13xTKrLnyzvtshFmR
 mMmg==
X-Gm-Message-State: AA+aEWYZYLvCIXzO6vjLIkjEAhdc1I34o64sLy+fd50MmzbPTJHqY0Dj
 TVzMEjIL6eNf8b497rx6EVeXbw==
X-Google-Smtp-Source: AFSGD/W39xHPT4eyXXzepuA82xS6hyVMU31nUqHw4EPBUjPMfFO3ijoACBQhkihSZjwMJsdrM/NNpA==
X-Received: by 2002:a1c:aad2:: with SMTP id t201mr2482648wme.148.1544539162989; 
 Tue, 11 Dec 2018 06:39:22 -0800 (PST)
Received: from boomer.baylibre.com ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.gmail.com with ESMTPSA id
 v1sm19160147wrw.90.2018.12.11.06.39.20
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 11 Dec 2018 06:39:22 -0800 (PST)
Message-ID: <48899a9beb0c32103ae7edea14cec890779d498e.camel@baylibre.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: clk: meson-g12a: Add G12A EE Clock
 Bindings
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu <jian.hu@amlogic.com>, Neil Armstrong <narmstrong@baylibre.com>
Date: Tue, 11 Dec 2018 15:39:19 +0100
In-Reply-To: <1543498917-98605-2-git-send-email-jian.hu@amlogic.com>
References: <1543498917-98605-1-git-send-email-jian.hu@amlogic.com>
 <1543498917-98605-2-git-send-email-jian.hu@amlogic.com>
User-Agent: Evolution 3.30.2 (3.30.2-2.fc29) 
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181211_063935_067834_C949C0B9 
X-CRM114-Status: GOOD (  15.75  )
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
Cc: Rob Herring <robh@kernel.org>, Jianxin Pan <jianxin.pan@amlogic.com>,
 devicetree@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Yixun Lan <yixun.lan@amlogic.com>,
 linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Qiufang Dai <qiufang.dai@amlogic.com>, Carlo Caione <carlo@caione.org>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, 2018-11-29 at 21:41 +0800, Jian Hu wrote:
> Add new clock controller compatible and dt-bingdings headers
> for the Everything-Else domain of the g12a SoC
> 
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
>  .../bindings/clock/amlogic,gxbb-clkc.txt           |  1 +
>  include/dt-bindings/clock/g12a-clkc.h              | 93
> ++++++++++++++++++++++
>  2 files changed, 94 insertions(+)
>  create mode 100644 include/dt-bindings/clock/g12a-clkc.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
> b/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
> index e950599..0833006 100644
> --- a/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
> +++ b/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
> @@ -9,6 +9,7 @@ Required Properties:
>  		"amlogic,gxbb-clkc" for GXBB SoC,
>  		"amlogic,gxl-clkc" for GXL and GXM SoC,
>  		"amlogic,axg-clkc" for AXG SoC.
> +		"amlogic,g12a-clkc" for G12A SoC.


Binding description is not aligned with what the driver does.
If you are going take clock input from DT, it needs to be documented.

In the meantime this has been done [0] for you but you'll have to rebase.

[0]: 20181203171640.12110-3-jbrunet@baylibre.com

>  
>  - #clock-cells: should be 1.
>  
> diff --git a/include/dt-bindings/clock/g12a-clkc.h b/include/dt-
> bindings/clock/g12a-clkc.h
> new file mode 100644
> index 0000000..b55e6e1
> --- /dev/null
> +++ b/include/dt-bindings/clock/g12a-clkc.h
> @@ -0,0 +1,93 @@
> +/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
> +/*
> + * Meson-G12A clock tree IDs
> + *
> + * Copyright (c) 2018 Amlogic, Inc. All rights reserved.
> + */
> +
> +#ifndef __G12A_CLKC_H
> +#define __G12A_CLKC_H
> +
> +#define CLKID_SYS_PLL				0
> +#define CLKID_FIXED_PLL				1
> +#define CLKID_FCLK_DIV2				2
> +#define CLKID_FCLK_DIV3				3
> +#define CLKID_FCLK_DIV4				4
> +#define CLKID_FCLK_DIV5				5
> +#define CLKID_FCLK_DIV7				6
> +#define CLKID_GP0_PLL				7
> +#define CLKID_CLK81				10
> +#define CLKID_MPLL0				11
> +#define CLKID_MPLL1				12
> +#define CLKID_MPLL2				13
> +#define CLKID_MPLL3				14
> +#define CLKID_DDR				15
> +#define CLKID_DOS				16
> +#define CLKID_AUDIO_LOCKER			17
> +#define CLKID_MIPI_DSI_HOST			18
> +#define CLKID_ETH_PHY				19
> +#define CLKID_ISA				20
> +#define CLKID_PL301				21
> +#define CLKID_PERIPHS				22
> +#define CLKID_SPICC0				23
> +#define CLKID_I2C				24
> +#define CLKID_SANA				25
> +#define CLKID_SD				26
> +#define CLKID_RNG0				27
> +#define CLKID_UART0				28
> +#define CLKID_SPICC1				29
> +#define CLKID_HIU_IFACE				30
> +#define CLKID_MIPI_DSI_PHY			31
> +#define CLKID_ASSIST_MISC			32
> +#define CLKID_SD_EMMC_A				33
> +#define CLKID_SD_EMMC_B				34
> +#define CLKID_SD_EMMC_C				35
> +#define CLKID_AUDIO_CODEC			36
> +#define CLKID_AUDIO				37
> +#define CLKID_ETH				38
> +#define CLKID_DEMUX				39
> +#define CLKID_AUDIO_IFIFO			40
> +#define CLKID_ADC				41
> +#define CLKID_UART1				42
> +#define CLKID_G2D				43
> +#define CLKID_RESET				44
> +#define CLKID_PCIE_COMB				45
> +#define CLKID_PARSER				46
> +#define CLKID_USB				47
> +#define CLKID_PCIE_PHY				48
> +#define CLKID_AHB_ARB0				49
> +#define CLKID_AHB_DATA_BUS			50
> +#define CLKID_AHB_CTRL_BUS			51
> +#define CLKID_HTX_HDCP22			52
> +#define CLKID_HTX_PCLK				53
> +#define CLKID_BT656				54
> +#define CLKID_USB1_DDR_BRIDGE			55
> +#define CLKID_MMC_PCLK				56
> +#define CLKID_UART2				57
> +#define CLKID_VPU_INTR				58
> +#define CLKID_GIC				59
> +#define CLKID_SD_EMMC_B_CLK0			60
> +#define CLKID_SD_EMMC_C_CLK0			61
> +#define CLKID_HIFI_PLL				71
> +#define CLKID_VCLK2_VENCI0			77
> +#define CLKID_VCLK2_VENCI1			78
> +#define CLKID_VCLK2_VENCP0			79
> +#define CLKID_VCLK2_VENCP1			80
> +#define CLKID_VCLK2_VENCT0			81
> +#define CLKID_VCLK2_VENCT1			82
> +#define CLKID_VCLK2_OTHER			83
> +#define CLKID_VCLK2_ENCI			84
> +#define CLKID_VCLK2_ENCP			85
> +#define CLKID_DAC_CLK				86
> +#define CLKID_AOCLK				87
> +#define CLKID_IEC958				88
> +#define CLKID_ENC480P				89
> +#define CLKID_RNG1				90
> +#define CLKID_VCLK2_ENCT			91
> +#define CLKID_VCLK2_ENCL			92
> +#define CLKID_VCLK2_VENCLMMC			93
> +#define CLKID_VCLK2_VENCL			94
> +#define CLKID_VCLK2_OTHER1			95
> +#define CLKID_FCLK_DIV2P5			96
> +
> +#endif /* __G12A_CLKC_H */



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
