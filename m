Return-Path: <SRS0=xEby=A5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8AA3C433E4
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Jul 2020 05:01:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A5172076A
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Jul 2020 05:01:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mChEocmL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T2MHOb96"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A5172076A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FKw43ST8x7ed3ayiuBYHnGYD5ACdo7RM0c9eBlBWfKw=; b=mChEocmLSuaiymWF+buWxggT8P
	BibLaEQiZOd186jiOOyVwJ/OCNajUYBlGNawawja7YYwRWBeFU+k69fHNrF2E2p++DX066p2Cfm6k
	XA1wPq0GJgqMwn3QR+eM7XNNWkazzqi9LlDkr2nh0lzuZfClk001oBx68gK0dxUD5WUl5+LbBqd0U
	cs62eF5EmzJ0fDhgIOsYGhzaaMo9U7mf74yeoTVxj1Ov9xwxlVyDqtjU8746ocE154Bo6ykEAiRe5
	Wgd7K8elkJR431Lwl3YNnLi7tdjduOsekJv96QrKb1POLnSW2FxegucIE1YEBnEeY59WAwUnhisav
	3nBherTA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jweyG-00071k-J0; Sat, 18 Jul 2020 05:01:12 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwey9-0006zx-GG; Sat, 18 Jul 2020 05:01:06 +0000
Received: by mail-wr1-x444.google.com with SMTP id f18so13163430wrs.0;
 Fri, 17 Jul 2020 22:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=pdW+Mjjnec0fSYPYQpDNjTJP81EjQ4GG3syPqnLR7Sc=;
 b=T2MHOb96zwRInfSLZlWUZTvE51GWOTjRoEfY/e1F9wRGBHS7xuq7BpVecTZUTEUF1W
 n/zz0kXeHWfy5gWgr6M45vy3Bd8cWRXlj9YUMZVSAUNDjp1tO1wE3yEEJVR8WTAyTX/o
 t8jKPqv0RoK1WJow8GD155dFpuO+hbSH7rjJvhHTAq0mqfm00ZEEFPHtaUk73oDZcZ1m
 QBigDfwRfa9diYYtY3k6bz9p5hwvOGbxjl/uQs5YoSxb50ktVsQDgOa5LtldlXPx84RM
 qdsFTenMH212uwVF4PaJJmKp5aAZt/9UKAltbrdc7V9ypwy06/UavuAfp9wi2FCThowM
 DZeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=pdW+Mjjnec0fSYPYQpDNjTJP81EjQ4GG3syPqnLR7Sc=;
 b=CYZOsTxoL+0PkHu5Gz099/azXzCmRXbzIxZuVumR+JjbGK0mY/pY6ZHrNqAR3cy6bo
 /sGud8ISbMIgzKrXF8M8duY+PUJTacJcOQedJjPFOmIgZbaor6UucsYIQNyaSxx5jvXU
 9Hkpbje7BiDfeOPagAqEpAsXffg88IK3UERh93TI1pc/HXjAagKyxyqrL5v/5CoXfnSW
 nGlmRfmfOfEhsRFkpU/Qdas6tCDLQxkc1GoFzbVT1Kc1oxeDV39vaRJrB0H3oOMGyoy+
 aAbDFdJ8G0u2Uh/QYAMF8E9uxyN05eeegMSXG3ylbT7SE+c95fRoVqiwaRE/uK4M4TiH
 5nLQ==
X-Gm-Message-State: AOAM530BJL7BYQDc/p/gNOUVHHRjGYPv1jzC3Fee5lJbEo+EK3uFlTES
 LkgMio1ei4iBKJ7aYaAnMfQ=
X-Google-Smtp-Source: ABdhPJxHRWHgh67kxq9xkuW198zVtS8jYB21lXDt27XPbgKgq2mt1y4z1UjeejNofF1NYKxGFZ/d9w==
X-Received: by 2002:a5d:4b45:: with SMTP id w5mr12527495wrs.4.1595048462119;
 Fri, 17 Jul 2020 22:01:02 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id 68sm18179815wmz.40.2020.07.17.22.01.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2020 22:01:01 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: meson: add support for the WeTek Core 2
Date: Sat, 18 Jul 2020 05:00:56 +0000
Message-Id: <20200718050056.1713-2-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200718050056.1713-1-christianshewitt@gmail.com>
References: <20200718050056.1713-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200718_010105_586435_DD1E6B5B 
X-CRM114-Status: GOOD (  17.11  )
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

The WeTek Core2 is a commercial device based on the Amlogic Q200 reference
design but with the following differences:

- 3GB RAM, 32GB eMMC
- Blue and Red LEDs used to signal on/off status
- uart_AO can be accessed after opening the case; soldering required
- USB OTG is not accessible (inside the case)
- Realtek RTL8152 Ethernet (internal USB connection)

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 arch/arm64/boot/dts/amlogic/Makefile          |  1 +
 .../dts/amlogic/meson-gxm-wetek-core2.dts     | 90 +++++++++++++++++++
 2 files changed, 91 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxm-wetek-core2.dts

diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
index 5cac4d1d487d..4e2239ffcaa5 100644
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -41,6 +41,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-gxm-q201.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-rbox-pro.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-s912-libretech-pc.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-vega-s96.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-gxm-wetek-core2.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-sm1-sei610.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-sm1-khadas-vim3l.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-sm1-odroid-c4.dtb
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-wetek-core2.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-wetek-core2.dts
new file mode 100644
index 000000000000..44fc5ea38dc0
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-wetek-core2.dts
@@ -0,0 +1,90 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2020 Christian Hewitt <christianshewitt@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "meson-gxm.dtsi"
+#include "meson-gx-p23x-q20x.dtsi"
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+
+/ {
+	compatible = "wetek,core2", "amlogic,s912", "amlogic,meson-gxm";
+	model = "WeTek Core 2";
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x0 0x0 0x80000000>; /* 2 GiB or 3 GiB */
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		blue {
+			color = <LED_COLOR_ID_BLUE>;
+			function = LED_FUNCTION_STATUS;
+			gpios = <&gpio GPIODV_24 GPIO_ACTIVE_HIGH>;
+			default-state = "on";
+		};
+	};
+
+	adc-keys {
+		compatible = "adc-keys";
+		io-channels = <&saradc 0>;
+		io-channel-names = "buttons";
+		keyup-threshold-microvolt = <1710000>;
+
+		button-update {
+			label = "update";
+			linux,code = <KEY_VENDOR>;
+			press-threshold-microvolt = <10000>;
+		};
+	};
+
+	gpio-keys-polled {
+		compatible = "gpio-keys-polled";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		poll-interval = <100>;
+
+		button-power {
+			label = "power";
+			linux,code = <KEY_POWER>;
+			gpios = <&gpio_ao GPIOAO_2 GPIO_ACTIVE_LOW>;
+		};
+	};
+};
+
+/* This is disabled as Realtek RTL8152 USB provides Ethernet */
+&ethmac {
+	status = "disabled";
+	phy-mode = "rmii";
+	phy-handle = <&internal_phy>;
+};
+
+&internal_phy {
+	pinctrl-0 = <&eth_link_led_pins>, <&eth_act_led_pins>;
+	pinctrl-names = "default";
+};
+
+&ir {
+	linux,rc-map-name = "rc-wetek-play2";
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
+		compatible = "brcm,bcm43438-bt";
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
