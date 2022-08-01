Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6EDAC00144
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Aug 2022 06:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ydNQJgq8EJN8CL40B2yxU4SeARFWY1zSjmvjca8zDRo=; b=w5d6Zi0ffud+2T
	STU2EqlqR75IaLn8A30gS88nXG+y2QbpoOxs+aokLh/gzdc19EsQpYWQyJkEVTvDkI55jNBZzkgaY
	zw/ywjzOIzQiecfmpHlu7dgfTLhDGky374cB6DNiZJ9U0Z8xb28tFp2C6kJKy/6nunbH2TMU2APRi
	puqS5HJl3Jc/b9JWd1H04hz6Iv/JSyY/t17c5A5SPPyrwRl1XF/C0zznlgcQWfdJ5MQa9eF6q1wOm
	CbLpmGodxIa6a/DvHGumbePTLAWJ3f5cq9eC9Q7xVZ0QI6p0DO942fW/VVsi0/oS81w9h80PHDgl2
	MZ5myqrEP/k7TPse9aoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIOVS-002WGr-R6; Mon, 01 Aug 2022 06:02:23 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIOUP-002VA1-Pi; Mon, 01 Aug 2022 06:01:19 +0000
Received: from droid01-xa.amlogic.com (10.88.11.200) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.9; Mon, 1 Aug 2022
 14:00:57 +0800
From: Jiucheng Xu <jiucheng.xu@amlogic.com>
To: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <devicetree@vger.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Will Deacon <will@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Neil Armstrong <narmstrong@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Chris Healy
	<cphealy@gmail.com>, Jiucheng Xu <jiucheng.xu@amlogic.com>
Subject: [PATCH v3 4/4] dt-binding: perf: Add Amlogic DDR PMU
Date: Mon, 1 Aug 2022 14:00:49 +0800
Message-ID: <20220801060049.1655177-4-jiucheng.xu@amlogic.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220801060049.1655177-1-jiucheng.xu@amlogic.com>
References: <20220801060049.1655177-1-jiucheng.xu@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.88.11.200]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220731_230117_861398_40EC89B6 
X-CRM114-Status: GOOD (  13.87  )
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
---
Changes v2 -> v3:
  - Remove oneOf
  - Add descriptions
  - Fix compiling warning

Changes v1 -> v2:
  - Rename file, from aml_ddr_pmu.yaml to amlogic,g12_ddr_pmu.yaml
  - Delete "model", "dmc_nr", "chann_nr" new properties
  - Fix compiling error
---
 .../bindings/perf/amlogic,g12_ddr_pmu.yaml    | 51 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/perf/amlogic,g12_ddr_pmu.yaml

diff --git a/Documentation/devicetree/bindings/perf/amlogic,g12_ddr_pmu.yaml b/Documentation/devicetree/bindings/perf/amlogic,g12_ddr_pmu.yaml
new file mode 100644
index 000000000000..961656d4db6e
--- /dev/null
+++ b/Documentation/devicetree/bindings/perf/amlogic,g12_ddr_pmu.yaml
@@ -0,0 +1,51 @@
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
+  The bandwidth is counted in the timer ISR.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - amlogic,g12b-ddr-pmu
+          - amlogic,g12a-ddr-pmu
+          - amlogic,sm1-ddr-pmu
+
+  reg:
+    items:
+      - description: Physical address of DMC bandwidth register
+          and size of the configuration address space.
+      - description: Physical address of DMC PLL register and
+          size of the configuration address space.
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
+    ddr_pmu@ff638000 {
+        compatible = "amlogic,g12a-ddr-pmu";
+        reg = <0xff638000 0x100
+               0xff638c00 0x100>;
+        interrupts = <GIC_SPI 52 IRQ_TYPE_EDGE_RISING>;
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
