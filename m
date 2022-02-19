Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE92C433EF
	for <linux-amlogic@archiver.kernel.org>; Sat, 19 Feb 2022 13:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qh8VB7QvxruslWGcp3XuDCO6rwt/Kn55LLyc7qaGs0k=; b=ntY0Y7dTU3F4WL
	i4+AeDJJfQL9+ZTed/2iuwcESDgr1UY+kdL9Q/TomAeYVgsBLZH8xZw3bm/JQ/Unn9ISdQpnelyAs
	/ttrRwb0UZPJI8CMhwjTG+W6RNaDX7np63/ReW/5ybyfBByxwKvYslcGaKudWSyH+OpnQ3IPZLuO1
	OsTKVCwCppLxmbbF/uuGaUKmXQH4fzQfHfbGSAuBs2IF8LZuGRchOkm7cNhe++WgPPDXomTOg63Nd
	IDIxfB0uk2uDeWb5I8SUvNHfLn0aCMOiCZBkGlOVrvr36WpiGOw1W8MI8I1Le+rIISOwfVhviHZ1v
	Zk7KTXQZZi1QJXbol1WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nLPhg-00GxLn-M5; Sat, 19 Feb 2022 13:23:12 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nLPgB-00Gwb0-Nh; Sat, 19 Feb 2022 13:21:41 +0000
Received: by mail-ed1-x52f.google.com with SMTP id m17so20128127edc.13;
 Sat, 19 Feb 2022 05:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=kKy0SIhSKIu0kr4V4JEIbxoglz4OmTrfglh5tt6nsYg=;
 b=HvdT9JAucpWhsLeiyKmZWgMiivw42j1g4brDgT0HYkHdFm7cuv08RqQ+Yd7vR0Am++
 eniGJ6ZcwKrAnunlIdeCJXU+CjPjTpl2zpBARlxoLXIARrfRdv8neQr7BLaE6r9+irr1
 ACXnsYsARFhvAIbZCqmGVB+57xjfnRFtrpPTm+2BvIwgepvw+QvR+CdIHrMs8cvmrvYc
 9t+W1y11Ppjg6LwczhsFqJjtXrMRwUWliOP6oTIxfWbJ8mbP6e2Txa3FM56WwoSx7+ZF
 HZ7eaSq61l4YPu7po20/tBL6w8LN9cqSNExUf8/VzCNBMLf2xo0gD9fadPzDq3s8yWgG
 GsSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=kKy0SIhSKIu0kr4V4JEIbxoglz4OmTrfglh5tt6nsYg=;
 b=brECBaH/Sc8QjOwfBAzzV9zmUc327z1bAIS/6amJKPwjptkDiwOQC+Gpm7YAasIHui
 4i6LqQpS5YFeYOjyWhrW2b6zlEywSZsoYjKq/+Tn2nLtXYRC3b8FjCauPctRKN0frG9G
 Hh3tSzC22SIj4oHbsp+IA1+Mb0CM5Hry5djqOZ2CWgELwB+K43xUup2HABi2MsMiA0Mw
 T8Jrb6ZP1byrj6EPglDyzwELZomMVPjPIIKis4XB1mDMY7W2GLPPpP4mudv1ypfHM3s9
 5elSojbv++XZeGK7OORWhjiBb1d4Id8Ipoe7003Dw/O+bhKqKxIIDG6H+FEZ+wtS0ehT
 gnRg==
X-Gm-Message-State: AOAM5300iazwzV6r8hn7bSY3gELqqXkJ4Da+BmBRlZQEMa02zYgeDbWQ
 9ClV6mEaDUZ2LkhmFJLWxHQ=
X-Google-Smtp-Source: ABdhPJxRPAPD6aXevcaRSr1YCJIxTII7mV9dKRp/d1qVz1sKSq4robgQqCvKDvV7unC3MvnXWu+JOA==
X-Received: by 2002:aa7:d592:0:b0:410:b9f9:90f2 with SMTP id
 r18-20020aa7d592000000b00410b9f990f2mr12921325edq.327.1645276897910; 
 Sat, 19 Feb 2022 05:21:37 -0800 (PST)
Received: from ?IPV6:2003:ea:8f4d:2b00:5cf9:df09:c1b3:d44d?
 (p200300ea8f4d2b005cf9df09c1b3d44d.dip0.t-ipconnect.de.
 [2003:ea:8f4d:2b00:5cf9:df09:c1b3:d44d])
 by smtp.googlemail.com with ESMTPSA id h5sm3194476ejo.124.2022.02.19.05.21.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Feb 2022 05:21:37 -0800 (PST)
Message-ID: <251a8c26-4b6e-e0ac-059e-94bb40c673f2@gmail.com>
Date: Sat, 19 Feb 2022 14:21:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: [PATCH 6/6] arm64: dts: meson-gxl-s905w-tx3-mini: add support for the
 7 segment display
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Miguel Ojeda
 <ojeda@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
References: <4172e59f-b9d5-d87d-9dbd-a6f683a2173c@gmail.com>
In-Reply-To: <4172e59f-b9d5-d87d-9dbd-a6f683a2173c@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220219_052139_809121_D61D7CE4 
X-CRM114-Status: GOOD (  10.71  )
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
