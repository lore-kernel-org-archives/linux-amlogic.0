Return-Path: <SRS0=lgrq=RV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DEF8C4360F
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 10:06:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3CBA20693
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 10:06:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pZwbA+2Y";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Q6IPGYW5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3CBA20693
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=asvVIyea6T40c6tWFVJxVMC6Qz/Moz+KeS2+uUtGQb0=; b=pZwbA+2Yy/HoqM
	rK8xFFH6nPHSAcHeHnRwhKKxOb27AE1eqfEIxgw0veYyYmuPYeUNEnFkycZNhXQREldVCcGGIELDQ
	Oi0XAgfl2YZ9wRU7w7Bh+/VRSAX1wZlIbEK/IWqvOKRyuYS865n2Yth85xcc6yD4IUdgnpU4a9GQ6
	/jknOlGov7P85H2w2lPs9tlonXhnYlQV76ztWVVLHAD0o5VXn3ixDMMjB2iHxM+V9HSpMTuBx57OW
	9wXMeazcfDVc3k86lnP26sz/ZYL6iizsGNfTQD60oj3ICzKjz243GwYMHD01DkQURi0xz/qeVM7Ld
	orA381bR/ie+kkhlOnnA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h5pA5-0002Oi-Er; Mon, 18 Mar 2019 10:06:29 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h5p8k-0008KB-9B
 for linux-amlogic@lists.infradead.org; Mon, 18 Mar 2019 10:05:11 +0000
Received: by mail-wm1-x344.google.com with SMTP id 81so4784746wme.0
 for <linux-amlogic@lists.infradead.org>; Mon, 18 Mar 2019 03:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ka0M5kZ6v8ySNByodqf/V1Upid5BsB19/rCuYJ69Io0=;
 b=Q6IPGYW5JnzybV9eCeTUZGpZ1t+QYBOReq0nmki/vqAM6f2toL/vrjpXSqtdC6EdSF
 V6fjdzkqiS2uvJrNUUQ0+07LUcjVsxVryt2prNRQOCFNI487A+sUZNIobOq2WGvbnYvM
 WGrLRHx/AyYg6H6sbX34SDMQ9WuZvHLvOuPYgBaj8dBj0X0lkNcSuNAC1HTkGRZQGYc8
 51zwHFpnmae1ea6bpf6ZMRy1Oqj52erjsGJSxbxKO31+qO59w8B1h7d/+NByJu2/LdS7
 nG20pLv2QUQR3TW8Bb9eSNg4cr6/oErqroHmxvqP4I0K4Y0jiPgravFcQGekEt5/A5Is
 4I8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ka0M5kZ6v8ySNByodqf/V1Upid5BsB19/rCuYJ69Io0=;
 b=m8yZ4iHWNp/apX59KB4aonpd+0/c9lFnFov+aqmH6QtwMMmWFUYBaZsQtdEBn3SEPk
 8wEXyD4ZpzsNiu1Ffe7XNONp/YJfYncXVlvYg/ZQfrF33MaL19GPpSWZ9uYMBQE2AqGF
 VUga1/eVPmW/DNZV6ZQdUsC8n++B+NZ2PIeABQ/7q/PS3l5/+e1lI+KyYMf+A0uWsJGr
 cdD5s7zBLh/KjdfWaf4LGqd0U63Xl5sYdlcwR0de2CEGoZvXUwwR8evHoC1eeAtPrEn3
 XhQVj8BNQH2KD8PFEvxYB3tT7nv1aKVO+fpLd/DHQFMMALFB3cQ/UARND4bGCmj4/lOk
 l57Q==
X-Gm-Message-State: APjAAAXe9CADPszR6arFK+rzmLIN9QnQrek04ZNEpkj1HvRjPGSi4XX/
 ig+jsaD+7K8/nwNpH7AGdYlJzQ==
X-Google-Smtp-Source: APXvYqzauSS7+U5mbKeWJsPQvpH05dphmAXYiE8cM/k4iZwv2zyyZWyaecnUIJJttDGlsL1iTuLYEw==
X-Received: by 2002:a1c:d189:: with SMTP id i131mr3139666wmg.151.1552903504114; 
 Mon, 18 Mar 2019 03:05:04 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id i11sm5216800wrp.40.2019.03.18.03.05.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 18 Mar 2019 03:05:03 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH v2 04/11] arm64: dts: meson-g12a-u200: add regulators
Date: Mon, 18 Mar 2019 11:04:51 +0100
Message-Id: <20190318100458.5619-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190318100458.5619-1-narmstrong@baylibre.com>
References: <20190318100458.5619-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190318_030506_651903_7312A247 
X-CRM114-Status: UNSURE (   9.35  )
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

Add system regulators for the S905D U200 reference design.

Add some regulators. Still missing
* VDD_EE (0.8V - PWM controlled)
* VDD_CPU (PWM controlled)

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../boot/dts/amlogic/meson-g12a-u200.dts      | 79 +++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
index f2afd0bf3e28..c69328d16333 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
@@ -6,6 +6,8 @@
 /dts-v1/;
 
 #include "meson-g12a.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/gpio/meson-g12a-gpio.h>
 
 / {
 	compatible = "amlogic,u200", "amlogic,g12a";
@@ -21,6 +23,83 @@
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
