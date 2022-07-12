Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14DC0C433EF
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Jul 2022 06:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rqQ/UQDCILGObTa1dhF1mev0w7Mb0Az2NEt3zjMiCXw=; b=BDh7ls5BGwM1IW
	N/z7Gp9ckPDUb+bSsnGQqxx/MinkUAqT+yqNWqyvt23/j2cIO78yWSYwLv+uRS9wKC7NLcr8ejejQ
	TiCLVLIMpL7KiimHjZbvQ4k3vLttc6At64H48Fwt1po86zH6fjs6zCXIbMKY1jbvWkO9FDBUBQOXo
	DdNFYvr29DDbC/ZIF9JjZV8U4Ktwt3N0S9MRVvaWbDHRZmZM5xh0F8CrmChOyqElvzDYgBCcLiX5q
	0Rsyir4+JjhTYG9MP+7unIt97Nuar4KNP0blk+i5lUi2FR7Qbgy1+dSlUXg2/sQwldTQFi4TuT1Ew
	p45mHsdAlyrRGTiGB7sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oB9Wp-0083Vx-Ei; Tue, 12 Jul 2022 06:37:51 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oB9WI-0083Fb-Lq; Tue, 12 Jul 2022 06:37:20 +0000
Received: from droid01-xa.amlogic.com (10.88.11.200) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2176.14; Tue, 12 Jul 2022
 14:37:00 +0800
From: Jiucheng Xu <jiucheng.xu@amlogic.com>
To: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <devicetree@vger.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Will Deacon <will@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Neil Armstrong <narmstrong@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Chris Healy
	<cphealy@gmail.com>, Jiucheng Xu <jiucheng.xu@amlogic.com>
Subject: [PATCH 4/4] dt-binding:perf: Add Amlogic DDR PMU
Date: Tue, 12 Jul 2022 14:36:41 +0800
Message-ID: <20220712063641.2790997-4-jiucheng.xu@amlogic.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220712063641.2790997-1-jiucheng.xu@amlogic.com>
References: <20220712063641.2790997-1-jiucheng.xu@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.88.11.200]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_233718_731279_21BB190E 
X-CRM114-Status: GOOD (  12.90  )
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
 .../devicetree/bindings/perf/aml-ddr-pmu.yaml | 51 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/perf/aml-ddr-pmu.yaml

diff --git a/Documentation/devicetree/bindings/perf/aml-ddr-pmu.yaml b/Documentation/devicetree/bindings/perf/aml-ddr-pmu.yaml
new file mode 100644
index 000000000000..c586b4ab4009
--- /dev/null
+++ b/Documentation/devicetree/bindings/perf/aml-ddr-pmu.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/perf/aml-ddr-pmu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic G12 DDR performance monitor
+
+maintainers:
+  - Jiucheng Xu <jiucheng.xu@amlogic.com>
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - aml,g12-ddr-pmu
+      - items:
+          - enum:
+              - aml,g12-ddr-pmu
+          - const: aml,g12-ddr-pmu
+
+  reg:
+    maxItems: 2
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - model
+  - dmc_nr
+  - chann_nr
+  - reg
+  - interrupts
+  - interrupt-names
+
+additionalProperties: false
+
+examples:
+  - |
+          ddr_pmu: ddr_pmu {
+                  compatible = "amlogic,g12-ddr-pmu";
+                  model = "g12a";
+                  dmc_nr = <1>;
+                  chann_nr = <4>;
+                  reg = <0x0 0xff638000 0x0 0x100
+                         0x0 0xff638c00 0x0 0x100>;
+                  interrupts = <GIC_SPI 52 IRQ_TYPE_EDGE_RISING>;
+                  interrupt-names = "ddr_pmu";
+          };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index fd2a56a339b4..ac0a1df4622d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1055,6 +1055,7 @@ M:	Jiucheng Xu <jiucheng.xu@amlogic.com>
 S:	Supported
 W:	http://www.amlogic.com
 F:	Documentation/admin-guide/perf/aml-ddr-pmu.rst
+F:	Documentation/devicetree/bindings/perf/aml-ddr-pmu.yaml
 F:	drivers/perf/amlogic/
 F:	include/soc/amlogic/
 
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
