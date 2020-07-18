Return-Path: <SRS0=xEby=A5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FB3DC43460
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Jul 2020 06:58:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB4D82076D
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Jul 2020 06:58:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="y3ztWVID";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MxnpCgiu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB4D82076D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZInImyR8DRWTkpo77pgKaxTaaMNuSlEWiZ/Twya6q5E=; b=y3ztWVIDRS05Hj97XcUTWwRScx
	4681+1X6IWldYVATFfJLxAzQNPagr0518qc6f41EBUZaMdsrzSWTxbFeGpPbkVsIMdq0hvt/fRdS0
	IrUgSKZWeJtMNBNRgr9tKnhPvCWJHJ4XFSb4jzaHmikiOMODvTx0SbYXeKEShGXhMI8Mstj595AbQ
	fbA/AuJIZPC9W84GdOhwygOFp8HXkQa1hTG5IbBGTXcpgN1nuYsEo0+WpIZkL7tY1SSN5A7j7TV5B
	HJXO2ueE85oqQ2GXwApMsQni5pJW62UgOO/On0LSIE8lOP7XJDOWpO0LnZoF6N84nkj87Wxn7VPVn
	xEefB6+g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwgno-0001UV-9r; Sat, 18 Jul 2020 06:58:32 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwgnB-0001E7-Un; Sat, 18 Jul 2020 06:57:55 +0000
Received: by mail-wm1-x342.google.com with SMTP id a6so8406669wmm.0;
 Fri, 17 Jul 2020 23:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=1krktBPS100MfXZ+pc+c++ZJjlsjSR2xUu8yCpuZMDY=;
 b=MxnpCgiutKDScYhaBSLciizrJAJTJFBr/z8JYY0P+RZ9GzgwghrgNFNaK07MDeEVIO
 go4TQe+V7RxkyR8z14sUvYAvDojXvhpsKSm9bCl01e305F4dSK2ORKh4vT781h5YU9cj
 fbQgwezKw96kyZ2O+6mrFEh/UgB1rW1NM8ioBXzfbtxQrE59TCdrcR2A5YN/QOWx/6hL
 fDDWUPFnWETz9S1Anlrno57q/ch+Bef82ry89P26ZxR8ZWiZvz7jTdy+xyPA8eWqSQQd
 mneR/5ai/AVUPC3PDw2PZEg95Fuo6fOeCmrhq6+lXSbXGTI9J/qAN96LnBS+nXKmJQCo
 XKMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=1krktBPS100MfXZ+pc+c++ZJjlsjSR2xUu8yCpuZMDY=;
 b=sNNFUj9eIYj1Gyqyib36aNsdhNEiIXdvWtNfhPDPz6OEQ0XVgAbX8kiN1vWbqN9XSO
 cD8AH4GVKZOhzf3+P2H5t38JIbtRMjnIqGGueXcW5S6fWmDRaK7fH05rYzWkSk47K/OQ
 O/znluw7O/Set8eXGAUh+95S+miFm1OqYUQ/g9d5sgvHhozZyR6ARCA558x8anoo0OhT
 bVcGeV5M1zeUogEylGprgX5UKN/ecsWY6VfPDkqpYVvYsbcjeUUr+Iu2cd8hWrzJQWyX
 v1wGRWRFb7NPugD4jNzY1UDqAxU5R6J3kxa159kpVGb7kh4us0VLDBBHiZfPhHQuW/2R
 NO3A==
X-Gm-Message-State: AOAM530IAiUGouACo338ivE8Qo4Kjo7c5J//5ZW4Yixv1l25w3zjSonW
 eaETAKQbKLCuwOEilKCrT8c=
X-Google-Smtp-Source: ABdhPJynB0P8pI+h9iCmq/dMiqpiyDbX2abpYL1dqoXORL7MYzIRgWhjk8zdE4npMk9SNvrzyP4JWQ==
X-Received: by 2002:a1c:e90d:: with SMTP id q13mr12857564wmc.187.1595055473119; 
 Fri, 17 Jul 2020 23:57:53 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id x5sm18749191wmg.2.2020.07.17.23.57.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2020 23:57:52 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 04/12] arm64: dts: meson: add audio playback to nexbox-a1
Date: Sat, 18 Jul 2020 06:57:31 +0000
Message-Id: <20200718065739.7802-5-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200718065739.7802-1-christianshewitt@gmail.com>
References: <20200718065739.7802-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200718_025754_220032_BC10CBCE 
X-CRM114-Status: GOOD (  10.59  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add initial support is limited to HDMI i2s and SPDIF (LPCM).

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 .../boot/dts/amlogic/meson-gxm-nexbox-a1.dts  | 80 +++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
index 83eca3af44ce..faca6fafc164 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
@@ -10,6 +10,7 @@
 /dts-v1/;
 
 #include "meson-gxm.dtsi"
+#include <dt-bindings/sound/meson-aiu.h>
 
 / {
 	compatible = "nexbox,a1", "amlogic,s912", "amlogic,meson-gxm";
@@ -24,11 +25,37 @@
 		stdout-path = "serial0:115200n8";
 	};
 
+	spdif_dit: audio-codec-0 {
+		#sound-dai-cells = <0>;
+		compatible = "linux,spdif-dit";
+		status = "okay";
+		sound-name-prefix = "DIT";
+	};
+
 	memory@0 {
 		device_type = "memory";
 		reg = <0x0 0x0 0x0 0x80000000>;
 	};
 
+	vddio_ao18: regulator-vddio_ao18 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDIO_AO18";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	hdmi_5v: regulator-hdmi-5v {
+		compatible = "regulator-fixed";
+
+		regulator-name = "HDMI_5V";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+
+		gpio = <&gpio GPIOH_3 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+	};
+
 	vddio_boot: regulator-vddio-boot {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDIO_BOOT";
@@ -75,6 +102,59 @@
 			};
 		};
 	};
+
+	sound {
+		compatible = "amlogic,gx-sound-card";
+		model = "GXM-NEXBOX-A1";
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
+	pinctrl-0 = <&spdif_out_h_pins>;
+	pinctrl-names = "default";
 };
 
 &cec_AO {
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
