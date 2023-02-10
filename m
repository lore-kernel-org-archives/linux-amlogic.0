Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39DEDC05027
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Feb 2023 12:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6yNtkUeYDFzypqDw4/fGQ97pcMcHHbIXAtkZoaxp1lM=; b=O/KFaC1xIMHQiK
	JH5fbg5rl3lOhIfZWBmTyXSCWc3TDzrHmsAd4Eta+Vmy9aTmELTgTQKxste/Z7mXH8rCCp62D9mLA
	coMq5f/Wj7WjZkTztW/k0vyBP/4Enl/23E3FF1cMLV12w74dEx4TMo3mR8tjbRFd+luLbal+iZPPA
	y8rOzRDVpT/iMwL87+Lda9tcEiiRqjvAkzFRtElWyBs/rsucY7KlWWmPgMczZVA623q87TBwGFtcj
	Lj+hWQt1/A2C3xdwXI+uqyTX4C8Z/rmW3CQaCJMYhuF+y+CMcoxn4Q8jH+Z9CKYBhIIhiGkS5bq8w
	W6jlF1j2ggLreWtRwSYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQSWc-005ggl-Je; Fri, 10 Feb 2023 12:29:10 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQSW2-005gKg-AR; Fri, 10 Feb 2023 12:28:35 +0000
Received: by mail-wr1-x432.google.com with SMTP id y1so4925999wru.2;
        Fri, 10 Feb 2023 04:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aW+Xc6jE1tZtkbSgroI6jR5Bd20w7LEpIgHknzDS1U8=;
        b=nWAYKV6nPw+ZVJ5IpixaLlHAfGLDGphE6F1LQ3m9IFP3j+y+uWtoutMtVXS33MQ0ss
         8F1M+67S6rl+ysrnS472YxWaKk5cjH/I7A2unp2HbrdNdV42D0rb1y5Dd9MucYtQmIeR
         73+jlFoMcp2/eeF+vXvktxkbOyZAj2RfOdNM9qfmuU3nCJjTBueK6GLqdXD7YUtk02Kq
         ztEPDa5hmAoW0EG3n4hpfxgDkKCAErU+aVXQwXH1Kdt0sRN4TRJpfIHqqDcFkQffkjFw
         bLDl/XA1Vn3Y9oiDRrLQwIYD52/RoG55WkS3d5HZqzHdL48lAyM/cmqfpf/PSNFISeMD
         XtOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aW+Xc6jE1tZtkbSgroI6jR5Bd20w7LEpIgHknzDS1U8=;
        b=Prc6X6vI9l0HiU1RzAKOkhmnjkjcFDvIp/Cj1INsORvEIiwR9DIdfsbu8yHPm0F21y
         5CvUZaXb8QXvooE2a6AipOmM3VYo+EHsrLio6OmkkWn3GnPRvsQBewDsXf2WxuKHjzmW
         sCa+nQhCPENASYKesZzHJjmwADLSKmXT9RQPQJ8HpE3BTr8hlNtl8/3W6c1DzX095yIB
         4JSpB9n6ffma2Sy1x7u3Xh/lw+NVtfmU3ezIlWl8RV+fbyf57l1fArtOVOGRnrTdwpcz
         thKoung1T4H0/mCjVGOezcDFigp4+QvbihMtIQx7SZVexceLcQ9D70MaeJkQkW6PEuWZ
         HTgg==
X-Gm-Message-State: AO0yUKVPSEuCjbR6kFiuigpUUes7X8RAVX8BXbKfL4cU3oz2XA1uUEX4
	pYzqxJsah0qsgPMHbU5VTYg=
X-Google-Smtp-Source: AK7set+PSi1B1Ua/z60ldCA3JTes+hrolioO/IoKIlJPVXaE3QlJnMPN2LC35dlx3CQ9jKmN23Wn3w==
X-Received: by 2002:adf:ef84:0:b0:2bf:bac7:30d4 with SMTP id d4-20020adfef84000000b002bfbac730d4mr14227649wro.53.1676032112223;
        Fri, 10 Feb 2023 04:28:32 -0800 (PST)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id i8-20020a5d4388000000b002c5493a17efsm1540989wrq.25.2023.02.10.04.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 04:28:31 -0800 (PST)
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
Subject: [PATCH 3/3] arm64: dts: meson: gxbb-kii-pro: add initial audio support
Date: Fri, 10 Feb 2023 12:28:17 +0000
Message-Id: <20230210122817.1027765-4-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230210122817.1027765-1-christianshewitt@gmail.com>
References: <20230210122817.1027765-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_042834_384988_A5293DF4 
X-CRM114-Status: GOOD (  10.46  )
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
---
 .../boot/dts/amlogic/meson-gxbb-kii-pro.dts   | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
index 435ae2aa404e..b6ee76011d82 100644
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
 
@@ -35,6 +43,59 @@ button-reset {
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
+		status = "okay";
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
