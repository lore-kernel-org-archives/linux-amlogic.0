Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E804CC6FD20
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Mar 2023 19:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BFceYjWmzaci1hEFhRKW3qn7s2TN9OjmM/rRIPn1G50=; b=sHTHhufbG8YPTP
	A7twBiY+8yAPKZYDiaRPHGMhWiPo0qPN2GGT0UElDSbcn6PO7CdANTro9I8/fR+byydkkTMZGOLts
	gZ8p185WJfHnJGzz4fz/BN0mSEasWxWmUi0I+DIFKvnUg9FvoJpYr2ib0R6fTrW38Z7QM9g9TMrER
	vel9WC25I08MHVDrDnBO1IqP4IQ5XHUBdlz7OQ4Uznj8bmNbdGYE63I+Ft6GzLDUom6/PWmfCckc9
	5f8jWEg+7e1QcukQYA0TZCgcEo9dIkD5rCYdKiMwWBV7LS1FkBnilFKH3MS2YRUEoVMnl2/Yp2pLs
	fZMXsDUFQWl9jW0LPKUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pehh6-00DTwj-1O;
	Tue, 21 Mar 2023 19:30:52 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pehgp-00DTnd-29;
	Tue, 21 Mar 2023 19:30:41 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 01BC55FD40;
	Tue, 21 Mar 2023 22:30:29 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1679427029;
	bh=8WhvsT+VA2KELOW9YjGZbNBYfWlCOu3+OAuCFUpl7hg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=kBZ82uoAijWHk4jOwalEfwyRLzk2Obu9J/vvSgikC2jT9UUsQzrFPWo5ttVQ2vQzq
	 kX7wH85dzR3pEXIh3lX5iRv/F4Lu/DrYSRoeYnv68eunrB60hZe227ShL3VZotuKMP
	 IeDQoEdbn9fBVznGSOO2jNYpu/lPbHkV4bVSJCahOWNMuyErWPByms7klB9BPQwqBP
	 F7QTT3UzQBqbktQjRprob9bwdBaGr9uvellM/USanAbZSKzpFyP8tQ5QyrLV+wZqUA
	 STyK/JYvJYR0KV3+BOKWvl4Wn7cd9eQDWXJP0gdiOsIOB85jAFAvXva9SZA/Z9VvTN
	 xmho0a1cZdcYQ==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Tue, 21 Mar 2023 22:30:28 +0300 (MSK)
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: <neil.armstrong@linaro.org>, <jbrunet@baylibre.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <khilman@baylibre.com>,
	<martin.blumenstingl@googlemail.com>
CC: <jian.hu@amlogic.com>, <kernel@sberdevices.ru>, <rockosov@gmail.com>,
	<linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Dmitry Rokosov
	<ddrokosov@sberdevices.ru>
Subject: [PATCH v11 3/5] dt-bindings: clock: meson: add A1 PLL and Peripherals clkcs bindings
Date: Tue, 21 Mar 2023 22:30:12 +0300
Message-ID: <20230321193014.26349-4-ddrokosov@sberdevices.ru>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20230321193014.26349-1-ddrokosov@sberdevices.ru>
References: <20230321193014.26349-1-ddrokosov@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/03/21 14:08:00 #20985970
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_123036_393654_2FE35349 
X-CRM114-Status: GOOD (  15.47  )
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

Add the documentation for Amlogic A1 PLL and Amlogic A1 Peripherals
clock drivers.
Introduce Amlogic A1 PLL and Amlogic A1 Peripherals device tree
bindings and include them to MAINTAINERS.

Signed-off-by: Jian Hu <jian.hu@amlogic.com>
Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
---
 .../bindings/clock/amlogic,a1-clkc.yaml       |  73 +++++++++++
 .../bindings/clock/amlogic,a1-pll-clkc.yaml   |  59 +++++++++
 MAINTAINERS                                   |   1 +
 include/dt-bindings/clock/amlogic,a1-clkc.h   | 113 ++++++++++++++++++
 .../dt-bindings/clock/amlogic,a1-pll-clkc.h   |  21 ++++
 5 files changed, 267 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a1-clkc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
 create mode 100644 include/dt-bindings/clock/amlogic,a1-clkc.h
 create mode 100644 include/dt-bindings/clock/amlogic,a1-pll-clkc.h

