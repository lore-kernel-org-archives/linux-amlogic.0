Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67E46C83F07
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Jul 2025 03:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fsJ0YozsN6dHR8xY0icW95gbEgcGZBbWmefEuTc6Nx8=; b=EMLb93EAuaqVZP
	7OERnaOag4ZRYOtASQJvBAfftsFt0Pa90OUqpuZjaC1Qcv1wrUc9Scmj+er8oR/+7vEp/P+phul+t
	IlMrPSDwnJWf4tSxpzruk7NShnqWqbj8EPcONueuQHfFBjanMrxuy9fST8T7MsZFsaus9qxxOtn9T
	IuLmuTiQWH0rbU+nR8xrG/2fv5ENsKbXiNdpI9TypWfDo0vLKr2caKO0i5ZxiCt7TnP6laE9gXggu
	sZL4ypViyUrcaVdgOdqofGalupJ0aDBKBmQcxCs2xpPEQvuJceJmVWRD6Z2xTvGYimH0D+57aG4wP
	pE8pJyliAAQE3q7opTMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXWlr-0000000D8A6-0NVI;
	Fri, 04 Jul 2025 03:07:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXWeG-0000000D7Mj-3D3Q
	for linux-amlogic@lists.infradead.org;
	Fri, 04 Jul 2025 02:59:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 45069458D7;
	Fri,  4 Jul 2025 02:59:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 170E5C4CEEE;
	Fri,  4 Jul 2025 02:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751597974;
	bh=HE+QQyQASQhlwMh647dt8HO00YDtO4Uo+20sLmuAsfg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TKR/XPnDpQFYgF6qrseSFvtps8p8XIIHW8xL9Znw0DAhvu1y6xM8h4ObRL2QXJX0L
	 EvNK6HHV5y9Nv850pX6rZ3G0geZxFnKaLtLl7oIBQbVlR1AtwyBXhxvSZIupBHNWBl
	 v/ynul/VrabtsZk2ZxnLM1Rg2sz4kjEQ79iuv3oO9pMew00VqavkaVn99hob+6nexE
	 dQH3XXap8zKAMoz5RsfoGVZtO5IAdjREJf6AguPWz0gcB6JvaAY6502m2QtY5ZCs/M
	 D2Wlk+uB3kzrExyQtSV1Sm/N+vuCdqMSaxGg5yJuKWeotzzEGszeVm64PM5gNZh3np
	 x5CR8xVTql47A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06569C83030;
	Fri,  4 Jul 2025 02:59:34 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Fri, 04 Jul 2025 10:59:32 +0800
Subject: [PATCH v4 1/3] spi: dt-bindings: Add binding document of Amlogic
 SPISG controller
MIME-Version: 1.0
Message-Id: <20250704-spisg-v4-1-6b731dfbe610@amlogic.com>
References: <20250704-spisg-v4-0-6b731dfbe610@amlogic.com>
In-Reply-To: <20250704-spisg-v4-0-6b731dfbe610@amlogic.com>
To: Sunny Luo <sunny.luo@amlogic.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-spi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751597972; l=1996;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=IHQOnKrg7npxbLs9TpeLcto9ZcmGHjz7nxGFh2mfna0=;
 b=IQdq1I0A/nxaoSC9PFdRfxrIi9GLilVkR76OMO3Nj+L40D88t+6EW6X8UJ7wD7DnpQuRQolXK
 BUbvoemWmK6DRlBqmggSd47SESbCRE04/Tb+baO7yg6SSy+o+tB2MIP
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_195936_860232_201B7EC2 
X-CRM114-Status: GOOD (  10.28  )
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
