Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2278C433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Feb 2022 04:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MlK6GOUljnTMSgckdE480xiVzpLg4zPIs5k7RKaPQLo=; b=fxykZ/cljGL/cn
	nxZYygG/v6cA4BMHxilKBLn7Ij/pQfykUfbD4DD01rDoYi9U5BxWekGCEf1Rhsorb6GfWa+AuIvZk
	VuQduXVCYjRGE5hNnDRaXSCLWghEbRI4lEjMD/seTjknpFw9WB0/wRGiHotGt7FyIFtblKxPWcTWm
	d4qMmhzBZ9VGsZiQCv0w6Zm0nhre3xWmemZid9ph661MuX1xt1mSQWG7j3BgNLES+njokZdVd4SUn
	gCGtTT8v8WPQGIZyUXhSVMoCfssKvrnw16T2FTduRhs7efVnGeCJNUz+1YgsvMte8BxLEN4w1oS3m
	WQi8CUOILahiLoTgq8Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nI1Mt-002Yx5-Hp; Thu, 10 Feb 2022 04:47:43 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nI1MD-002YfW-Ci; Thu, 10 Feb 2022 04:47:03 +0000
Received: by mail-wr1-x42f.google.com with SMTP id q7so7277397wrc.13;
 Wed, 09 Feb 2022 20:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=rVIcuDz6GjpOZ4yoklcTopWb9sLPnBO2BTPRQDHuze4=;
 b=lfusYxrBeGh0ZDAiCpcDAPQz3UYVLND1HVMBkg/UAecwAC0CHX7yl/oIWSIfISAMmo
 n/5+B+QKAYXtreUCsqx9lO9md+BXN6eqVFrfqp3IKEGEURoQ1BAwzo/wKb2gK4YAwO3J
 O0DPdssQBrabMErkw5CBkU5ckEg4/sTkE8Jfk8/EjS/Cz/DwCgikf7QsRU0+5pNsKYuM
 XEPdJiamzBzzOJF506b3ucLSJRC2Nvjp99KcxGN326xNn1yWJJdtESmsliMUr08tFfYf
 AOxYntl25yAeqU7LFt9CCFNEll5zjlO3EUk0LDvgJFrNrLRf12XwO5ohTDZU7QAv4mS6
 9Cig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=rVIcuDz6GjpOZ4yoklcTopWb9sLPnBO2BTPRQDHuze4=;
 b=PtU4JLD32bwLjM6e6Nae7DmKqXtOnlGD+ki+1ibpJjxPdUVHYVtUTSSXLVuNfQrCcW
 RX3b3EBIhbRcOEHLscF50wRrzJCd1e8GYdAXx+ErCjqCa8f7trNX5n4S5dcXr72acGBx
 QAqjX3tVoEEtzM2AiNdhz9qJ6dWjEU/HU0d/kJjg9MW08z3iO8jgVaTL7cNmRxVMxkZm
 sOHl+/M8NfAPuSm4rwxu2iiZ3j5qHpGU7BmA84ZXwNfvBFPThlrwRUBAW9lUU33fqpVr
 nXIPCmgjJDsjgsb8p7FdG70TkaqvmkR7pXSUsmMfG3seZxTGmnKC12yUTgAyNxqv3Z+Z
 JrxQ==
X-Gm-Message-State: AOAM532IBTuhEAsOeUimD3S/rC37jTbSQd8DKscWSt95G5db+A/hhHr4
 VXjsIaudqbivdr35W/ggwmGQUlklbAXc0A==
X-Google-Smtp-Source: ABdhPJxWY1CDtE0jw55kAeDJ6p8q5IR4lBSTmWD24fQzgrqWE77Sm9GoOD+rl8eHcZbM2XpWOe3saw==
X-Received: by 2002:adf:f58b:: with SMTP id f11mr3755541wro.427.1644468419618; 
 Wed, 09 Feb 2022 20:46:59 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id h17sm323089wmm.15.2022.02.09.20.46.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 20:46:59 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>,
 Sam Nazarko <email@samnazarko.co.uk>, Chad Wagner <wagnerch42@gmail.com>
