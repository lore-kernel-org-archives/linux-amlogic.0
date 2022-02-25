Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC0D3C433EF
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Feb 2022 21:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rYyxroEIdfuS/wG3AivuWbb4HrVShREVnoBKEN/yOaw=; b=pqEEE+vc0fZ7Eu
	+qwXFsgrrH8PMKL3cSR3Y7RlmDkDL/1Qf1Z3rvgiNTzkC6/ZITNOWhNbafOdn0v5Dsr3JosSrFsGT
	s4ts4Q0VAhrId6EcI7HWrUMvyaMxft9bvLmZ7e+rcVZy+x3FWBv9zg35RBNYiqmeecWcdO/FyThhS
	mlJpM0efpDTeeSVcSjHfV5v1vHdo1C0SPNxUB0qpPLK33nVUiaLrxzjt3OoC0iQdLRXLWFudshvRw
	KkNTozKWql1jvxQ9A41VhZr7IsJ44QSh5yzGbPk5R4wZTbkxa/YVgcuuRPKdyykcdtD8U+Fu/1Zlo
	qdXD1pRhAMsVV+Ag3sRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNi5S-00715k-Ap; Fri, 25 Feb 2022 21:25:14 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNi4A-0070SS-1D; Fri, 25 Feb 2022 21:23:56 +0000
Received: by mail-ej1-x636.google.com with SMTP id vz16so13343322ejb.0;
 Fri, 25 Feb 2022 13:23:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=ITwZ2iGGWJevAmm+W8iPYQ6tiXhFibH5anmi49Qig/0=;
 b=Gb0HgBQ6y0KAx0MSz95w+dOzfqWoOCxdTtZ0naa5y9d3oA1he40MqTBHqREx+YMwNU
 tM/Q/K3hAumLvQYlfTu26FOVzJwt43lzSEQTfo+PLKk/fiqCZDrhfDaaWH+cPkigp0fE
 5ZdlX2MmPgxC7ENnsE1z50WTkvm2w657wb0tw/oiM8spb8CKjua2D8ABbyKnR3+RqffV
 PnnoUygFBnQZGjeEQrT/aShIt0tdhUzY/IuOlXFN8DPBEUSdioAdPXhHMUwIN/TgQkkz
 UbTx0JtBkSdGpAJfHPjnyEuEo9si5XU3qAjcWkOCbbJQRQ3UbHOuY8Nslq8aMYoOq45l
 tElg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=ITwZ2iGGWJevAmm+W8iPYQ6tiXhFibH5anmi49Qig/0=;
 b=NV1wR7v/UHjx/2eiu6dl1jJypI7XqTfYVqmdlcJXX40AZVJNGW79Ybk+xSGuWoAe0x
 QZ3GzyijypnGmxlxIjEcIaMl+UXuOXKlIyC9bv/K4lmehlGxBgSAgzAz1H7DaCrX98KV
 JVwQ2dndARb/IrGhvxBxy4WxFQ882jHdLRzjOqC6dgJh1D7xr9fTB5Z1h1lIHZU8Q+KT
 Dyxx8zf7LqPzm/4XlRuWDz+ocTe1Rv/t0m7pkGf8kL4PyK+6Pu9rn15MH6vG3wSk9gov
 aNB7EB3Xf6KkJl0PVNphuL5YkazUFsUD79MxVDe1sQb66k506YSIdEmJWV364sy8P3C1
 0cAw==
X-Gm-Message-State: AOAM530AoUx3g3W70ReX4BKU48JbkGaXUafHmBJsKldGNkXv6PHeCrqG
 aJtTTCQGDIJnuE39gCsdGJ4=
X-Google-Smtp-Source: ABdhPJzUs0H4TCgOlY3vFGZehzz7PcJuULHzTp7dFQgUPHtVX+kHpnMTtDX6gtT/li+x4ea7DXdsEA==
X-Received: by 2002:a17:906:d977:b0:6ce:7097:b8ab with SMTP id
 rp23-20020a170906d97700b006ce7097b8abmr7317116ejb.766.1645824232592; 
 Fri, 25 Feb 2022 13:23:52 -0800 (PST)
Received: from ?IPV6:2a01:c22:7326:e100:c9d3:3c62:2c99:d44b?
 (dynamic-2a01-0c22-7326-e100-c9d3-3c62-2c99-d44b.c22.pool.telefonica.de.
 [2a01:c22:7326:e100:c9d3:3c62:2c99:d44b])
 by smtp.googlemail.com with ESMTPSA id
 j2-20020aa7c0c2000000b00412b6b79d1asm1914186edp.10.2022.02.25.13.23.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Feb 2022 13:23:52 -0800 (PST)
Message-ID: <98b09fc5-5de7-ab71-cbfc-843f1c83239b@gmail.com>
Date: Fri, 25 Feb 2022 22:22:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: [PATCH v5 5/6] arm64: dts: meson-gxl-s905w-tx3-mini: add support for
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
References: <90668779-b53d-b3e7-5327-af11ff4a1d18@gmail.com>
In-Reply-To: <90668779-b53d-b3e7-5327-af11ff4a1d18@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_132354_183219_5A1551FF 
X-CRM114-Status: UNSURE (   9.71  )
X-CRM114-Notice: Please train this message.
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
v5:
- add vendor prefix to controller-specific properties
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
+			titanmec,segment-mapping = /bits/ 8 <4 5 6 1 2 3 7>;
+			titanmec,grid = /bits/ 8 <4 3 2 1>;
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
