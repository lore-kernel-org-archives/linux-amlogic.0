Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7CA1C5B555
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Jun 2025 07:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7TwDG2ooHJ4jvcLKgX5aAxPSL7tIwI0kqB6yQ+HvV8s=; b=dufPzdfx61nXso
	6bNGTxK5Xh/7LKMnUViwO72k4GDUbzmPs0ESUxjZFPSkj9rtgrx9bbhCO0XzJxsTyayNBPSKM1H3n
	4olJeZINC/Sppwv6XWwzeZQjRSLvOqJ21MGRl9m759b+p+wvIVF+lqxFjgj7pEcCvod1EaoXpdkJW
	p3Fz9gf/SRBo+w8cZedSKWiSrqDTzmYsa667GM6W5WVeUUfj9MiTSZgq/29FjLjPB8v/Wc8PFDy1i
	QQZdTr5BCNoisVlhi5DZJ+xl5wgAysHnaKKqJaksNbqqx1k1t2rS6mx1kcw9AvAm//PiugX8aBOdK
	knNanRIM09YiL0RrnZ1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMik4-0000000CmrV-0TVc;
	Wed, 04 Jun 2025 07:40:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMik2-0000000Cmq0-0xEm
	for linux-amlogic@lists.infradead.org;
	Wed, 04 Jun 2025 07:40:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AA33749F4F;
	Wed,  4 Jun 2025 07:40:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4E44CC4CEE7;
	Wed,  4 Jun 2025 07:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749022853;
	bh=rnNGz1GGn6PYOQnsZwE6bvO/8t20BGjGItt9vuXTLJM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ig2odtzXCY68fEB55GXo4JCps7EuIcpr0zGMJODQ1oLZDoceL/WnwT6SqcmjNKl5o
	 PpcLlk28ZPhDty+DGlwwNVNld+UPHAfV6UeFrgSPePmHmGMI8GzY9xjyzdiGtT+PnU
	 Y301QvXrhoB/MVs5xCj0Da3ljI75A5pXJf/rd+zLpmVQtZKdjgrBqahsnOMZ0OiiN3
	 rnrydIGE2/spo5xyQGUULFkSyQ4RN1KJUgskGIDh5/8frGnJ0nJ9No+Xr734+AhMi4
	 REpFu0N6mtS2Lfq3Izo2UzxG4ub5g1ZFaMUQ63IzdYsIohm4aNVXZu22MEddaE67yN
	 RktlEK68GEl9w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C69DC5B555;
	Wed,  4 Jun 2025 07:40:53 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 04 Jun 2025 15:40:51 +0800
Subject: [PATCH 1/3] dt-bindings: spi: Add binding document of Amlogic
 SPISG controller
MIME-Version: 1.0
Message-Id: <20250604-spisg-v1-1-5893dbe9d953@amlogic.com>
References: <20250604-spisg-v1-0-5893dbe9d953@amlogic.com>
In-Reply-To: <20250604-spisg-v1-0-5893dbe9d953@amlogic.com>
To: Sunny Luo <sunny.luo@amlogic.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-spi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749022851; l=1826;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=JpIA8EXgX4qGdcEsZY4R8K9pmoEKnmQU577yskBQ4WM=;
 b=WU0+PjqZQ/YG3zcsD8IQTOQXyB0iue0WTGEdFfz/pwvDZorVTn0IbaEYldYwpEZemlC5h/eNM
 FKk2xjt93mJBvihUKpic4zerxQ1YFa9LjXaqt/T1TFF4OxnjcAQBvKI
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_004054_316710_657EB1CD 
X-CRM114-Status: GOOD (  10.67  )
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

From: Sunny Luo <sunny.luo@amlogic.com>

The SPISG is a new communication oriented SPI controller of Amlogic, which
supports PIO, block DMA and scatter-gather DMA three operation modes.

Signed-off-by: Sunny Luo <sunny.luo@amlogic.com>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 .../devicetree/bindings/spi/amlogic,a4-spisg.yaml  | 55 ++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/amlogic,a4-spisg.yaml b/Documentation/devicetree/bindings/spi/amlogic,a4-spisg.yaml
new file mode 100644
index 000000000000..8d4d4606ff48
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/amlogic,a4-spisg.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2025 Amlogic, Inc. All rights reserved
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/amlogic,a4-spisg.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic SPI Scatter-Gather Controller
+
+maintainers:
+  - Xianwei Zhao <xianwei.zhao@amlogic.com>
+  - Sunny Luo <sunny.luo@amlogic.com>
+
+allOf:
+  - $ref: spi-controller.yaml#
+
+properties:
+  compatible:
+    const: amlogic,a4-spisg
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 2
+
+  clock-names:
+    items:
+      - const: core
+      - const: pclk
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    spi@50000 {
+        compatible = "amlogic,a4-spisg";
+        reg = <0x50000 0x38>;
+        interrupts = <0 183 4>;
+        clocks = <&clkc 37>,
+                 <&clkc 93>;
+        clock-names = "core", "pclk";
+        #address-cells = <1>;
+        #size-cells = <0>;
+    };

-- 
2.37.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
