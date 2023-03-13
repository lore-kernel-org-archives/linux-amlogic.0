Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0EF5C74A4B
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Mar 2023 20:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bpS5hx+nhHrHZALcrVF0fFZHMHb/q2HJHY6iDtoks4o=; b=ioOvGJQlTQGosx
	p92rDM+dLw62hQkzzMb4BA/2RpnvbO7xk+z+veLTOiw/oa8TEbK3A6DtlSw5Hvg1othjpQ6lD+BZs
	1sbc8orUF8Z9Kpk9joCUrjBaNbBLj8y3gclWtB02S+wcFFY8lmGNUGmb+exv54Fm2FDeXPIp22c6N
	ccbG7GKVpYgXNEDKtp4Z93Co9Oif25dRttUbrkIdYI21+Vf5RzOfjW9L8AMdrzCEVFBvEr6REBYhv
	hRG6/29envvvlGz2EyUaJFxAliXkUGxtyrkeODvlcvKtTH19rgipfAqeR75mxovSqEyEMo+gVV3ON
	rrB6QLDdh+gkDg/j34rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pboY7-007cHZ-5x; Mon, 13 Mar 2023 20:13:39 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pboXk-007c9g-9b; Mon, 13 Mar 2023 20:13:20 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 4E5A35FD17;
	Mon, 13 Mar 2023 23:13:14 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1678738394;
	bh=XkddDaO9Rc+qi/LkUeRmMmo9g+t8I684sF8xN8+37y0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=YrBIEZhxQQL7dzEfUjAtuutVYdFtNPvlv9cEgjU2/Rdy4HiH1QP0/okfmHtrkOO/h
	 uIKGomu5G2Gc0Cg0FUFs78ParkaLBlQ9+k2d/vJzfmT6+kHpweWU7RFWKT9ySxbC8I
	 qr0ZtfthFJxuHrauUU1kIJtLoE4972rRpkesSd0sMTXgR0Eye99js05W5YQDfA4ziB
	 bLbX954RAfnA7rkN7aeoZChEmAj2wNqVthjpujYFE0EeZf4gZGygXahIizWKx9Jpqn
	 0XNSIGoASaBzR7osEcW2wMUcf+OWT09Nw0uODDBjtYbvCs/1qP9B0VVQl38Oz3rHi9
	 dShlVjfCUc+6g==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Mon, 13 Mar 2023 23:13:14 +0300 (MSK)
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
Subject: [PATCH v10 3/5] dt-bindings: clock: meson: add A1 PLL and Peripherals clkcs bindings
Date: Mon, 13 Mar 2023 23:12:57 +0300
Message-ID: <20230313201259.19998-4-ddrokosov@sberdevices.ru>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20230313201259.19998-1-ddrokosov@sberdevices.ru>
References: <20230313201259.19998-1-ddrokosov@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/03/13 10:14:00 #20942017
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_131317_076333_D6088F70 
X-CRM114-Status: GOOD (  15.19  )
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
 .../bindings/clock/amlogic,a1-clkc.yaml       |  73 +++++++++++++
 .../bindings/clock/amlogic,a1-pll-clkc.yaml   |  59 +++++++++++
 MAINTAINERS                                   |   1 +
 include/dt-bindings/clock/amlogic,a1-clkc.h   | 100 ++++++++++++++++++
 .../dt-bindings/clock/amlogic,a1-pll-clkc.h   |  20 ++++
 5 files changed, 253 insertions(+)
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
index 000000000000..2b16b1f1a5bf
--- /dev/null
+++ b/include/dt-bindings/clock/amlogic,a1-clkc.h
@@ -0,0 +1,100 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
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
+#define CLKID_FIXPLL_IN		1
+#define CLKID_USB_PHY_IN	2
+#define CLKID_USB_CTRL_IN	3
+#define CLKID_HIFIPLL_IN	4
+#define CLKID_SYSPLL_IN		5
+#define CLKID_DDS_IN		6
+#define CLKID_SYS		7
+#define CLKID_CLKTREE		8
+#define CLKID_RESET_CTRL	9
+#define CLKID_ANALOG_CTRL	10
+#define CLKID_PWR_CTRL		11
+#define CLKID_PAD_CTRL		12
+#define CLKID_SYS_CTRL		13
+#define CLKID_TEMP_SENSOR	14
+#define CLKID_AM2AXI_DIV	15
+#define CLKID_SPICC_B		16
+#define CLKID_SPICC_A		17
+#define CLKID_MSR		18
+#define CLKID_AUDIO		19
+#define CLKID_JTAG_CTRL		20
+#define CLKID_SARADC_EN		21
+#define CLKID_PWM_EF		22
+#define CLKID_PWM_CD		23
+#define CLKID_PWM_AB		24
+#define CLKID_CEC		25
+#define CLKID_I2C_S		26
+#define CLKID_IR_CTRL		27
+#define CLKID_I2C_M_D		28
+#define CLKID_I2C_M_C		29
+#define CLKID_I2C_M_B		30
+#define CLKID_I2C_M_A		31
+#define CLKID_ACODEC		32
+#define CLKID_OTP		33
+#define CLKID_SD_EMMC_A		34
+#define CLKID_USB_PHY		35
+#define CLKID_USB_CTRL		36
+#define CLKID_SYS_DSPB		37
+#define CLKID_SYS_DSPA		38
+#define CLKID_DMA		39
+#define CLKID_IRQ_CTRL		40
+#define CLKID_NIC		41
+#define CLKID_GIC		42
+#define CLKID_UART_C		43
+#define CLKID_UART_B		44
+#define CLKID_UART_A		45
+#define CLKID_SYS_PSRAM		46
+#define CLKID_RSA		47
+#define CLKID_CORESIGHT		48
+#define CLKID_AM2AXI_VAD	49
+#define CLKID_AUDIO_VAD		50
+#define CLKID_AXI_DMC		51
+#define CLKID_AXI_PSRAM		52
+#define CLKID_RAMB		53
+#define CLKID_RAMA		54
+#define CLKID_AXI_SPIFC		55
+#define CLKID_AXI_NIC		56
+#define CLKID_AXI_DMA		57
+#define CLKID_CPU_CTRL		58
+#define CLKID_ROM		59
+#define CLKID_PROC_I2C		60
+#define CLKID_DSPA_EN		63
+#define CLKID_DSPA_EN_NIC	64
+#define CLKID_DSPB_EN		65
+#define CLKID_DSPB_EN_NIC	66
+#define CLKID_RTC		67
+#define CLKID_CECA_32K		68
+#define CLKID_CECB_32K		69
+#define CLKID_24M		70
+#define CLKID_12M		71
+#define CLKID_FCLK_DIV2_DIVN	72
+#define CLKID_GEN		73
+#define CLKID_SARADC		75
+#define CLKID_PWM_A		76
+#define CLKID_PWM_B		77
+#define CLKID_PWM_C		78
+#define CLKID_PWM_D		79
+#define CLKID_PWM_E		80
+#define CLKID_PWM_F		81
+#define CLKID_SPICC		82
+#define CLKID_TS		83
+#define CLKID_SPIFC		84
+#define CLKID_USB_BUS		85
+#define CLKID_SD_EMMC		86
+#define CLKID_PSRAM		87
+#define CLKID_DMC		88
+#define CLKID_GEN_SEL		121
+
+#endif /* __A1_CLKC_H */
diff --git a/include/dt-bindings/clock/amlogic,a1-pll-clkc.h b/include/dt-bindings/clock/amlogic,a1-pll-clkc.h
new file mode 100644
index 000000000000..8e97d3fb9d30
--- /dev/null
+++ b/include/dt-bindings/clock/amlogic,a1-pll-clkc.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
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
+#define CLKID_FIXED_PLL		1
+#define CLKID_FCLK_DIV2		6
+#define CLKID_FCLK_DIV3		7
+#define CLKID_FCLK_DIV5		8
+#define CLKID_FCLK_DIV7		9
+#define CLKID_HIFI_PLL		10
+
+#endif /* __A1_PLL_CLKC_H */
-- 
2.36.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
