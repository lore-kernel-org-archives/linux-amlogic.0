Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABA5FCA0FE7
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Aug 2025 02:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X/whMVLfqVfvtzRaC0+eq2EFVEvP2DZtZUyc84wxGso=; b=qRlD5nK8yaKWjb
	Ol2cG6LbKS/137t28gjbSwKSishi4AqtS3fzH/Wb1tEEkuouN/phJ/O3dHeOlztxWPKOqTcqNrM9i
	nBWuXTI90QwXXAihkGLMFM3FbZOm84fShFPimLprJp0/k0096k5wCbqxZmLNmNN7dE/v0hrrI7b5B
	zCwOaVE/+2hkJGW+8UQsXNGth+VGBV0zNVzIzZOs8QBH3KtKFH5KeG/9mxyns/IauzWjM0ejyTblj
	XuytgcB4hvS47MZjqf5m4LTxTh8LEPaFsK/Uf5OyYYzYbp4w9Uw5Nu0jePb6YMFN4eNTXln7RGRK8
	xuf8L6WVyWmr05+SlrLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqjAe-0000000AKkZ-3jAN;
	Tue, 26 Aug 2025 02:12:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqj8X-0000000AKTb-07md
	for linux-amlogic@lists.infradead.org;
	Tue, 26 Aug 2025 02:10:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 182065C5A8C;
	Tue, 26 Aug 2025 02:10:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A347AC4CEF1;
	Tue, 26 Aug 2025 02:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756174211;
	bh=GlgpP4aSy/X3lcFsQSpchLxm7GsCiqdy3J2u9KSg5Xk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=SECtojZ5SIi5CIPplOUtDz+Y+11qnwgrDVsaExgh9xezMWD7avO2OAl5LYyc/MDqm
	 sA+VR5aZXPE0C5EZdHNKBEwNXM+9uAjHOQMAZZPBhLYnWO77VrnXZp5irWKKOXAhEv
	 eribIYiGnY2aLj3PVBy7tuT2JoGj5DWPnFmb6BlgvMpCH7/fPyluAZkcVu2NuF0dtz
	 rG9KvLvdqB1F6cr2TZLCe2Bv+TKs+sUINLTeThQYGzJ0Az9ZtBWpxlwkDiBpXDmesc
	 PDuPACE0+yvAswwt7cDmTqGQS39U4CmpZHuaMtppONbmKPosk/y6Khb9teU/BCMtkM
	 rGmv7JG9Jsa0g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EA1ACA0FE7;
	Tue, 26 Aug 2025 02:10:11 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Tue, 26 Aug 2025 10:10:09 +0800
Subject: [PATCH v3 1/3] spi: dt-bindings: add Amlogic A113L2 SFC
MIME-Version: 1.0
Message-Id: <20250826-spifc-v3-1-7e926041d7f6@amlogic.com>
References: <20250826-spifc-v3-0-7e926041d7f6@amlogic.com>
In-Reply-To: <20250826-spifc-v3-0-7e926041d7f6@amlogic.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liang Yang <liang.yang@amlogic.com>, 
 Feng Chen <feng.chen@amlogic.com>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756174209; l=2882;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=nMIimNuJem3Ad+WE57H9ayTye/RTSID7JvSbdPjhHgE=;
 b=SQqv+O/jv+z7GPwTBZKFS9gTdHrF7OkLVLWldB+3IIs0jIdORjnwmc2FtpawYj1yUlN7xnefa
 VQGV7vgjusFA3ivPHXfungy6Bki1jrnVTM10aDIBn/pMhdMCwOezDjP
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_191013_161513_2468B6F6 
X-CRM114-Status: GOOD (  13.16  )
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
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 .../devicetree/bindings/spi/amlogic,a4-spifc.yaml  | 82 ++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/amlogic,a4-spifc.yaml b/Documentation/devicetree/bindings/spi/amlogic,a4-spifc.yaml
new file mode 100644
index 000000000000..80a89408a832
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
+      Adjust sample timing for RX, Sampling time move later by 1 bus clock.
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
