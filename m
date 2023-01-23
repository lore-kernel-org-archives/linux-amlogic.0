Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C47DC05027
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Jan 2023 10:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BwIj7RbyfAJdF0CJWGcdLW94ffM1yVkPxjlv7xnTdfI=; b=OqHpdmX3VTWrAY
	Uq5VkAziLZqqLXyqFu5h/c3dgY1aDGykfS6Erbu2qYwjU3AafD3H0Wpzs3S2d7WobIo1Rz2fwIDHQ
	BT6PwXCP+n10FBhVsA2gANINGJPY7bGlWsi/5V+7cMNgOr22IlU5adJkZRExWBn+MHKTXWko06NjP
	xmKvPPmkS5IN4SYCZARd2yhB6qHOG6Cvu96/YfSFQeDH57TpcBY0oGOT5eA8HDnxuk9EQlmiaInC0
	VFpxlJLhq7vsa1RC9NRs2vwJZKp7ZzHVIzq0yjL8R5n7Pjs9YZLbbJAeUND0wt6y8Jq6md38H+W9o
	ToWCPYkBawH3fUjQbKkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJu0U-00Gnd6-8b; Mon, 23 Jan 2023 10:24:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJtmR-00GhdB-8D
	for linux-amlogic@bombadil.infradead.org; Mon, 23 Jan 2023 10:10:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=/pQr6KmTdUgnaHE8iXfJ0bvx2pGOLcHh3rodgiE7+Kk=; b=lac3+XCy9/XTnv1pKdQV00b+kQ
	05gfM5YwLOgmU28Cwkxc62P/6aEyYdRhPZnhbTllW8Zgg6zhihGSUPa2hlC/qCHOPhN/0RwnO90BC
	vkh4LceTIL+d9SBxXNFXfOXc2RXzYlU+7yY9RddkXqtOtb9JJWr1BRppJMrIqvkwd5SYMt2SgcQDf
	YRbF7mog6Kqzcbu4NNDEGBw92H1vOzgGJIDMJ+6JnQk8KduE1ZeyTZ63bwXLlwQLI3R8UEEgqCRia
	iVYBy5HO1E2meU4Ulhm29+KNe/4Ms6N0+eFr75x5/g/++KyuiixhuOgrm3X74/TWs5mOH/xzeIg1f
	Ue9T4OdA==;
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pJtlq-001Vho-2e
	for linux-amlogic@lists.infradead.org;
	Mon, 23 Jan 2023 10:09:52 +0000
Received: by mail-wr1-x431.google.com with SMTP id r9so10257843wrw.4
        for <linux-amlogic@lists.infradead.org>; Mon, 23 Jan 2023 02:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/pQr6KmTdUgnaHE8iXfJ0bvx2pGOLcHh3rodgiE7+Kk=;
        b=fNsjAacdBPOR5DiDkCUpjezb9Dvezn7/R1FOw2oZ6QwPNBVsWcDPdfYkSTPbKULF5H
         L6X8evzYtigZvdTanLyQe7YKEypW1MmUWAFSXc/OX09EViqzK6jhSEbwUFE0CXqf6ClZ
         xecJS89i7tQY3WnNwOsN2PxhADwmM9yP2wOXtSSOciODP5/ZScoY8iJRrd9rCWSQWr+I
         6S2U+eXdSVoQ2hLeHBv4+RRBYOoGqIlisoiMjDNUQEm0Amv4dzcoL/6Se6PRpm8aNmlZ
         0ahovNgqgULX1nnl+wkzFGtG/sy1fWqs6a8s0NEEargwtSBytuV/rX2GJW1zF3/gReFF
         UDpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/pQr6KmTdUgnaHE8iXfJ0bvx2pGOLcHh3rodgiE7+Kk=;
        b=ZcAt0mDYYmNuk5/yGNdcXkWFBlyxyRHGW7RihMkYIiLCzVI47XtXwU7nLIRUojtMgs
         5TfeWwEtawPqjoKeflzUsyPmg4uuhY8/QO5zEJ9nYA+69I/c9rzSs9zlXHjNm8Gq8t2K
         erUX25F5lKyo10PTMX87exNNLgOI/B/NKnRXMdn1zOLCv9B4rvc+uAoHDwbwki8UZy9b
         kfa3E57KvKfb1fHmilvO8MBKKygpOZK73iRoiVM2Ke3v/mrD3DIwxeZliJLg8c4Ew++j
         mrfvanuLEHu5YW4xYaep1hO+flOMuN8EVIZJ3k0ot2ys45EfDpTT4QDurcGW4KDOXzpw
         FdWg==