diff --git a/Documentation/devicetree/bindings/clock/amlogic,a1-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,a1-clkc.yaml
new file mode 100644
index 000000000000..cb6d8f4eb959
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/amlogic,a1-clkc.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/amlogic,a1-clkc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Meson A/C serials Peripheral Clock Control Unit
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+  - Jerome Brunet <jbrunet@baylibre.com>
+  - Jian Hu <jian.hu@jian.hu.com>
+  - Dmitry Rokosov <ddrokosov@sberdevices.ru>
+
+properties:
+  compatible:
+    const: amlogic,a1-clkc
+
+  '#clock-cells':
+    const: 1
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: input fixed pll div2
+      - description: input fixed pll div3
+      - description: input fixed pll div5
+      - description: input fixed pll div7
+      - description: input hifi pll
+      - description: input oscillator (usually at 24MHz)
+
+  clock-names:
+    items:
+      - const: fclk_div2
+      - const: fclk_div3
+      - const: fclk_div5
+      - const: fclk_div7
+      - const: hifi_pll
+      - const: xtal
+
+required:
+  - compatible
+  - '#clock-cells'
+  - reg
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/amlogic,a1-pll-clkc.h>
+    apb {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        clock-controller@800 {
+            compatible = "amlogic,a1-clkc";
+            reg = <0 0x800 0 0x104>;
+            #clock-cells = <1>;
+            clocks = <&clkc_pll CLKID_FCLK_DIV2>,
+                     <&clkc_pll CLKID_FCLK_DIV3>,
+                     <&clkc_pll CLKID_FCLK_DIV5>,
+                     <&clkc_pll CLKID_FCLK_DIV7>,
+                     <&clkc_pll CLKID_HIFI_PLL>,
+                     <&xtal>;
+            clock-names = "fclk_div2", "fclk_div3",
+                          "fclk_div5", "fclk_div7",
+                          "hifi_pll", "xtal";
+        };
+    };
diff --git a/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
new file mode 100644
index 000000000000..77a13b1f9d5a
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/amlogic,a1-pll-clkc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Meson A/C serials PLL Clock Control Unit
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+  - Jerome Brunet <jbrunet@baylibre.com>
+  - Jian Hu <jian.hu@jian.hu.com>
+  - Dmitry Rokosov <ddrokosov@sberdevices.ru>
+
+properties:
+  compatible:
+    const: amlogic,a1-pll-clkc
+
+  '#clock-cells':
+    const: 1
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: input fixpll_in
+      - description: input hifipll_in
+
+  clock-names:
+    items:
+      - const: fixpll_in
+      - const: hifipll_in
+
+required:
+  - compatible
+  - '#clock-cells'
+  - reg
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/amlogic,a1-clkc.h>
+    apb {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        clock-controller@7c80 {
+            compatible = "amlogic,a1-pll-clkc";
+            reg = <0 0x7c80 0 0x18c>;
+            #clock-cells = <1>;
+            clocks = <&clkc_periphs CLKID_FIXPLL_IN>,
+                     <&clkc_periphs CLKID_HIFIPLL_IN>;
+            clock-names = "fixpll_in", "hifipll_in";
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 39ff1a717625..8438bc9bd636 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1895,6 +1895,7 @@ L:	linux-amlogic@lists.infradead.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/clock/amlogic*
 F:	drivers/clk/meson/
+F:	include/dt-bindings/clock/a1*
 F:	include/dt-bindings/clock/gxbb*
 F:	include/dt-bindings/clock/meson*
 
diff --git a/include/dt-bindings/clock/amlogic,a1-clkc.h b/include/dt-bindings/clock/amlogic,a1-clkc.h
new file mode 100644
index 000000000000..95131779982c
--- /dev/null
+++ b/include/dt-bindings/clock/amlogic,a1-clkc.h
@@ -0,0 +1,113 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * Copyright (c) 2019 Amlogic, Inc. All rights reserved.
+ * Author: Jian Hu <jian.hu@amlogic.com>
+ *
+ * Copyright (c) 2023, SberDevices. All Rights Reserved.
+ * Author: Dmitry Rokosov <ddrokosov@sberdevices.ru>
+ */
+
+#ifndef __A1_CLKC_H
+#define __A1_CLKC_H
+
+#define CLKID_FIXPLL_IN		0
+#define CLKID_USB_PHY_IN	1
+#define CLKID_USB_CTRL_IN	2
+#define CLKID_HIFIPLL_IN	3
+#define CLKID_SYSPLL_IN		4
+#define CLKID_DDS_IN		5
+#define CLKID_SYS		6
+#define CLKID_CLKTREE		7
+#define CLKID_RESET_CTRL	8
+#define CLKID_ANALOG_CTRL	9
+#define CLKID_PWR_CTRL		10
+#define CLKID_PAD_CTRL		11
+#define CLKID_SYS_CTRL		12
+#define CLKID_TEMP_SENSOR	13
+#define CLKID_AM2AXI_DIV	14
+#define CLKID_SPICC_B		15
+#define CLKID_SPICC_A		16
+#define CLKID_MSR		17
+#define CLKID_AUDIO		18
+#define CLKID_JTAG_CTRL		19
+#define CLKID_SARADC_EN		20
+#define CLKID_PWM_EF		21
+#define CLKID_PWM_CD		22
+#define CLKID_PWM_AB		23
+#define CLKID_CEC		24
+#define CLKID_I2C_S		25
+#define CLKID_IR_CTRL		26
+#define CLKID_I2C_M_D		27
+#define CLKID_I2C_M_C		28
+#define CLKID_I2C_M_B		29
+#define CLKID_I2C_M_A		30
+#define CLKID_ACODEC		31
+#define CLKID_OTP		32
+#define CLKID_SD_EMMC_A		33
+#define CLKID_USB_PHY		34
+#define CLKID_USB_CTRL		35
+#define CLKID_SYS_DSPB		36
+#define CLKID_SYS_DSPA		37
+#define CLKID_DMA		38
+#define CLKID_IRQ_CTRL		39
+#define CLKID_NIC		40
+#define CLKID_GIC		41
+#define CLKID_UART_C		42
+#define CLKID_UART_B		43
+#define CLKID_UART_A		44
+#define CLKID_SYS_PSRAM		45
+#define CLKID_RSA		46
+#define CLKID_CORESIGHT		47
+#define CLKID_AM2AXI_VAD	48
+#define CLKID_AUDIO_VAD		49
+#define CLKID_AXI_DMC		50
+#define CLKID_AXI_PSRAM		51
+#define CLKID_RAMB		52
+#define CLKID_RAMA		53
+#define CLKID_AXI_SPIFC		54
+#define CLKID_AXI_NIC		55
+#define CLKID_AXI_DMA		56
+#define CLKID_CPU_CTRL		57
+#define CLKID_ROM		58
+#define CLKID_PROC_I2C		59
+#define CLKID_DSPA_EN		60
+#define CLKID_DSPA_EN_NIC	61
+#define CLKID_DSPB_EN		62
+#define CLKID_DSPB_EN_NIC	63
+#define CLKID_RTC		64
+#define CLKID_CECA_32K		65
+#define CLKID_CECB_32K		66
+#define CLKID_24M		67
+#define CLKID_12M		68
+#define CLKID_FCLK_DIV2_DIVN	69
+#define CLKID_GEN		70
+#define CLKID_SARADC		71
+#define CLKID_PWM_A		72
+#define CLKID_PWM_B		73
+#define CLKID_PWM_C		74
+#define CLKID_PWM_D		75
+#define CLKID_PWM_E		76
+#define CLKID_PWM_F		77
+#define CLKID_SPICC		78
+#define CLKID_TS		79
+#define CLKID_SPIFC		80
+#define CLKID_USB_BUS		81
+#define CLKID_SD_EMMC		82
+#define CLKID_PSRAM		83
+#define CLKID_DMC		84
+#define CLKID_GEN_SEL		85
+#define CLKID_PWM_A_SEL		86
+#define CLKID_PWM_B_SEL		87
+#define CLKID_PWM_C_SEL		88
+#define CLKID_PWM_D_SEL		89
+#define CLKID_PWM_E_SEL		90
+#define CLKID_PWM_F_SEL		91
+#define CLKID_DSPA_A_SEL	92
+#define CLKID_DSPA_B_SEL	93
+#define CLKID_DSPB_A_SEL	94
+#define CLKID_DSPB_B_SEL	95
+#define CLKID_CECA_32K_SEL	96
+#define CLKID_CECB_32K_SEL	97
+#define NR_CLKS			98
+
+#endif /* __A1_CLKC_H */
diff --git a/include/dt-bindings/clock/amlogic,a1-pll-clkc.h b/include/dt-bindings/clock/amlogic,a1-pll-clkc.h
new file mode 100644
index 000000000000..740fe8c4db5d
--- /dev/null
+++ b/include/dt-bindings/clock/amlogic,a1-pll-clkc.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * Copyright (c) 2019 Amlogic, Inc. All rights reserved.
+ * Author: Jian Hu <jian.hu@amlogic.com>
+ *
+ * Copyright (c) 2023, SberDevices. All Rights Reserved.
+ * Author: Dmitry Rokosov <ddrokosov@sberdevices.ru>
+ */
+
+#ifndef __A1_PLL_CLKC_H
+#define __A1_PLL_CLKC_H
+
+#define CLKID_FIXED_PLL		0
+#define CLKID_FCLK_DIV2		1
+#define CLKID_FCLK_DIV3		2
+#define CLKID_FCLK_DIV5		3
+#define CLKID_FCLK_DIV7		4
+#define CLKID_HIFI_PLL		5
+#define NR_PLL_CLKS		6
+
+#endif /* __A1_PLL_CLKC_H */
-- 
2.36.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
