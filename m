Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CA3ACD128D
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Mar 2024 20:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oI2Ax4pQtz38Nn9Xymh9oVFK2vzp3daB3jtR9wdUGj0=; b=ywEchfJSERuL2C
	gbDRcswPLYoyx7WpACuu8JapcvU1mIFZEd0nKzNOYqqa2dbsz3OhxZfTaOFOdBjtZlK/iBI7EJzWK
	01J9twdv8cMRRSdIxb8KxU7ZNcqq3ORWuqsWKHJPwitCzBw5AsjVgLVcM+PVcV3WJWdYKh8zUSVAR
	e9sqlxdOMMkbytSkz66rM2gg8a6HvqljoQhu59PFKEW0DKEG18B+HCO24ZBZ8QegeO2jw5ZxCcRbZ
	2WJKOYU5nxQ0q+pCqoVBVfkoDJx3nyAJLJFOFtm2rFIZS0wLVhUl8YPQIQWZif40ITfh8d446URc9
	VNnjm4WR0aIL/NlFtygw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqJJx-00000001y7M-1EXh;
	Fri, 29 Mar 2024 20:59:29 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqJJo-00000001y3B-34Aj;
	Fri, 29 Mar 2024 20:59:24 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 8184710001F;
	Fri, 29 Mar 2024 23:59:17 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 8184710001F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1711745957;
	bh=wKonTLmT/lAstuWfOUMJ7juI/CNJuYDUMc9VxZUfnJc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=LhGnnDhwKyiOWKZfJuSyJGDqfT0S0zmBLtK032Midb6MAKSk00u5rRDDxFwk76Aru
	 Rsaf2hcABtTY5rFPdfEUqZGcAhIpPVA8MAT+G0CwAz8a/8djKLUi+lKxSeYZVmXF0L
	 3ugy+p+a197AooSJMT1M7+yQ2ikfhHAbfod+ib5PxplfVkK/zcmA9AYj2AiJDtTBdm
	 NAmEZieDLtAplalVrroYmu05r3ArlatJ1fxBjYCYbKCT8MqGZQJhPLxAsUwUvbGOi2
	 Q3+W4TbuRP91G+f6Ug2ZLjS/tQmaIgPnJSQBMZOdqEYvK5NH4/XOw52gzNBZQpMA2J
	 IDzpGYw1o9dNg==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Fri, 29 Mar 2024 23:59:17 +0300 (MSK)
Received: from CAB-WSD-L081021.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 29 Mar 2024 23:59:16 +0300
From: Dmitry Rokosov <ddrokosov@salutedevices.com>
To: <neil.armstrong@linaro.org>, <jbrunet@baylibre.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <khilman@baylibre.com>,
	<martin.blumenstingl@googlemail.com>
CC: <kernel@salutedevices.com>, <rockosov@gmail.com>,
	<linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Dmitry Rokosov
	<ddrokosov@salutedevices.com>
Subject: [PATCH v1 5/6] dt-bindings: clock: meson: add A1 CPU clock controller bindings
Date: Fri, 29 Mar 2024 23:58:45 +0300
Message-ID: <20240329205904.25002-6-ddrokosov@salutedevices.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240329205904.25002-1-ddrokosov@salutedevices.com>
References: <20240329205904.25002-1-ddrokosov@salutedevices.com>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 184500 [Mar 29 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: ddrokosov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 14 0.3.14 5a0c43d8a1c3c0e5b0916cc02a90d4b950c01f96, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, salutedevices.com:7.1.1;devicetree.org:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;100.64.160.123:7.1.2;smtp.sberdevices.ru:5.0.1,7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/03/29 19:32:00
X-KSMG-LinksScanning: Clean, bases: 2024/03/29 19:32:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/03/29 16:52:00 #24511844
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_135921_151409_A7F2F034 
X-CRM114-Status: GOOD (  14.36  )
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

Add the documentation and dt bindings for Amlogic A1 CPU clock
controller.

This controller consists of the general 'cpu_clk' and two main parents:
'cpu fixed clock' and 'syspll'. The 'cpu fixed clock' is an internal
fixed clock, while the 'syspll' serves as an external input from the A1
PLL clock controller.

Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
---
 .../bindings/clock/amlogic,a1-cpu-clkc.yaml   | 64 +++++++++++++++++++
 .../dt-bindings/clock/amlogic,a1-cpu-clkc.h   | 19 ++++++
 2 files changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a1-cpu-clkc.yaml
 create mode 100644 include/dt-bindings/clock/amlogic,a1-cpu-clkc.h

diff --git a/Documentation/devicetree/bindings/clock/amlogic,a1-cpu-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,a1-cpu-clkc.yaml
new file mode 100644
index 000000000000..d52d2e084ae7
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/amlogic,a1-cpu-clkc.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/amlogic,a1-cpu-clkc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic A1 CPU Clock Control Unit
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+  - Jerome Brunet <jbrunet@baylibre.com>
+  - Dmitry Rokosov <ddrokosov@salutedevices.com>
+
+properties:
+  compatible:
+    const: amlogic,a1-cpu-clkc
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
+      - description: input sys pll
+      - description: input oscillator (usually at 24MHz)
+
+  clock-names:
+    items:
+      - const: fclk_div2
+      - const: fclk_div3
+      - const: sys_pll
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
+        clock-controller@fd000000 {
+            compatible = "amlogic,a1-cpu-clkc";
+            reg = <0 0xfd000000 0 0x88>;
+            #clock-cells = <1>;
+            clocks = <&clkc_pll CLKID_FCLK_DIV2>,
+                     <&clkc_pll CLKID_FCLK_DIV3>,
+                     <&clkc_pll CLKID_SYS_PLL>,
+                     <&xtal>;
+            clock-names = "fclk_div2", "fclk_div3", "sys_pll", "xtal";
+        };
+    };
diff --git a/include/dt-bindings/clock/amlogic,a1-cpu-clkc.h b/include/dt-bindings/clock/amlogic,a1-cpu-clkc.h
new file mode 100644
index 000000000000..1d321c6eddb7
--- /dev/null
+++ b/include/dt-bindings/clock/amlogic,a1-cpu-clkc.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * Copyright (c) 2024, SaluteDevices. All Rights Reserved.
+ * Author: Dmitry Rokosov <ddrokosov@salutedevices.com>
+ */
+
+#ifndef __A1_CPU_CLKC_H
+#define __A1_CPU_CLKC_H
+
+#define CLKID_CPU_FSOURCE_SEL0	0
+#define CLKID_CPU_FSOURCE_DIV0	1
+#define CLKID_CPU_FSEL0		2
+#define CLKID_CPU_FSOURCE_SEL1	3
+#define CLKID_CPU_FSOURCE_DIV1	4
+#define CLKID_CPU_FSEL1		5
+#define CLKID_CPU_FCLK		6
+#define CLKID_CPU_CLK		7
+
+#endif /* __A1_CPU_CLKC_H */
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
