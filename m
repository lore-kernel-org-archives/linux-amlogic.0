Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87E9CCE7AFF
	for <linux-amlogic@archiver.kernel.org>; Thu, 28 Sep 2023 06:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c9dt+GY5Dt3+s+bz7akBYbACkNhGY1BnSX40CJvDrcM=; b=EicvW5FODOL5aS
	lp7cUueJYyC8MAed69tL3Jyj6SfTiix0QQqHVgcVhGb0WFzOgFtJnJagjl9myAiGjALnjGbnGn4i2
	3/D+VvFYPWl0+uIhXeSXEmVp7azq8fV/M/Q6tAaQXQ7wWUeRPgXvK12YxcRJM6v5ASDA7Bf6TX6j/
	DNoRWsEXNK03gRixkz4fYZE5ZF7NZXuSmbpZ/ijULcQU5nyQzSYmwTKP6eH26Wu+5Nj0zd716VuUU
	2tnbBSMTDKY/bC6xXBS/R64o1x1nnHXx2Iw0h4EB4QA3f2xOWja9SOC8HbSS3nU8UUCvDj6G5rkTt
	N1dTphxp21JzcL1ZCfyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlkcS-002PVH-2H;
	Thu, 28 Sep 2023 06:35:28 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlkcJ-002POv-15;
	Thu, 28 Sep 2023 06:35:23 +0000
Received: from droid01-cd.amlogic.com (10.98.11.200) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Thu, 28 Sep 2023
 14:34:57 +0800
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
To: <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet
	<jbrunet@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, "Stephen
 Boyd" <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Kevin Hilman
	<khilman@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Xianwei Zhao <xianwei.zhao@amlogic.com>
Subject: [PATCH 1/4] dt-bindings: clock: add Amlogic C3 PLL clock controller bindings
Date: Thu, 28 Sep 2023 14:34:45 +0800
Message-ID: <20230928063448.3544464-2-xianwei.zhao@amlogic.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230928063448.3544464-1-xianwei.zhao@amlogic.com>
References: <20230928063448.3544464-1-xianwei.zhao@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.98.11.200]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_233519_374680_6CF031CB 
X-CRM114-Status: GOOD (  11.20  )
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

Add the C3 PLL clock controller dt-bindings for Amlogic C3 SoC family

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 .../bindings/clock/amlogic,c3-pll-clkc.yaml   | 53 +++++++++++++++++++
 .../dt-bindings/clock/amlogic,c3-pll-clkc.h   | 42 +++++++++++++++
 2 files changed, 95 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,c3-pll-clkc.yaml
 create mode 100644 include/dt-bindings/clock/amlogic,c3-pll-clkc.h

diff --git a/Documentation/devicetree/bindings/clock/amlogic,c3-pll-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,c3-pll-clkc.yaml
new file mode 100644
index 000000000000..18c0eb5ac3e4
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/amlogic,c3-pll-clkc.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+Documentation/devicetree/bindings/clock/amlogic,s4-pll-clkc.yaml
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/amlogic,c3-pll-clkc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic C3 serials PLL Clock Controller
+
+maintainers:
+  - Chuan Liu <chuan.liu@amlogic.com>
+
+properties:
+  compatible:
+    const: amlogic,c3-pll-clkc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 2
+    items:
+      - description: input pll_in
+      - description: input mclk_pll_in
+
+  clock-names:
+    minItems: 2
+    items:
+      - const: pll_in
+      - const: mclk_pll_in
+
+  "#clock-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - "#clock-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    clkc_pll: clock-controller@8000 {
+      compatible = "amlogic,c3-pll-clkc";
+      reg = <0x0 0x8000 0x0 0x1a4>;
+      clocks = <&clkc_periphs CLKID_PLL_IN>,
+		<&clkc_periphs CLKID_MCLK_PLL_IN>;
+      clock-names = "pll_in", "mclk_pll_in";
+      #clock-cells = <1>;
+    };
diff --git a/include/dt-bindings/clock/amlogic,c3-pll-clkc.h b/include/dt-bindings/clock/amlogic,c3-pll-clkc.h
new file mode 100644
index 000000000000..aa731e8fae29
--- /dev/null
+++ b/include/dt-bindings/clock/amlogic,c3-pll-clkc.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * Copyright (c) 2023 Amlogic, Inc. All rights reserved.
+ * Author: Chuan Liu <chuan.liu@amlogic.com>
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_AMLOGIC_C3_PLL_CLKC_H
+#define _DT_BINDINGS_CLOCK_AMLOGIC_C3_PLL_CLKC_H
+
+#define CLKID_FIXED_PLL_DCO			0
+#define CLKID_FIXED_PLL				1
+#define CLKID_FCLK_DIV40_DIV			2
+#define CLKID_FCLK_DIV40			3
+#define CLKID_FCLK_DIV2_DIV			4
+#define CLKID_FCLK_DIV2				5
+#define CLKID_FCLK_DIV2P5_DIV			6
+#define CLKID_FCLK_DIV2P5			7
+#define CLKID_FCLK_DIV3_DIV			8
+#define CLKID_FCLK_DIV3				9
+#define CLKID_FCLK_DIV4_DIV			10
+#define CLKID_FCLK_DIV4				11
+#define CLKID_FCLK_DIV5_DIV			12
+#define CLKID_FCLK_DIV5				13
+#define CLKID_FCLK_DIV7_DIV			14
+#define CLKID_FCLK_DIV7				15
+#define CLKID_GP0_PLL_DCO			16
+#define CLKID_GP0_PLL				17
+#define CLKID_HIFI_PLL_DCO			18
+#define CLKID_HIFI_PLL				19
+#define CLKID_MCLK_PLL_DCO			20
+#define CLKID_MCLK_PLL				21
+#define CLKID_MCLK_PLL_CLK			22
+#define CLKID_MCLK0_SEL				23
+#define CLKID_MCLK0_SEL_OUT			24
+#define CLKID_MCLK0_DIV				25
+#define CLKID_MCLK0				26
+#define CLKID_MCLK1_SEL				27
+#define CLKID_MCLK1_SEL_OUT			28
+#define CLKID_MCLK1_DIV				29
+#define CLKID_MCLK1				30
+
+#endif  /* _DT_BINDINGS_CLOCK_AMLOGIC_C3_PLL_CLKC_H */
-- 
2.37.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
