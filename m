Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45C80EB64DC
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Jul 2023 09:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ixAjOLVf0u/HOOOqjuTPM1m7ekqD0aWWJ0tuMjELCUI=; b=V9Duyq/4qZ3xLfIWUJClcXp7QN
	lLqMJ6Hwp8XcH356IaKGca1m/UKN7cBWgUvKAzGS6PFe4indKEEwl6A4RUIeoi9L/YcHUV6nV9yxW
	Fq4fXjusmQkbAfFmtbzhPaCt7cpGODVwXDpzyxkRWQChi1G6mwl0QeIw96qTD+0arRUIDuDv9cSpP
	Q+t4soa+zA6WnhoefwB5afXDo7UeZE/o/2lRUk4pFoTW/LgckiLucrDpAYhEi9VzkUKnCeBcyvsrc
	ItNYspRj7BPYOuhkFnZv9Ag+Qpt7YPcODbgYyBzC/PSWVpOiuRuJbF3GOKqUiHte4o1P4TlrwaPC0
	JaBJFtuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGG8Q-009zIF-29;
	Mon, 03 Jul 2023 09:46:18 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGG8O-009zFy-0R
	for linux-amlogic@lists.infradead.org;
	Mon, 03 Jul 2023 09:46:17 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3fbc54cab6fso33746555e9.0
        for <linux-amlogic@lists.infradead.org>; Mon, 03 Jul 2023 02:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688377574; x=1690969574;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6YxmwD91c/+NBVGd4LTXYec9yyX92sVVNyvoTP8SC/o=;
        b=rfe7q1paV04u4WMl2xsU7lXAnbdFMZx3b98Y7omL3Ya/ErjM/UypQeramJBzF7nK5A
         r9FeN4Ppms24FWznaT7iptXS/rC8JuUsRurTKuUPy638lv4Zn/h1Pi/lFdPaXd+IW4aN
         m54fPBVbptaX5O6nD5ujFMeeYzUvATviaE7zGOwnL2x9fUc1wLnQrNZ4tVG+ejSr9sKT
         OR4RxYHsJXXXh/Jc1y/IsyRpzhWvpGO81S5CClAEEqWs3KwpvvJ/xmi6FqmJHU9EuAPm
         LV2Dj1UD1zMawzkZQO4q0VQLAbyxJUvsFw8Xgvog73z6q5a+KPTCENFObGQOMRGnt2S1
         K6KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688377574; x=1690969574;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6YxmwD91c/+NBVGd4LTXYec9yyX92sVVNyvoTP8SC/o=;
        b=irT+5R4Lkpj82xf3HxAhLE0RTJPuupcH5X6ICOtcbD2VHQXkKd/mXseBnX7QgfCcRX
         HAQEfg1VOpIHrjKNETq7Kov/CbcVmbFA1xWa14ekNxXkAV4v/ZYpT34JXtQoqZeZvM2S
         7Tmn1d43mem7GFSXHGCGcdKPHTmcwYcprUsn67FQzx/++aKbYvVgJSXuTm7W1JjlHX/B
         jNoj73ePP9Y5hLx3TY5giV2Mi1o7C4Yr8iuQoRrC2z4i7WsPYCOKvETZNvO21ylC06xI
         b2HTpmwRCvSp3ab0cRwZ7Q8lOQ/j0673jW1Fs+2NNjY287YuNcCJoxyyAKZtfN7ZxTSo
         0rzg==
X-Gm-Message-State: AC+VfDw4hwpqAMGXqLBVHaCiCexMY82KH7q2aw7HM18IfJI9y2o/BgNq
	ZxRN1dXLYhjV+R6zPegjiSB3dw==
X-Google-Smtp-Source: ACHHUZ62MFIGNzgH7SOGMy5RT90Dhl2wwmF8IgM0LWybqYaqf1zNtnma7n2jx1U7QDJVyjPicJrkFw==
X-Received: by 2002:a05:600c:2114:b0:3fa:8874:fe69 with SMTP id u20-20020a05600c211400b003fa8874fe69mr7601791wml.29.1688377574572;
        Mon, 03 Jul 2023 02:46:14 -0700 (PDT)
Received: from [192.168.7.21] (679773502.box.freepro.com. [212.114.21.58])
        by smtp.gmail.com with ESMTPSA id x19-20020a1c7c13000000b003fbb0c01d4bsm14432177wmc.16.2023.07.03.02.46.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jul 2023 02:46:14 -0700 (PDT)
