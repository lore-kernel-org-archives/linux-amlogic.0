Return-Path: <SRS0=YblX=6Y=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86D04C38A2A
	for <linux-amlogic@archiver.kernel.org>; Sun, 10 May 2020 12:42:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DA6F2080C
	for <linux-amlogic@archiver.kernel.org>; Sun, 10 May 2020 12:42:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sLOypgD/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LSwcXsCX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4DA6F2080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=EqWamRS6j8/3MkVVi8d0p9etC5M2oKdO+lMieDzNZHc=; b=sLOypgD/uY45h/jULB+qLmun2X
	HUkthOBofEzzqNJ9+Lft/oKzhiKUxwP1aPK1ZHIh5RzCuxS/2rl28Hp0tQ/g3nmcJMOI89xMZMW26
	ELnMRHdAHT5jEwZSUyWYeEzmjBCX8rrH3vK4KsSUWtPQk9l9jPlLhiJlvOnNmZ30Bix65dNN7qqf1
	8JmWLm/zg8QyIKSXAkzEFIbsyyJTiG3NqDnwJL+dj4rYdFN4N5/Nni2tD0cNxd99lHDAUAJVwiR/s
	f91EXJ83zx266CFqiLNOB6IVNvjpxtZOzFOincmuAJG9A6U+CtHsieJs7Q60Q5xA6HgTBGIcQ9+1l
	l9M/OJkQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jXlI7-0004PC-Ez; Sun, 10 May 2020 12:42:47 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXlH6-0003OE-Qt; Sun, 10 May 2020 12:41:46 +0000
Received: by mail-lj1-x241.google.com with SMTP id f18so6445097lja.13;
 Sun, 10 May 2020 05:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=NAU0BK+VVegmur9qw286jHjw2JuJhlP5IclMrk1t5Fc=;
 b=LSwcXsCXLUbmLEmiAoiY7Sc91AKsxo1qaLqtbW+OyVlysutWwkoKTk9DLVx+3XhQw+
 g1zrwvZ3Uv9NcD6FuZZqutd186rpIJjQzmMiMOSHAkA1jznx5tYQx4bqhtD0cidTFRlM
 YDxqTu7pByJje6EJLTWKVM4n5imLwczIPB38Qzfg8cJybUY6G0ySqle0WIA8pwf+RKNV
 gFPklHCzrtnZT24cyLtbZUxm0wYBWUjht+20HsFdllSC3afFnNHbExLuUV5mC+XyRwvF
 EhSYBZSBl4WF3OX4royuQqZeIzdE3aUOnDzSw8r1oFRR7+FNT5EAkaEoDnihR+PfO/q4
 w7tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=NAU0BK+VVegmur9qw286jHjw2JuJhlP5IclMrk1t5Fc=;
 b=qeX0PyucZLo/LZn0+RMvYVh5R6XWTbqhsdyt62Ec+RdCqcwVcXfDJWhRSWiyQAEaxM
 d47mp9FOli5xUm4eZCcNVxPP/0e7ArGu4zIuX83cSEpLs0oOPOJUYPb2u7eYW7tZD8wJ
 Uwv487EN84algYPgNzriaq/8XKTp5vEAbZZByNtxP6+/Xmv83xuULfBoCXmUa2pVkG5N
 eNkNPtmWFzJhW4YyFOFj14S97+ccZSUHeThyiYOzrkA33BJDUVBeGKEh2VTKSBZcdfVU
 x0fB2riP1MZ+wwicGNXXeRLoa288nL0lec7EKIhHjpz25I5x0QbLIGrgHtXILAhE4Eti
 H4Jg==
X-Gm-Message-State: AOAM531XS0pdKAi7tRTUHZRtdz0uyW5QjoCnA2iLK7Dy1b1C+7YkidPX
 GOQOXzcbyDD/0+tpHUZUdEw=