Subject: [PATCH 3/3] arm64: dts: meson: add support for OSMC Vero 4K+
Date: Thu, 10 Feb 2022 04:46:47 +0000
Message-Id: <20220210044647.14443-4-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220210044647.14443-1-christianshewitt@gmail.com>
References: <20220210044647.14443-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_204701_479729_CEEA0B88 
X-CRM114-Status: GOOD (  16.36  )
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

The OSMC Vero 4K+ device is based on the Amlogic S905D (P230)
reference design with the following specifications:

- 2GB DDR4 RAM
- 16GB eMMC
- HDMI 2.1 video
- S/PDIF optical output
- AV output
- 10/100/1000 Ethernet
- AP6255 Wireless (802.11 a/b/g/n/ac, BT 4.2)
- 2x USB 2.0 ports (1x OTG)
- IR receiver (internal)
- IR extender port (external)
- 1x micro SD card slot
- 1x Power LED (red)
- 1x Reset button (in AV jack)

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Tested-by: Chad Wagner <wagnerch42@gmail.com>
---
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../amlogic/meson-gxl-s905d-vero4k-plus.dts   | 125 ++++++++++++++++++
 2 files changed, 126 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s905d-vero4k-plus.dts

diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
index 13f73ca700ef..0eec18678311 100644
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -36,6 +36,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905d-p230.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905d-p231.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905d-phicomm-n1.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905d-sml5442tw.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905d-vero4k-plus.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s805x-p241.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905w-p281.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905w-tx3-mini.dtb
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-vero4k-plus.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-vero4k-plus.dts
new file mode 100644
index 000000000000..453d51a4b77e
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-vero4k-plus.dts
@@ -0,0 +1,125 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
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
+	compatible = "osmc,vero4k-plus", "amlogic,s905d", "amlogic,meson-gxl";
+	model = "OSMC Vero 4K Plus";
+
+	reserved-memory {
+		/* 32 MiB reserved for ARM Trusted Firmware (BL32) */
+		secmon_reserved_bl32: secmon@5300000 {
+			reg = <0x0 0x05300000 0x0 0x2000000>;
+			no-map;
+		};
+	};
+
+	gpio-keys-polled {
+		compatible = "gpio-keys-polled";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		poll-interval = <20>;
+
+		button@0 {
+			label = "power";
+			linux,code = <KEY_POWER>;
+			gpios = <&gpio_ao GPIOAO_2 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-standby {
+			color = <LED_COLOR_ID_RED>;
+			function = LED_FUNCTION_POWER;
+			gpios = <&gpio_ao GPIOAO_9 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+			panic-indicator;
+		};
+	};
+};
+
+&ethmac {
+	pinctrl-0 = <&eth_pins>;
+	pinctrl-names = "default";
+
+	phy-mode = "rgmii-txid";
+	phy-handle = <&external_phy>;
+
+	amlogic,tx-delay-ns = <0>;
+};
+
+&external_mdio {
+	external_phy: ethernet-phy@0 {
+		/* Realtek RTL8211F (0x001cc916) */
+		pinctrl-0 = <&eth_phy_irq_pin>;
+		pinctrl-names = "default";
+
+		reg = <0>;
+		max-speed = <1000>;
+
+		/* External PHY reset is shared with internal PHY Led signal */
+		reset-assert-us = <10000>;
+		reset-deassert-us = <80000>;
+		reset-gpios = <&gpio GPIOZ_14 GPIO_ACTIVE_LOW>;
+
+		interrupt-parent = <&gpio_intc>;
+		interrupts = <25 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
+
+&pinctrl_periphs {
+	eth_phy_irq_pin: eth-phy-irq {
+		mux {
+			groups = "GPIOZ_15";
+			function = "gpio_periphs";
+			bias-disable;
+			output-disable;
+		};
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
+
+&usb {
+	dr_mode = "host";
+};
+
+&usb2_phy0 {
+	/* HDMI_5V also supplies the USB VBUS */
+	phy-supply = <&hdmi_5v>;
+};
+
+&usb2_phy0 {
+	/* HDMI_5V also supplies the USB VBUS */
+	phy-supply = <&hdmi_5v>;
+};
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
