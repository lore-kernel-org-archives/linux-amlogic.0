Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2FB9D1CDCA
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Oct 2024 09:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f+Qr83C9iQxhfhQpOs9kZku8MlzvpUrFKHE1W3G8+pc=; b=kKzbPEDfV5pBn9
	XJt8yYxw8hVlAxtaLOJnLFB3AfOAbjWZI2uxmW+s/n7Vh1X0jFlV18+BpJ/DTkYszKAuzg1ua6f6F
	raT6xufprRDCn+UELICp7BJ04uIvtNGk0ruc/AlYIMGu1oNMuuZ04lMSP4FziapO/0r9Ty+9Y4TyW
	fQPmxZhIt9HKkre0E2MVuzUOwnPu0Yl5ltDjVijkOhg4ksrizUCcLXntnrapeoWpn1WAlQoeEkkaF
	bm7H/cyQ83X9zOG9hRkSWBbmfyTnKx2AdbXDjcegTA/FEnFKm+EDoB2jipjuTUVmjypGBXvQYWDQB
	Q1PI3IIuOcQ3GNdjSHkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3BQF-0000000AOcg-333c;
	Tue, 22 Oct 2024 09:43:27 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3BHC-0000000AMjY-0huP
	for linux-amlogic@lists.infradead.org;
	Tue, 22 Oct 2024 09:34:10 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-37d6a2aa748so3558590f8f.1
        for <linux-amlogic@lists.infradead.org>; Tue, 22 Oct 2024 02:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729589644; x=1730194444; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=gZycHHif1XK15/J1/2rimbGE/T++GDZJvNYQ0hrutG4=;
        b=pRY5uguEyKv4Vjdd4UyMhCUMEggb+Y4d5LJSkNtbl95WPMIt9vBu927dpMaqoTaGXm
         WqgDDAq+c+HquLN1c5/+7VtP3gDMHP1FTBeg1d8tCRAI2Ni7SNWWqbjk85GV2Pfwgio9
         NySJJP3CuW8AceFIC/XozpENjJsHzZSOb4DIUk1buwxjDadXMa4GfX7vBrTVcVbDKDO3
         QHE7cpUmlLdwfPG9xVdSxdziGWnCTAxbvxctlsixamiJfH/5uSmhBm6SLeZuFJx22IwZ
         5sZMP7kz1kjxg4m9P/JQqB54Dr2p3BoV0URVAspw4o4T+TcrSp6iNcm0JTMTRu3JpBPy
         D28g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729589644; x=1730194444;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gZycHHif1XK15/J1/2rimbGE/T++GDZJvNYQ0hrutG4=;
        b=aZATxH/m4s9KIuSvSPE4m+Ei9W/fMt4Mslf3+lrotv3tqB++JRhg78O5mzdBFcagDi
         AWrbcYx9H1ZBpzIBJLIWrzmvQhnGKXPqSd1qhET7ToqOqSsm37+4b62zKZoPh2D2NUQ3
         VOEUVInNCTqnkiW1dfxNWQ6+uB2Dtoo3RgfCn7tLqqqyJ7uznD2VryEvwqeDkfXFO4Lu
         BptZQf4PmCjdvdtRzXJHYKyXf05NCX4zA2L+9EeB5ZQHb19zqp4SchNOojC5J60DP1Od
         bwvP6ImjW3vTDM2wUjHr6UQrtKZN52R5xLKHY/Ot6xoTVX8qIM5tS9g/FIeAxJZacqpm
         cLEg==
X-Forwarded-Encrypted: i=1; AJvYcCUNVjECC3ld5yi8mB9A54chf/8Q/wqio+luIKSEvfzvR5ndznmPE11S5pPYUr6ne6WTAXdZfw/Ty69RhWGX@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4AW9O6tSjyvD5GPUxY091wSVGUSTbQne+ZpnBx5gJ+1rT0AXs
	fIxUpFRz5LIRVudtjjXsKkZVzM+wk9O3eXo1ggVmCff+b3+H+PKqe4Gyzb/c6N0=
