Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BED9EB64D7
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Jun 2023 16:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e3RIg6+/PRTvI4IwHSW7LdHigZyepK1BLXupPbhDrUY=; b=ut8rzGfPsRHtMt
	Yb+JV+PBiJY7dTaOSrh7e9fj4deBkdx8uUIvis89Ynrj+Vd+wVQe8qB1cGFFE8P/ZORLFtKdGawjX
	4WSybNgkQAr1Qcg7u5qNgz9I+zgYVOhRMwh8CUXQQIWoJJAAg+/0QvwT+fd59XcDbJ+L4GUKSv9f0
	y9udGbhwQ2vbex2h2/wAXp+1APvAdXVppyf6VR2MkwYuS/Ze6funQvLGEUX3g5dkXG4z88CSZqH6S
	EM7AEyZ5LnVY3sRbPqLEWaYMKU0RqjTA56ylaGilLfIxlk+Ac5f0gQDAQEhX58xoeiuaTTYi+4pM2
	oQKWpXO7xugYUlSgJATw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFH1a-00449S-2p;
	Fri, 30 Jun 2023 16:31:10 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFH1Y-00448H-0c
	for linux-amlogic@lists.infradead.org;
	Fri, 30 Jun 2023 16:31:09 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3fbac8b01b3so18213525e9.1
        for <linux-amlogic@lists.infradead.org>; Fri, 30 Jun 2023 09:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688142667; x=1690734667;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=f0qt0frxxKKp+v1aQwP5ebt6u2uU8PqBkcHGbpgYSx0=;
        b=jN13Cff+QWLqExNK/0jHIyoZOp/FRgNBzMHvGbweedixXHCqCflaAc6VmRQnLRCMl6
         QkVeRYiT/2M1iiJSJlIXXALVquw0GX7iHQ/tcw/CYisZ+uCL+KFzwqT9AaMh8n1r4MT8
         llpOy5LqrCCuQVNyQrDiuQvEOHwRMP88unjVy9pAIPg9EYhZ1m9sHzHl+m2qMO9zjD3G
         gxhBDy9R/OMZOfLhJYEoE1ZfuoS4g9VTcHUK1aqiWBvuMSYa4iGL+VMip2i9qluz11Yc
         aRQYQ82NQ0m7PdlLjlCtGsvmh1DurWT3BzKsHhhMfQom9ZXTtHUfZvyvnLD6EJK1MqTT
         palg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688142667; x=1690734667;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f0qt0frxxKKp+v1aQwP5ebt6u2uU8PqBkcHGbpgYSx0=;
        b=I0P8Azei/5+ySji8o9GuaJOEps5GaqdV+WJMGjxcyOzXcPpKkOOb8j3hx7FSmw8S53
         gCxdcavSnZVxvA9RmkbRCr1sPi6SQ51/0hAztKMZnwYTnkmMaqw5Rg5smsxMyhuTpv7U
         q8Nym1GJK5a7jbiFUy/b40CX3avf0KVzNjCJGZZ2D0I4Eq2GPfOyyVApTbfVrETK3oVw
         2MGap/FaVw2xvxD7eSn16U3mW84txTTmO2HYyydtkyFsuMgxRl9zvC/AwYkZwXybpzPK
         xeB5QNcr6wjm8Vsrw4/vsYs9lh3t23WBXMADmSEYQhIVcv/0uxKlx4rSbCnLZ15OIMBM
         NQUA==
X-Gm-Message-State: ABy/qLauF/45Bn3CCN9g75BdYQGibnoILoa9EX8eWkH9SlY0eyaxuEu0
	Uqnv2/09/CpMa1ASA3xpn4xvBw==
