Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 374B8C36002
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Mar 2025 07:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hz9G0bwlB59TdXFrmJKC0qmWQUK2EzIPH82Wbow54jk=; b=1MRyUryjpddLbJmjvOQm+LF8tK
	nF/Pk9y04pEZFpOr1I+h/ze/Fdgt8vo+zBJVzia1evpJq+5f3CL8BttgkdKRHw+tHy5YMZGu9Ou9A
	1GPaDS+Io0rX9ajbnJfRZzHAMqo0m8vYUQ3eTf8dDBRrXThx3v3zF3azFmaEMWhYt2Dvw1BKGIOUg
	fMLr8++MND85BL2eYhJHpjewkyoI/oq0ggc4UnPc7miCMLnY4od1gC1rWDtq8Ugwi59oMrAG7aLJa
	fT2SjRNQjTBLCCjr5twDmH/zjjLDNt6Xa9xTY+fWIMJYFBH+CE+7Z692w9eRZH/6gfdo5e5VwhsCG
	BjRmB3Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twbzb-00000002Psz-3BRN;
	Mon, 24 Mar 2025 07:13:03 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twbtZ-00000002Oo4-4AQC
	for linux-amlogic@lists.infradead.org;
	Mon, 24 Mar 2025 07:06:51 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-38a25d4b9d4so2077864f8f.0
        for <linux-amlogic@lists.infradead.org>; Mon, 24 Mar 2025 00:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742800008; x=1743404808; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R5gCTHqi5RXz4RfxlVIq8tZmJ5xAwfohObZ7yBTeoI8=;
        b=I1TO30yw8VCPrha/RYN+B3SLoLtuKyVWSMj4ZRERIQpqkX9NW5g7+ut16yf9GMJWCS
         xoe1SwxNBfnvAeG+s9BJPrgpHAMSQnRZpJGmdelZIw6hmCkrFXjMyNT0Oxxh3zfSicYL
         1Rq1DI8SE0dNo/ctbLktcBwEJBoucKJ+8FHA2eYZH/4fW+UbO1DzP29cX+zf4uA3Hx0+
         f2YzgCGIxa+PeG7/XZzzdSihFIRejJEmO3BV+5xXllU2X8CzNws2LSi2GYPwKNfAfQQE
         Kg0EemfttKWM0CdlaXn8nMWHRYFJYACuctbptEHPkAilKr6ib9xuaqhXVGsngHrzxWV3
         V7NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742800008; x=1743404808;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=R5gCTHqi5RXz4RfxlVIq8tZmJ5xAwfohObZ7yBTeoI8=;
        b=n8dxQGTXbZ8cx8FHXkuQqr1KaIStxgR/OMqz/nOJg5pY/HcNdliMUPRY7V2zJ+48WG
         6Wqs3LROIQQJhXYzlnEZcJSmXNuYHeHI2ZFH9oyiE8B/1vrokhPOq9Wku6/+wHmdwu1A
         a9GWfpoC1SdmpRLGSMvT8DN1O53QSaY0MHTtJr911NPHHUtou3HOk4OkB9yUuq19vLHq
         8F0xcDp/LxRz0is+aQsxa35cGWW5e1JI3X2rUPaLtVFkItPTDtK9vOJklsuJ2IxVRtoR
         bePgLTFxSfL7n98Niolz9xlwn5jiH/NXtX3gG6MqyGm3M86JhEE31QGu1gT754Qf88BO
         zeeg==
X-Forwarded-Encrypted: i=1; AJvYcCUVLw8tsg7qile43pnsc/FbolfIketFW3Bx7Ia3r+3RRHbkeCLNCj8rYU4PJQHRf5x+SC33THbDr62kkknw@lists.infradead.org
X-Gm-Message-State: AOJu0Ywv+akNcU8JHH0/DVmr6QcRi+c41DayvJI6lUpAJqqvRSa1cII8
	Go3OSU+UKuQmg4oeVaaJJAKnS/+Abp2PVbV/dWmUgwGx7+6bHSs13OcUcoEzVUM=
