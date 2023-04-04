Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DC2FC6FD1D
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Apr 2023 15:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7fRDOUSLQIs8fjQBWJnHaQ82hJAfSWGRb9qPKL68F1c=; b=Nq04uY47PvO0FX
	Nx5FhqExe3VCN6Bx9FfbN/8CfFym52sq6NAhSoxD3VKWXVK7PyPSv+ovfR63/ZkyjcRR9GcQnQhDa
	8kugdmcBwPdqyD0EhGs/DmqolDrS/6K5ZycoJqyRl6/Bo6PMGQpE1N+dv9faE05aJuyg78oYbrnPz
	JubKvkR9+mu4Us69b2fMoVIPViEts699vVKbnra9MG7r73FBIvoGP9u/JzqMM2js1rgKXwkhqhP4S
	BASBtqAxO3BLyBFCtnaCT455X74CdigREML+ZxhJEdNp1rUO2oTTs5mDN+YYT0TPyH2EnZEvfOZJs
	iVpDeTuuRWF0qbMGPIuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjiys-0025CN-13;
	Tue, 04 Apr 2023 15:53:58 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjiyk-00253V-34;
	Tue, 04 Apr 2023 15:53:54 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 1F8DE5FD12;
	Tue,  4 Apr 2023 18:53:46 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1680623626;
	bh=Gfq69bQPhpjDfFKGpxkK2P8CaECp/U2kprHt2hfdBMM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=P5u5mTrgejFlkllujy2AXxn1rVV1icQkYTxA6iJKNvVvJlg47eHFhkCVPm9yUwR0F
	 e3yGR3O7KYQZzZ40UxCbYlXmAzq2TSjaIT8EGHaBPThcHUcK+Ys2VbnyzG3+oamEaO
	 TEe91tb4vmAYqXXFiyn3EHw3tn+ishJaMhKQPbJcbkBTL1cFlBE5bWgFTLraTFcdSP
	 y0dFdlu7P/t5e5aTAG9qzjr3SUXH6VR0zP3fhfUzpPiQ6P9/7OC6FIY98ehXWb5xC/
	 DoZQz7zDoiMRiy70nTR5JROXlWmxJFw8afMKCDSudGyW05LjHEzehMmD2esk4Mfxxf
	 HEoHFoxYiiPKA==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Tue,  4 Apr 2023 18:53:46 +0300 (MSK)
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
Subject: [PATCH v12 3/6] dt-bindings: clock: meson: add A1 PLL clock controller bindings
Date: Tue, 4 Apr 2023 18:53:29 +0300
Message-ID: <20230404155332.9571-4-ddrokosov@sberdevices.ru>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20230404155332.9571-1-ddrokosov@sberdevices.ru>
References: <20230404155332.9571-1-ddrokosov@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/04/04 13:20:00 #21030339
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_085351_708345_DA86A4C8 
X-CRM114-Status: GOOD (  15.29  )
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

Add the documentation for Amlogic A1 PLL clock driver, and A1 PLL
clock controller bindings.
Also include new A1 clock controller dt bindings to MAINTAINERS.

Signed-off-by: Jian Hu <jian.hu@amlogic.com>
Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
---
 .../bindings/clock/amlogic,a1-pll-clkc.yaml   | 58 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 .../dt-bindings/clock/amlogic,a1-pll-clkc.h   | 20 +++++++
 3 files changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
 create mode 100644 include/dt-bindings/clock/amlogic,a1-pll-clkc.h

diff --git a/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
new file mode 100644
index 000000000000..b3f46cf4b161
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
@@ -0,0 +1,58 @@
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
+    apb {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        clock-controller@7c80 {
+            compatible = "amlogic,a1-pll-clkc";
+            reg = <0 0x7c80 0 0x18c>;
+            #clock-cells = <1>;
+            clocks = <&clkc_periphs_fixpll_in>,
+                     <&clkc_periphs_hifipll_in>;
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
 
diff --git a/include/dt-bindings/clock/amlogic,a1-pll-clkc.h b/include/dt-bindings/clock/amlogic,a1-pll-clkc.h
new file mode 100644
index 000000000000..94554ea52da4
--- /dev/null
+++ b/include/dt-bindings/clock/amlogic,a1-pll-clkc.h
@@ -0,0 +1,20 @@
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
+
+#endif /* __A1_PLL_CLKC_H */
-- 
2.36.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