X-Google-Smtp-Source: AGHT+IF2AI9bQIr0tGScY7Bv5vlVywZpblspYP/H+5e4xTqZiXyoU9NwrHtaw3F1qCz0C5DcMMgfnA==
X-Received: by 2002:adf:f744:0:b0:37d:5103:8896 with SMTP id ffacd0b85a97d-37eab4ed1ddmr8572359f8f.41.1729589643781;
        Tue, 22 Oct 2024 02:34:03 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:ef1c:ae40:1300:20c6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a37d25sm6220808f8f.23.2024.10.22.02.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 02:34:03 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: Conor Dooley <conor+dt@kernel.org>,  <devicetree@vger.kernel.org>,
  Kevin Hilman <khilman@baylibre.com>,  "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>,  <linux-amlogic@lists.infradead.org>,
  <linux-arm-kernel@lists.infradead.org>,  <linux-clk@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  Michael Turquette
 <mturquette@baylibre.com>,  Neil Armstrong <neil.armstrong@linaro.org>,
  Philipp Zabel <p.zabel@pengutronix.de>,  Rob Herring <robh@kernel.org>,
  Stephen Boyd <sboyd@kernel.org>
Subject: Re: [RFC PATCH v4 3/5] dt-bindings: clock: axg-audio: document A1
 SoC audio clock controller driver
