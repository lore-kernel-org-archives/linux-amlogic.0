Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A42FCA0EC0
	for <linux-amlogic@archiver.kernel.org>; Fri,  8 Aug 2025 02:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e04FOu5Bh4yiZrvqfxI6mCmI08SE8i59h6WtC52WDTI=; b=KB40O/kIrxDOqR
	ZM7nIKEfk8kfs2qeFtRx74NR2Y1VC+sfNYD18Q/ffqVfmV05AtAHnG98vWXZeHG+f2T3IQc09DQKh
	YI+oMm/gpgl0LxL5WlklqvmTOE/suD0P7firmhRDD/tO9PT2FZTx9qvucOybqKKSufRbfELjrxa5+
	Hjqx42w+tL259e/umM7Z4jdCkmak8AqPyVr2uc59Wqn90DDWjusdOeNnUlX4WiW9n3V5H1wi2WcQy
	iWx7n9898cUniM+7pTOkeZCiW7iMvNgGiUQce0106kNXFwbTrBMkKPDAkqcOl4lkylyYrBq3ca/eR
	OX5B/Fx0EMmbVQzNEykw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukCRM-00000001pir-3gNU;
	Fri, 08 Aug 2025 02:02:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukCPP-00000001pUS-2bpT
	for linux-amlogic@lists.infradead.org;
	Fri, 08 Aug 2025 02:00:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 994665C5C8F;
	Fri,  8 Aug 2025 02:00:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3E0E0C4CEF4;
	Fri,  8 Aug 2025 02:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754618436;
	bh=gtvsT1x6KL1WuqVo2r9Pv7p1UHA5wXGQdsrF0EprLAs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=VfL82cMQEMJrREUNvoBvzRO+68hd8djtvU1WiwhedyshvRc43Sd4F1P0vA2vUudVD
	 /AMjaqihthghF1n1Z2sGgmZYIZ64rEMDpk6aDzfUhquPso131rat/K58JbFv4MOb/r
	 tHZO0D8/uswR8SjNlIC7a7Rf/L3scLCUfwIYbt4uykW3wTy45se3YWKGjBR5m9Xsbo
	 /O37l/cmYPNcQvFuQoug1U4vncQaIP73OAEXB4IW75iVbwzniFn6ddeUZ806wuFfg2
	 1BjyUFT3dWzxEvEza16YcukD4GT01ybMZHharWmCYdm+uA/K5biDMiZIECj0kAO2UD
	 EetANZx6IaRag==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BF12C87FCF;
	Fri,  8 Aug 2025 02:00:36 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Fri, 08 Aug 2025 10:00:34 +0800
Subject: [PATCH 1/3] spi: dt-bindings: add doc for Amlogic A113L2 SFC
MIME-Version: 1.0
Message-Id: <20250808-spifc-v1-1-ff4e30e26a6b@amlogic.com>
References: <20250808-spifc-v1-0-ff4e30e26a6b@amlogic.com>
In-Reply-To: <20250808-spifc-v1-0-ff4e30e26a6b@amlogic.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liang Yang <liang.yang@amlogic.com>, 
 Feng Chen <feng.chen@amlogic.com>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754618434; l=3425;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=bLH1YCUDdwpRixxvKPG4oxzNBgBNJNrkBjlYrk9Mqmw=;
 b=gu7g30GKaG1N5QhYx3uprkNWWWZUpQ1YT+TRKt5aQwRTH9zrplfXfOCLLUmjTAGhPVpb50Ke2
 3ZErOJJYgH1ALW5FPI+6iz3oA5mW3DB4OHa2+f/8WkWRXGCk9YAQRbL
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_190039_747663_C16EC2E1 
X-CRM114-Status: GOOD (  13.63  )
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
 .../devicetree/bindings/spi/amlogic,a4-spifc.yaml  | 104 +++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/amlogic,a4-spifc.yaml b/Documentation/devicetree/bindings/spi/amlogic,a4-spifc.yaml
new file mode 100644
index 000000000000..712a17a4b117
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/amlogic,a4-spifc.yaml
@@ -0,0 +1,104 @@
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
+  The Amlogic SPI flash controller is an extended version
+  of the Amlogic NAND flash controller. It supports SPI Nor
+  Flash and SPI NAND Flash(where the Host ECC HW engine could
+  be enabled).
+
+allOf:
+  - $ref: /schemas/spi/spi-controller.yaml#
+
+properties:
+  compatible:
+    const: amlogic,a4-spifc
+
+  reg:
+    items:
+      - description: core registers
+      - description: parent clk control registers
+
+  reg-names:
+    items:
+      - const: core
+      - const: pclk
+
+  clocks:
+    items:
+      - description: clock gate
+      - description: clock used for the controller
+      - description: clock used for the SPI bus
+
+  clock-names:
+    items:
+      - const: gate
+      - const: core
+      - const: device
+
+  interrupts:
+    maxItems: 1
+
+  amlogic,sfc-enable-random:
+    description: Enable data scrambling
+    type: boolean
+
+  amlogic,sfc-no-hwecc:
+    description: Disable ECC HW engine
+    type: boolean
+
+  amlogic,rx-adj:
+    description:
+      Adjust sample timing for RX, Sampling time
+      move later by 1 bus clock.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1, 2, 3]
+    default: 0
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    sfc0: spi@fe08d000 {
+      compatible = "amlogic,a4-spifc";
+      reg = <0xfe08d000 0x800>, <0xfe08c000 0x4>;
+      reg-names = "core", "pclk";
+      clocks = <&clkc_periphs 31>,
+               <&clkc_periphs 102>,
+               <&scmi_clk 13>;
+      clock-names = "gate", "core", "device";
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
