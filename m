Return-Path: <SRS0=A3X0=MF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75E21C07E95
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Jul 2021 23:11:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3BC2961361
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Jul 2021 23:11:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3BC2961361
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kj9ZJuMd0KDsEauIA5r6cNvkJ41tJnxNC6/sas7S5/Q=; b=FHu89fJ3lXRmiK
	RZcr31gUGwZnOoZ1JbRq7YaXmpUCl9tsLCk9P5mn7bdL6gBHsRSKfKwHzQ+1GH/cTc7y8helY6qQq
	5I4M5WJ1v9EzEABIxuPMHKMoSk99fh5SWjGKIwvWG5GIFscUzzjge2U9E0UXN9PUpbwt/L0JAmAc6
	fkldAJvKCeIehk6XK4CiUnJAVgIvI5ccWQEh5Z1YihfVt9X706m5UwLEQAqZvqNwkZTPEB8M1mOWg
	VcgItYMDk8ghV1vTDsZoXyL2dyyFXEQYC4MZ/q2Qo7KL0Xk51uiz3Wi4hI7vSWfA6X2WJqr7CdWb/
	CbjZ9ybUcePDTp6yDYNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3RYj-00BZpg-DC; Tue, 13 Jul 2021 23:11:25 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3RYW-00BZmZ-Aw; Tue, 13 Jul 2021 23:11:14 +0000
Received: by mail-wr1-x42f.google.com with SMTP id g16so760001wrw.5;
 Tue, 13 Jul 2021 16:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QSb3ObAo4ylOUw0FlyxhZx8xAa3rKpfUqluE9lkrXRM=;
 b=X2+0woRl6dwUbgPxnKsHnNPShGzW7Zlak3pDlZy1mXIZ24tnJZtXQ8U/WX6dKzUCmk
 MuIPurdh7dcQT+ZADiIScnXTtPxvUSN8ptkY1CztSrUPIxenRPOFVkZT0n3GtF1U2TOx
 83SFDq3Lg4r+exQ59RnRwDou7neb4hTKTQdLCgUic6jZufLOtSn10gNVnOZ3cMaTTjlH
 11IheQ9BaOO619bnnOHYjbJp140JoymFgjOcDT18U26NWWLF/zTeRkTCV1zC2KqH61X5
 6TILsuLNIoRkyGQLPJ6rupEgdcPXM82U8PKiCwFj/Ez+tv+sKb2274NqlBL9Gvi803dw
 OwOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QSb3ObAo4ylOUw0FlyxhZx8xAa3rKpfUqluE9lkrXRM=;
 b=a1YHhVCWUcXal+fM5va4x5AQ8swp1vLSI8yE2jAorlrNye5ygB+KDtWTeOHpQQl7FJ
 1QUlfIvwnQV4bVsLccQRbpw2uBJeQU1xz9nmYw8m489ClQpLi3y8sXtzBKMYpbHVK2Zd
 oeMKbAOZTrg7Ygnw4Um2MycmjQV7cexvspSMbS2YlcJjAshALoQ7Lb+uPF68E2Cs8npC
 7O1HQqcwx3Yy/lk1PdkTTaDCucxjDYVxmpsSFwDnqD2jg8QRNnaGftoeNCEzKaB2XTm4
 UIzIgQx9uNJF1KFDRRaWN4vXXZmPup6Y/xzN4u9UjnxBc7OvDTIO/p9GZKC+3RsUzQ5I
 jK/w==
X-Gm-Message-State: AOAM531Dbc/iSERRWIu/ODLhKsx39C3Shnghm2B5pZ407qjbu8reMzC/
 sxFicnNITEabxe5sCcoYfVt9ciKhHck=
X-Google-Smtp-Source: ABdhPJxu5zW+U7tPxlUasKv+D8P4pl4jIiUS1ggFku8BsXHu7/b6Gu6oF8K1Q+KoYQybmzxmmludSA==
X-Received: by 2002:adf:e581:: with SMTP id l1mr8643410wrm.116.1626217870639; 
 Tue, 13 Jul 2021 16:11:10 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-2a01-0c23-c041-6f00-f22f-74ff-fe21-0725.c23.pool.telefonica.de.
 [2a01:c23:c041:6f00:f22f:74ff:fe21:725])
 by smtp.googlemail.com with ESMTPSA id y16sm3551608wmq.1.2021.07.13.16.11.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 16:11:10 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: narmstrong@baylibre.com, khilman@baylibre.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 1/2] ARM: dts: meson: Add the AIU audio controller
Date: Wed, 14 Jul 2021 01:11:02 +0200
Message-Id: <20210713231103.2994354-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210713231103.2994354-1-martin.blumenstingl@googlemail.com>
References: <20210713231103.2994354-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210713_161112_418288_11CA7E8E 
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
 arch/arm/boot/dts/meson.dtsi   | 11 ++++++
 arch/arm/boot/dts/meson8.dtsi  | 63 ++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/meson8b.dtsi | 63 ++++++++++++++++++++++++++++++++++
 3 files changed, 137 insertions(+)

diff --git a/arch/arm/boot/dts/meson.dtsi b/arch/arm/boot/dts/meson.dtsi
index bd0e864964e9..6a30ed54ca83 100644
--- a/arch/arm/boot/dts/meson.dtsi
+++ b/arch/arm/boot/dts/meson.dtsi
@@ -5,6 +5,7 @@
 
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/sound/meson-aiu.h>
 
 / {
 	#address-cells = <1>;
@@ -36,6 +37,16 @@ hhi: system-controller@4000 {
 				reg = <0x4000 0x400>;
 			};
 
+			aiu: audio-controller@5400 {
+				compatible = "amlogic,aiu";
+				#sound-dai-cells = <2>;
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
