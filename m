Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DD15CAC5B0
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Sep 2025 12:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=br7Qf44+SPaf5jrI25UUqYVoaBnm8ubv3YmJV3Q+rBI=; b=XYIWpDj2uv5xCg
	MWiam2xRvx6/AcccGlWQsDGRrKz6jrs4fnOuQQQMsgcY4hqpZoYvh2x44/QZR2WC4aWmNsesN5w2M
	IZt9xfbAxjJjn0IrNh+/9K3t+fpWdEBVW4f5ARtyOHUGFCiBLKCBx++ChWUeHmVF4oojTcvGBaEdl
	CkECwpEHJcBd5iF7btJWig7PRNGxE/fLam470a2OPluB6bNbBLITUsoFmw3F2mPDAdUOZn5lNZg5v
	LIfhEHNysqnTq47asm4WMrrdsEfDd7aJMyBKCgUsnEvBhw0zOK0sfHh4MLxOdJ/1q9gt58usRBTeM
	WdivZyKL94JRPItasGrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2UNZ-00000009nT6-38pO;
	Sat, 27 Sep 2025 12:50:21 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2UNT-00000009nMv-1eqP
	for linux-amlogic@lists.infradead.org;
	Sat, 27 Sep 2025 12:50:17 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-46e34bd8eb2so31355535e9.3
        for <linux-amlogic@lists.infradead.org>; Sat, 27 Sep 2025 05:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758977413; x=1759582213; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tvqCH35JXfb+heqlrUNAEgD5kXF3T57R7NZ3MRlHDho=;
        b=OvIzun1OUAnn9rnwaE7a8DYC7/icA0sthChcWTmdKx671Y4NSEHzHjoTV5pWhqDAIp
         0zB04WVODYfZiGRDbHGcTLA/AkQWp7Cyjm+vO6Zx/MBKcQxvQUCqcSjceEE6CZa9v1Db
         hi8NAHDy5AN8O9GBXNpZyYfA28Ug23EbsgN6/FvL8HUyunkb3Yy0NfoDRhLuKycnk57c
         iKKjQOLOUWeE9xIHLQNUhgdm4PnwbY1ahEHjgEv1YiCvKTdc0h5CAzCUjlzoLagx/R30
         G97+mluHAib1rmVU6UW9+n8jAFkZksRyRc0c9voOYAbrwKXFMl2NhmvjvyuEbpT2Gxb1
         8UVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758977413; x=1759582213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tvqCH35JXfb+heqlrUNAEgD5kXF3T57R7NZ3MRlHDho=;
        b=rkGubqSxV77l8elq+v1YswMSTTIwhe/1bMmPzxCPGeXL1uLMWsEzd6vzoYKY8jn3Tq
         ko1s8CtRjROmLyzlhPGd0apgOkO+i63mnE5ZYNKRf0C/W5sM0/wjoHmzyRK7S2thj77H
         0jd+kb9DVp56MnCuxMqcqghhXXI3RUs/UU9bg2fuQBKqXgY31f1yHfisuW0DOcfwx/Vb
         AOPK4muOqpPqFzMpg17WGitt9nIMwIphr2zuQLxQ77tA8QSbL3TTOxKZL+9MPfKJyS6q
         dndM4qWOyNfcml38ShkUzlCUe8rGVlYmB0LO/JECNMIB6F2q3TVWBZiGGu2MSROuWKT2
         ETxg==
X-Forwarded-Encrypted: i=1; AJvYcCVZAyVjKUiGreOohTV+ZpiHv8XO3tdK5YzjuiJw9cg0S4Ezj4VngQ6wztYKmHx6S29faWeuvYxl61gb4Q+5@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0+EGWbhdxoSZfUXcuCGnFwWLWORYroiRz/m1V3ZHJWDr5U6D+
	qczbzXMxxlRqxCzZX3aqdxBXni7lwJkDmeJZSq1PXWATZ7cE1A+df0VR
X-Gm-Gg: ASbGnctnLx9ZOopoVXDgf94uH0E3oyJIf00aWNnyZIK8CCyKyAf3Y3vL+lS3roXNe/r
	MLf8Uk/I8fEEBWJWVWbVkRVzox23MMoLwJq/krgkxS240VsRtdgS+j7f1vXophdeK3w4YLIqL0J
	dvQ3IBpyv60PJ4FFBASUzQGgFcbjN1QGCKB9JDN8sz5YxmSbz40s3KVETKlXFUwX1oF/aX3nXsB
	K/Phs8WwNCl7DoYMjEeT7vluSb32PyG+AgPinB+peXO5ea/MX50pLjVvmfz4kRt8pb0RYPrgcBO
	hOp1fBof1bgAPPPtWsVv3cj5LztSkTzUEv9Uxlp8YToacUD5kU7tgJba6dVJrA8ZOTXuMzxWahq
	He6o4OKmkjeyymuRgm/oR5Iy80ro=
