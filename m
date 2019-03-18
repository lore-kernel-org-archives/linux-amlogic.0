Return-Path: <SRS0=lgrq=RV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A581C4360F
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 10:06:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F002220693
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 10:06:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CQPg8ACn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="xZG2wIbl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F002220693
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=podUvVRbHK2TwdLtWP5KG3fLv1AwCazDSwSVooa5s/Y=; b=CQPg8ACnb0Xgyf
	NpQfK+HZZ4OAzf5hUk9QkQWZENDVAGGMIRpUkl8UH7AlurVYBlO7kmAgT4fz+0FyJ18FTKy0bYPfL
	4+YJQsqLh9JBzTPRYaP6lR3ImvotzJAieFr0fQFozz+B4AUbi7pFt/pLrNKA0o1gaJy6P9xm8hrJ4
	ja8A/x/As2THBGiioLmGG+12WJKqKhAzoOpzuhCwtmWSi29m8xbbBkgHL6WWK4lhk/iujdO4wNGNx
	o7KyXQqKwehP2qhdVk+rqxNw1IvNKDuZImD3EQuQUeLwB2GpfOTEoi858R5j3y7Cyj2fLzGq5ib6Q
	t060Gxjb62CxNcxuWo5w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h5pAL-0002k7-FB; Mon, 18 Mar 2019 10:06:45 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h5p8m-00004s-63
 for linux-amlogic@lists.infradead.org; Mon, 18 Mar 2019 10:05:16 +0000
Received: by mail-wr1-x441.google.com with SMTP id g12so16296890wrm.5
 for <linux-amlogic@lists.infradead.org>; Mon, 18 Mar 2019 03:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vyTVu6y/dDbn/Kx5YTVNiJNMsZW+Ml6FfRobJ2/iYLI=;
 b=xZG2wIblReXElzEDHMFnQ7bJBSuztu9HpMItiJxKZB+hvG9Wqv+hpUUnxBSPUwkNgX
 9CV0gNDrFhnnFgIEcOCTafjXcTtCP5WXecsQzw+t9/7SRTVb5JKQFYreeTevDZ1I1h0a
 vXXDwIpnXynG3TK/vwjyCU3TVRW/nqAXJ1rVQBt+XfQuYjgLETgrXLOnvZDrvFaKCt2y
 qEYYIEKiMxHfHkW86rWg4Dwh7k6JY3LKfu47dpW9OOi3RIWmR2YyNNEPGa5LtCFTQgm1
 4ilEAJ6Ukm9rhkPHRMjcA4UGs1WeVPpyHRsTzjYARKLyLaYmY2RgvQeaIb2Vx5T0XGNK
 MFWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vyTVu6y/dDbn/Kx5YTVNiJNMsZW+Ml6FfRobJ2/iYLI=;
 b=bSzFB7BqRQDuumaYt/Gvbngskse2k3jGoN3DBJ8pVb7A/SXXnR+UrZIQCo0rcRhrO0
 tLojwXiyOfsUXa3qSmCHGj8Zv1vnPsYS/rED1dmct/6DI3S9E0s7Hnb/Gx2f42ye7fsV
 GQRnXo7CZO90g1djKdSb4fW3HbVTcTWcwRrLb5EWG/Hhxp90k01+SdOLyH3GB0hIAKGu
 RnByXK2NbgIuZOM3NXxdAe9oxcP9+HnW3lmThekY+9pwPzHbl8cxcGEH2/2rzJkoOjRF
 JqgmhN3ix3xtcR75aqc12svQ7GlKUMHwuuReW5l1Rpo0T45iHwfR3I9uWLtqqAxTESH+
 De4A==
X-Gm-Message-State: APjAAAVSB+rjE2VYgDkWDXUae7lwHf0/SeTUC+c+6sWAnWyF0a/x2jus
 SG5laRszLgcWe75Gj81pQuTsIA==
X-Google-Smtp-Source: APXvYqxTf4ES755Gsyz1mPIIMFjVm3ZD0yffSU/KrzviME+s8xa+NaPc4ZzzOkBBP+InTNFra4nMFw==
X-Received: by 2002:adf:e2ca:: with SMTP id d10mr11057150wrj.250.1552903506042; 
 Mon, 18 Mar 2019 03:05:06 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id i11sm5216800wrp.40.2019.03.18.03.05.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 18 Mar 2019 03:05:05 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH v2 06/11] arm64: dts: meson-g12a-x96-max: add regulators
Date: Mon, 18 Mar 2019 11:04:53 +0100
Message-Id: <20190318100458.5619-7-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190318100458.5619-1-narmstrong@baylibre.com>
References: <20190318100458.5619-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190318_030508_696705_B1B8CD23 
X-CRM114-Status: UNSURE (   9.26  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org,
 Guillaume La Roque <glaroque@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Guillaume La Roque <glaroque@baylibre.com>

Add system regulators for the X96 Max Set-Top-Box.

Still missing
* VDD_EE (0.8V - PWM controlled)
* VDD_CPU (PWM controlled)

Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../boot/dts/amlogic/meson-g12a-x96-max.dts   | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
index 0edbd00b358f..5c37930b09e2 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
@@ -6,6 +6,8 @@
 /dts-v1/;
 
 #include "meson-g12a.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/gpio/meson-g12a-gpio.h>
 
 / {
 	compatible = "amediatech,x96-max", "amlogic,u200", "amlogic,g12a";
@@ -21,6 +23,71 @@
 		device_type = "memory";
 		reg = <0x0 0x0 0x0 0x40000000>;
 	};
+
+	flash_1v8: regulator-flash_1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "FLASH_1V8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vcc_3v3>;
+		regulator-always-on;
+	};
+
+	dc_in: regulator-dc_in {
+		compatible = "regulator-fixed";
+		regulator-name = "DC_IN";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+
+	vcc_1v8: regulator-vcc_1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC_1V8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vcc_3v3>;
+		regulator-always-on;
+	};
+
+	vcc_3v3: regulator-vcc_3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vddao_3v3>;
+		regulator-always-on;
+		/* FIXME: actually controlled by VDDCPU_B_EN */
+	};
+
+	vcc_5v: regulator-vcc_5v {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC_5V";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&dc_in>;
+
+		gpio = <&gpio GPIOH_8 GPIO_OPEN_DRAIN>;
+		enable-active-high;
+	};
+
+	vddao_1v8: regulator-vddao_1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDAO_1V8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vddao_3v3>;
+		regulator-always-on;
+	};
+
+	vddao_3v3: regulator-vddao_3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDAO_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&dc_in>;
+		regulator-always-on;
+	};
 };
 
 &uart_AO {
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
