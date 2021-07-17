Return-Path: <SRS0=V7O5=MJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1D83C636C9
	for <linux-amlogic@archiver.kernel.org>; Sat, 17 Jul 2021 23:30:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 676CA61106
	for <linux-amlogic@archiver.kernel.org>; Sat, 17 Jul 2021 23:30:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 676CA61106
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=paDPEtjOK1ukFph8SH72fm4VZBNssPfNvJe2Z+hAaOs=; b=tMJcQv/XZ2RFf/
	fR87LOCq5s5HsbcJZW7CIyrr6sOQQi/jT933zCu6nxBEio/KI+uBydOsHz580ueVoX2chuWyZqz4c
	USfwLBgxbVqYh/o/hFAdcN6l8hFN+qyrdPq4mM9TMk6uCN+JWwSLXDZbqF2jtZxnF/JiO3PBulOBI
	p/8Nt1OfCMJ+hjXxRG7T7tSB/z1lUtt9Z3I6pOAjdKGmCgZdxbUAS2YhKuWKFGniLFqYZ2cApVHdU
	G9Dr1sbgPWAZoQ1Nb2qFQsv5Egp0HIiASLSNQhTf+HXl8ABY12e79GSvFsBqOaLR76wJaxr0Q7z9m
	wsa4pUCojbDV8q8vfGqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4tlk-00783e-2i; Sat, 17 Jul 2021 23:30:52 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4tlW-007806-R0; Sat, 17 Jul 2021 23:30:40 +0000
Received: by mail-wm1-x32d.google.com with SMTP id
 q18-20020a1ce9120000b02901f259f3a250so8080476wmc.2; 
 Sat, 17 Jul 2021 16:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZsVloxEGjSteK4U7+lXhhEQfJStMyVYbpRaRDn0jLto=;
 b=J+U+9/QycuPEanBet1BEi5lgWbUua9ldGZEuMBNS4BYUQhwrxG8Jjp/l5bDdkA4rDW
 XsJKSv9P4B9KKovPfWOE+uvS1vWveAk0b6eJlTT4/9YXu0rHolnYBvQKcTQLjdUUvKdk
 qxIXzR8MOSqCUIpWyyvvV8cllttE6w21KBlQePoTayqOz+Nmdk6L0aF2lUJEu3dgUElB
 VHv9icGzEddE6ENhifGZgikgvy/kmQg4BP42bLVRZh850M94wdj6RLNgCNJbKbLXGW/F
 DoeuDvTKJ7pP5gLFuSwwdn09GDfJMbnYv9rAE1092pHglvuEqx6Th3EZsksrZTrcSY+C
 iSLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZsVloxEGjSteK4U7+lXhhEQfJStMyVYbpRaRDn0jLto=;
 b=CXxSsALP4EE+yv/JaOzrM0Tl/d5ajkgUV/xIeaj0G6upGy9G3vA2ncnNMFm4rXK57W
 cp7Q9nvNGnBRbZRLo3EP+j6WQrbzeaWkqEsgdfuGHJvOG/bZti1G3iaohHqijA3zyaAS
 li0rVviMuxee1xkz6UfXmA1RFhq+mVSZTDNKCZDUErEp+Va8tHzmzitHeAiVpvbxGRyU
 k+HJBOFZdZmRsFLhz2pvGNKsIS5nULKmEqmQjOQrQ/UdBIkE5mG7YPPJKtzOBvj9Chkp
 4u2x2bl2imBSN/eqeSRGTCufrVopXmw84F7mNHRiu2nDl40Bd7+3GudvwbkiwfDr98EE
 jSew==
X-Gm-Message-State: AOAM5303a+c73YBZNLDW6oWtDmMXUP/1PwH1oqk+g7LC2CXcuXFqewKQ
 sCB55NRuqHEt4pJqT7LpCRJOu+Kfqxo=
