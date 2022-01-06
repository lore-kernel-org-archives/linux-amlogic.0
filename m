Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73515C433F5
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jan 2022 05:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=grmwRu0hO+PHJ0PrKFpKPPvdt8YuOdxDa9NBJnST+K4=; b=sJzHxbaVDdV5jJ
	piLv7HsK5kMnbUPfMugC+8u1c8cZJemaM2IfTQURYpV0TaSRCmsY2qJp4KwRkFrSV6YjXD9iIa50a
	zT4NZOy9/TEdSdTc/uzD5cSg/r0GzNHMMVr+E1bbxjm579z6t/yhnHjF+i0fkxUJZFH86G8yb4geJ
	SZfBPtehBHpwz1ElY8rrLEWTgujSPv8sRj7+xCIGN4TLx8/Jx3i/c5JnqnYxm8BDrbcMECx5xXrDL
	igDUxSqCiwU++RcMJMGdoFR6TQphuotQZ/f2ebIBXdWN2yG5mQxwrNUeTlGHfVFe/0vzjQft/SGzQ
	FsNKqU6rQz3JbypBu3Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5Lco-00GhTv-OK; Thu, 06 Jan 2022 05:47:46 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5Lcc-00GhRy-FG; Thu, 06 Jan 2022 05:47:35 +0000
Received: from droid04.amlogic.com (10.18.11.246) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2176.14; Thu, 6 Jan 2022
 13:47:25 +0800
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
To: <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
CC: Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Rob Herring
 <robh+dt@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>
Subject: [PATCH V3] arm64: dts: add support for S4 based Amlogic AQ222
Date: Thu, 6 Jan 2022 13:47:24 +0800
Message-ID: <20220106054724.18637-1-xianwei.zhao@amlogic.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Originating-IP: [10.18.11.246]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220105_214734_564018_4A50A7E9 
X-CRM114-Status: GOOD (  12.01  )
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

Add basic support for the Amlogic S4 based Amlogic AQ222 board:
which describe components as follows: CPU, GIC, IRQ, Timer, UART.
It's capable of booting up into the serial console.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
V2 -> V3: add of dts board  compatible family
V1 -> V2: cleaned up coding style, modify CPU affinity of timer interrups,
          and modify GIC reg defintions.
---
 arch/arm64/boot/dts/amlogic/Makefile          |  1 +
 .../dts/amlogic/meson-s4-s805x2-aq222.dts     | 30 ++++++
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi     | 99 +++++++++++++++++++
 3 files changed, 130 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-s4.dtsi

diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
index 5148cd9e5146..faea74a45994 100644
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -57,3 +57,4 @@ dtb-$(CONFIG_ARCH_MESON) += meson-sm1-odroid-c4.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-sm1-odroid-hc4.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-sm1-sei610.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-a1-ad401.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-s4-s805x2-aq222.dtb
diff --git a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
new file mode 100644
index 000000000000..a942d7e06d6e
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2021 Amlogic, Inc. All rights reserved.
+ */
+
+/dts-v1/;
+
+#include "meson-s4.dtsi"
+
+/ {
+	model = "Amlogic Meson S4 AQ222 Development Board";
+	compatible = "amlogic,aq222", "amlogic,s4";
+	interrupt-parent = <&gic>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	aliases {
+		serial0 = &uart_B;
+	};
+
+	memory@00000000 {
+		device_type = "memory";
+		reg = <0x0 0x0 0x0 0x40000000>;
+	};
+
+};
+
+&uart_B {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
new file mode 100644
index 000000000000..d7083c93d3d0
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -0,0 +1,99 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2021 Amlogic, Inc. All rights reserved.
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	cpus:cpus {
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		CPU0:cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a35","arm,armv8";
+			reg = <0x0 0x0>;
+			enable-method = "psci";
+		};
+
+		CPU1:cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a35","arm,armv8";
+			reg = <0x0 0x1>;
+			enable-method = "psci";
+		};
+
+		CPU2:cpu@2 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a35","arm,armv8";
+			reg = <0x0 0x2>;
+			enable-method = "psci";
+		};
+
+		CPU3:cpu@3 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a35","arm,armv8";
+			reg = <0x0 0x3>;
+			enable-method = "psci";
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+	};
+
+	xtal: xtal-clk {
+		compatible = "fixed-clock";
+		clock-frequency = <24000000>;
+		clock-output-names = "xtal";
+		#clock-cells = <0>;
+	};
+
+	soc {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		gic: interrupt-controller@fff01000 {
+			compatible = "arm,gic-400";
+			#interrupt-cells = <3>;
+			#address-cells = <0>;
+			interrupt-controller;
+			reg = <0x0 0xfff01000 0 0x1000>,
+			      <0x0 0xfff02000 0 0x2000>,
+			      <0x0 0xfff04000 0 0x2000>,
+			      <0x0 0xfff06000 0 0x2000>;
+			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
+		};
+
+		apb4: apb4@fe000000 {
+			compatible = "simple-bus";
+			reg = <0x0 0xfe000000 0x0 0x480000>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges = <0x0 0x0 0x0 0xfe000000 0x0 0x480000>;
+
+			uart_B: serial@7a000 {
+				compatible = "amlogic,meson-s4-uart",
+					     "amlogic,meson-ao-uart";
+				reg = <0x0 0x7a000 0x0 0x18>;
+				interrupts = <GIC_SPI 169 IRQ_TYPE_EDGE_RISING>;
+				status = "disabled";
+				clocks = <&xtal>, <&xtal>, <&xtal>;
+				clock-names = "xtal", "pclk", "baud";
+			};
+		};
+	};
+};

base-commit: c5468e3c930d4d2937d3a842a85df0f74e95e152
-- 
2.30.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
