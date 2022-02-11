Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59AB6C433F5
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Feb 2022 11:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ge70M4/O8J3JXwlm0vNharzqALC6Hbgzpybxz3FdV98=; b=xDHwfyGjNB8sQP
	+3oDHwHeGD+gVdMIY0BdKnt3g29/dlk649Dz1umZYhCspiNtwKOpUT/NgyP3lWz+K+jXvjbCe0QNS
	X8u69LqGf0as0vikT+M31jBrlOavCdir4mjTilFyTvbEydK+0pztlC3lDZJ7W5xXms4voLGOaFk5l
	G9rghqa3yD+u5IVZWpQTf8Lekxu66p0FrNoBGb/vhSMfu8Rt8J4qlUp/OaycVt9x2f2lVfGH+Ir7p
	urH41y3ZHeBHsMKP50ciYKqLjhkRN9+Nn45YMDpboaxzDj/ZmlHeXOXWTDUBadyWNf3qFNTJPmIsb
	GcR3xdspwsMtHfpDRr1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nITi5-006n1m-Gq; Fri, 11 Feb 2022 11:03:29 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nITYL-006iG1-Bx; Fri, 11 Feb 2022 10:53:32 +0000
Received: by mail-wr1-x42f.google.com with SMTP id w11so14539739wra.4;
 Fri, 11 Feb 2022 02:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=NEg/h1rqfy5tfcGwjNRH+ELJL27ypf3P9uQhCTngjpQ=;
 b=EiHJjKtki0Y3p75pwSD062DGTRPcAr9d7YoJJjtcA6quBe3oHjMNyJ/v1LLxzzpGTa
 X0I7l8QQEjrQyHmDb0XaHXAEjmfjGDCbpgPe3+do8toNvxEpn5bMSL1Nkl+2J3/+bG/a
 vSrqx88iV/uQ0ynOYhO1LI39+hPMccCvhbLja4swMrNnxdIHcyZuxV0f3BPGOXxmaMer
 Nt4LLzoZCpIW6YAxwVDao/Lsj7hPJuJIfQqbvqjHT+6lZMS6TEOOy8zVgGfxaZymipMO
 QCi4s3UO6ecrQRZYIqkz6ZpsKg7Qa/MzQyNWuMTHkCU8YqZPDfy+y9pvSHwh9Oi0vIls
 x2jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=NEg/h1rqfy5tfcGwjNRH+ELJL27ypf3P9uQhCTngjpQ=;
 b=TfcroeaKW8YaMJXjDBM8GIC/ETwZEUDTV7gTjIC3itAIltIFBZk6NR4tYmEPkvLMoM
 8ADQ/G/n8ixc/A5Jks02SaAHWU58J/U3TAkf6LlhBHb6yVY6YNNp30PAYI5FxLfrYpYc
 DuUNFXFlBq8/DiqsgBVV8j6QAKMwb7QCiuw1P2In10TDgP75IvNKgE88Q1D2UJ8blmMO
 DH/jtmKtt6TvvB2cg7Orm7u/O77ru+Rmuk/nvhiA5vonMgxXP85Igk1WVVjjLurU5HKk
 qUGe5Fiag8nlzOSmthgLULxVMO816SftfTTpYRhFL1OlIPVPBIOOSZgwgJIBosF6s7wr
 pafg==
X-Gm-Message-State: AOAM531WaLcs50jNh6nDmMJ/Qz0SYlTuZDA0tQqzYvW84WdLv58Wmxhy
 FFv6iXRsl0rdwDgBaDWCdng=
X-Google-Smtp-Source: ABdhPJyDyblAnzKFDfH5G1AvXIGzF5i1aOIDvOxvPib/TWe/45UGWSj7DZx0XP22W3Q51MF11gjODw==
X-Received: by 2002:a05:6000:1707:: with SMTP id
 n7mr901310wrc.662.1644576803672; 
 Fri, 11 Feb 2022 02:53:23 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id b4sm13382374wrw.100.2022.02.11.02.53.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 02:53:23 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>,
 Sam Nazarko <email@samnazarko.co.uk>, Chad Wagner <wagnerch42@gmail.com>
Subject: [PATCH v2 3/3] arm64: dts: meson: add support for OSMC Vero 4K+
Date: Fri, 11 Feb 2022 10:53:11 +0000
Message-Id: <20220211105311.30320-4-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220211105311.30320-1-christianshewitt@gmail.com>
References: <20220211105311.30320-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220211_025325_475212_64140CDF 
X-CRM114-Status: GOOD (  16.56  )
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
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../amlogic/meson-gxl-s905d-vero4k-plus.dts   | 117 ++++++++++++++++++
 2 files changed, 118 insertions(+)
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
index 000000000000..4b0ff707e21b
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-vero4k-plus.dts
@@ -0,0 +1,117 @@
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
+	/* Ensure the phy irq pin is properly configured as input */
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
