Return-Path: <SRS0=5jQr=I7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9136DC433B4
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Apr 2021 06:46:20 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 351E061103
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Apr 2021 06:46:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 351E061103
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8b2BvrmBVQV/B4LLGniBO6wL7gvTSmmRu4i/8nIoPOY=; b=jiv7edN/YY1Nun3wjlufUJNRcp
	4jHg8RYG1BuK5RNsJ2pZUV69MLlbENVEBqCVpgUqYjWNFvIVA3t9W73Gr5kioRL6e7jyfOMxWaoqf
	u7mDdegxbbpCshDuwnkd2RqQTgfxoYHPsPu2EqPMLawunJWleUG0gMEub3jUNjGqshAqIGfRNYOw4
	bhPMHvYOscYQSmYU6CtW54CUUJX5YPS+vCGQY91BKEvx5acNlFW3CsNu5TpegZ1hAvbh9BPRY3R+Z
	DK8Y7FgMpT+RR+cQ1Uk0sX6tAOsbLFWN4Zxetly9XlBr90e6fvg5+pXQM57KEzXlwVf9VEyE6lqji
	Tl5arsoA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lSDZN-00C8N1-Mj; Fri, 02 Apr 2021 06:46:13 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lSDYg-00C8DY-Eh; Fri, 02 Apr 2021 06:45:32 +0000
Received: by mail-wm1-x32e.google.com with SMTP id g20so2060344wmk.3;
 Thu, 01 Apr 2021 23:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=IXrsfM/bzMtfG8sk9rGtjCWcXsrIlDFcIC5xqhsxNUQ=;
 b=XXWDfPnhi5QTmEkyP9dgE7t253bfQKkETi44apcA0dbFdDCqShlDFMB2MFuvXIGhDl
 1pVie3m9RznqEMSqNj1YvBhOgsYv8Dcw0al72AubcvqAk+hnTud+AZswi4y4w3U3Nkcd
 CXYb86hR38UD7pdOe+Uay3T6XmJ0RAuUGgSvccmH7KW1dvm7up2cs+4nRjRkzlr02Osd
 m6Rgh6enO9YloqXvUIjzGUUndMrwiOx08pgvIF4yiai8CD2XhalcnnYPNrtqV0nXFbFD
 iG9ZbO+Pjt7CXQ/WingDcSwYVgN2RtfFjyKfd7Wvo99Lf/4rhICNy3STJqpHUCSo+LKd
 Xlfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=IXrsfM/bzMtfG8sk9rGtjCWcXsrIlDFcIC5xqhsxNUQ=;
 b=RC/Ovln2lwuysmIFu9d8mYK5B8OzpoQz0klHGc9bQa8hiFGIMCK637VdPyWIW/DhS/
 nM/F+I/j+0ikJj+wfwscWO6JDGelP/ZJBywOIlsScRFDUw1Bstlw2N43KxcWdpZkgBWq
 nyOX212Fl8c5niH56tZXgY4+b5jArVDYsBk3nDijKgA9RCyFJC80sVmNSrwIZHbT/oma
 a76nju9iTSJ3KO1rnVg+i/qLicU2QyLetXqj/l2abHiXvFhZLdDHMax0lw2HwrEAlIg6
 h0koxpPE/ucOw0mvNg1dlS+7jG5dpNjpP14EgLi4etwJqQrWWnbA30IhPPvMuMCyxGiY
 kC5g==
X-Gm-Message-State: AOAM530E8j4AsbZlNqpi3B6UhqHZdDPT1zCYm3mwJKTr8plCYo4Ee3rV
 to4NPJKHioPff0oh2aTGuKc=
X-Google-Smtp-Source: ABdhPJw7QRHWHHVnYtQ9i82pbjvzX4UeYRh1S9npADu4fuBzoegfyDWvLO3aAc8sPtpGkCE/49QH9w==
X-Received: by 2002:a7b:c24f:: with SMTP id b15mr11202016wmj.59.1617345929937; 
 Thu, 01 Apr 2021 23:45:29 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id m17sm13627131wrx.92.2021.04.01.23.45.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 23:45:29 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH v2 2/3] arm64: dts: meson: add initial device-tree for MeCool
 KII Pro
Date: Fri,  2 Apr 2021 06:45:20 +0000
Message-Id: <20210402064521.30579-3-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210402064521.30579-1-christianshewitt@gmail.com>
References: <20210402064521.30579-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210402_074530_749563_0A117A8F 
X-CRM114-Status: GOOD (  15.70  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

MeCool (Videostrong) KII Pro is based on the Amlogic P230 reference
board with an S905D chip and the following specs:

- 2GB DDR3 RAM
- 16GB eMMC
- 10/100 Base-T Ethernet
- BCM4335 Wireless (802.11 b/g/n/ac, BT 4.0)
- DVB-C/T/T2/S/S2 (AVL6862TA demod + R848 tuner)
- HDMI 2.0a video
- S/PDIF optical output
- CVBS/Analogue output
- 4x USB 2.0 ports
- IR receiver
- 1x Power button (with integrated blue LED)
- 1x micro SD card slot

Tested-by: Drazen Spio <drazsp@gmail.com>
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/Makefile          |  1 +
 .../meson-gxl-s905d-mecool-kii-pro.dts        | 86 +++++++++++++++++++
 2 files changed, 87 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s905d-mecool-kii-pro.dts

diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
index aebd49c88719..f8f515c93055 100644
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -29,6 +29,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-libretech-cc.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-libretech-cc-v2.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-nexbox-a95x.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-p212.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905d-mecool-kii-pro.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905d-p230.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905d-p231.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905d-phicomm-n1.dtb
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-mecool-kii-pro.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-mecool-kii-pro.dts
new file mode 100644
index 000000000000..5ab5d3aa0646
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-mecool-kii-pro.dts
@@ -0,0 +1,86 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+/*
+ * Author: Christian Hewitt <christianshewitt@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "meson-gxl-s905d.dtsi"
+#include "meson-gx-p23x-q20x.dtsi"
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+
+/ {
+	compatible = "videostrong,gxl-kii-pro", "amlogic,s905d", "amlogic,meson-gxl";
+	model = "MeCool KII Pro";
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
+		#address-cells = <1>;
+		#size-cells = <0>;
+		poll-interval = <100>;
+
+		button@0 {
+			label = "power";
+			linux,code = <KEY_POWER>;
+			gpios = <&gpio_ao GPIOAO_2 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		blue {
+			color = <LED_COLOR_ID_BLUE>;
+			function = LED_FUNCTION_POWER;
+			gpios = <&gpio GPIODV_24 GPIO_ACTIVE_HIGH>;
+			default-state = "on";
+			panic-indicator;
+		};
+	};
+};
+
+&ethmac {
+	phy-mode = "rmii";
+	phy-handle = <&internal_phy>;
+};
+
+&ir {
+	linux,rc-map-name = "rc-mecool-kii-pro";
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
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
