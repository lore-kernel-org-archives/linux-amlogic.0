Return-Path: <SRS0=hsLn=HD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFE12C433DB
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Feb 2021 21:05:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6876364ECF
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Feb 2021 21:05:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6876364ECF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tcZPmfJk22Ft4aF1yNM8DULa6xLxKsNMntc/F+uHJQA=; b=DRxK9zt3PeKqtgbYPJbIPHK5Zq
	Vd5UKTaxsS4taE44guA1kWVyR55+EMjX43/tATqTLCcGH/bFnzyszzXyFeqvniJg8roGsyF8jfIAl
	jIVJi13iHjXZRP9uew/Zhq0Fjfk34hjem9RFIHRNnZlQRhRTb0K13YOmJuxGd8qjtP+CUswuUbrCZ
	NEw9HL0xDY8MK3KGfaotyUcZrsBcDIvRdvbvxlWqBzSgMYae+13qRjU+X6umOLGrsWWphuqc7z3Tx
	k4WOk15JBEAFm5HlN8E30+YmPdw6Uj3RcaU/OziZWbQ7aTwLbVYxTe7+iqi832M6ZfL699PrcZyRE
	GTWr5XsQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6gNt-0001Y9-RG; Mon, 01 Feb 2021 21:05:21 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6gNo-0001Wq-5J; Mon, 01 Feb 2021 21:05:17 +0000
Received: by mail-wr1-x42c.google.com with SMTP id c12so18150301wrc.7;
 Mon, 01 Feb 2021 13:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=0Bn7PH0wrR7CqoJxTwdalhGxT/l60oUdzQ/t+CWunU0=;
 b=n7pRTEtFU/Na7sXTjNFGQ2i5gcGUB0u2Kb96jSAd8FkI9Y2qCp6vR8u20hmtkf+nC9
 Vln0hZ1Qh5aM7qRcS1rl1jZiLnE6+HcAki7pGud9tFdjslbaU38EbAzI+qNflqWumJYM
 il/TLIiv7cdUF/axEw63efTuotnx6W5mgso61+EvHg4lB9t9EWDD+1pmtfVgKcFsjeMo
 /8Pi/bI33Ba0k3fM6I5cs+SKr22QuGvWJyoj8Zx4gyzHKj+ephLYsvBfgVeiUfcYAk3s
 tspESvB7+iMY82GUmXfNl3crV9krvrRyD6MVHB9pgtnQyyZaZUbsoQhPaJ2i0XrPUacx
 Yubg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=0Bn7PH0wrR7CqoJxTwdalhGxT/l60oUdzQ/t+CWunU0=;
 b=MyXgxMmB4lFvOYqKnYwIWlGDwhRzuoUpHc546oUn7z072TygmsF66W7VrbljXIypfy
 F/AcEcGTUPjeS/Wpj3XpPtGAe321WwAvQdCRKZiwzAgJLfpxU7GEVTxYHu1o+WOGnceN
 fzn2uJ69saO2pigTtbZE6YvBxDMze3+R3TK1dqCjwPuicj0Mxp2C4hlXna/0t/A+U36m
 CRCMNzfh0iRAtfUGgcImZPaJSmuOAkBnXwYlCYqh6gIVTGhxS0w3a+XMkEaIFm4t0K3d
 bEO4vdpgJC569oPk+kj/tTPgw63NRwSG/RDcZ1DOC8/coAc9O+UtsYzBPDF2At7M/ZAF
 tRQA==
X-Gm-Message-State: AOAM533zjMmy86TZJnZ1hbvhcTFzS1upheiTtdNZlTsbDjeNGQx0Yn7A
 UoON/nLwQnRWUtHqJyojZoI=
X-Google-Smtp-Source: ABdhPJwc8+dbopAR0Ydcu9iN3y8Zs0lgf6s5e6mnHNeZc0ULs6zYir/Fy1BH60tvqR4Hkk+sruNduA==
X-Received: by 2002:a05:6000:1245:: with SMTP id
 j5mr8186726wrx.333.1612213514947; 
 Mon, 01 Feb 2021 13:05:14 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id 36sm29769846wrj.97.2021.02.01.13.05.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 13:05:14 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: meson: add initial device-tree for Minix NEO
 U9-H
Date: Mon,  1 Feb 2021 21:05:08 +0000
Message-Id: <20210201210508.1528-2-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210201210508.1528-1-christianshewitt@gmail.com>
References: <20210201210508.1528-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_160516_229443_316D7C73 
X-CRM114-Status: GOOD (  17.92  )
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

Minix NEO U9-H is based on the Amlogic Q200 reference board with an
S912-H chip and the following specs:

- 2GB DDR3 RAM
- 16GB eMMC
- 10/100/1000 Base-T Ethernet
- AP6356S Wireless (802.11 a/b/g/n/ac, BT 4.1)
- RTC chip
- HDMI 2.1 video
- S/PDIF optical output
- ES8323 audio codec
- Analogue headphone output
- 3x USB 2.0 ports (1x OTG)
- IR receiver
- 1x Power LED (white)
- 1x Power button (rear)
- 1x Update/Reset button (underside)
- 1x micro SD card slot

Tested-by: Wes Bradley <komplex@live.ie>
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../dts/amlogic/meson-gxm-minix-neo-u9h.dts   | 120 ++++++++++++++++++
 2 files changed, 121 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxm-minix-neo-u9h.dts

diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
index dce41cd3f347..46e67de3d6d2 100644
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -38,6 +38,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905w-p281.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905w-tx3-mini.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905d-libretech-pc.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-khadas-vim2.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-gxm-minix-neo-u9h.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-nexbox-a1.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-q200.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-q201.dtb
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-minix-neo-u9h.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-minix-neo-u9h.dts
new file mode 100644
index 000000000000..a414cd39c2b1
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-minix-neo-u9h.dts
@@ -0,0 +1,120 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) Christian Hewitt <christianshewitt@gmail.com>
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
+	compatible = "minix,neo-u9h", "amlogic,s912", "amlogic,meson-gxm";
+	model = "Minix Neo U9-H";
+
+	leds {
+		compatible = "gpio-leds";
+
+		white {
+			color = <LED_COLOR_ID_WHITE>;
+			function = LED_FUNCTION_POWER;
+			gpios = <&gpio_ao GPIOAO_9 GPIO_ACTIVE_HIGH>;
+			default-state = "on";
+			panic-indicator;
+		};
+	};
+
+	adc-keys {
+		compatible = "adc-keys";
+		io-channels = <&saradc 0>;
+		io-channel-names = "buttons";
+		keyup-threshold-microvolt = <1710000>;
+
+		button-function {
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
+		button@0 {
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
+	linux,rc-map-name = "rc-minix-neo";
+};
+
+&i2c_B {
+	status = "okay";
+	pinctrl-0 = <&i2c_b_pins>;
+	pinctrl-names = "default";
+
+	rtc: rtc@51 {
+		status = "okay";
+		compatible = "haoyu,hym8563";
+		reg = <0x51>;
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+		clock-output-names = "xin32k";
+		wakeup-source;
+	};
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