Message-ID: <296e4ed1-29ec-cfbc-1843-43c16b87e416@linaro.org>
Date: Mon, 3 Jul 2023 11:46:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v7 0/4] Add Amlogic A311D2 and Khadas Vim4 Board Support
Content-Language: en-US
To: Lucas Tanure <tanure@linux.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Nick <nick@khadas.com>, Artem <art@khadas.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20230629073419.207886-1-tanure@linux.com>
Organization: Linaro Developer Services
In-Reply-To: <20230629073419.207886-1-tanure@linux.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_024616_174774_00ABD05E 
X-CRM114-Status: GOOD (  21.23  )
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

Hi Lucas,

On 29/06/2023 09:34, Lucas Tanure wrote:
> The Khadas VIM4 uses the Amlogic A311D2 SoC, based on the Amlogic T7 family.
> This chip is not the same as A311D used in Vim3 board.
> 
> Work based on Khadas 5.4 branch:
> https://github.com/khadas/linux/tree/khadas-vims-5.4.y
> 
> The current status is Vim4 board booting to emergency shell via uart.
> 
> Board Features:
> - 8GB LPDDR4X 2016MHz
> - 32GB eMMC 5.1 storage
> - 32MB SPI flash
> - 10/100/1000 Base-T Ethernet
> - AP6275S Wireless (802.11 a/b/g/n/ac/ax, BT5.1)
> - HDMI 2.1 video
> - HDMI Input
> - 1x USB 2.0 + 1x USB 3.0 ports
> - 1x USB-C (power) with USB 2.0 OTG
> - 3x LED's (1x red, 1x blue, 1x white)
> - 3x buttons (power, function, reset)
> - M2 socket with PCIe, USB, ADC & I2C
> - 40pin GPIO Header
> - 1x micro SD card slot

I've applied patches 1 & 4, now you can send the serie with only uart changes,
it will simplify Greg's life.

Thanks,
Neil

> 
> Changes Since v6:
>   - Move Uart clock to amlogic-t7-a311d2-khadas-vim4 dts
>   - Fix GIC_CPU_MASK_SIMPLE
>   - Lowercase uart label
> 
> Changes Since v5:
>   - Remove meson as T7 its not a meson chip
>   - Change Uart Document descript to S4 compatibles
> 
> Changes Since v4:
>   - Use S4 instead of G12a for uart fallback
>   - Add OF_EARLYCON_DECLARE for T7 uart
> 
> Changes Since v3:
>   - Fix issues with "amlogic,meson-t7-uart" documentation
> 
> Changes Since v2:
>   - Add "amlogic,meson-t7-uart" documentation
> 
> Changes Since v1:
>   - Drop the T7 clock driver as it is not needed for serial boot. It will
>   later use the S4 clock
>   driver as S4 and  T7 seems to be similar chips.
>   - Use "arm,gic-400" for interrupt controller to fix dtb_check
>   - Remove CPU node properties not needed for serial boot
>   - Move UART node to apb4 node
>   - Drop T7 UART compatible line and use S4 uart
>   - Use psci V1 instead of 0.2, it works, but I can't verify is correct
>   as the datasheet I have
>   doesn't contain that information.
>   - Remove compatible from meson-t7.dtsi, move it to vim4 board dts
>   - Add memory node with 8GB. Not sure about this one, works without,
>   but doesn't detect 8GB
>   - Use defines for GIC_CPU_MASK_SIMPLE, IRQ_TYPE_LEVEL_LOW,
>   IRQ_TYPE_LEVEL_HIGH instead of hardcoded values
> 
> Lucas Tanure (4):
>    dt-bindings: arm: amlogic: add Amlogic A311D2 bindings
>    dt-bindings: serial: amlogic,meson-uart: Add compatible string for T7
>    tty: serial: meson: Add a earlycon for the T7 SoC
>    arm64: dts: amlogic-t7-a311d2-khadas-vim4: add initial device-tree
> 
>   .../devicetree/bindings/arm/amlogic.yaml      |   7 +
>   .../bindings/serial/amlogic,meson-uart.yaml   |   4 +
>   arch/arm64/boot/dts/amlogic/Makefile          |   1 +
>   .../amlogic/amlogic-t7-a311d2-khadas-vim4.dts |  54 ++++++
>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi   | 155 ++++++++++++++++++
>   drivers/tty/serial/meson_uart.c               |   2 +
>   6 files changed, 223 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
>   create mode 100644 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> 
> --
> 2.41.0
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