X-Google-Smtp-Source: ABdhPJywMQVKPjUbVi7xolNMlKaN+tPpKAzZJFYFqum6WncftMz8NZBUlZIVwOeRhGVmsHQli/H1hQ==
X-Received: by 2002:a05:600c:2187:: with SMTP id
 e7mr24465294wme.161.1626564637171; 
 Sat, 17 Jul 2021 16:30:37 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-2a01-0c22-7602-4e00-f22f-74ff-fe21-0725.c22.pool.telefonica.de.
 [2a01:c22:7602:4e00:f22f:74ff:fe21:725])
 by smtp.googlemail.com with ESMTPSA id q19sm14824051wmq.38.2021.07.17.16.30.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 16:30:36 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: narmstrong@baylibre.com, khilman@baylibre.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 1/2] ARM: dts: meson: Add the AIU audio controller
Date: Sun, 18 Jul 2021 01:30:29 +0200
Message-Id: <20210717233030.331273-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210717233030.331273-1-martin.blumenstingl@googlemail.com>
References: <20210717233030.331273-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210717_163038_918079_7D937D5F 
X-CRM114-Status: GOOD (  12.65  )
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

Add the AIU audio controller to the Amlogic Meson6/8/8b/8m2 SoC DT. This
provides I2S and SPDIF outputs as well as codec glues for the internal
HDMI controller.
Also add the clock inputs and pin mux definitions on Meson8/8b/8m2. On
Meson6 this is omitted because we neither have a clock nor pin
controller node there yet.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson.dtsi   | 12 +++++++
 arch/arm/boot/dts/meson8.dtsi  | 63 ++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/meson8b.dtsi | 63 ++++++++++++++++++++++++++++++++++
 3 files changed, 138 insertions(+)