X-Gm-Gg: ASbGncsMM3Qt546oVLFx3Qmb31MiDl1A2TEhwAY7z0j6FOBfM2HedC7xx4ad20sBoNR
	And5ttna1/AsUbuoZ6/GJerfuaEKYtf0D8Fb4YgxO/aJQCBwLpLd/mpaXW2+MXnTK7vL8dVDShA
	GhENYz3Chs5sHBm5zjIBHAnXnlUttJWiP/bqrVaPGRkeHdoOWkWLLiqvqfRq93MkGrM5dzV+lZa
	LQASzksX0yD8TqEPuiwzsyaHgJX2fUi8NkfUn/JPLxlrGxciAGlYdASO2XUqEkyzwdEHTZOqaWD
	VVgOUrdMqzG0v8DZNk+08vPkfl1BzjLR6lZRPLzG/t+C+gaWSLQ62Sc95JbGeY/nFoAfooZyF+Z
	x/at+s1JfJHoZRuBG
X-Google-Smtp-Source: AGHT+IHPuC+hLaYBHOASKlqZMU4X4ISor3sOVKvUnkvmOWB16uZ4LvwNA+ulTX9xjUSyrlovjePGvQ==
X-Received: by 2002:a05:6000:1842:b0:391:2c09:bdef with SMTP id ffacd0b85a97d-3997f9261d0mr9315513f8f.30.1742800008211;
        Mon, 24 Mar 2025 00:06:48 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:a356:8d0:d4d:bb5f? ([2a01:e0a:3d9:2080:a356:8d0:d4d:bb5f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f995a05sm9931047f8f.8.2025.03.24.00.06.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 00:06:47 -0700 (PDT)
Message-ID: <3ca650ec-d0f2-453b-9770-5e5bbe7a75f0@linaro.org>
Date: Mon, 24 Mar 2025 08:06:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 3/3] arm64: dts: amlogic: Add A5 Reset Controller
To: kelvin.zhang@amlogic.com, Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Zelong Dong <zelong.dong@amlogic.com>
References: <20250320-a4-a5-reset-v5-0-296f83bf733d@amlogic.com>
 <20250320-a4-a5-reset-v5-3-296f83bf733d@amlogic.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20250320-a4-a5-reset-v5-3-296f83bf733d@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_000650_045852_D4868037 
X-CRM114-Status: GOOD (  15.39  )
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

On 20/03/2025 10:42, Kelvin Zhang via B4 Relay wrote:
> From: Zelong Dong <zelong.dong@amlogic.com>
> 
> Add the device node and related header file for Amlogic
> A5 reset controller.
> 
> Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
> Link: https://lore.kernel.org/r/20240918074211.8067-4-zelong.dong@amlogic.com
> Signed-off-by: Kelvin Zhang <kelvin.zhang@amlogic.com>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-a5-reset.h | 95 ++++++++++++++++++++++++++
>   arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi    |  8 +++
>   2 files changed, 103 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a5-reset.h b/arch/arm64/boot/dts/amlogic/amlogic-a5-reset.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..cdf0f515962097c606e4c53badb19df7d21606ec
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-a5-reset.h
> @@ -0,0 +1,95 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
> +/*
> + * Copyright (c) 2024 Amlogic, Inc. All rights reserved.
> + */
> +
> +#ifndef __DTS_AMLOGIC_A5_RESET_H
> +#define __DTS_AMLOGIC_A5_RESET_H
> +
> +/* RESET0 */
> +/*						0-3 */
> +#define RESET_USB				4
> +/*						5-7 */
> +#define RESET_USBPHY20				8
> +/*						9 */
> +#define RESET_USB2DRD				10
> +/*						11-31 */
> +
> +/* RESET1 */
> +#define RESET_AUDIO				32
> +#define RESET_AUDIO_VAD				33
> +/*                                              34 */
> +#define RESET_DDR_APB				35
> +#define RESET_DDR				36
> +/*						37-40 */
> +#define RESET_DSPA_DEBUG			41
> +/*                                              42 */
> +#define RESET_DSPA				43
> +/*						44-46 */
> +#define RESET_NNA				47
> +#define RESET_ETHERNET				48
> +/*						49-63 */
> +
> +/* RESET2 */
> +#define RESET_ABUS_ARB				64
> +#define RESET_IRCTRL				65
> +/*						66 */
> +#define RESET_TS_PLL				67
> +/*						68-72 */
> +#define RESET_SPICC_0				73
> +#define RESET_SPICC_1				74
> +#define RESET_RSA				75
> +
> +/*						76-79 */
> +#define RESET_MSR_CLK				80
> +#define RESET_SPIFC				81
> +#define RESET_SAR_ADC				82
> +/*						83-90 */
> +#define RESET_WATCHDOG				91
> +/*						92-95 */
> +
> +/* RESET3 */
> +/*						96-127 */
> +
> +/* RESET4 */
> +#define RESET_RTC				128
> +/*						129-131 */
> +#define RESET_PWM_AB				132
> +#define RESET_PWM_CD				133
> +#define RESET_PWM_EF				134
> +#define RESET_PWM_GH				135
> +/*						104-105 */
> +#define RESET_UART_A				138
> +#define RESET_UART_B				139
> +#define RESET_UART_C				140
> +#define RESET_UART_D				141
> +#define RESET_UART_E				142
> +/*						143*/
> +#define RESET_I2C_S_A				144
> +#define RESET_I2C_M_A				145
> +#define RESET_I2C_M_B				146
> +#define RESET_I2C_M_C				147
> +#define RESET_I2C_M_D				148
> +/*						149-151 */
> +#define RESET_SDEMMC_A				152
> +/*						153 */
> +#define RESET_SDEMMC_C				154
> +/*						155-159*/
> +
> +/* RESET5 */
> +/*						160-175 */
> +#define RESET_BRG_AO_NIC_SYS			176
> +#define RESET_BRG_AO_NIC_DSPA			177
> +#define RESET_BRG_AO_NIC_MAIN			178
> +#define RESET_BRG_AO_NIC_AUDIO			179
> +/*						180-183 */
> +#define RESET_BRG_AO_NIC_ALL			184
> +#define RESET_BRG_NIC_NNA			185
> +#define RESET_BRG_NIC_SDIO			186
> +#define RESET_BRG_NIC_EMMC			187
> +#define RESET_BRG_NIC_DSU			188
> +#define RESET_BRG_NIC_SYSCLK			189
> +#define RESET_BRG_NIC_MAIN			190
> +#define RESET_BRG_NIC_ALL			191
> +
> +#endif
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
> index 32ed1776891bc7d1befd01a76c76048631606f5a..b1da8cbaa25a1844312a23bc39eb876df3c60df5 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
> @@ -4,6 +4,7 @@
>    */
>   
>   #include "amlogic-a4-common.dtsi"
> +#include "amlogic-a5-reset.h"
>   #include <dt-bindings/power/amlogic,a5-pwrc.h>
>   / {
>   	cpus {
> @@ -50,6 +51,13 @@ pwrc: power-controller {
>   };
>   
>   &apb {
> +	reset: reset-controller@2000 {
> +		compatible = "amlogic,a5-reset",
> +			     "amlogic,meson-s4-reset";
> +		reg = <0x0 0x2000 0x0 0x98>;
> +		#reset-cells = <1>;
> +	};
> +
>   	gpio_intc: interrupt-controller@4080 {
>   		compatible = "amlogic,a5-gpio-intc",
>   			     "amlogic,meson-gpio-intc";
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
