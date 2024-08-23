Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C19BC5472C
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Aug 2024 09:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JwpJDPSRffDXh/jybZOpBHbNjMM2r7uFfkZegpPHRb8=; b=EemRv0f0bEjGUB
	5INco3iRP76b5wOT+WUJ1SQnjyjArNRNiTsKLWkduDbe23wEJyoMJRdWtV3s26gBGrhe2De22lmeA
	WtzbJ5D9R2SVaAYj86QpExvs2i0jshG6+LMxQlc/pf2QCu9SGl4k08TXjQ0rUDCdigmTsc+HBUAhp
	VlmkbS6nwjBYih6W36cDBVXpjs17McQO2hRwGAc5ijvcGU/KvvYV3CkBfUWwmijkAArfkwYFqKfB6
	0sUNG892D4/QXAPXP21q9abpzLPbUzWAS6QMJOJiN3Vmza/SNrtb4XepVgfgojBeAuWgCYWbswyR5
	Ru/MiVaxyYgO9PzRtJTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shQUw-0000000G5Wn-1Tdc;
	Fri, 23 Aug 2024 09:22:22 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shQST-0000000G4qk-3Sv3
	for linux-amlogic@lists.infradead.org;
	Fri, 23 Aug 2024 09:19:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 322BACE0EC1;
	Fri, 23 Aug 2024 09:19:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 54287C4AF0B;
	Fri, 23 Aug 2024 09:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724404787;
	bh=4tFRUr6pC6/XXpYh11KENxGWfRrFHffWmB1w9kduv2k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=agGWn2aOlO3V1Yc/uSYbaee0W82ReHFO7fXfzpsiQYex2jkOCotR3W5sRKhJPeQ7w
	 vG301xgNgm3RVAS9IaDoVnK+0TPG5gxl2dAvczC2Sbt+OI8vygA4aBIDCIJrGF8KWC
	 +MNHarTgljIOkH3+tetALV26MMoNLcp1Mz/dUAfnbABMQaTtH37cYFTZrprLDNsTya
	 XZuaKUzmb3tYmKdVPGBSS2HocvBNKykuUWYztUGodPwJ4WNbcYiiPkfJxzCemc98qk
	 hyIwUUI2yPpgoT7MbAedlJKimmvDwD/dkOonMZpygHHYQaio3WlGdAdU3N6pvcnzf+
	 wR2TKCte9PDFA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 440E3C52D7C;
	Fri, 23 Aug 2024 09:19:47 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Fri, 23 Aug 2024 17:19:44 +0800
Subject: [PATCH 1/3] dt-bindings: rtc: Add Amlogic A311L2 and A113X2 rtc
MIME-Version: 1.0
Message-Id: <20240823-rtc-v1-1-6f70381da283@amlogic.com>
References: <20240823-rtc-v1-0-6f70381da283@amlogic.com>
In-Reply-To: <20240823-rtc-v1-0-6f70381da283@amlogic.com>
To: Yiting Deng <yiting.deng@amlogic.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724404784; l=2235;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=OuCbmduzBkZkzatxp6faWcdgmpE7uNtqHqmhQseAr7Q=;
 b=dISvZXk6kBMEY4QicOnnOG4EnavSgL5tgiaHxWNMtJlC1IK0M9ZC0Mk+6UrV4a7/RyGGtpizi
 z4qtwKvsNUkAOFXsKzzFCrFp6FYHRWi5RFa1J56cuPfkpYnyDwPdSfZ
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_021950_257127_54C5B464 
X-CRM114-Status: GOOD (  10.87  )
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
Reply-To: xianwei.zhao@amlogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Yiting Deng <yiting.deng@amlogic.com>

Add documentation describing the Amlogic A113L2 and A113X2 rtc controller.

Signed-off-by: Yiting Deng <yiting.deng@amlogic.com>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 .../bindings/rtc/amlogic,amlogic-rtc.yaml          | 66 ++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/amlogic,amlogic-rtc.yaml b/Documentation/devicetree/bindings/rtc/amlogic,amlogic-rtc.yaml
new file mode 100644
index 000000000000..fa3d7838022e
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/amlogic,amlogic-rtc.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2024 Amlogic, Inc. All rights reserved
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/amlogic,amlogic-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Real Time Clock controller include a4, a5
+
+maintainers:
+  - Yiting Deng <yiting.deng@amlogic.com>
+  - Xianwei Zhao <xianwei.zhao@amlogic.com>
+
+description:
+  The Amlogic new chips used RTC module.
+
+allOf:
+  - $ref: rtc.yaml#
+
+properties:
+  compatible:
+    enum:
+      - amlogic,a4-rtc
+      - amlogic,a5-rtc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: RTC clock source, available 24M or 32K crystal
+          oscillator source. when using 24M, need to divide 24M into 32K.
+      - description: RTC module accesses the clock of the apb bus.
+
+  clock-names:
+    items:
+      - const: rtc_osc
+      - const: rtc_sys_clk
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - interrupts
+  - reg
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    apb {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        rtc: rtc@8e600 {
+            compatible = "amlogic,a4-rtc";
+            interrupts = <GIC_SPI 131 IRQ_TYPE_EDGE_RISING>;
+            reg = <0x0 0x8e600 0x0 0x38>;
+            clocks = <&xtal_32k>, <&clkc_periphs 1>;
+            clock-names = "rtc_osc", "rtc_sys_clk";
+        };
+    };

-- 
2.37.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
