Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20537C636D6
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 Feb 2023 11:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xpxmk7xvM0mFMECY2P+PsR2ira45x+p7GfVmqnSMKMk=; b=MkKP6bK0plips3
	uRy8b0ILRvcsLYmmFZiVBadX7GV7Mjn/S6orIdtcTax6dPArdfTErMQyT42saYjsrX04KHDCCrOcs
	10ETjKsAhOFCFsJWvcyiciNxzuvSJrtzAsMI6LQ4zl/mPDO4S98mYdVl4/bfRHiu2Vkc1h3em2phS
	QBP4gqK4YoHLqaeiWKdnPtA040G0EnrHG/jMP9MI2rTOWU2C9tYYMzCL78yVwA1fm68Oja7oEXFm6
	DGbMud6SMpzcuhIrcvzsSEHQdkyJpO8NBnYA7tsxIc07RPHThaQfpdKqkKyCsAGpcdB9JdDxgbJZr
	4aXGnl4KPvRVx18bkSQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUneR-00CDp7-3M; Wed, 22 Feb 2023 11:51:11 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUne0-00CDcM-ES; Wed, 22 Feb 2023 11:50:47 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 002535FD64;
	Wed, 22 Feb 2023 14:50:35 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1677066635;
	bh=Yyq/EadsRRDr4Cn4B6hjT0ghvVGKK0Iz7Oqvfgz081w=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=drPuGdEfS1foAlEwDmZ4JZ/FIZiO/YPWJYfQ5IFyvCIUhIrepI1GdLa3QCHmULr63
	 2oym3dL0FOxSkQ7ARmTOxjO9b2iJYh0qlPzs7TTp1c4j/RDl/J3vegWBUKQP4TxSNY
	 xnUiiPLmDNubxa4IdADeTUwwWLNhi7OBoEbMuiwWxVE3gSq7YolPnWIdy2LCgHLCr5
	 8gL9Vu+kQ4clguQvtC/wTFU/OlMbYXEr2iRyIcD4/oo9WnGML4KegxfdZJwsyYysHq
	 XO61/OMBWd1tJHBp7Ofgyd8hQiTRgvw7nmcStgDVMJU/mluG4m7GSCe54DdsDTvEgq
	 EHDV7se7R0u3A==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Wed, 22 Feb 2023 14:50:34 +0300 (MSK)
From: Alexey Romanov <avromanov@sberdevices.ru>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<neil.armstrong@linaro.org>, <khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <linus.walleij@linaro.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kernel@sberdevices.ru>, Alexey Romanov <avromanov@sberdevices.ru>
Subject: [PATCH v1 3/3] arch/arm: dts: introduce meson-a1 device tree
Date: Wed, 22 Feb 2023 14:50:20 +0300
Message-ID: <20230222115020.55867-4-avromanov@sberdevices.ru>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20230222115020.55867-1-avromanov@sberdevices.ru>
References: <20230222115020.55867-1-avromanov@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/02/22 06:32:00 #20888384
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_035044_868838_726CB378 
X-CRM114-Status: GOOD (  12.56  )
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

Add basic support for the 32-bit Amlogic A1. This device tree
describes following compontents: CPU, GIC, IRQ, Timer, UART,
PIN controller. It's capable of booting up into
the serial console.

This is based on arm64 version of meson-a1.dtsi.

Signed-off-by: Alexey Romanov <avromanov@sberdevices.ru>
---
 arch/arm/boot/dts/meson-a1.dtsi | 151 ++++++++++++++++++++++++++++++++
 1 file changed, 151 insertions(+)
 create mode 100644 arch/arm/boot/dts/meson-a1.dtsi

diff --git a/arch/arm/boot/dts/meson-a1.dtsi b/arch/arm/boot/dts/meson-a1.dtsi
new file mode 100644
index 000000000000..1d900fe86f8e
--- /dev/null
+++ b/arch/arm/boot/dts/meson-a1.dtsi
@@ -0,0 +1,151 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2023 SberDevices.
+ * Author: Alexey Romanov <avromanov@sberdevices.ru>
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/gpio/meson-a1-gpio.h>
+
+/ {
+	compatible = "amlogic,a1";
+
+	interrupt-parent = <&gic>;
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a35";
+			reg = <0x0>;
+			enable-method = "psci";
+			next-level-cache = <&l2>;
+		};
+
+		cpu1: cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a35";
+			reg = <0x1>;
+			enable-method = "psci";
+			next-level-cache = <&l2>;
+		};
+
+		l2: l2-cache0 {
+			compatible = "cache";
+		};
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+	};
+
+	sm: secure-monitor {
+		compatible = "amlogic,meson-gxbb-sm";
+	};
+
+	soc {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		apb: bus@fe000000 {
+			compatible = "simple-bus";
+			reg = <0xfe000000 0x1000000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0xfe000000 0x1000000>;
+
+			reset: reset-controller@0 {
+				compatible = "amlogic,meson-a1-reset";
+				reg = <0x0 0x8c>;
+				#reset-cells = <1>;
+			};
+
+			periphs_pinctrl: pinctrl@400 {
+				compatible = "amlogic,meson-a1-periphs-pinctrl";
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges;
+
+				gpio: bank@400 {
+					reg = <0x0400 0x003c>,
+					      <0x0480 0x0118>;
+					reg-names = "mux", "gpio";
+					gpio-controller;
+					#gpio-cells = <2>;
+					gpio-ranges = <&periphs_pinctrl 0 0 62>;
+				};
+
+			};
+
+			uart_AO: serial@1c00 {
+				compatible = "amlogic,meson-gx-uart",
+					     "amlogic,meson-ao-uart";
+				reg = <0x1c00 0x18>;
+				interrupts = <GIC_SPI 25 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&xtal>, <&xtal>, <&xtal>;
+				clock-names = "xtal", "pclk", "baud";
+				status = "disabled";
+			};
+
+			uart_AO_B: serial@2000 {
+				compatible = "amlogic,meson-gx-uart",
+					     "amlogic,meson-ao-uart";
+				reg = <0x2000 0x18>;
+				interrupts = <GIC_SPI 26 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&xtal>, <&xtal>, <&xtal>;
+				clock-names = "xtal", "pclk", "baud";
+				status = "disabled";
+			};
+
+			gpio_intc: interrupt-controller@0440 {
+				compatible = "amlogic,meson-a1-gpio-intc",
+					     "amlogic,meson-gpio-intc";
+				reg = <0x0440 0x14>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				amlogic,channel-interrupts =
+					<49 50 51 52 53 54 55 56>;
+			};
+		};
+
+		gic: interrupt-controller@ff901000 {
+			compatible = "arm,gic-400";
+			reg = <0xff901000 0x1000>,
+			      <0xff902000 0x2000>,
+			      <0xff904000 0x2000>,
+			      <0xff906000 0x2000>;
+			interrupt-controller;
+			interrupts = <GIC_PPI 9
+				(GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>;
+			#interrupt-cells = <3>;
+			#address-cells = <0>;
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13
+			(GIC_CPU_MASK_RAW(0xff) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14
+			(GIC_CPU_MASK_RAW(0xff) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11
+			(GIC_CPU_MASK_RAW(0xff) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10
+			(GIC_CPU_MASK_RAW(0xff) | IRQ_TYPE_LEVEL_LOW)>;
+	};
+
+	xtal: xtal-clk {
+		compatible = "fixed-clock";
+		clock-frequency = <24000000>;
+		clock-output-names = "xtal";
+		#clock-cells = <0>;
+	};
+};
-- 
2.38.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
