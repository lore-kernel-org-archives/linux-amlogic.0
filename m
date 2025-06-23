Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0FE6C7EE30
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Jun 2025 09:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=teRX5f5G4ZKPUmP/Ls6OIzZriuni1mKkiCUMRsQxrTU=; b=Ek5YvcbYvXbhWM
	efAHiiZfDYmrbceiZ/jn1B4xnDxVpJhi71noTgd0ae7vMMOvrqDg7Nk973K6QfrZG/TZTD3lB32hH
	Fs0pO4lhM53a933uXXXQerYzYIBXIbzILJ15YoI4PluKyigsxiUVbNIrZrIZSDxRMewOnQ3WFtOtt
	4xz+ZWYDyvS359bJDmHJD+tfd3jUzz1o/7UyqAk9meWip49oDtd3N2vrR4vYlYe+EYD9lvyhdcQ/3
	oLiC3MsF8tVRopbP+oBZg+srI6++1TcgncJ6ushAZ20FueYxixS53LBEsUQHyvTK/xHhFf2gJo6On
	duYzzbHZg20p5vTWCXsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTdAM-000000027Ei-3qXm;
	Mon, 23 Jun 2025 09:08:38 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTcvi-000000024SH-2unS
	for linux-amlogic@lists.infradead.org;
	Mon, 23 Jun 2025 08:53:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B3CCDA50C48;
	Mon, 23 Jun 2025 08:53:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5589CC4CEF1;
	Mon, 23 Jun 2025 08:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750668809;
	bh=AHNWpwAy8MJW09iklYohLLBu2hUWRyvFhy9O91s9sTE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=m75xei8CnbYbmiE3p9TkDEs0JHF7xKcHeAHdxrwnd0MfBtzRlDgQVA1qu3aK//m0X
	 7cSy/oRuqdyEKYk1tnxp6O8ckEY9FuZ54fFP556cuPrdmR8KLEQGkAJpZ0XNmbgWO6
	 FvkuR2gli3zxqPNSqDpKeOzz95g+SOozuAZinz4ZGXZRXwPUZ6mobK64ez8F+fHN5d
	 vs9uImnewGUJsFakSZtznXBk1n4Ph6eq1UL4Nx5mLMhpUjECyk0uEl1t77jEu834hv
	 b485em+JEkWLDm/gD8EgtqS58HcxAGUdk8oJohx9+ms9iaZZ0J8Z1DDgR/0t50yowM
	 w5pzK3jUwqRXg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FF5EC7115B;
	Mon, 23 Jun 2025 08:53:29 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Mon, 23 Jun 2025 16:53:27 +0800
Subject: [PATCH v3 1/3] dt-bindings: spi: Add binding document of Amlogic
 SPISG controller
MIME-Version: 1.0
Message-Id: <20250623-spisg-v3-1-c731f57e289c@amlogic.com>
References: <20250623-spisg-v3-0-c731f57e289c@amlogic.com>
In-Reply-To: <20250623-spisg-v3-0-c731f57e289c@amlogic.com>
To: Sunny Luo <sunny.luo@amlogic.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-spi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750668807; l=1879;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=13MP5z5DFFJsG8DGKO1bHTVm7KiuWGBoe/rppEzsqCI=;
 b=b/wq+TddKbNmrGl9KidTJei3VmEY0V1Sb4mLMBADfIkMl9mazUWzmmnQunyUUQys4THlvLKzD
 adFlc5DBETjCKWN/zwL97YEpAKhwD/udfruKCzuxR0fU4TEmhzQh1M9
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_015330_917111_DC1E1D63 
X-CRM114-Status: GOOD (  10.41  )
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
