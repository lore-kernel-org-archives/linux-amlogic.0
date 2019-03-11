Return-Path: <SRS0=n5rD=RO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFF94C43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Mar 2019 09:57:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F0DC206BA
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Mar 2019 09:57:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tkSYZjSx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="YqUa5DEP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F0DC206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OZsefmJLlIOKNYKtVdEMp0lB0yBOAxDtNCzx/L1sjps=; b=tkSYZjSxTRZpuq
	EYLLVc6ugDjDYTRCgoaHT+HGjck2vtcPo1PPnM18AnIT5m3afwFmEY7kc3Ncd3bkSN+AhOqic1WrH
	R1iSVIRIYh7eXGTfKcnhdhgBztVhHiRELbJ7AbRD7MAkrFlCP0oVjUGt0QO/x2cZ0bvtkM0dO6zpu
	nKX0LMERmGrzBlJJgPmKXL8viOn5Hl/9/yXr+9/mxx2S9mnvV8hIpthElkElGXbjsLWgresoq04Fr
	J/VA1NIohk6Qs8V/qIhCZxGwDmzKjh18vmsI7HaFwjYh0r8JbeI6MxomxvcGmINGAos1et4NNkWSu
	lV4E+W9QOPNWYP6zvpeg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3HgI-0001XG-PM; Mon, 11 Mar 2019 09:57:14 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3HfR-0000Ej-L5
 for linux-amlogic@lists.infradead.org; Mon, 11 Mar 2019 09:56:25 +0000
Received: by mail-wm1-x342.google.com with SMTP id f3so3723121wmj.4
 for <linux-amlogic@lists.infradead.org>; Mon, 11 Mar 2019 02:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dlQmJsnensphSeHI2BxNKgmtHpRyagMWL7c5fX6N84g=;
 b=YqUa5DEPEbi8cm7SdOSEYeTYKPqw2gtnHok/BuxEl/Xvxr0dSCJDrGkriKlgsQK3Qs
 k60gH+H+xtVB0ApI/4+XAm/xtBF42Kf1RoIVGBUsIUwQvZqABdfIddINY6IZDh7SK/V7
 jChE7/FFUnHx9NyZdvAIaLZqf0ldauqTRFe7DpYysZ+wmZ10bw6ajDOeEJustqxlo83N
 bidUhgtICIwna7n/42eHfrI0/A7qlyh49LybeyRzpBDZ3nz6xzto9fQfAdJW/25IxlHf
 G2DOj6DJ5a0tOEu/IrlLI8JoCj52R2dZyZHI+R6wWcvhGjNPf4dNuzUljOvxz0ND40eo
 T0gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dlQmJsnensphSeHI2BxNKgmtHpRyagMWL7c5fX6N84g=;
 b=uMPgrELmhfUhEhZBhWqKAGU/0LmA6/OfESGMxKa/3BMfZrFX8R6iJQTgl5vHSoTdPs
 QSB6lJpWUY4zNmLinAUp2xlc3vBTCk5Z6cG0fFE2OtOcqIA+GoYU86C5B0wonp+dRzl7
 nDgVNqtHey5DLuQ57sGp1RDj8ifetAiKuckGYCLSYHDZgtTtmryFu3KlVToBrxIpncrO
 Lle1PjflmJdtTALBmsBhRbmkM6g0DEwZof9jdvbgF+XadGpHiHCyp8hN+jqKkzpWU1w4
 4JyC4jep9SEb/561AaU9BoGYtoJOZiO3V8BBhyl5Va8EOVtHHxNTzQJgTW4HpP+FP0sj
 drnw==
X-Gm-Message-State: APjAAAW1/L0tKDv/fRW46dFPdHjB8+ffR68CVFymAFzd5qNSfAYbHOWZ
 MVprOlIAw+nbpAhDwU5NJRUdQB712TANYg==
X-Google-Smtp-Source: APXvYqzFnPCm7pP6aZLD3dgEH/TMQKJKZkJE4UY6ET4IF6Krgpq2OQH9Gz56QJgYLgkpcsfc+BqvoQ==
X-Received: by 2002:a1c:7906:: with SMTP id l6mr16117566wme.83.1552298180112; 
 Mon, 11 Mar 2019 02:56:20 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id e12sm4764737wrs.91.2019.03.11.02.56.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 11 Mar 2019 02:56:19 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 04/11] arm64: dts: meson-g12a-u200: add regulators
Date: Mon, 11 Mar 2019 10:56:06 +0100
Message-Id: <20190311095613.11371-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190311095613.11371-1-narmstrong@baylibre.com>
References: <20190311095613.11371-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190311_025621_726765_6F810CFA 
X-CRM114-Status: UNSURE (   9.31  )
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
Cc: linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Jerome Brunet <jbrunet@baylibre.com>

Add system regulators for the S905D2 U200 reference design.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../boot/dts/amlogic/meson-g12a-u200.dts      | 79 +++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
index f2afd0bf3e28..17696f356ff2 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
@@ -14,13 +14,92 @@
 	aliases {
 		serial0 = &uart_AO;
 	};
+
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
 	memory@0 {
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
+	main_12v: regulator-main_12v {
+		compatible = "regulator-fixed";
+		regulator-name = "12V";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
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
+		vin-supply = <&main_12v>;
+
+		gpio = <&gpio GPIOH_8 GPIO_OPEN_DRAIN>;
+		enable-active-high;
+	};
+
+	usb_pwr_en: regulator-usb_pwr_en {
+		compatible = "regulator-fixed";
+		regulator-name = "USB_PWR_EN";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc_5v>;
+
+		gpio = <&gpio GPIOH_6 GPIO_ACTIVE_HIGH>;
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
+		vin-supply = <&main_12v>;
+		regulator-always-on;
+	};
+
 };
 
 &uart_AO {
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