X-Google-Smtp-Source: ABdhPJxqYQXvLDdFvpl/hPS6GiSgWb9asphcJPLfMewADBnX1GCD9/pMZuHoMO8sjg2/4kXlE8bNAw==
X-Received: by 2002:a2e:3208:: with SMTP id y8mr7245503ljy.282.1589114502953; 
 Sun, 10 May 2020 05:41:42 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id m11sm7136611lfo.55.2020.05.10.05.41.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 May 2020 05:41:42 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v8 3/3] arm64: dts: meson: add support for the Smartlabs
 SML-5442TW
Date: Sun, 10 May 2020 12:41:29 +0000
Message-Id: <20200510124129.31575-4-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200510124129.31575-1-christianshewitt@gmail.com>
References: <20200510124129.31575-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200510_054144_934583_A5D295AB 
X-CRM114-Status: GOOD (  15.07  )
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

The Smartlabs SML-5442TW is based on the Amlogic P231 reference design
but with the following differences:

- The Yellow and Blue LEDs are available but disabled
- The Red and Green LEDs are used to signal off/on status
- uart_AO can be accessed after opening the case; soldered pins exist
- QCA9377 instead of the usual Ampak/Broadcom module

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 arch/arm64/boot/dts/amlogic/Makefile          |  1 +
 .../dts/amlogic/meson-gxl-s905d-sml5442tw.dts | 80 +++++++++++++++++++
 2 files changed, 81 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dts

diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
index eef0045320f2..6cf8c4ac0390 100644
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -27,6 +27,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-p212.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905d-p230.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905d-p231.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905d-phicomm-n1.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905d-sml5442tw.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s805x-p241.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905w-p281.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905w-tx3-mini.dtb
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dts
new file mode 100644
index 000000000000..0b95e9ecbef0
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dts
@@ -0,0 +1,80 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) Christian Hewitt <christianshewitt@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "meson-gxl-s905d.dtsi"
+#include "meson-gx-p23x-q20x.dtsi"
+#include <dt-bindings/leds/common.h>
+
+/ {
+	compatible = "smartlabs,sml5442tw", "amlogic,s905d", "amlogic,meson-gxl";
+	model = "SmartLabs SML-5442TW";
+
+	leds {
+		compatible = "gpio-leds";
+
+		yellow {
+			color = <LED_COLOR_ID_YELLOW>;
+			function = LED_FUNCTION_STATUS;
+			gpios = <&gpio_ao GPIOAO_6 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		blue {
+			color = <LED_COLOR_ID_BLUE>;
+			function = LED_FUNCTION_STATUS;
+			gpios = <&gpio GPIODV_28 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		green {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_STATUS;
+			gpios = <&gpio_ao GPIOAO_9 GPIO_ACTIVE_HIGH>;
+			default-state = "on";
+		};
+
+		red {
+			color = <LED_COLOR_ID_RED>;
+			function = LED_FUNCTION_STATUS;
+			gpios = <&gpio GPIODV_27 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+	};
+};
+
+&ethmac {
+	status = "okay";
+	phy-mode = "rmii";
+	phy-handle = <&internal_phy>;
+};
+
+&i2c_A {
+	status = "okay";
+	pinctrl-0 = <&i2c_a_pins>;
+	pinctrl-names = "default";
+};
+
+&internal_phy {
+	pinctrl-0 = <&eth_link_led_pins>, <&eth_act_led_pins>;
+	pinctrl-names = "default";
+};
+
+/* This is connected to the Bluetooth module: */
+&uart_A {
+	status = "okay";
+	pinctrl-0 = <&uart_a_pins>, <&uart_a_cts_rts_pins>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
+
+	bluetooth {
+		compatible = "qcom,qca9377-bt";
+		enable-gpios = <&gpio GPIOX_17 GPIO_ACTIVE_HIGH>;
+		max-speed = <2000000>;
+		clocks = <&wifi32k>;
+		clock-names = "lpo";
+	};
+};
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