X-Gm-Message-State: AFqh2kpllMB1/oInX6TZ27Z9vCThu4Yjw0vFthZtkeoMCbjjqq1TZxmb
	c8QWJj9TomgUoEfGxWHmAA8JNg==
X-Google-Smtp-Source: AMrXdXtX4ayB4/SYIKN3tEBT6oVM/Ouxw56XQljpQcVZlok0nl5I8ryh0pMDyUY+HyWaFPo2iskQvQ==
X-Received: by 2002:a5d:4bce:0:b0:2be:4ae1:215a with SMTP id l14-20020a5d4bce000000b002be4ae1215amr11722277wrt.16.1674468609550;
        Mon, 23 Jan 2023 02:10:09 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id m9-20020a056000024900b002bdec340a1csm22670403wrz.110.2023.01.23.02.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 02:10:09 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 23 Jan 2023 11:10:04 +0100
Subject: [PATCH v3 7/7] dt-bindings: PCI: convert amlogic,meson-pcie.txt to
 dt-schema
MIME-Version: 1.0
Message-Id: <20221117-b4-amlogic-bindings-convert-v3-7-e28dd31e3bed@linaro.org>
References: <20221117-b4-amlogic-bindings-convert-v3-0-e28dd31e3bed@linaro.org>
In-Reply-To: <20221117-b4-amlogic-bindings-convert-v3-0-e28dd31e3bed@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-mmc@vger.kernel.org, linux-pci@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_100947_087883_12AC57EF 
X-CRM114-Status: GOOD (  15.66  )
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

Convert the Amlogic Meson AXG DWC PCIe SoC controller bindings to
dt-schema.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/pci/amlogic,axg-pcie.yaml  | 134 +++++++++++++++++++++
 .../devicetree/bindings/pci/amlogic,meson-pcie.txt |  70 -----------
 2 files changed, 134 insertions(+), 70 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/amlogic,axg-pcie.yaml b/Documentation/devicetree/bindings/pci/amlogic,axg-pcie.yaml
