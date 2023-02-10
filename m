Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C67FDC636CD
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Feb 2023 17:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DWbFEOKdoDxlD/Ce60FoyPfxPssA+L+KpWTY0AiV3lk=; b=umQ+eq7OnQXpi+
	VmlBRteZs7Yax8fc1zP4Nq+vN/rqlNvNvO57/PDNG5G+jcPOaYfFUzNRnKqnsn3LhsIKSW2JAaREi
	fi+RBF8teocEio4viUX3VW7yAW1OjvGV0KpzHuqfDhWrq5zQkSgrTqoUh1ePneJOYiJxuluMsMeAE
	noQK2v6WUrQglN0RaC980pxLYcsUNVyTVP5T2LEUCyh4FUkRwCYjSvjjnBAwh5TO7XmQZTWHK0sgA
	4aYrShnvF7b947B54CISeYFGwaSSNGTtbQsHQemIgr1s6Vjn7bs2fBta+2PWwnNizwrno/V5vKxCk
	a482/Um/rR8ftyMOXCxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQWsc-006fyA-Uu; Fri, 10 Feb 2023 17:08:10 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQWsB-006fhX-DC; Fri, 10 Feb 2023 17:07:44 +0000
Received: by mail-wm1-x332.google.com with SMTP id az4-20020a05600c600400b003dff767a1f1so4554815wmb.2;
        Fri, 10 Feb 2023 09:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/+tC+3M79LSCIIw5j8lDKYBrOpewHeq1xIre2CyKVA0=;
        b=TSvLq/yg83aGHSy29gBUVTTw8fyHTID5dLAVCWzS8+XE1Aheh+pwONXyZjNuVCF0gi
         +FUJcET3VPMjufgd17yOq1uwwv5tzTefspOSMXEZDWk4HNU5V9FGE5FglYQRzr2HNqU1
         +k3wUQGH62K+0HW+3Rz1EMlm5T7oZY84J+oW5nqvP07wqnaQMvu9N0kC4x/cf+v4tiJH
         X04eN40qHjjZ9MNPEBCGKufOQnT2xoU+/a/BUIHUionClPb1Z9kyuC+FZCVp8d435gCz
         PfJdih+ZYs15D77erJ/AyM7zp0cpLUN/thyjk643G349BnTphFhERpzuY+3TFkW4TuI4
         ucAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/+tC+3M79LSCIIw5j8lDKYBrOpewHeq1xIre2CyKVA0=;
        b=qSeZHOsqCMRoTFp89K7h/BbqWNjeKQooUtc6KtsYNupNKk+GgNidMQsn3/vnkDhTpK
         H4/f2UVg4q7iVS6HRQ1jps+/pWdUu/UjSRXUbx5AmTB5Xb/c7PdW5el/BykZ+KucpJLN
         DHOOJRvbRef3fZzFcl7Lg3McQUKCt2s13ZKka4fnTMZmOaa3Uf+OPlrlopjOCCv+UIAG
         XgBNUCBhWbL53dmIKnMj7kvqfMEOYFqiX8emN+NmpHZVzjlDQgF7+UdTIuq2v2m5jOoX
         90aDizI722E9JscG4cpN6M9HbYczPwvdfuDhGcFONZ04BipYH/F4F1lEMBO+lFOOBMn0
         xFtw==
X-Gm-Message-State: AO0yUKWbVq+aTv4+Ul11ojxTxSGINtzObMi+Aj2Lrlv+NzIFt4qMkfih
	kLX/0AW+QUONvzaUUXcJHex5TxHs79Kf7w==
X-Google-Smtp-Source: AK7set+xFtoXhPW9GlnW+yzOi2G6h5E1IL8vgMQscZINpwWEiNTlw9KCHDpYZcfVbdLisQesB7NQMw==
X-Received: by 2002:a05:600c:4496:b0:3dc:de85:5007 with SMTP id e22-20020a05600c449600b003dcde855007mr13352560wmo.21.1676048854683;
        Fri, 10 Feb 2023 09:07:34 -0800 (PST)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id x7-20020a05600c188700b003cffd3c3d6csm5351531wmp.12.2023.02.10.09.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 09:07:34 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] arm64: dts: meson: gxbb-kii-pro: add initial audio support
Date: Fri, 10 Feb 2023 17:07:21 +0000
Message-Id: <20230210170721.1285914-4-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230210170721.1285914-1-christianshewitt@gmail.com>
References: <20230210170721.1285914-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_090743_470747_D17BCED6 
X-CRM114-Status: GOOD (  10.55  )
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
Cc: Ferass El Hafidi <vitali64pmemail@protonmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add initial support for HDMI and S/PDIF audio output.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Tested-by: Ferass El Hafidi <vitali64pmemail@protonmail.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../boot/dts/amlogic/meson-gxbb-kii-pro.dts   | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
index 435ae2aa404e..a09340e9f73a 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
@@ -9,11 +9,19 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/sound/meson-aiu.h>
 
 / {
 	compatible = "videostrong,kii-pro", "amlogic,meson-gxbb";
 	model = "Videostrong KII Pro";
 
+	spdif_dit: audio-codec-0 {
+		#sound-dai-cells = <0>;
+		compatible = "linux,spdif-dit";
+		status = "okay";
+		sound-name-prefix = "DIT";
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
@@ -35,6 +43,58 @@ button-reset {
 			gpios = <&gpio_ao GPIOAO_3 GPIO_ACTIVE_HIGH>;
 		};
 	};
+
+	sound {
+		compatible = "amlogic,gx-sound-card";
+		model = "KII-PRO";
+		assigned-clocks = <&clkc CLKID_MPLL0>,
+				  <&clkc CLKID_MPLL1>,
+				  <&clkc CLKID_MPLL2>;
+		assigned-clock-parents = <0>, <0>, <0>;
+		assigned-clock-rates = <294912000>,
+				       <270950400>,
+				       <393216000>;
+
+		dai-link-0 {
+			sound-dai = <&aiu AIU_CPU CPU_I2S_FIFO>;
+		};
+
+		dai-link-1 {
+			sound-dai = <&aiu AIU_CPU CPU_SPDIF_FIFO>;
+		};
+
+		dai-link-2 {
+			sound-dai = <&aiu AIU_CPU CPU_I2S_ENCODER>;
+			dai-format = "i2s";
+			mclk-fs = <256>;
+
+			codec-0 {
+				sound-dai = <&aiu AIU_HDMI CTRL_I2S>;
+			};
+		};
+
+		dai-link-3 {
+			sound-dai = <&aiu AIU_CPU CPU_SPDIF_ENCODER>;
+
+			codec-0 {
+				sound-dai = <&spdif_dit>;
+			};
+		};
+
+		dai-link-4 {
+			sound-dai = <&aiu AIU_HDMI CTRL_OUT>;
+
+			codec-0 {
+				sound-dai = <&hdmi_tx>;
+			};
+		};
+	};
+};
+
+&aiu {
+	status = "okay";
+	pinctrl-0 = <&spdif_out_y_pins>;
+	pinctrl-names = "default";
 };
 
 &ethmac {
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
