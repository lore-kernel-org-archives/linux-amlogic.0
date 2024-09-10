Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32154EDE99A
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Sep 2024 10:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bC39E54vF3UkvPJuALB2miNadbM3ed1XZ/9Po2RFeWo=; b=2K1CJFxLia61gA
	MBGWNJJkSF0fJjsC/K0DaCiOuDpXjzWIuCLJrZsUwx5UJzQEoYa2fXJHl8DM58NOQ5Hkd7spCTdwe
	zJWd1Wb41yHkX9Y8G0Nic4Y2Q8/zcfd0BgPUOETADHlYf0mZU00ytLmqgNUakH5855qCYbHsCrbbv
	uSx8yb3gkTCunUb3N/YA6TeEN1lWRWkVV44aNwvwCxaTSNmHrrUFTo9+0+AuG2+0rRaYCj4UABRQD
	xL2f/DrqGaEiIfqgiGv0aLLMXoFZXAuLlKX7bgHtvWrb4An4WhPe89j1g1fyX4tFeuEeTq056qtJR
	SPUkpjt4Gx3q2g3LPO0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snxtJ-00000005CNG-1CrW;
	Tue, 10 Sep 2024 10:14:33 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snxt7-00000005CIS-3emq
	for linux-amlogic@lists.infradead.org;
	Tue, 10 Sep 2024 10:14:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3CA2BA44555;
	Tue, 10 Sep 2024 10:14:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6ADDFC4CEC3;
	Tue, 10 Sep 2024 10:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725963260;
	bh=KDsv3s5S2knS4s9lv8drKPwrJUJ8cTMP0GELKtXUN7U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=RPxe5kjFUoTcryIcIed+HVxDZ0RPRA4FQkW5camA4tc+fFnXN+em2/qrCWw8y2T3L
	 NlF5d9//sxB/jiDrcf/P0UEBMiR7behXr3r+5k0wP3ig9y5ECYDh+F+Xyn/TtTm3p/
	 5Rx5frmI/vO7E+DOgtQokNsn1LG3sEdOHumBpXKYSt/hars/cnr8Kj1bSGsaWhPj+X
	 TNKvyBnCxN02UlQIel+vSGD9E5Xw4/ti3ElpJJyRVkmY/JDyEDNr2bHi8Qn0cjzNtv
	 udK06wDqslxJ6U7rmMFr7xvARBeJU67mqpn+/26xIT+FYZOHxYkzAJUD4XIyRSbcd+
	 1VnR2i3G716uw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ADAAECE58D;
	Tue, 10 Sep 2024 10:14:20 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Tue, 10 Sep 2024 18:14:18 +0800
Subject: [PATCH v3 1/3] dt-bindings: rtc: Add Amlogic A4 and A5 RTC
MIME-Version: 1.0
Message-Id: <20240910-rtc-v3-1-1fa077a69a20@amlogic.com>
References: <20240910-rtc-v3-0-1fa077a69a20@amlogic.com>
In-Reply-To: <20240910-rtc-v3-0-1fa077a69a20@amlogic.com>
To: Yiting Deng <yiting.deng@amlogic.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725963258; l=2094;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=RJlEl+9x/wxXWC6SJOp6Ssaq+XIiQ49flcxO3prFEIo=;
 b=lqlH6lI6Mbaz8YpxYz0TvJYx6HNMDygTItWswCe2gH4ekIPI9APVWGUrxlgDcFj2lr+EWy8WV
 ZTtRGI+e0jcD6hektMsVUGKIXJRU9RwY0rVIX3/vSUQEUVyHcpFOqJ5
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240910_031422_109242_645383AC 
X-CRM114-Status: GOOD (  11.68  )
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

Add documentation describing the Amlogic A4(A113L2) and A5(A113X2) RTC.

Signed-off-by: Yiting Deng <yiting.deng@amlogic.com>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 .../devicetree/bindings/rtc/amlogic,a4-rtc.yaml    | 63 ++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/amlogic,a4-rtc.yaml b/Documentation/devicetree/bindings/rtc/amlogic,a4-rtc.yaml
new file mode 100644
index 000000000000..eee994753a12
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/amlogic,a4-rtc.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2024 Amlogic, Inc. All rights reserved
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/amlogic,a4-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic A4 and A5 RTC
+
+maintainers:
+  - Yiting Deng <yiting.deng@amlogic.com>
+  - Xianwei Zhao <xianwei.zhao@amlogic.com>
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
+      - const: osc
+      - const: sys
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
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
+        rtc@8e600 {
+            compatible = "amlogic,a4-rtc";
+            reg = <0x0 0x8e600 0x0 0x38>;
+            interrupts = <GIC_SPI 131 IRQ_TYPE_EDGE_RISING>;
+            clocks = <&xtal_32k>, <&clkc_periphs 1>;
+            clock-names = "osc", "sys";
+        };
+    };

-- 
2.37.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