In-Reply-To: <20240913121152.817575-4-jan.dakinevich@salutedevices.com> (Jan
	Dakinevich's message of "Fri, 13 Sep 2024 15:11:50 +0300")
References: <20240913121152.817575-1-jan.dakinevich@salutedevices.com>
	<20240913121152.817575-4-jan.dakinevich@salutedevices.com>
Date: Tue, 22 Oct 2024 11:34:02 +0200
Message-ID: <1jzfmwjxbp.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_023406_257260_EEC9485E 
X-CRM114-Status: GOOD (  14.81  )
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

On Fri 13 Sep 2024 at 15:11, Jan Dakinevich <jan.dakinevich@salutedevices.com> wrote:

> Add device tree bindings for A1 SoC audio clock and reset controllers.
>
> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
> ---
>  .../clock/amlogic,axg-audio-clkc.yaml         |   3 +
>  .../dt-bindings/clock/amlogic,a1-audio-clkc.h | 122 ++++++++++++++++++
>  .../reset/amlogic,meson-a1-audio-reset.h      |  29 +++++
>  3 files changed, 154 insertions(+)
>  create mode 100644 include/dt-bindings/clock/amlogic,a1-audio-clkc.h
>  create mode 100644 include/dt-bindings/reset/amlogic,meson-a1-audio-reset.h
>
> diff --git a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
> index fd7982dd4cea..df9eb8ce28dc 100644
> --- a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
> +++ b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
> @@ -18,6 +18,8 @@ description:
>  properties:
>    compatible:
>      enum:
> +      - amlogic,a1-audio-clkc

This controller is missing aud_top clock input coming from the vad
controller, AFAICT.

> +      - amlogic,a1-audio-vad-clkc
>        - amlogic,axg-audio-clkc
>        - amlogic,g12a-audio-clkc
>        - amlogic,sm1-audio-clkc
> @@ -114,6 +116,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - amlogic,a1-audio-clkc
>                - amlogic,g12a-audio-clkc
>                - amlogic,sm1-audio-clkc
>      then:
> diff --git a/include/dt-bindings/clock/amlogic,a1-audio-clkc.h b/include/dt-bindings/clock/amlogic,a1-audio-clkc.h
> new file mode 100644
> index 000000000000..6534d1878816
> --- /dev/null
> +++ b/include/dt-bindings/clock/amlogic,a1-audio-clkc.h
> @@ -0,0 +1,122 @@
> +/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
> +/*
> + * Copyright (c) 2024, SaluteDevices. All Rights Reserved.
> + *
> + * Author: Jan Dakinevich <jan.dakinevich@salutedevices.com>
> + */
> +
> +#ifndef __A1_AUDIO_CLKC_BINDINGS_H
> +#define __A1_AUDIO_CLKC_BINDINGS_H
> +
> +#define AUD_CLKID_DDR_ARB		1
> +#define AUD_CLKID_TDMIN_A		2
> +#define AUD_CLKID_TDMIN_B		3
> +#define AUD_CLKID_TDMIN_LB		4
> +#define AUD_CLKID_LOOPBACK		5
> +#define AUD_CLKID_TDMOUT_A		6
> +#define AUD_CLKID_TDMOUT_B		7
> +#define AUD_CLKID_FRDDR_A		8
> +#define AUD_CLKID_FRDDR_B		9
> +#define AUD_CLKID_TODDR_A		10
> +#define AUD_CLKID_TODDR_B		11
> +#define AUD_CLKID_SPDIFIN		12
> +#define AUD_CLKID_RESAMPLE		13
> +#define AUD_CLKID_EQDRC			14
> +#define AUD_CLKID_LOCKER		15
> +#define AUD_CLKID_MST_A_MCLK_SEL	16
> +#define AUD_CLKID_MST_A_MCLK_DIV	17
> +#define AUD_CLKID_MST_A_MCLK		18
> +#define AUD_CLKID_MST_B_MCLK_SEL	19
> +#define AUD_CLKID_MST_B_MCLK_DIV	20
> +#define AUD_CLKID_MST_B_MCLK		21
> +#define AUD_CLKID_MST_C_MCLK_SEL	22
> +#define AUD_CLKID_MST_C_MCLK_DIV	23
> +#define AUD_CLKID_MST_C_MCLK		24
> +#define AUD_CLKID_MST_D_MCLK_SEL	25
> +#define AUD_CLKID_MST_D_MCLK_DIV	26
> +#define AUD_CLKID_MST_D_MCLK		27
> +#define AUD_CLKID_SPDIFIN_CLK_SEL	28
> +#define AUD_CLKID_SPDIFIN_CLK_DIV	29
> +#define AUD_CLKID_SPDIFIN_CLK		30
> +#define AUD_CLKID_RESAMPLE_CLK_SEL	31
> +#define AUD_CLKID_RESAMPLE_CLK_DIV	32
> +#define AUD_CLKID_RESAMPLE_CLK		33
> +#define AUD_CLKID_LOCKER_IN_CLK_SEL	34
> +#define AUD_CLKID_LOCKER_IN_CLK_DIV	35
> +#define AUD_CLKID_LOCKER_IN_CLK		36
> +#define AUD_CLKID_LOCKER_OUT_CLK_SEL	37
> +#define AUD_CLKID_LOCKER_OUT_CLK_DIV	38
> +#define AUD_CLKID_LOCKER_OUT_CLK	39
> +#define AUD_CLKID_EQDRC_CLK_SEL		40
> +#define AUD_CLKID_EQDRC_CLK_DIV		41
> +#define AUD_CLKID_EQDRC_CLK		42
> +#define AUD_CLKID_MST_A_SCLK_PRE_EN	43
> +#define AUD_CLKID_MST_A_SCLK_DIV	44
> +#define AUD_CLKID_MST_A_SCLK_POST_EN	45
> +#define AUD_CLKID_MST_A_SCLK		46
> +#define AUD_CLKID_MST_B_SCLK_PRE_EN	47
> +#define AUD_CLKID_MST_B_SCLK_DIV	48
> +#define AUD_CLKID_MST_B_SCLK_POST_EN	49
> +#define AUD_CLKID_MST_B_SCLK		50
> +#define AUD_CLKID_MST_C_SCLK_PRE_EN	51
> +#define AUD_CLKID_MST_C_SCLK_DIV	52
> +#define AUD_CLKID_MST_C_SCLK_POST_EN	53
> +#define AUD_CLKID_MST_C_SCLK		54
> +#define AUD_CLKID_MST_D_SCLK_PRE_EN	55
> +#define AUD_CLKID_MST_D_SCLK_DIV	56
> +#define AUD_CLKID_MST_D_SCLK_POST_EN	57
> +#define AUD_CLKID_MST_D_SCLK		58
> +#define AUD_CLKID_MST_A_LRCLK_DIV	59
> +#define AUD_CLKID_MST_A_LRCLK		60
> +#define AUD_CLKID_MST_B_LRCLK_DIV	61
> +#define AUD_CLKID_MST_B_LRCLK		62
> +#define AUD_CLKID_MST_C_LRCLK_DIV	63
> +#define AUD_CLKID_MST_C_LRCLK		64
> +#define AUD_CLKID_MST_D_LRCLK_DIV	65
> +#define AUD_CLKID_MST_D_LRCLK		66
> +#define AUD_CLKID_TDMIN_A_SCLK_SEL	67
> +#define AUD_CLKID_TDMIN_A_SCLK_PRE_EN	68
> +#define AUD_CLKID_TDMIN_A_SCLK_POST_EN	69
> +#define AUD_CLKID_TDMIN_A_SCLK		70
> +#define AUD_CLKID_TDMIN_A_LRCLK		71
> +#define AUD_CLKID_TDMIN_B_SCLK_SEL	72
> +#define AUD_CLKID_TDMIN_B_SCLK_PRE_EN	73
> +#define AUD_CLKID_TDMIN_B_SCLK_POST_EN	74
> +#define AUD_CLKID_TDMIN_B_SCLK		75
> +#define AUD_CLKID_TDMIN_B_LRCLK		76
> +#define AUD_CLKID_TDMIN_LB_SCLK_SEL	77
> +#define AUD_CLKID_TDMIN_LB_SCLK_PRE_EN	78
> +#define AUD_CLKID_TDMIN_LB_SCLK_POST_EN	79
> +#define AUD_CLKID_TDMIN_LB_SCLK		80
> +#define AUD_CLKID_TDMIN_LB_LRCLK	81
> +#define AUD_CLKID_TDMOUT_A_SCLK_SEL	82
> +#define AUD_CLKID_TDMOUT_A_SCLK_PRE_EN	83
> +#define AUD_CLKID_TDMOUT_A_SCLK_POST_EN	84
> +#define AUD_CLKID_TDMOUT_A_SCLK		85
> +#define AUD_CLKID_TDMOUT_A_LRCLK	86
> +#define AUD_CLKID_TDMOUT_B_SCLK_SEL	87
> +#define AUD_CLKID_TDMOUT_B_SCLK_PRE_EN	88
> +#define AUD_CLKID_TDMOUT_B_SCLK_POST_EN	89
> +#define AUD_CLKID_TDMOUT_B_SCLK		90
> +#define AUD_CLKID_TDMOUT_B_LRCLK	91
> +
> +#define AUD_CLKID_VAD_DDR_ARB		1
> +#define AUD_CLKID_VAD_PDM		2
> +#define AUD_CLKID_VAD_TDMIN		3
> +#define AUD_CLKID_VAD_TODDR		4
> +#define AUD_CLKID_VAD			5
> +#define AUD_CLKID_VAD_AUDIOTOP		6
> +#define AUD_CLKID_VAD_MCLK_SEL		7
> +#define AUD_CLKID_VAD_MCLK_DIV		8
> +#define AUD_CLKID_VAD_MCLK		9
> +#define AUD_CLKID_VAD_CLK_SEL		10
> +#define AUD_CLKID_VAD_CLK_DIV		11
> +#define AUD_CLKID_VAD_CLK		12
> +#define AUD_CLKID_VAD_PDM_DCLK_SEL	13
> +#define AUD_CLKID_VAD_PDM_DCLK_DIV	14
> +#define AUD_CLKID_VAD_PDM_DCLK		15
> +#define AUD_CLKID_VAD_PDM_SYSCLK_SEL	16
> +#define AUD_CLKID_VAD_PDM_SYSCLK_DIV	17
> +#define AUD_CLKID_VAD_PDM_SYSCLK	18
> +
> +#endif /* __A1_AUDIO_CLKC_BINDINGS_H */
> diff --git a/include/dt-bindings/reset/amlogic,meson-a1-audio-reset.h b/include/dt-bindings/reset/amlogic,meson-a1-audio-reset.h
> new file mode 100644
> index 000000000000..653fddba1d8f
> --- /dev/null
> +++ b/include/dt-bindings/reset/amlogic,meson-a1-audio-reset.h
> @@ -0,0 +1,29 @@
> +/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
> +/*
> + * Copyright (c) 2024, SaluteDevices. All Rights Reserved.
> + *
> + * Author: Jan Dakinevich <jan.dakinevich@salutedevices.com>
> + */
> +
> +#ifndef _DT_BINDINGS_AMLOGIC_MESON_A1_AUDIO_RESET_H
> +#define _DT_BINDINGS_AMLOGIC_MESON_A1_AUDIO_RESET_H
> +
> +#define AUD_RESET_DDRARB	0
> +#define AUD_RESET_TDMIN_A	1
> +#define AUD_RESET_TDMIN_B	2
> +#define AUD_RESET_TDMIN_LB	3
> +#define AUD_RESET_LOOPBACK	4
> +#define AUD_RESET_TDMOUT_A	5
> +#define AUD_RESET_TDMOUT_B	6
> +#define AUD_RESET_FRDDR_A	7
> +#define AUD_RESET_FRDDR_B	8
> +#define AUD_RESET_TODDR_A	9
> +#define AUD_RESET_TODDR_B	10
> +#define AUD_RESET_SPDIFIN	11
> +#define AUD_RESET_RESAMPLE	12
> +#define AUD_RESET_EQDRC		13
> +#define AUD_RESET_LOCKER	14
> +#define AUD_RESET_TOACODEC	30
> +#define AUD_RESET_CLKTREE	31
> +
> +#endif /* _DT_BINDINGS_AMLOGIC_MESON_A1_AUDIO_RESET_H */

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
