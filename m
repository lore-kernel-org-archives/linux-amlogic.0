Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB8F0ECAAD1
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Sep 2022 02:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Os+DQFaKLr5baWY62/O485c0H48jVqKH81hbRIMwieE=; b=kCtc0BAo0E41t7
	rCQcQoLdDDxuA8zoOkbos/L+i/Uc5i7ctJTeWo2DfWnGsApAntiju2GU9+OtWvmRr397tRTl3X2Av
	v20K/qRjDa4+SlIcA1GaKGXx1aT6HNu7BVsbc9cQn0KNcj4bhRTwbD0UZPY6ROe9ifmTl6w+Wj3Mb
	4b6FwqMFHGUjsJbAOpwwwVW5WAk22kiu76vdAoVEYN3gRrhfqj3iqsFQgydbJ7nYsnS2pnA/7jS0j
	NqKX8ys7cACsPJtdM9MnHNRqq6WtvAbYtD4CmbKHEjdJNS1hAU1fw+f4fc5qXWQcNm3SAemoqbDYd
	rLEphfGur8UMKa9GkOvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTaDw-009FUx-Er; Thu, 01 Sep 2022 02:46:32 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTaDV-009FIO-UI; Thu, 01 Sep 2022 02:46:07 +0000
Received: from droid01-xa.amlogic.com (10.88.11.200) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.9; Thu, 1 Sep 2022
 10:45:47 +0800
From: Jiucheng Xu <jiucheng.xu@amlogic.com>
To: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <devicetree@vger.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Will Deacon <will@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Neil Armstrong <narmstrong@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Chris Healy
	<cphealy@gmail.com>, Jiucheng Xu <jiucheng.xu@amlogic.com>, Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v6 3/4] dt-binding: perf: Add Amlogic DDR PMU
Date: Thu, 1 Sep 2022 10:45:25 +0800
Message-ID: <20220901024526.2833232-3-jiucheng.xu@amlogic.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220901024526.2833232-1-jiucheng.xu@amlogic.com>
References: <20220901024526.2833232-1-jiucheng.xu@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.88.11.200]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220831_194606_000147_264A89A1 
X-CRM114-Status: GOOD (  13.63  )
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

Add binding documentation for the Amlogic G12 series DDR
performance monitor unit.

Signed-off-by: Jiucheng Xu <jiucheng.xu@amlogic.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes v6 -> v5:
  - remove blank line

Changes v4 -> v5:
  - Remove "items" in compatible since have only one item
  - Condense description of reg
  - Rename node
  - Split one reg into two reg items.
  - Binding go first
 
Changes v3 -> v4:
  - Fix "$id: relative path/filename doesn't match actual path or
    filename" warning

Changes v2 -> v3:
  - Remove oneOf
  - Add descriptions
  - Fix compiling warning

Changes v1 -> v2:
  - Rename file, from aml_ddr_pmu.yaml to amlogic,g12_ddr_pmu.yaml
  - Delete "model", "dmc_nr", "chann_nr" new properties
  - Fix compiling error
---
 .../bindings/perf/amlogic,g12-ddr-pmu.yaml    | 55 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/perf/amlogic,g12-ddr-pmu.yaml

diff --git a/Documentation/devicetree/bindings/perf/amlogic,g12-ddr-pmu.yaml b/Documentation/devicetree/bindings/perf/amlogic,g12-ddr-pmu.yaml
new file mode 100644
index 000000000000..50f46a6898b1
--- /dev/null
+++ b/Documentation/devicetree/bindings/perf/amlogic,g12-ddr-pmu.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/perf/amlogic,g12-ddr-pmu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic G12 DDR performance monitor
+
+maintainers:
+  - Jiucheng Xu <jiucheng.xu@amlogic.com>
+
+description: |
+  Amlogic G12 series SoC integrate DDR bandwidth monitor.
+  A timer is inside and can generate interrupt when timeout.
+  The bandwidth is counted in the timer ISR. Different platform
+  has different subset of event format attribute.
+
+properties:
+  compatible:
+    enum:
+      - amlogic,g12a-ddr-pmu
+      - amlogic,g12b-ddr-pmu
+      - amlogic,sm1-ddr-pmu
+
+  reg:
+    items:
+      - description: DMC bandwidth register space.
+      - description: DMC PLL register space.
+
+  interrupts:
+    items:
+      - description: The IRQ of the inside timer timeout.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    pmu {
+        #address-cells=<2>;
+        #size-cells=<2>;
+
+        pmu@ff638000 {
+            compatible = "amlogic,g12a-ddr-pmu";
+            reg = <0x0 0xff638000 0x0 0x100>,
+                  <0x0 0xff638c00 0x0 0x100>;
+            interrupts = <GIC_SPI 52 IRQ_TYPE_EDGE_RISING>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 8ee68e699e6d..67c2c9e8c4ea 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1055,6 +1055,7 @@ M:	Jiucheng Xu <jiucheng.xu@amlogic.com>
 S:	Supported
 W:	http://www.amlogic.com
 F:	Documentation/admin-guide/perf/meson-ddr-pmu.rst
+F:	Documentation/devicetree/bindings/perf/amlogic,g12-ddr-pmu.yaml
 F:	drivers/perf/amlogic/
 F:	include/soc/amlogic/
 
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
