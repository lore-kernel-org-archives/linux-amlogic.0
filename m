Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 511CBCAC589
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Sep 2025 06:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7614dII/N6Or9tnfidRcCuRspq0dXcTbn80Rr0UzXZY=; b=GbyDxBKcoz92Jo
	pRxCzEcUE2FvCBvzEyKrzCeCJ1TeZP/qu4ONBdMPutd4zzpJPSruZVUkCP3Qqk6txAfOV5mP5eEvw
	LsSUKPkZ4tDhbhCjy6IRAQ9GqSD9D84XgU/vQo+RJKLUzrnEdrp+GsY2sho/V9XcN2/tImfs2yFyI
	KvM6fwB1GNxJEX6lZ6VCRbTgOPnGcf94tnnMseIs+VwqDiAbAzurOKUHcZLoYXF3a2hrdEG23uWEf
	tLnETZnDGyo91fHwckgrBibuDXnTJzxaY0pActa1aCbqekXEhW3CorV9JFnuESZI437f1r7Kly60+
	Nj/nz5D4ATUE0vJOsQ+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsJ9-00000004yb2-39fk;
	Tue, 09 Sep 2025 06:58:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvqfZ-00000004NFr-33ue
	for linux-amlogic@lists.infradead.org;
	Tue, 09 Sep 2025 05:13:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C37FD44C37;
	Tue,  9 Sep 2025 05:13:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 80F17C4CEF5;
	Tue,  9 Sep 2025 05:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757394808;
	bh=9kBKm/gBv1uCgD5lsyQqPzoNEJYvhKjrD6QZgPZrqv8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=EHYqroyVUqlSXUHC5DMAnXI8w3eMP8ESLu4LVO12cvXJXtWPsfLH3ap4NVBt9ywJR
	 pc0trpja3Su3ZLPdQGl1Cl1NJojxdQ0BP6riGnKBDAeAdfIHuE8y/6QQPB/rCCugMY
	 Sap+VbUnXq8n2dBNSpsoKBB9tZKMF55V5EzX+KMwoyC+3ybO2ZsK5I/M+t8ttxLRvi
	 dE1U0+PUCII/QENDJ18lX7UBpCt+jhrk9cur668CZdqnJASjol77iZHZZLRCe/r1t6
	 qpf/3VnrZb8indDNdL4rt4wCSUw13t0eLZP6jNe6umUSd4m5nGIdypB6qSsLqTfjnD
	 jZtmBAp8VFtPQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 705F2CA0FED;
	Tue,  9 Sep 2025 05:13:28 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Tue, 09 Sep 2025 13:13:25 +0800
Subject: [PATCH v5 1/3] spi: dt-bindings: add Amlogic A113L2 SFC
MIME-Version: 1.0
Message-Id: <20250909-spifc-v5-1-962bc147d17f@amlogic.com>
References: <20250909-spifc-v5-0-962bc147d17f@amlogic.com>
In-Reply-To: <20250909-spifc-v5-0-962bc147d17f@amlogic.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liang Yang <liang.yang@amlogic.com>, 
 Feng Chen <feng.chen@amlogic.com>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757394806; l=2921;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=IJXxGvCCcnhjW/q7lyLw0FtfCEtHZHIRbIAcYUb/Pz0=;
 b=WkIoqR7Yb1rXj19ROKSuuoGH0/JBxnw7qN79PR5AiweWblD6d221N4iXfYFmzOuEsWZwC13Ox
 /xH/qzzgFGvCxUkHo4GUxt3FQaBaApv+HK1DUsr+vvpSrL3trsStraJ
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_221329_856407_7CCE19E3 
X-CRM114-Status: GOOD (  12.80  )
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

From: Feng Chen <feng.chen@amlogic.com>

The Flash Controller is derived by adding an SPI path to the original
raw NAND controller. This controller supports two modes: raw mode and
SPI mode. The raw mode has already been implemented in the community,
and the SPI mode is described here.

Add bindings for Amlogic A113L2 SPI Flash Controller.

Signed-off-by: Feng Chen <feng.chen@amlogic.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 .../devicetree/bindings/spi/amlogic,a4-spifc.yaml  | 82 ++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/amlogic,a4-spifc.yaml b/Documentation/devicetree/bindings/spi/amlogic,a4-spifc.yaml
new file mode 100644
index 000000000000..b4cef838bcd4
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/amlogic,a4-spifc.yaml
@@ -0,0 +1,82 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2025 Amlogic, Inc. All rights reserved
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/amlogic,a4-spifc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SPI flash controller for Amlogic ARM SoCs
+
+maintainers:
+  - Liang Yang <liang.yang@amlogic.com>
+  - Feng Chen <feng.chen@amlogic.com>
+  - Xianwei Zhao <xianwei.zhao@amlogic.com>
+
+description:
+  The Amlogic SPI flash controller is an extended version of the Amlogic NAND
+  flash controller. It supports SPI Nor Flash and SPI NAND Flash(where the Host
+  ECC HW engine could be enabled).
+
+allOf:
+  - $ref: /schemas/spi/spi-controller.yaml#
+
+properties:
+  compatible:
+    const: amlogic,a4-spifc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: clock apb gate
+      - description: clock used for the controller
+
+  clock-names:
+    items:
+      - const: gate
+      - const: core
+
+  interrupts:
+    maxItems: 1
+
+  amlogic,rx-adj:
+    description:
+      Number of clock cycles by which sampling is delayed.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1, 2, 3]
+    default: 0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    sfc0: spi@fe08d000 {
+      compatible = "amlogic,a4-spifc";
+      reg = <0xfe08d000 0x800>;
+      clocks = <&clkc_periphs 31>,
+               <&clkc_periphs 102>;
+      clock-names = "gate", "core";
+
+      pinctrl-0 = <&spiflash_default>;
+      pinctrl-names = "default";
+
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      flash@0 {
+          compatible = "spi-nand";
+          reg = <0>;
+          #address-cells = <1>;
+          #size-cells = <1>;
+          nand-ecc-engine = <&sfc0>;
+          nand-ecc-strength = <8>;
+          nand-ecc-step-size = <512>;
+      };
+    };

-- 
2.37.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