X-Google-Smtp-Source: APBJJlFRXVru6bzc3ZqFIQTYVBOPXO2D4SZ1ANqnJwL4EQVagGGQD26rE+6763+kt6xCmMZbnxmibw==
X-Received: by 2002:a5d:69cf:0:b0:307:7959:6461 with SMTP id s15-20020a5d69cf000000b0030779596461mr2768421wrw.31.1688142666708;
        Fri, 30 Jun 2023 09:31:06 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:eac6:eb92:cae4:cfd2? ([2a01:e0a:982:cbb0:eac6:eb92:cae4:cfd2])
        by smtp.gmail.com with ESMTPSA id d13-20020a5d4f8d000000b003063db8f45bsm18645263wru.23.2023.06.30.09.31.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jun 2023 09:31:04 -0700 (PDT)
Message-ID: <1f190620-2c83-0dce-b295-fa1a2860312e@linaro.org>
Date: Fri, 30 Jun 2023 18:31:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/3] dt-bindings: reset: Add compatible and DT bindings
 for Meson-C3 Reset Controller
Content-Language: en-US
To: zelong dong <zelong.dong@amlogic.com>, narmstrong@baylibre.com,
 p.zabel@pengutronix.de, khilman@baylibre.com,
 Rob Herring <robh+dt@kernel.org>, martin.blumenstingl@googlemail.com
Cc: linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com,
 devicetree@vger.kernel.org, kelvin.zhang@amlogic.com
References: <20230630121059.28748-1-zelong.dong@amlogic.com>
 <20230630121059.28748-2-zelong.dong@amlogic.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230630121059.28748-2-zelong.dong@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_093108_247383_F0225B29 
X-CRM114-Status: GOOD (  16.06  )
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

On 30/06/2023 14:10, zelong dong wrote:
> From: Zelong Dong <zelong.dong@amlogic.com>
> 
> Add new compatible and DT bindings for Amlogic's Meson-C3 Reset Controller
> 
> Change-Id: Ie8941818bde5b736689e43367f66827c5bc0449e

Please drop Change-Id when sending patches upstream, same for patch 2

Thanks,
Neil

> Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
> ---
>   .../bindings/reset/amlogic,meson-reset.yaml   |   1 +
>   .../reset/amlogic,meson-c3-reset.h            | 119 ++++++++++++++++++
>   2 files changed, 120 insertions(+)
>   create mode 100644 include/dt-bindings/reset/amlogic,meson-c3-reset.h
> 
> diff --git a/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml b/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
> index d3fdee89d4f8..cf1da9f7bc51 100644
> --- a/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
> +++ b/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
> @@ -18,6 +18,7 @@ properties:
>         - amlogic,meson-axg-reset # Reset Controller on AXG and compatible SoCs
>         - amlogic,meson-a1-reset # Reset Controller on A1 and compatible SoCs
>         - amlogic,meson-s4-reset # Reset Controller on S4 and compatible SoCs
> +      - amlogic,meson-c3-reset # Reset Controller on C3 and compatible SoCs
>   
>     reg:
>       maxItems: 1
> diff --git a/include/dt-bindings/reset/amlogic,meson-c3-reset.h b/include/dt-bindings/reset/amlogic,meson-c3-reset.h
> new file mode 100644
> index 000000000000..24b39d60b2f7
> --- /dev/null
> +++ b/include/dt-bindings/reset/amlogic,meson-c3-reset.h
> @@ -0,0 +1,119 @@
> +/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
> +/*
> + * Copyright (c) 2023 Amlogic, Inc. All rights reserved.
> + */
> +
> +#ifndef _DT_BINDINGS_AMLOGIC_MESON_C3_RESET_H
> +#define _DT_BINDINGS_AMLOGIC_MESON_C3_RESET_H
> +
> +/* RESET0 */
> +/*						0-3 */
> +#define RESET_USBCTRL				4
> +/*						5-7 */
> +#define RESET_USBPHY20				8
> +/*						9 */
> +#define RESET_USB2DRD				10
> +#define RESET_MIPI_DSI_HOST			11
> +#define RESET_MIPI_DSI_PHY			12
> +/*						13-20 */
> +#define RESET_GE2D				21
> +#define RESET_DWAP				22
> +/*						23-31 */
> +
> +/* RESET1 */
> +#define RESET_AUDIO				32
> +/*						33-34 */
> +#define RESET_DDRAPB				35
> +#define RESET_DDR				36
> +#define RESET_DOS_CAPB3				37
> +#define RESET_DOS				38
> +/*						39-46 */
> +#define RESET_NNA				47
> +#define RESET_ETHERNET				48
> +#define RESET_ISP				49
> +#define RESET_VC9000E_APB			50
> +#define RESET_VC9000E_A				51
> +/*						52 */
> +#define RESET_VC9000E_CORE			53
> +/*						54-63 */
> +
> +/* RESET2 */
> +#define RESET_ABUS_ARB				64
> +#define RESET_IRCTRL				65
> +/*						66 */
> +#define RESET_TEMP_PII				67
> +/*						68-72 */
> +#define RESET_SPICC_0				73
> +#define RESET_SPICC_1				74
> +#define RESET_RSA				75
> +
> +/*						76-79 */
> +#define RESET_MSR_CLK				80
> +#define RESET_SPIFC				81
> +#define RESET_SAR_ADC				82
> +/*						83-87 */
> +#define RESET_ACODEC				88
> +/*						89-90 */
> +#define RESET_WATCHDOG				91
> +/*						92-95 */
> +
> +/* RESET3 */
> +#define RESET_ISP_NIC_GPV			96
> +#define RESET_ISP_NIC_MAIN			97
> +#define RESET_ISP_NIC_VCLK			98
> +#define RESET_ISP_NIC_VOUT			99
> +#define RESET_ISP_NIC_ALL			100
> +#define RESET_VOUT				101
> +#define RESET_VOUT_VENC				102
> +/*						103 */
> +#define RESET_CVE_NIC_GPV			104
> +#define RESET_CVE_NIC_MAIN			105
> +#define RESET_CVE_NIC_GE2D			106
> +#define RESET_CVE_NIC_DW			106
> +#define RESET_CVE_NIC_CVE			108
> +#define RESET_CVE_NIC_ALL			109
> +#define RESET_CVE				110
> +/*						112-127 */
> +
> +/* RESET4 */
> +#define RESET_RTC				128
> +#define RESET_PWM_AB				129
> +#define RESET_PWM_CD				130
> +#define RESET_PWM_EF				131
> +#define RESET_PWM_GH				132
> +#define RESET_PWM_IJ				133
> +#define RESET_PWM_KL				134
> +#define RESET_PWM_MN				135
> +/*						136-137 */
> +#define RESET_UART_A				138
> +#define RESET_UART_B				139
> +#define RESET_UART_C				140
> +#define RESET_UART_D				141
> +#define RESET_UART_E				142
> +#define RESET_UART_F				143
> +#define RESET_I2C_S_A				144
> +#define RESET_I2C_M_A				145
> +#define RESET_I2C_M_B				146
> +#define RESET_I2C_M_C				147
> +#define RESET_I2C_M_D				148
> +/*						149-151 */
> +#define RESET_SD_EMMC_A				152
> +#define RESET_SD_EMMC_B				153
> +#define RESET_SD_EMMC_C				154
> +
> +/* RESET5 */
> +/*						160-172 */
> +#define RESET_BRG_NIC_NNA			173
> +#define RESET_BRG_MUX_NIC_MAIN			174
> +#define RESET_BRG_AO_NIC_ALL			175
> +/*						176-183 */
> +#define RESET_BRG_NIC_VAPB			184
> +#define RESET_BRG_NIC_SDIO_B			185
> +#define RESET_BRG_NIC_SDIO_A			186
> +#define RESET_BRG_NIC_EMMC			187
> +#define RESET_BRG_NIC_DSU			188
> +#define RESET_BRG_NIC_SYSCLK			189
> +#define RESET_BRG_NIC_MAIN			190
> +#define RESET_BRG_NIC_ALL			191
> +
> +#endif


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
