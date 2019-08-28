Return-Path: <SRS0=aHUU=WY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B27F8C3A5A1
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Aug 2019 14:12:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 889C62189D
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Aug 2019 14:12:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N3DIIgLZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="CPajweGC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 889C62189D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6q/mSCFUeBBqkPbHR0rUXkSpZVv39b7LMdHu8svc2P0=; b=N3DIIgLZW/YIep
	ExAoeRwMSlSCGHdoifhx9BM7slII1nqPZOd5XPfuD6vRP2oznn+hYch2XWYkGGYh8BpUp+gazyF3L
	yrdWM9ZdNzYZHbGGyzM5i0KbG8LafB/IfX4MameriXIgB57CsZw4vjJ5SMBofnYEaDjx51AvyyFx2
	XXDIfGVA4UsVTk7jGpM0IrI8pabptvIuxyZSnryYc11wsL2nxtOrMkqv/v8B7CINL6IXnXslPdprA
	5P3SWAG6eWUDK3t8HHzs6xVuGhkMFIJbgqSmljnMNPFCOILMKFwQEs8MTha7b7hwe6dmkC29ew6CT
	4OVSrP+M9DLmWifp4wdA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2ygw-0008HH-Cy; Wed, 28 Aug 2019 14:12:54 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2yg8-0007Qr-H4
 for linux-amlogic@lists.infradead.org; Wed, 28 Aug 2019 14:12:06 +0000
Received: by mail-wr1-x444.google.com with SMTP id u16so2713097wrr.0
 for <linux-amlogic@lists.infradead.org>; Wed, 28 Aug 2019 07:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x8fPXZy6s7fSXGNVXDgDu4BkBSj5SqALzh4Ghh1aBOk=;
 b=CPajweGCAUD9yks8LzYgU2HerKglth8p0dRXSnKd+0ELtHs0MIqAHsPT8c1OAxPNer
 QZoymlZV9WoD6Gf3xVrSUaq8m2vbN6l4I0C8xHu09J9LkZoBr22ZnFRiY87jCWBl3K4k
 LCX23SLQAAWjkwSoa86nE9bLj4QuudhgePOlhKAqrlDiTXmQ8o8HaCvbmhAQ8NIrsn7H
 rhdu++obGYqdrW9OMSmMEVQDggyl7fAMZuVXEYoqgrwc/ZvvhK6yyh9G+6JCCh9In2Xm
 gX7qjCCxWhsdjVLp2zKoaICGeAhLK8BLtcLy7pyL62GLyN1pdUDq5rnqa3iiU8VQbfmp
 JDfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x8fPXZy6s7fSXGNVXDgDu4BkBSj5SqALzh4Ghh1aBOk=;
 b=Rvl733QcDEfuijgIj55V085WgXfqAr1jiwyvqGD4FUB51+Cv9y/+kN7fJxkDcYz6ld
 LB+S10PfGpJDB1gQjV0rF4LUTKHYcynJgAZNj2BRQUSjG+kFF643YyYs5YMVds+fkWR9
 lzH8XySfZZRQTTNKeMfqhL8FbW8z5RWkVgRmFv5PJqnpsaVYOZMSnTsurMtCcYdhQk7O
 W/UPoAPnehCaEkBVb6IB1GbrpDYJwOoc2Q4a38twWGWm6Uq3MlgAFC5jYocsI4Zle2b8
 sJndad3R+XqrCa4EXAoBXvvyCkda9mSO8JlyDChGvP9oqmlzeXQPcLy7Tg1Essz/JYkM
 SVOg==
X-Gm-Message-State: APjAAAUYFDPIEVKWiU1yNIHNpseYZkF8Xf29yqkjZGxPIQqqpC/w4ZgI
 xkPoiyFo//U1XaRK4P6Jjy2LgM0ObtZs0A==
X-Google-Smtp-Source: APXvYqwG1ZhyXVOn+IpEMzrwvxB5kMuQJ2oHDe9dj7LB12pG3Q2AZepM9ElxCTetUuJVFLowhhDcOg==
X-Received: by 2002:adf:dec8:: with SMTP id i8mr4844927wrn.217.1567001523089; 
 Wed, 28 Aug 2019 07:12:03 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id a11sm2774838wrx.59.2019.08.28.07.12.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 07:12:02 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH v2 3/3] arm64: dts: khadas-vim3: add support for the SM1 based
 VIM3L
Date: Wed, 28 Aug 2019 16:11:57 +0200
Message-Id: <20190828141157.15503-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190828141157.15503-1-narmstrong@baylibre.com>
References: <20190828141157.15503-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190828_071204_599180_AF5262CF 
X-CRM114-Status: GOOD (  14.56  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the Amlogic SM1 based Khadas VIM3L, sharing all the same features
as the G12B based VIM3, but:
- a different DVFS support since only a single cluster is available
- audio is still not available on SM1

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/Makefile          |  1 +
 .../dts/amlogic/meson-sm1-khadas-vim3l.dts    | 70 +++++++++++++++++++
 2 files changed, 71 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts

diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
index edbf128e7707..84afecba9ec0 100644
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -35,3 +35,4 @@ dtb-$(CONFIG_ARCH_MESON) += meson-gxm-q201.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-rbox-pro.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-vega-s96.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-sm1-sei610.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-sm1-khadas-vim3l.dtb
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
new file mode 100644
index 000000000000..5233bd7cacfb
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
@@ -0,0 +1,70 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2019 BayLibre, SAS
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ */
+
+/dts-v1/;
+
+#include "meson-sm1.dtsi"
+#include "meson-khadas-vim3.dtsi"
+
+/ {
+	compatible = "khadas,vim3l", "amlogic,sm1";
+	model = "Khadas VIM3L";
+
+	vddcpu: regulator-vddcpu {
+		/*
+		 * Silergy SY8030DEC Regulator.
+		 */
+		compatible = "pwm-regulator";
+
+		regulator-name = "VDDCPU";
+		regulator-min-microvolt = <690000>;
+		regulator-max-microvolt = <1050000>;
+
+		vin-supply = <&vsys_3v3>;
+
+		pwms = <&pwm_AO_cd 1 1250 0>;
+		pwm-dutycycle-range = <100 0>;
+
+		regulator-boot-on;
+		regulator-always-on;
+	};
+};
+
+&cpu0 {
+	cpu-supply = <&vddcpu>;
+	operating-points-v2 = <&cpu_opp_table>;
+	clocks = <&clkc CLKID_CPU_CLK>;
+	clock-latency = <50000>;
+};
+
+&cpu1 {
+	cpu-supply = <&vddcpu>;
+	operating-points-v2 = <&cpu_opp_table>;
+	clocks = <&clkc CLKID_CPU1_CLK>;
+	clock-latency = <50000>;
+};
+
+&cpu2 {
+	cpu-supply = <&vddcpu>;
+	operating-points-v2 = <&cpu_opp_table>;
+	clocks = <&clkc CLKID_CPU2_CLK>;
+	clock-latency = <50000>;
+};
+
+&cpu3 {
+	cpu-supply = <&vddcpu>;
+	operating-points-v2 = <&cpu_opp_table>;
+	clocks = <&clkc CLKID_CPU3_CLK>;
+	clock-latency = <50000>;
+};
+
+&pwm_AO_cd {
+	pinctrl-0 = <&pwm_ao_d_e_pins>;
+	pinctrl-names = "default";
+	clocks = <&xtal>;
+	clock-names = "clkin1";
+	status = "okay";
+};
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
