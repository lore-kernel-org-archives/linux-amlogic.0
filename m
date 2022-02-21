Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA44CC433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Feb 2022 20:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qh8VB7QvxruslWGcp3XuDCO6rwt/Kn55LLyc7qaGs0k=; b=EwbHlK/IgICBPn
	qsdy72SX3FlchxmPRhPXelnuFNGwe5Oo3qDOOdH4aZE9Ch+sq/3S6wBx579MDgWPrMmmfsaRkNv0q
	uaMgTa3qKRXf9uTV9BTKdZj++/Xbxj5kTEbFoZTUs3NbpNZSjHTY8HyvKBztggPuVx6momo9Xp5Dl
	dnfNyX3ydCVZQvCl66PjN1UiUQ5PtB6E4k1+UNAFvRE4X+2UXdz7xo5DmDNUOPcjNHfxtMslFUUew
	njKtsqHOVsXxbFzZUaLRciXYV9DItpzm5pjWjc4Dyrb6Z4+HwVPlHvr4PcsRoXuh5KkR2BfDVYFb0
	1p+k2ejz2u5GnzVhsBog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMFIs-007C7w-Ag; Mon, 21 Feb 2022 20:29:02 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMFGu-007B4i-5X; Mon, 21 Feb 2022 20:27:01 +0000
Received: by mail-ej1-x634.google.com with SMTP id p9so36127541ejd.6;
 Mon, 21 Feb 2022 12:26:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=kKy0SIhSKIu0kr4V4JEIbxoglz4OmTrfglh5tt6nsYg=;
 b=QhVIXeLafiSQ+OusdmmLI0MIBGtvj3M481RJOUzvum6fl2yqAsuXwGTwQhoP9NLvat
 y4Y+vCs1VSsLIzMLQRF5NuFHG6V8TgmXXLxQ60lQBmu4dmRZV9ItYU/MX0mzMRxuwmwy
 EqyvBxAGVS5LUf+H9sO4IezQR9H3OsdG4GiTusuanzCvgMRXZ6pEPZwSgua6a+yohYwf
 4by0nWAmB9lBf2uIB3ytC4/PhWqcpzzOQ46K8YahEYzftolz1Qf2npCeqtoAV1g3Zslo
 opN2I62ZXz/PAUFu+YXk+dQPE9Kepb5WHawTz8ll4C1CJXarImQ9pStdnL54hqxfPioq
 Criw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=kKy0SIhSKIu0kr4V4JEIbxoglz4OmTrfglh5tt6nsYg=;
 b=fzJ0sH2faCnK7jNf40N25/aG9v+0A5dNqicyhWenfMxHxBFBuc2aOna1SS8qcwgPct
 evTZKEtkKjPoT6u28szbOJUKC/E+Cg42R9Kd6pUF9dekhrF4GniFZUMMvbwh/Dnm1A8U
 ajN1BAGbPXivPfJAOejjEJycXhSLmDN1KN3iG+3wa45w9kE1JEPu1YYsy1ngKiwTcuZ6
 5zOEK9ucdWlzZPUn69VrMCD3HT7O3ysKUa9ELc2RmIsqCueEi7N9muJLiu+zbB9Nc4B8
 PBHrcvenfIoTF6BTuC6iz1G1HfIkJLL7VTSvjgAfmKT08XgfxIED3kzYfPFQAHT9YIjK
 DEdg==
X-Gm-Message-State: AOAM5309e21y0gOQkTL2ZjjTP0Vy0jg4kLrYOmXU33J1w5ETfkd34DHH
 7cI/kvmDSb0qZaJEfIZVTzA=
X-Google-Smtp-Source: ABdhPJzT/P9zjoUcLxnr99/r6mPFb4wbtKG9JwGOJjHBZorNZuyuG/B2BVUR3d7nISl8goaCC1aj/w==
X-Received: by 2002:a17:906:a057:b0:6cf:2736:ba65 with SMTP id
 bg23-20020a170906a05700b006cf2736ba65mr16811745ejb.171.1645475218445; 
 Mon, 21 Feb 2022 12:26:58 -0800 (PST)
Received: from ?IPV6:2003:ea:8f4d:2b00:b141:a0d:4aad:2a06?
 (p200300ea8f4d2b00b1410a0d4aad2a06.dip0.t-ipconnect.de.
 [2003:ea:8f4d:2b00:b141:a0d:4aad:2a06])
 by smtp.googlemail.com with ESMTPSA id y21sm5391986ejq.185.2022.02.21.12.26.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Feb 2022 12:26:58 -0800 (PST)
Message-ID: <cb4c2ed9-0710-7b6c-f4c1-faf13d814f09@gmail.com>
Date: Mon, 21 Feb 2022 21:26:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: [PATCH v2 6/6] arm64: dts: meson-gxl-s905w-tx3-mini: add support for
 the 7 segment display
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
References: <1f39432b-84e2-e6dc-a6b8-c48ad5cf2210@gmail.com>
In-Reply-To: <1f39432b-84e2-e6dc-a6b8-c48ad5cf2210@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_122700_242651_0C011330 
X-CRM114-Status: GOOD (  10.16  )
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