new file mode 100644
index 000000000000..a5bd90bc0712
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/amlogic,axg-pcie.yaml
@@ -0,0 +1,134 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/amlogic,axg-pcie.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Meson AXG DWC PCIe SoC controller
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+
+description:
+  Amlogic Meson PCIe host controller is based on the Synopsys DesignWare PCI core.
+
+allOf:
+  - $ref: /schemas/pci/pci-bus.yaml#
+  - $ref: /schemas/pci/snps,dw-pcie-common.yaml#
+
+# We need a select here so we don't match all nodes with 'snps,dw-pcie'
+select:
+  properties:
+    compatible:
+      enum:
+        - amlogic,axg-pcie
+        - amlogic,g12a-pcie
+  required:
+    - compatible
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - amlogic,axg-pcie
+          - amlogic,g12a-pcie
+      - const: snps,dw-pcie
+
+  reg:
+    items:
+      - description: External local bus interface registers
+      - description: Meson designed configuration registers
+      - description: PCIe configuration space
+
+  reg-names:
+    items:
+      - const: elbi
+      - const: cfg
+      - const: config
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: PCIe GEN 100M PLL clock
+      - description: PCIe RC clock gate
+      - description: PCIe PHY clock
+
+  clock-names:
+    items:
+      - const: pclk
+      - const: port
+      - const: general
+
+  phys:
+    maxItems: 1
+
+  phy-names:
+    const: pcie
+
+  resets:
+    items:
+      - description: Port Reset
+      - description: Shared APB reset
+
+  reset-names:
+    items:
+      - const: port
+      - const: apb
+
+  num-lanes:
+    const: 1
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - clock
+  - clock-names
+  - "#address-cells"
+  - "#size-cells"
+  - "#interrupt-cells"
+  - interrupt-map
+  - interrupt-map-mask
+  - ranges
+  - bus-range
+  - device_type
+  - num-lanes
+  - phys
+  - phy-names
+  - resets
+  - reset-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    pcie: pcie@f9800000 {
+        compatible = "amlogic,axg-pcie", "snps,dw-pcie";
+        reg = <0xf9800000 0x400000>, <0xff646000 0x2000>, <0xf9f00000 0x100000>;
+        reg-names = "elbi", "cfg", "config";
+        interrupts = <GIC_SPI 177 IRQ_TYPE_EDGE_RISING>;
+        clocks = <&pclk>, <&clk_port>, <&clk_phy>;
+        clock-names = "pclk", "port", "general";
+        resets = <&reset_pcie_port>, <&reset_pcie_apb>;
+        reset-names = "port", "apb";
+        phys = <&pcie_phy>;
+        phy-names = "pcie";
+        #interrupt-cells = <1>;
+        interrupt-map-mask = <0 0 0 0>;
+        interrupt-map = <0 0 0 0 &gic GIC_SPI 179 IRQ_TYPE_EDGE_RISING>;
+        bus-range = <0x0 0xff>;
+        #address-cells = <3>;
+        #size-cells = <2>;
+        device_type = "pci";
+        num-lanes = <1>;
+        ranges = <0x82000000 0 0 0xf9c00000 0 0x00300000>;
+    };
+...
diff --git a/Documentation/devicetree/bindings/pci/amlogic,meson-pcie.txt b/Documentation/devicetree/bindings/pci/amlogic,meson-pcie.txt
deleted file mode 100644
index c3a75ac6e59d..000000000000
--- a/Documentation/devicetree/bindings/pci/amlogic,meson-pcie.txt
+++ /dev/null
@@ -1,70 +0,0 @@
-Amlogic Meson AXG DWC PCIE SoC controller
-
-Amlogic Meson PCIe host controller is based on the Synopsys DesignWare PCI core.
-It shares common functions with the PCIe DesignWare core driver and
-inherits common properties defined in
-Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml.
-
-Additional properties are described here:
-
-Required properties:
-- compatible:
-	should contain :
-	- "amlogic,axg-pcie" for AXG SoC Family
-	- "amlogic,g12a-pcie" for G12A SoC Family
-	to identify the core.
-- reg:
-	should contain the configuration address space.
-- reg-names: Must be
-	- "elbi"	External local bus interface registers
-	- "cfg"		Meson specific registers
-	- "config"	PCIe configuration space
-- reset-gpios: The GPIO to generate PCIe PERST# assert and deassert signal.
-- clocks: Must contain an entry for each entry in clock-names.
-- clock-names: Must include the following entries:
-	- "pclk"       PCIe GEN 100M PLL clock
-	- "port"       PCIe_x(A or B) RC clock gate
-	- "general"    PCIe Phy clock
-- resets: phandle to the reset lines.
-- reset-names: must contain "port" and "apb"
-       - "port"        Port A or B reset
-       - "apb"         Share APB reset
-- phys: should contain a phandle to the PCIE phy
-- phy-names: must contain "pcie"
-
-- device_type:
-	should be "pci". As specified in snps,dw-pcie.yaml
-
-
-Example configuration:
-
-	pcie: pcie@f9800000 {
-			compatible = "amlogic,axg-pcie", "snps,dw-pcie";
-			reg = <0x0 0xf9800000 0x0 0x400000
-					0x0 0xff646000 0x0 0x2000
-					0x0 0xf9f00000 0x0 0x100000>;
-			reg-names = "elbi", "cfg", "config";
-			reset-gpios = <&gpio GPIOX_19 GPIO_ACTIVE_HIGH>;
-			interrupts = <GIC_SPI 177 IRQ_TYPE_EDGE_RISING>;
-			#interrupt-cells = <1>;
-			interrupt-map-mask = <0 0 0 0>;
-			interrupt-map = <0 0 0 0 &gic GIC_SPI 179 IRQ_TYPE_EDGE_RISING>;
-			bus-range = <0x0 0xff>;
-			#address-cells = <3>;
-			#size-cells = <2>;
-			device_type = "pci";
-			ranges = <0x82000000 0 0 0x0 0xf9c00000 0 0x00300000>;
-
-			clocks = <&clkc CLKID_USB
-					&clkc CLKID_PCIE_A
-					&clkc CLKID_PCIE_CML_EN0>;
-			clock-names = "general",
-					"pclk",
-					"port";
-			resets = <&reset RESET_PCIE_A>,
-				<&reset RESET_PCIE_APB>;
-			reset-names = "port",
-					"apb";
-			phys = <&pcie_phy>;
-			phy-names = "pcie";
-	};

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
