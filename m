Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 582BFC38145
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Sep 2022 08:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kJs785Qk+E5VlSA2VElhhB/nISdhf9+PegrqU1ZSRiA=; b=yLDEq3ehi+l5/J
	2DcHUOI+wJ5ZDJS6ld7F0OGO+FaMsFe+SU2LYCeZjgHiUfTZw8Y3d+hiunv2q+nLnIYYHJgfDJZ4Z
	bvTOzw7N1VjCpPMHUBnQAT5uWqkYd1wpjqiuXYh/EePdFsGxMYGb+dd3KkTMmeJsGFomKEW1LprFO
	LBbNcJrjoysQIxSuM1gHfHIE6pQ1Y3D1Snl5G+/HVoJHvuEEjPjpuzY9Ztb6hyBXdBgV3qxLxMW94
	/7Mp+RCeJBZJdLyMRcc1Hc+JzlBzY3yr7lLGHxCIvAeXRg4y38fP2+oLoAvwi2vhQh/IgGiqBtYgV
	Kit2OdwwOPewu5UgqCWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVqFq-00496z-OM; Wed, 07 Sep 2022 08:17:50 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVq2o-0040gb-11; Wed, 07 Sep 2022 08:04:24 +0000
Received: from droid11-sz.amlogic.com (10.28.8.21) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server id 15.1.2507.6; Wed, 7 Sep 2022
 16:04:15 +0800
From: Liang Yang <liang.yang@amlogic.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, <linux-mtd@lists.infradead.org>
CC: Liang Yang <liang.yang@amlogic.com>, Rob Herring <robh+dt@kernel.org>,
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
	Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong
	<narmstrong@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>,
	Jianxin Pan <jianxin.pan@amlogic.com>, Victor Wan <victor.wan@amlogic.com>,
	XianWei Zhao <xianwei.zhao@amlogic.com>, Kelvin Zhang
	<kelvin.zhang@amlogic.com>, BiChao Zheng <bichao.zheng@amlogic.com>, YongHui
 Yu <yonghui.yu@amlogic.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: [PATCH v9 4/5] dt-bindings: nand: meson: convert txt to yaml
Date: Wed, 7 Sep 2022 16:04:04 +0800
Message-ID: <20220907080405.28240-5-liang.yang@amlogic.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220907080405.28240-1-liang.yang@amlogic.com>
References: <20220907080405.28240-1-liang.yang@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.28.8.21]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220907_010422_413881_71DB742D 
X-CRM114-Status: GOOD (  14.98  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

convert the amlogic,meson-name.txt to amlogic,meson-nand.yaml

Signed-off-by: Liang Yang <liang.yang@amlogic.com>
---
 .../bindings/mtd/amlogic,meson-nand.txt       | 55 -----------
 .../bindings/mtd/amlogic,meson-nand.yaml      | 93 +++++++++++++++++++
 2 files changed, 93 insertions(+), 55 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mtd/amlogic,meson-nand.txt
 create mode 100644 Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml

diff --git a/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.txt b/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.txt
deleted file mode 100644
index 5d5cdfef417f..000000000000
--- a/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.txt
+++ /dev/null
@@ -1,55 +0,0 @@
-Amlogic NAND Flash Controller (NFC) for GXBB/GXL/AXG family SoCs
-
-This file documents the properties in addition to those available in
-the MTD NAND bindings.
-
-Required properties:
-- compatible : contains one of:
-  - "amlogic,meson-gxl-nfc"
-  - "amlogic,meson-axg-nfc"
-
-- reg        : Offset and length of the register set
-
-- reg-names  : "nfc" is the register set for NFC controller and "emmc"
-		is the register set for MCI controller.
-
-- clocks     :
-	A list of phandle + clock-specifier pairs for the clocks listed
-	in clock-names.
-
-- clock-names: Should contain the following:
-	"core" - NFC module gate clock
-	"device" - parent clock for internal NFC
-
-Optional children nodes:
-Children nodes represent the available nand chips.
-
-Other properties:
-see Documentation/devicetree/bindings/mtd/nand-controller.yaml for generic bindings.
-
-Example demonstrate on AXG SoC:
-
-	nand-controller@7800 {
-		compatible = "amlogic,meson-axg-nfc";
-		reg = <0x0 0x7800 0x0 0x100>,
-		      <0x0 0x7000 0x0 0x800>;
-		reg-names = "nfc", "emmc";
-		#address-cells = <1>;
-		#size-cells = <0>;
-		interrupts = <GIC_SPI 34 IRQ_TYPE_EDGE_RISING>;
-
-		clocks = <&clkc CLKID_SD_EMMC_C>,
-			 <&clkc CLKID_FCLK_DIV2>;
-		clock-names = "core", "device";
-
-		pinctrl-names = "default";
-		pinctrl-0 = <&nand_pins>;
-
-		nand@0 {
-			reg = <0>;
-			#address-cells = <1>;
-			#size-cells = <1>;
-
-			nand-on-flash-bbt;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml b/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
new file mode 100644
index 000000000000..28fb9a7dd70f
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
@@ -0,0 +1,93 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/amlogic,meson-nand.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic NAND Flash Controller (NFC) for GXBB/GXL/AXG family SoCs
+
+allOf:
+  - $ref: nand-controller.yaml
+
+maintainers:
+  - liang.yang@amlogic.com
+
+properties:
+  compatible:
+    enum:
+      - amlogic,meson-gxl-nfc
+      - amlogic,meson-axg-nfc
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: nfc
+      - const: emmc
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
+      - const: device
+
+patternProperties:
+  "^nand@[0-7]$":
+    type: object
+    properties:
+      reg:
+        minimum: 0
+        maximum: 1
+
+      nand-ecc-mode:
+        const: hw
+
+      nand-ecc-step-size:
+        const: 1024
+
+      nand-ecc-strength:
+        enum: [8, 16, 24, 30, 40, 50, 60]
+        description: |
+          The ECC configurations that can be supported are as follows.
+            meson-gxl-nfc 8, 16, 24, 30, 40, 50, 60
+            meson-axg-nfc 8
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
+    #include <dt-bindings/clock/axg-clkc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    nand-controller@ffe07800 {
+      compatible = "amlogic,meson-axg-nfc";
+      reg = <0xffe07800 0x100>, <0xffe07000 0x800>;
+      reg-names = "nfc", "emmc";
+      interrupts = <GIC_SPI 34 IRQ_TYPE_EDGE_RISING>;
+      clocks = <&clkc CLKID_SD_EMMC_C>,  <&clkc CLKID_FCLK_DIV2>;
+      clock-names = "core", "device";
+
+      pinctrl-0 = <&nand_pins>;
+      pinctrl-names = "default";
+
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      nand@0 {
+        reg = <0>;
+      };
+    };
+
+...
-- 
2.37.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
