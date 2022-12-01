Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39E0CC3A5A7
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Dec 2022 23:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DMuJSYF3/X9XpfHKj5lJ3h1QZfH5mifNlE6l2Ybp2AQ=; b=AVQtz7Rzea3+X4
	jyXRWtNLearE0SMAsHr6LUVbv2axsTLUyvzTW6HlW3UbJ5hFVrwFrWCseduzBTgetEXZmiLhHQO/o
	J8WZEsyF6XYb/0i19NJmVLVHVXZsrb6j29jne3gGAzT6I7+9Z9GO7obEaH75+YOXgoV5BofVaMZrl
	FfyPKEomfd+ep06qd6X1nfgJOHzc6fEDvnYvYHcPWvUUiH0svpS4ETNu4/J3zfdngETzpDz4IcbQ8
	g9gBG5qAQ+pCpRQCpoEiyVWiUPdDHY2oP0quIy2/Eis8JzXpP/wAEfNp/bgSyoWy5rmbZu3E0gTUw
	8xOT3nSnn+sOcgiNFJEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0sy7-00Bg1P-97; Thu, 01 Dec 2022 23:27:51 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0sUt-00BSR1-6P; Thu, 01 Dec 2022 22:57:42 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 825945FD09;
	Fri,  2 Dec 2022 01:57:27 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1669935447;
	bh=EQ9CARlmUHJwGJYtqkN5xpSRpu9hEHlDHl1ZbpZt5yY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=OSB0Cpsf4gX2hE4mYCIVr5A4vk7HKyQqqsx7issPWIb77oAGUKZb7fHkf3gXz4m/O
	 u/eRI/swfEZW72yb6WdtFNY6tiT1qyjmPDUSp6T/dwX8v0QjwbhzToN9qr4hAYzpoP
	 nRDfCK8Z7vC7yZvm9RdLXGYXpOFj+tCvdWc00oeMDs6BYTuWMlmHc3DjLYILWwhm7a
	 YL0QlVrezUIL/gxKlVUqErrY4eqGzm6bR4GyBAwBSq8qfRPC0lygioIRwI3H7SpX+6
	 00YOjhKD7VXsudiTMeYE/vTi3I1gjPYWRvejAa5InIdoJYnn47LbRVBUKUfhceD2sb
	 TYGu/+hrrN96Q==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Fri,  2 Dec 2022 01:57:27 +0300 (MSK)
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
Subject: [PATCH v8 01/11] dt-bindings: clock: meson: add A1 PLL clock controller bindings
Date: Fri, 2 Dec 2022 01:56:53 +0300
Message-ID: <20221201225703.6507-2-ddrokosov@sberdevices.ru>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20221201225703.6507-1-ddrokosov@sberdevices.ru>
References: <20221201225703.6507-1-ddrokosov@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2022/12/01 20:49:00 #20634374
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_145740_365252_C241073B 
X-CRM114-Status: GOOD (  13.02  )
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

From: Jian Hu <jian.hu@amlogic.com>

Add the documentation to support Amlogic A1 PLL clock driver,
and add A1 PLL clock controller bindings.

Signed-off-by: Jian Hu <jian.hu@amlogic.com>
Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
---
 .../bindings/clock/amlogic,a1-pll-clkc.yaml   | 52 +++++++++++++++++++
 include/dt-bindings/clock/a1-pll-clkc.h       | 16 ++++++
 2 files changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
 create mode 100644 include/dt-bindings/clock/a1-pll-clkc.h

diff --git a/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
new file mode 100644
index 000000000000..d67250fbeece
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/amlogic,a1-pll-clkc.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Amlogic Meson A/C serials PLL Clock Control Unit Device Tree Bindings
+
+maintainers:
+  - Neil Armstrong <narmstrong@baylibre.com>
+  - Jerome Brunet <jbrunet@baylibre.com>
+  - Jian Hu <jian.hu@jian.hu.com>
+
+properties:
+  compatible:
+    const: amlogic,a1-pll-clkc
+
+  "#clock-cells":
+    const: 1
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+     - description: input xtal_fixpll
+     - description: input xtal_hifipll
+
+  clock-names:
+    items:
+      - const: xtal_fixpll
+      - const: xtal_hifipll
+
+required:
+  - compatible
+  - "#clock-cells"
+  - reg
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    clkc_pll: pll-clock-controller@7c80 {
+                compatible = "amlogic,a1-pll-clkc";
+                reg = <0 0x7c80 0 0x18c>;
+                #clock-cells = <1>;
+                clocks = <&clkc_periphs 1>,
+                         <&clkc_periphs 4>;
+                clock-names = "xtal_fixpll", "xtal_hifipll";
+    };
diff --git a/include/dt-bindings/clock/a1-pll-clkc.h b/include/dt-bindings/clock/a1-pll-clkc.h
new file mode 100644
index 000000000000..58eae237e503
--- /dev/null
+++ b/include/dt-bindings/clock/a1-pll-clkc.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
+/*
+ * Copyright (c) 2019 Amlogic, Inc. All rights reserved.
+ */
+
+#ifndef __A1_PLL_CLKC_H
+#define __A1_PLL_CLKC_H
+
+#define CLKID_FIXED_PLL				1
+#define CLKID_FCLK_DIV2				6
+#define CLKID_FCLK_DIV3				7
+#define CLKID_FCLK_DIV5				8
+#define CLKID_FCLK_DIV7				9
+#define CLKID_HIFI_PLL				10
+
+#endif /* __A1_PLL_CLKC_H */
-- 
2.36.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