X-Google-Smtp-Source: AGHT+IGFiza2PyST1hvBpar3qyMF627+xP0YSabLGMeYvzRG6Xn1tvxP7J8jmmQXhXGeK1SK484Oow==
X-Received: by 2002:a05:600c:1da1:b0:46e:37fe:f0e6 with SMTP id 5b1f17b1804b1-46e37fef1cdmr84106095e9.30.1758977413198;
        Sat, 27 Sep 2025 05:50:13 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e33bede39sm115338255e9.18.2025.09.27.05.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Sep 2025 05:50:12 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: meson: add initial device-tree for Tanix TX9 Pro
Date: Sat, 27 Sep 2025 12:50:06 +0000
Message-Id: <20250927125006.824293-2-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250927125006.824293-1-christianshewitt@gmail.com>
References: <20250927125006.824293-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250927_055015_468231_5174EE2B 
X-CRM114-Status: GOOD (  14.49  )
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

Oranth Tanix TX9 Pro is based on the Amlogic Q200 reference design with
an S912 chip and the following specs:

- 3GB DDR3 RAM
- 32GB eMMC
- 10/100/1000 Base-T Ethernet
- AP6356 Wireless (802.11 b/g/n/ac, BT 5.0)
- HDMI 2.0a video
- VFD for clock/status
- 2x USB 2.0 ports
- IR receiver
- 1x Power LED (white)
- 1x Update/Reset button (underside)
- 1x micro SD card slot

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
Checkpatch generates the 'phy-mode "rgmii" without comment'
warning but this dts is using the same rgmii format as all
other Amlogic boards, so I have omitted a comment.

 arch/arm64/boot/dts/amlogic/Makefile          |  1 +
 .../boot/dts/amlogic/meson-gxm-tx9-pro.dts    | 90 +++++++++++++++++++
 2 files changed, 91 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxm-tx9-pro.dts

diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
index 619dce79b020..219fb088c704 100644
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -80,6 +80,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-gxm-q200.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-q201.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-rbox-pro.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-s912-libretech-pc.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-gxm-tx9-pro.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-ugoos-am3.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-vega-s96.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-wetek-core2.dtb
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-tx9-pro.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-tx9-pro.dts
new file mode 100644
index 000000000000..9a62176cfe5a
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-tx9-pro.dts
@@ -0,0 +1,90 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2016 Endless Computers, Inc.
+ * Author: Carlo Caione <carlo@endlessm.com>
+ */
+
+/dts-v1/;
+
+#include "meson-gxm.dtsi"
+#include "meson-gx-p23x-q20x.dtsi"
+#include <dt-bindings/input/input.h>
+
+/ {
+	compatible = "oranth,tx9-pro", "amlogic,s912", "amlogic,meson-gxm";
+	model = "Tanix TX9 Pro";
+
+	adc-keys {
+		compatible = "adc-keys";
+		io-channels = <&saradc 0>;
+		io-channel-names = "buttons";
+		keyup-threshold-microvolt = <1710000>;
+
+		button-function {
+			label = "Update";
+			linux,code = <KEY_VENDOR>;
+			press-threshold-microvolt = <10000>;
+		};
+	};
+
+	gpio-keys-polled {
+		compatible = "gpio-keys-polled";
+		poll-interval = <100>;
+
+		button {
+			label = "power";
+			linux,code = <KEY_POWER>;
+			gpios = <&gpio_ao GPIOAO_2 GPIO_ACTIVE_LOW>;
+		};
+	};
+};
+
+&ethmac {
+	pinctrl-0 = <&eth_pins>;
+	pinctrl-names = "default";
+	phy-handle = <&external_phy>;
+	amlogic,tx-delay-ns = <2>;
+	phy-mode = "rgmii";
+};
+
+&external_mdio {
+	external_phy: ethernet-phy@0 {
+		/* Realtek RTL8211F (0x001cc916) */
+		reg = <0>;
+		max-speed = <1000>;
+
+		reset-assert-us = <10000>;
+		reset-deassert-us = <80000>;
+		reset-gpios = <&gpio GPIOZ_14 GPIO_ACTIVE_LOW>;
+
+		interrupt-parent = <&gpio_intc>;
+		/* MAC_INTR on GPIOZ_15 */
+		interrupts = <25 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
+
+&ir {
+	linux,rc-map-name = "rc-tanix-tx3mini";
+};
+
+&sd_emmc_a {
+	brcmf: wifi@1 {
+		reg = <1>;
+		compatible = "brcm,bcm4329-fmac";
+	};
+};
+
+&uart_A {
+	status = "okay";
+	pinctrl-0 = <&uart_a_pins>, <&uart_a_cts_rts_pins>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
+
+	bluetooth {
+		compatible = "brcm,bcm43438-bt";
+		shutdown-gpios = <&gpio GPIOX_17 GPIO_ACTIVE_HIGH>;
+		max-speed = <2000000>;
+		clocks = <&wifi32k>;
+		clock-names = "lpo";
+	};
+};
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
