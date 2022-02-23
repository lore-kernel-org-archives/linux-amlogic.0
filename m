Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A346DC433EF
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Feb 2022 18:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qh8VB7QvxruslWGcp3XuDCO6rwt/Kn55LLyc7qaGs0k=; b=U/wyhDWwpJgO58
	LU+ToUW7hJYsOYAsDb8Pwjxco2C7JClu2KZOiPuXTDBkaDHCY74URYimD9/d1+OQXSxDmnc6PN1gb
	fmwpHyUIyXRKpH2pwkZQGiA5gUCi8oznSO9q6vnMO/Z4OGcHErJZQRBRzQn2UOFV2/S7MbjP3KBT0
	dO98bo4VyXOXIizQ+zfbBU4PFZhswosQT4G0rcKIE3gAMxHoow/OT+3lYjFySgnrraK57UInNfDN8
	o6+cDC8dxf7JERbqRrzF1vpks3twCpMLnbb7Sc/uVXKypMH07ilU1Wrex69lucgVNP3+RNEnmA9y6
	jNEStalDVJ307nHVjDuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMvzc-00FeBa-0k; Wed, 23 Feb 2022 18:04:00 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMvyL-00Fdcr-UY; Wed, 23 Feb 2022 18:02:44 +0000
Received: by mail-ej1-x631.google.com with SMTP id a8so54289431ejc.8;
 Wed, 23 Feb 2022 10:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=kKy0SIhSKIu0kr4V4JEIbxoglz4OmTrfglh5tt6nsYg=;
 b=k5evABcfUyMDmcpbRWLMKTTEaE66zAD51+aTidnEBLz/X0eLhEfO4FfyJROQfgKKkZ
 6NFb0sXaXWJXY4YS2U50ElYdvQcEPC3gtcXu/5zIued4WEl/3wU3n4B2GwqLFVuu2Mp5
 hAJTUC7df+NVZTVWBjobcwliXZEz4e4GljvtB1kbs5m/qTrDGWxz6AsrMnZZfTtlVqMf
 wvws7+tf6RPO1f5b48wBrNRKEdOSFUDUtdnma0e8Zd7I0eKgJwfqRp4eEwarceFzh+Qv
 YlPE0PSGOIA3drZxTWuyFj+SfjB/u86wgMNEE6wgRLvgk81gIEn5/LJyeFVCnRvwg6Gx
 goag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=kKy0SIhSKIu0kr4V4JEIbxoglz4OmTrfglh5tt6nsYg=;
 b=nuAPQ/8BDfFAQq6SOPEnmq8AUEl6ka29isXpLO1EK+aKcKceG3nopOx7bR5c/ctRtC
 gIphYaOPsigGCARwTgUnpu+2mnEP8RPuii/Qz7Qk2+BqpH7JcvKPdRV198e6kpHIbu2C
 mNiCHze+agddAUz+UniDjeMwVcnEY66HqAAz4+Nrfnl9Z5fTtFp8UoBThFJRrGJs7F9f
 iNTMFfH5FFLJHCCL6wtUMjeF/bQhoI0kt+ArK/NpXC6e9exZzqXL022C2mnLXH6HiAii
 gbwsypFR/CQLYeY0P6fkIp9T8TZbDJaPsHZ17NE/79imz2Lzs0df62r1xW6XpnvlUSqd
 NtzQ==
X-Gm-Message-State: AOAM530jTPX08Kbd0zUjohjbhE/OzOcV1G5RI8O7Lh6Sm2tGLBPrDDB3
 rbshNgtTUp/6YuwV/jPgs1k=
X-Google-Smtp-Source: ABdhPJw5Ridx0IVbRGILzyG7eR4owfLekmgpSCrFo3IamQ1/zAZc80600sF7xC0hx1HShrZ57axLlA==
X-Received: by 2002:a17:906:91c8:b0:6c5:76a6:688b with SMTP id
 b8-20020a17090691c800b006c576a6688bmr719712ejx.174.1645639360129; 
 Wed, 23 Feb 2022 10:02:40 -0800 (PST)
Received: from ?IPV6:2003:ea:8f4d:2b00:d12c:c0a:f603:b44d?
 (p200300ea8f4d2b00d12c0c0af603b44d.dip0.t-ipconnect.de.
 [2003:ea:8f4d:2b00:d12c:c0a:f603:b44d])
 by smtp.googlemail.com with ESMTPSA id d18sm148151ejd.95.2022.02.23.10.02.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 10:02:39 -0800 (PST)
Message-ID: <b0cb189b-8015-bf2b-5852-b2e42bc79bb2@gmail.com>
Date: Wed, 23 Feb 2022 19:02:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: [PATCH v3 5/5] arm64: dts: meson-gxl-s905w-tx3-mini: add support for
 the 7 segment display
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
 Miguel Ojeda <ojeda@kernel.org>
Cc: "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Geert Uytterhoeven <geert+renesas@glider.be>
References: <4eb7b036-a9b9-3bd2-4e84-f56ba4b1a740@gmail.com>
In-Reply-To: <4eb7b036-a9b9-3bd2-4e84-f56ba4b1a740@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_100242_036107_E75E750E 
X-CRM114-Status: GOOD (  10.27  )
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

This patch adds support for the 7 segment display of the device.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 .../dts/amlogic/meson-gxl-s905w-tx3-mini.dts  | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-tx3-mini.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-tx3-mini.dts
index 6705c2082..20bbd931e 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-tx3-mini.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-tx3-mini.dts
@@ -10,6 +10,7 @@
 
 #include "meson-gxl-s905x.dtsi"
 #include "meson-gx-p23x-q20x.dtsi"
+#include <dt-bindings/leds/common.h>
 
 / {
 	compatible = "oranth,tx3-mini", "amlogic,s905w", "amlogic,meson-gxl";
@@ -19,6 +20,64 @@ memory@0 {
 		device_type = "memory";
 		reg = <0x0 0x0 0x0 0x40000000>; /* 1 GiB or 2 GiB */
 	};
+
+	spi {
+		compatible = "spi-gpio";
+		sck-gpios = <&gpio GPIODV_27  GPIO_ACTIVE_HIGH>;
+		mosi-gpios = <&gpio GPIODV_26 GPIO_ACTIVE_HIGH>;
+		cs-gpios = <&gpio_ao GPIOAO_4 GPIO_ACTIVE_LOW>;
+		num-chipselects = <1>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		tm1628: led-controller@0 {
+			compatible = "titanmec,tm1628";
+			reg = <0>;
+			spi-3wire;
+			spi-lsb-first;
+			spi-rx-delay-us = <1>;
+			spi-max-frequency = <500000>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+
+			segment-mapping = /bits/ 8 <4 5 6 1 2 3 7>;
+			grid = /bits/ 8 <4 3 2 1>;
+
+			alarm@5,1 {
+				reg = <5 1>;
+				function = LED_FUNCTION_ALARM;
+			};
+
+			usb@5,2 {
+				reg = <5 2>;
+				function = LED_FUNCTION_USB;
+			};
+			play@5,3 {
+				reg = <5 3>;
+				function = "play";
+			};
+
+			pause@5,4 {
+				reg = <5 4>;
+				function = "pause";
+			};
+
+			colon@5,5 {
+				reg = <5 5>;
+				function = "colon";
+			};
+
+			lan@5,6 {
+				reg = <5 6>;
+				function = LED_FUNCTION_LAN;
+			};
+
+			wlan@5,7 {
+				reg = <5 7>;
+				function = LED_FUNCTION_WLAN;
+			};
+		};
+	};
 };
 
 &ir {
-- 
2.35.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
