Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DD05C28D13
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Aug 2022 02:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dm0Fsto6+hj7HiOwFvBPop3i9UsFndVFXyIDmCyfsaw=; b=XS0z1o8b4vq4x7
	c9rS7FO0G8/EgAg621maDfKz8dlrT3VugJeCAmvqyRWW3a1Z/78h+L3ScUEZ4oTKa2nEnHIx6kFgm
	UQIetns5L2wV25P9z+KY2HTe1lU82BiJe3z1CMO9aEp66cSNst1tosruijulvfcS5p8GuOSr5m86X
	8smcgdHJqXwT/sm69V6FK0dLdQlVYyOhPR/UenFAu97noRhJhpE5NlJmPvnjkbAnO45kffYhG8nHi
	J+ErSO/hfTH2eso0Aw/rP6QSxln2ASuEd9OZgM1dsbDDSDWetiwChwq7mKV9mIb+ScnCRa4zp0Vqc
	iPxrMZ5c7exheN2G/zMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQJeG-000Noi-Tx; Tue, 23 Aug 2022 02:28:12 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQJdt-000NPt-2Q; Tue, 23 Aug 2022 02:27:50 +0000
Received: from droid06.amlogic.com (10.18.11.248) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.9; Tue, 23 Aug 2022
 10:27:35 +0800
From: Yu Tu <yu.tu@amlogic.com>
To: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Neil
 Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>
CC: Yu Tu <yu.tu@amlogic.com>
Subject: [PATCH V4 1/6] dt-bindings: clock: meson: add S4 SoC PLL clock controller bindings
Date: Tue, 23 Aug 2022 10:26:25 +0800
Message-ID: <20220823022630.25007-2-yu.tu@amlogic.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220823022630.25007-1-yu.tu@amlogic.com>
References: <20220823022630.25007-1-yu.tu@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.18.11.248]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220822_192749_181951_4987D432 
X-CRM114-Status: GOOD (  12.46  )
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

Add the documentation to support Amlogic S4 SoC PLL clock driver and
add S4 SoC PLL clock controller bindings.

Signed-off-by: Yu Tu <yu.tu@amlogic.com>
---
 .../bindings/clock/amlogic,s4-pll-clkc.yaml   | 51 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 .../dt-bindings/clock/amlogic,s4-pll-clkc.h   | 30 +++++++++++
 3 files changed, 82 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,s4-pll-clkc.yaml
 create mode 100644 include/dt-bindings/clock/amlogic,s4-pll-clkc.h

diff --git a/Documentation/devicetree/bindings/clock/amlogic,s4-pll-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,s4-pll-clkc.yaml
new file mode 100644
index 000000000000..fd517e8ef14f
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/amlogic,s4-pll-clkc.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/amlogic,s4-pll-clkc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Meson S serials PLL Clock Controller
+
+maintainers:
+  - Neil Armstrong <narmstrong@baylibre.com>
+  - Jerome Brunet <jbrunet@baylibre.com>
+  - Yu Tu <yu.hu@amlogic.com>
+
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
diff --git a/MAINTAINERS b/MAINTAINERS
index 64379c699903..b039cf953520 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1774,6 +1774,7 @@ L:	linux-amlogic@lists.infradead.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/clock/amlogic*
 F:	drivers/clk/meson/
+F:	include/dt-bindings/clock/amlogic*
 F:	include/dt-bindings/clock/gxbb*
 F:	include/dt-bindings/clock/meson*
 
diff --git a/include/dt-bindings/clock/amlogic,s4-pll-clkc.h b/include/dt-bindings/clock/amlogic,s4-pll-clkc.h
new file mode 100644
index 000000000000..345f87023886
--- /dev/null
+++ b/include/dt-bindings/clock/amlogic,s4-pll-clkc.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
+/*
+ * Copyright (c) 2021 Amlogic, Inc. All rights reserved.
+ * Author: Yu Tu <yu.tu@amlogic.com>
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_AMLOGIC_S4_PLL_CLKC_H
+#define _DT_BINDINGS_CLOCK_AMLOGIC_S4_PLL_CLKC_H
+
+/*
+ * CLKID index values
+ */
+
+#define CLKID_FIXED_PLL			1
+#define CLKID_FCLK_DIV2			3
+#define CLKID_FCLK_DIV3			5
+#define CLKID_FCLK_DIV4			7
+#define CLKID_FCLK_DIV5			9
+#define CLKID_FCLK_DIV7			11
+#define CLKID_FCLK_DIV2P5		13
+#define CLKID_GP0_PLL			15
+#define CLKID_HIFI_PLL			17
+#define CLKID_HDMI_PLL			20
+#define CLKID_MPLL_50M			22
+#define CLKID_MPLL0			25
+#define CLKID_MPLL1			27
+#define CLKID_MPLL2			29
+#define CLKID_MPLL3			31
+
+#endif /* _DT_BINDINGS_CLOCK_AMLOGIC_S4_PLL_CLKC_H */
-- 
2.33.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
