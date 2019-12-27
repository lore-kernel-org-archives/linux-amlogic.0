Return-Path: <SRS0=RZf2=2R=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FE60C2D0C6
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Dec 2019 09:47:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52FBC208C4
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Dec 2019 09:47:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qMMikek4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 52FBC208C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lmzP2ou/Bmw5WGoJqpIyfGgGFxmnXv8MEkIlktTFQxc=; b=qMMikek4MSfA9y
	8Hti0ZR6Rn9wpU79+BVLkrjDX2Jjmcvt/hYQ+j1mp1UWnsoED+d0JvBvrEP+0BVJMizFnb0hGweNE
	74b7Xynpp/v/lEBpAY+psrfOibDS3aQU1v47uMKOQR9+jTvIws+zoN66xfPzBsfJ2P1286PdR4g+l
	OWDYEIXs1vpE0F14IhrcP0XV6BedUPdKhi1r46PWu/V3Drigx4i7ALGAvRqsiSR/FoxN/T7BNi7a2
	LwPMF0TVk6MoX9Jf/zBORff+pmEZ7/X7RRY99wBZpPEhfgvZwoXAbHoKNJ2n/7/1CFBSpnMMqS95u
	W6cD1oVW2b2NWEIqUFeQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ikmDG-0003Vg-0A; Fri, 27 Dec 2019 09:47:18 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ikmCR-0002mi-GW; Fri, 27 Dec 2019 09:46:31 +0000
Received: from droid15-sz.amlogic.com (10.28.8.25) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server id 15.1.1591.10; Fri, 27 Dec 2019
 17:46:34 +0800
From: Jian Hu <jian.hu@amlogic.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>
Subject: [PATCH v5 1/5] dt-bindings: clock: meson: add A1 PLL clock controller
 bindings
Date: Fri, 27 Dec 2019 17:46:02 +0800
Message-ID: <20191227094606.143637-2-jian.hu@amlogic.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191227094606.143637-1-jian.hu@amlogic.com>
References: <20191227094606.143637-1-jian.hu@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.28.8.25]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191227_014627_547466_3511138D 
X-CRM114-Status: UNSURE (   9.53  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Rob Herring <robh@kernel.org>, Victor Wan <victor.wan@amlogic.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>, devicetree@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Jian Hu <jian.hu@amlogic.com>,
 linux-arm-kernel@lists.infradead.org, Qiufang Dai <qiufang.dai@amlogic.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 Chandle Zou <chandle.zou@amlogic.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the documentation to support Amlogic A1 PLL clock driver,
and add A1 PLL clock controller bindings.

Signed-off-by: Jian Hu <jian.hu@amlogic.com>
---
 .../bindings/clock/amlogic,a1-pll-clkc.yaml   | 54 +++++++++++++++++++
 include/dt-bindings/clock/a1-pll-clkc.h       | 16 ++++++
 2 files changed, 70 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
 create mode 100644 include/dt-bindings/clock/a1-pll-clkc.h

diff --git a/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
new file mode 100644
index 000000000000..7a327bb174b8
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/clock/amlogic,a1-pll-clkc.yaml#"
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
+clocks:
+  maxItems: 2
+  items:
+   - description: Input xtal_fixpll
+   - description: Input xtal_hifipll
+
+clock-names:
+  maxItems: 2
+  items:
+     - const: xtal_fixpll
+     - const: xtal_hifipll
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
+                clocks = <&clkc_periphs CLKID_XTAL_FIXPLL>,
+                         <&clkc_periphs CLKID_XTAL_HIFIPLL>;
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
2.24.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
