Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E099EC83F1A
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Jul 2025 02:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fsJ0YozsN6dHR8xY0icW95gbEgcGZBbWmefEuTc6Nx8=; b=ZdLeHQ6UC0hEqE
	EoF1JnBfch5p5izFD9aZGS2tLoEtm8dilJLeGOx0ShCyav3Ke4SEEGPrR45xY63f+7XvxHlcVQe24
	4Et6Gy2KNHIG4x4N2giDBxH+opBc3YXz0wVDUdycpzGHSao586c5g9lQmCPKNQXXZwJDYZ0rmKsTW
	m8VbUO0LCn2Qzg7qDY26xs0l5WI40urn5aUen1IgnkBW+nNccbgCRuvgRcHxSkA5hbBLMxIUrglp1
	NZzv4474niCiTujusist/WDm8l5yiQcowhvYC/loukzwsKOtuB/e8+MsxAsWKSqGK+vcYznySr9uv
	ggNMeL2xGIRszRpLHhCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucaWG-0000000BW0k-2NB1;
	Fri, 18 Jul 2025 02:08:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucaGs-0000000BUBx-2bFq
	for linux-amlogic@lists.infradead.org;
	Fri, 18 Jul 2025 01:52:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4ADA3613F9;
	Fri, 18 Jul 2025 01:52:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AA6D0C4CEF0;
	Fri, 18 Jul 2025 01:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752803539;
	bh=HE+QQyQASQhlwMh647dt8HO00YDtO4Uo+20sLmuAsfg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=tLJhIMIpPMkhIF6YwAP9xDx0FmzSoMDT/a7aXN07g/RyfFRN8NLGMj4uW7vOX/xwo
	 fTXndc/A5Ry84i0J22OABSZpF/Ko8P52i1Jb3KrpKG3OKZD8L72TTD7n4oG+XLDbUK
	 weIe0MrwMC1GYok1gDG2dqxWf9bDufFyhAK7zMtbqp2TnTEr8qKKPtA83LCTpSmI73
	 F29VLkoqQlinnq9uQQrLXUUXVbO660/vrur8R6Pf0DzcBAZe7MKafUfR9b140W73DF
	 HbOchtVH9yLsvuvcu7SQHGZStu9RQAshGoe5NN+IW9YRWO6K7+ccmLwzM1pG7LdqT3
	 KP1KX6RwBhJ0Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A372C83F34;
	Fri, 18 Jul 2025 01:52:19 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Fri, 18 Jul 2025 09:52:16 +0800
Subject: [PATCH v5 1/3] spi: dt-bindings: Add binding document of Amlogic
 SPISG controller
MIME-Version: 1.0
Message-Id: <20250718-spisg-v5-1-b8f0f1eb93a2@amlogic.com>
References: <20250718-spisg-v5-0-b8f0f1eb93a2@amlogic.com>
In-Reply-To: <20250718-spisg-v5-0-b8f0f1eb93a2@amlogic.com>
To: Sunny Luo <sunny.luo@amlogic.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-spi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752803537; l=1996;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=IHQOnKrg7npxbLs9TpeLcto9ZcmGHjz7nxGFh2mfna0=;
 b=QItDgLJRXMpbE+E2/D88SywXqnLg9DSQ4FOxzlbAB+LRK2KcSZ6CyBUwU+GzW66YXRsm/gG+M
 A5w4GFXkVAzCxwIa0O0D5IJuG1OhtFJhseb1mSC/QAnEpNBA/1WTMcC
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
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
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 .../devicetree/bindings/spi/amlogic,a4-spisg.yaml  | 59 ++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/amlogic,a4-spisg.yaml b/Documentation/devicetree/bindings/spi/amlogic,a4-spisg.yaml
new file mode 100644
index 000000000000..9bfb8089f7ea
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/amlogic,a4-spisg.yaml
@@ -0,0 +1,59 @@
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
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: core
+      - const: pclk
+
+  resets:
+    maxItems: 1
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
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    spi@50000 {
+        compatible = "amlogic,a4-spisg";
+        reg = <0x50000 0x38>;
+        interrupts = <GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>;
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
