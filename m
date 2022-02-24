Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EC61C433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 24 Feb 2022 20:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qh8VB7QvxruslWGcp3XuDCO6rwt/Kn55LLyc7qaGs0k=; b=IudXXBO0LLaJ50
	BxGxBAK8j4N4ZoZDJ731s4xauC3ziW+bFoaQa+WJS9Lwr+s7z6ttfGUsxDNgypaHqlLeRDJE3ohox
	LLF4zuImYbS5az/Z/WrfnRD1mNG+B+kDOa/Yj+uaN8iDSGbV+ALkbo2CBueZ7dsQ8TGIm2YURbZLh
	hNneAasTXuqXd6MNXX9tuN7jfEX8fbx66YMiHjty/eZxMuKYXQYgcv9BFRL5QNh5uwciJperQHm/Q
	z5Xcf+7uYu+9zyy/B9Gd2bR/ipW439gg34UShslEX2iqLgRKnXhBphddD6uc9Hc0TepFJQeJku9CQ
	ZQJV7ZwiW0FFuT39kgjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNKTh-002IDr-B7; Thu, 24 Feb 2022 20:12:41 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNKSd-002HjV-Gg; Thu, 24 Feb 2022 20:11:36 +0000
Received: by mail-ed1-x535.google.com with SMTP id bq11so4497111edb.2;
 Thu, 24 Feb 2022 12:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=kKy0SIhSKIu0kr4V4JEIbxoglz4OmTrfglh5tt6nsYg=;
 b=QdhW2DCKhmJB5VXGZFJfH7ZF47QkssFORrQn+dwi6ampYfc6DbEvRiB00HukSiD/Xx
 xLmiCT2E+0K7MEAubTf+4e0pwdJIUhbpjdSNkBFiQM9oSLRRPyKxD+fJ9LpLvIGP0jHI
 gVpuP4MOmdWQXm7hdJ0juO9V3caTWucEcmf7YJYjMDHOm8Zhon1+lFFhYdophwymy1/R
 2tfuko9MQKHhISTAmDY4Pk8RjadWxJOiNCLxJo9RN+c5fGuwOjOYy1xD9HcZ7r34HmwW
 1KPwI/Y/yU1HE1nMsY/2lMK7LLYb+XfJatje+2/IjL056fag2LcCeBtt1ebuE76P9/Hb
 LxRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=kKy0SIhSKIu0kr4V4JEIbxoglz4OmTrfglh5tt6nsYg=;
 b=UOofJc0TVTvh/pIevSzK5wSEVVr2FY/sMNjHwzYvj2vcTnoq4m0OJBtStcQl0tFgYj
 fynhIQAiEi/QESp24+gg3wlBVf9BUPzkIRWZhOQbGbKv7vxgLvC6KIlQ0OzHpm8AidPR
 zpOPIaLIjjvfCNy1p7Ljs3yCu2h9R3jooFUJM+LH0cUsKJQABJMQieZDFj7USDyZDak4
 2iTvsmx5svcY4slj9z3GvA7Gaj6j2mpckTfiMbPCbXQT1hNVIvsh5ewwIDLCOOBEihne
 qvmaaRK8tQ/+QiIJhwwJeVmBaXMbiVY5xOkxaKB7m/QaFzdcyovSaTwrt1COMpF1mKSi
 g7kQ==
X-Gm-Message-State: AOAM531g4HhaYRX7jAKeOIQ2rbQAxXXWsCkhi0DQs5tVTdJoXm9MleUT
 YQafUZAJMTXavzWjYPrnB0c=
X-Google-Smtp-Source: ABdhPJxCCcYxGn8Kcl7NsKJCzdQ4Vl6lcaApJwLzVwVutqb4KSaWgUcrjJg1sBfXDTuQvMAevfEsmA==
X-Received: by 2002:a50:8e44:0:b0:40f:d71f:bdf5 with SMTP id
 4-20020a508e44000000b0040fd71fbdf5mr4038143edx.166.1645733493712; 
 Thu, 24 Feb 2022 12:11:33 -0800 (PST)
Received: from ?IPV6:2003:ea:8f4d:2b00:70ad:e6bd:1cea:7edd?
 (p200300ea8f4d2b0070ade6bd1cea7edd.dip0.t-ipconnect.de.
 [2003:ea:8f4d:2b00:70ad:e6bd:1cea:7edd])
 by smtp.googlemail.com with ESMTPSA id
 q15-20020a1709060e4f00b006cdf4535cf2sm130234eji.67.2022.02.24.12.11.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 12:11:33 -0800 (PST)
Message-ID: <a9db41fc-3409-7a5f-00b1-e9619b80ca5e@gmail.com>
Date: Thu, 24 Feb 2022 21:10:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: [PATCH v4 5/6] arm64: dts: meson-gxl-s905w-tx3-mini: add support for
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
References: <f911c7d3-a9c4-32ee-68a1-e30b478732c9@gmail.com>
In-Reply-To: <f911c7d3-a9c4-32ee-68a1-e30b478732c9@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_121135_618882_21760760 
X-CRM114-Status: UNSURE (   9.53  )
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
