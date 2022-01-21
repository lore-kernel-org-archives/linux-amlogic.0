Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9042CC433EF
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Jan 2022 07:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7jO7uJIG6vhRIrQKtX9ROjKI6uqZRhy+amSuOvMH0pA=; b=i9VL6hR4rllLPK
	XmtIikWS0aSsUNfKKYM9djhmNUrCBoVav4b1IBohHnJ7kyhTyi3aweesnwvY+z+Twyj0oihOU6OJV
	zq7B/4LjOSG1lf0wjY2VRypqDvUiSVaYaHyz7Zcrsu9GWiZcd+tPYGbqIrIWmtblxHrg2i/FsPA+5
	LLh6+yCaaHYNJLHQvI2FJzBPZSiF76wYc74gTvbld5IAv1p3eOMuB0r1bJB+MGw1t6tgMkBbr67KE
	LtqQPmGMVDd01PAFDNXNBumiOycRMix5PoXHxmcVQ9pKwSH7afGdRFJomLnYMTQpAv05PV8ADx/Kb
	cXAurh/3njb/DMC8txtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAocV-00E6AM-Rm; Fri, 21 Jan 2022 07:46:03 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAobs-00E5rn-QY; Fri, 21 Jan 2022 07:45:26 +0000
Received: from droid11-sz.amlogic.com (10.28.8.21) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server id 15.1.2176.2; Fri, 21 Jan 2022
 15:45:20 +0800
From: Liang Yang <liang.yang@amlogic.com>
To: Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, <linux-clk@vger.kernel.org>
CC: Liang Yang <liang.yang@amlogic.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Jianxin Pan <jianxin.pan@amlogic.com>,
 Victor Wan <victor.wan@amlogic.com>, XianWei Zhao <xianwei.zhao@amlogic.com>, 
 Kelvin Zhang <kelvin.zhang@amlogic.com>, BiChao Zheng
 <bichao.zheng@amlogic.com>, YongHui Yu <yonghui.yu@amlogic.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v10 3/4] clk: meson: add DT documentation for emmc clock
 controller
Date: Fri, 21 Jan 2022 15:45:07 +0800
Message-ID: <20220121074508.42168-4-liang.yang@amlogic.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220121074508.42168-1-liang.yang@amlogic.com>
References: <20220121074508.42168-1-liang.yang@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.28.8.21]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_234524_898427_EB74BE9C 
X-CRM114-Status: GOOD (  11.56  )
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

Document the MMC sub clock controller driver, the potential consumer
of this driver is MMC or NAND. Also add four clock bindings IDs which
provided by this driver.

Signed-off-by: Liang Yang <liang.yang@amlogic.com>
---
 .../bindings/clock/amlogic,mmc-clkc.yaml      | 64 +++++++++++++++++++
 include/dt-bindings/clock/amlogic,mmc-clkc.h  | 14 ++++
 2 files changed, 78 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,mmc-clkc.yaml
 create mode 100644 include/dt-bindings/clock/amlogic,mmc-clkc.h

diff --git a/Documentation/devicetree/bindings/clock/amlogic,mmc-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,mmc-clkc.yaml
new file mode 100644
index 000000000000..0fe2e33c2082
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/amlogic,mmc-clkc.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/amlogic,mmc-clkc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic MMC Sub Clock Controller Driver Device Tree Bindings
+
+maintainers:
+  - jianxin.pan@amlogic.com
+  - liang.yang@amlogic.com
+
+properties:
+  compatible:
+    enum:
+      - "amlogic,axg-mmc-clkc", "syscon"
+      - "amlogic,gx-mmc-clkc", "syscon"
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: "clkin0", "clkin1"
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
+    sd_mmc_c_clkc: clock-controller@7000 {
+	compatible = "amlogic,axg-mmc-clkc", "syscon";
+	reg = <0x0 0x7000 0x0 0x4>;
+	#clock-cells = <1>;
+
+	clock-names = "clkin0", "clkin1";
+	clocks = <&clkc CLKID_SD_EMMC_C_CLK0>,
+		 <&clkc CLKID_FCLK_DIV2>;
+     };
+
+  - |
+    sd_emmc_b_clkc: clock-controller@5000 {
+	compatible = "amlogic,axg-mmc-clkc", "syscon";
+	reg = <0x0 0x5000 0x0 0x4>;
+
+	#clock-cells = <1>;
+	clock-names = "clkin0", "clkin1";
+	clocks = <&clkc CLKID_SD_EMMC_B_CLK0>,
+		 <&clkc CLKID_FCLK_DIV2>;
+    };
+
+...
\ No newline at end of file
diff --git a/include/dt-bindings/clock/amlogic,mmc-clkc.h b/include/dt-bindings/clock/amlogic,mmc-clkc.h
new file mode 100644
index 000000000000..71301517b183
--- /dev/null
+++ b/include/dt-bindings/clock/amlogic,mmc-clkc.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
+/*
+ * Copyright (c) 2019 Amlogic, Inc. All rights reserved.
+ */
+
+#ifndef __MMC_CLKC_H
+#define __MMC_CLKC_H
+
+#define CLKID_MMC_DIV		0
+#define CLKID_MMC_PHASE_CORE	1
+#define CLKID_MMC_PHASE_TX	2
+#define CLKID_MMC_PHASE_RX	3
+
+#endif
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