diff --git a/arch/arm/boot/dts/meson.dtsi b/arch/arm/boot/dts/meson.dtsi
index bd0e864964e9..3be7cba603d5 100644
--- a/arch/arm/boot/dts/meson.dtsi
+++ b/arch/arm/boot/dts/meson.dtsi
@@ -5,6 +5,7 @@
 
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/sound/meson-aiu.h>
 
 / {
 	#address-cells = <1>;
@@ -36,6 +37,17 @@ hhi: system-controller@4000 {
 				reg = <0x4000 0x400>;
 			};
 
+			aiu: audio-controller@5400 {
+				compatible = "amlogic,aiu";
+				#sound-dai-cells = <2>;
+				sound-name-prefix = "AIU";
+				reg = <0x5400 0x2ac>;
+				interrupts = <GIC_SPI 48 IRQ_TYPE_EDGE_RISING>,
+					     <GIC_SPI 50 IRQ_TYPE_EDGE_RISING>;
+				interrupt-names = "i2s", "spdif";
+				status = "disabled";
+			};
+
 			assist: assist@7c00 {
 				compatible = "amlogic,meson-mx-assist", "syscon";
 				reg = <0x7c00 0x200>;
diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
index 686c7b7c79d5..f80ddc98d3a2 100644
--- a/arch/arm/boot/dts/meson8.dtsi
+++ b/arch/arm/boot/dts/meson8.dtsi
@@ -317,6 +317,29 @@ mali: gpu@c0000 {
 	};
 }; /* end of / */
 
+&aiu {
+	compatible = "amlogic,aiu-meson8", "amlogic,aiu";
+	clocks = <&clkc CLKID_AIU_GLUE>,
+		 <&clkc CLKID_I2S_OUT>,
+		 <&clkc CLKID_AOCLK_GATE>,
+		 <&clkc CLKID_CTS_AMCLK>,
+		 <&clkc CLKID_MIXER_IFACE>,
+		 <&clkc CLKID_IEC958>,
+		 <&clkc CLKID_IEC958_GATE>,
+		 <&clkc CLKID_CTS_MCLK_I958>,
+		 <&clkc CLKID_CTS_I958>;
+	clock-names = "pclk",
+		      "i2s_pclk",
+		      "i2s_aoclk",
+		      "i2s_mclk",
+		      "i2s_mixer",
+		      "spdif_pclk",
+		      "spdif_aoclk",
+		      "spdif_mclk",
+		      "spdif_mclk_sel";
+	resets = <&reset RESET_AIU>;
+};
+
 &aobus {
 	pmu: pmu@e0 {
 		compatible = "amlogic,meson8-pmu", "syscon";
@@ -340,6 +363,38 @@ gpio_ao: ao-bank@14 {
 			gpio-ranges = <&pinctrl_aobus 0 0 16>;
 		};
 
+		i2s_am_clk_pins: i2s-am-clk-out {
+			mux {
+				groups = "i2s_am_clk_out_ao";
+				function = "i2s_ao";
+				bias-disable;
+			};
+		};
+
+		i2s_out_ao_clk_pins: i2s-ao-clk-out {
+			mux {
+				groups = "i2s_ao_clk_out_ao";
+				function = "i2s_ao";
+				bias-disable;
+			};
+		};
+
+		i2s_out_lr_clk_pins: i2s-lr-clk-out {
+			mux {
+				groups = "i2s_lr_clk_out_ao";
+				function = "i2s_ao";
+				bias-disable;
+			};
+		};
+
+		i2s_out_ch01_ao_pins: i2s-out-ch01 {
+			mux {
+				groups = "i2s_out_ch01_ao";
+				function = "i2s_ao";
+				bias-disable;
+			};
+		};
+
 		uart_ao_a_pins: uart_ao_a {
 			mux {
 				groups = "uart_tx_ao_a", "uart_rx_ao_a";
@@ -460,6 +515,14 @@ mux {
 			};
 		};
 
+		spdif_out_pins: spdif-out {
+			mux {
+				groups = "spdif_out";
+				function = "spdif";
+				bias-disable;
+			};
+		};
+
 		spi_nor_pins: nor {
 			mux {
 				groups = "nor_d", "nor_q", "nor_c", "nor_cs";
diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index c02b03cbcdf4..b49b7cbaed4e 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -279,6 +279,29 @@ mali: gpu@c0000 {
 	};
 }; /* end of / */
 
+&aiu {
+	compatible = "amlogic,aiu-meson8b", "amlogic,aiu";
+	clocks = <&clkc CLKID_AIU_GLUE>,
+		 <&clkc CLKID_I2S_OUT>,
+		 <&clkc CLKID_AOCLK_GATE>,
+		 <&clkc CLKID_CTS_AMCLK>,
+		 <&clkc CLKID_MIXER_IFACE>,
+		 <&clkc CLKID_IEC958>,
+		 <&clkc CLKID_IEC958_GATE>,
+		 <&clkc CLKID_CTS_MCLK_I958>,
+		 <&clkc CLKID_CTS_I958>;
+	clock-names = "pclk",
+		      "i2s_pclk",
+		      "i2s_aoclk",
+		      "i2s_mclk",
+		      "i2s_mixer",
+		      "spdif_pclk",
+		      "spdif_aoclk",
+		      "spdif_mclk",
+		      "spdif_mclk_sel";
+	resets = <&reset RESET_AIU>;
+};
+
 &aobus {
 	pmu: pmu@e0 {
 		compatible = "amlogic,meson8b-pmu", "syscon";
@@ -302,6 +325,46 @@ gpio_ao: ao-bank@14 {
 			gpio-ranges = <&pinctrl_aobus 0 0 16>;
 		};
 
+		i2s_am_clk_pins: i2s-am-clk-out {
+			mux {
+				groups = "i2s_am_clk_out";
+				function = "i2s";
+				bias-disable;
+			};
+		};
+
+		i2s_out_ao_clk_pins: i2s-ao-clk-out {
+			mux {
+				groups = "i2s_ao_clk_out";
+				function = "i2s";
+				bias-disable;
+			};
+		};
+
+		i2s_out_lr_clk_pins: i2s-lr-clk-out {
+			mux {
+				groups = "i2s_lr_clk_out";
+				function = "i2s";
+				bias-disable;
+			};
+		};
+
+		i2s_out_ch01_ao_pins: i2s-out-ch01 {
+			mux {
+				groups = "i2s_out_01";
+				function = "i2s";
+				bias-disable;
+			};
+		};
+
+		spdif_out_1_pins: spdif-out-1 {
+			mux {
+				groups = "spdif_out_1";
+				function = "spdif_1";
+				bias-disable;
+			};
+		};
+
 		uart_ao_a_pins: uart_ao_a {
 			mux {
 				groups = "uart_tx_ao_a", "uart_rx_ao_a";
-- 
2.32.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
