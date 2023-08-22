Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11E14EE49A8
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Aug 2023 08:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XFKbEf8Gso8Gt0MTrV0dFD8I48qaP9BN4nOuzN34lY0=; b=P9zWlSAlgInfPe
	93sEX+ahNuZn6+xo0a4sLZf2sQv+BadlPvD0Xq+ARS5dmjLvq0W8jts+wn4dlp0hGxQjTgJF04i/H
	3gjvQowqnlkIXnUsZI5AEGLBxRO8kb6nc6NadUCVr2VBbCagrbDqZVVSUPwWtUDwcZKvVMCSxDz1G
	g8hgk00hosKjILnMsDF8a6oTG+EkYRmiI9gLajyhssiz0ajQK72F2oVLBeTXdTB0rdo5z8SrpvYNZ
	fhlCIniql5UTjn7oJyjP/65pQShftmSMRiSO7drcO08KzLmOCWzD0k3BJbu7guzNuIh605DJptJXV
	2DrX5wEb2TCRMekvydog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYMkP-00FSQh-0P;
	Tue, 22 Aug 2023 08:28:21 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYMkG-00FSNp-1f;
	Tue, 22 Aug 2023 08:28:14 +0000
Received: from droid06.amlogic.com (10.18.11.248) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Tue, 22 Aug 2023
 16:28:00 +0800
From: Yu Tu <yu.tu@amlogic.com>
To: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>
CC: <kelvin.zhang@amlogic.com>, <qi.duan@amlogic.com>, Yu Tu
	<yu.tu@amlogic.com>
Subject: [PATCH V10 1/4] dt-bindings: clock: document Amlogic S4 SoC PLL clock controller
Date: Tue, 22 Aug 2023 16:27:47 +0800
Message-ID: <20230822082750.27633-2-yu.tu@amlogic.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20230822082750.27633-1-yu.tu@amlogic.com>
References: <20230822082750.27633-1-yu.tu@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.18.11.248]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_012812_555010_D4BE418A 
X-CRM114-Status: GOOD (  10.83  )
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

Add the S4 PLL clock controller dt-bindings in the S4 SoC family.

Signed-off-by: Yu Tu <yu.tu@amlogic.com>
---
 .../bindings/clock/amlogic,s4-pll-clkc.yaml   | 49 +++++++++++++++++++
 .../dt-bindings/clock/amlogic,s4-pll-clkc.h   | 43 ++++++++++++++++
 2 files changed, 92 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,s4-pll-clkc.yaml
 create mode 100644 include/dt-bindings/clock/amlogic,s4-pll-clkc.h

diff --git a/Documentation/devicetree/bindings/clock/amlogic,s4-pll-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,s4-pll-clkc.yaml
new file mode 100644
index 000000000000..d8932ec26ca8
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/amlogic,s4-pll-clkc.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2022-2023 Amlogic, Inc. All rights reserved
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/amlogic,s4-pll-clkc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic S4 PLL Clock Controller
+
+maintainers:
+  - Yu Tu <yu.tu@amlogic.com>
+
+properties:
+  compatible:
+    const: amlogic,s4-pll-clkc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: xtal
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
+    clkc_pll: clock-controller@fe008000 {
+      compatible = "amlogic,s4-pll-clkc";
+      reg = <0xfe008000 0x1e8>;
+      clocks = <&xtal>;
+      clock-names = "xtal";
+      #clock-cells = <1>;
+    };
+
+...
diff --git a/include/dt-bindings/clock/amlogic,s4-pll-clkc.h b/include/dt-bindings/clock/amlogic,s4-pll-clkc.h
new file mode 100644
index 000000000000..af9f110f8b62
--- /dev/null
+++ b/include/dt-bindings/clock/amlogic,s4-pll-clkc.h
@@ -0,0 +1,43 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * Copyright (c) 2022-2023 Amlogic, Inc. All rights reserved.
+ * Author: Yu Tu <yu.tu@amlogic.com>
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_AMLOGIC_S4_PLL_CLKC_H
+#define _DT_BINDINGS_CLOCK_AMLOGIC_S4_PLL_CLKC_H
+
+#define CLKID_FIXED_PLL_DCO		0
+#define CLKID_FIXED_PLL			1
+#define CLKID_FCLK_DIV2_DIV		2
+#define CLKID_FCLK_DIV2			3
+#define CLKID_FCLK_DIV3_DIV		4
+#define CLKID_FCLK_DIV3			5
+#define CLKID_FCLK_DIV4_DIV		6
+#define CLKID_FCLK_DIV4			7
+#define CLKID_FCLK_DIV5_DIV		8
+#define CLKID_FCLK_DIV5			9
+#define CLKID_FCLK_DIV7_DIV		10
+#define CLKID_FCLK_DIV7			11
+#define CLKID_FCLK_DIV2P5_DIV		12
+#define CLKID_FCLK_DIV2P5		13
+#define CLKID_GP0_PLL_DCO		14
+#define CLKID_GP0_PLL			15
+#define CLKID_HIFI_PLL_DCO		16
+#define CLKID_HIFI_PLL			17
+#define CLKID_HDMI_PLL_DCO		18
+#define CLKID_HDMI_PLL_OD		19
+#define CLKID_HDMI_PLL			20
+#define CLKID_MPLL_50M_DIV		21
+#define CLKID_MPLL_50M			22
+#define CLKID_MPLL_PREDIV		23
+#define CLKID_MPLL0_DIV			24
+#define CLKID_MPLL0			25
+#define CLKID_MPLL1_DIV			26
+#define CLKID_MPLL1			27
+#define CLKID_MPLL2_DIV			28
+#define CLKID_MPLL2			29
+#define CLKID_MPLL3_DIV			30
+#define CLKID_MPLL3			31
+
+#endif /* _DT_BINDINGS_CLOCK_AMLOGIC_S4_PLL_CLKC_H */
-- 
2.33.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
