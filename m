Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A520C433FE
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Nov 2022 14:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A5oHbs7yLMWbTE9NZUYL1/4+dNuJEUGyK3azsuwrE/E=; b=QFqyss5ej+yWcz
	eLM9iKF2gI97HOm4qLKMcEePK5W+1hKCfU0CU9tWgmJbcsaAoNo/KZsWvyDc0dM8M+5ACIdlW2HyL
	I6iW3e/TamV0+850Unb3KfRLx+GpaqvEe0kFX3jWDDzHpI2MWJ7pzEYRa/divXqMMqIQk3lynEFqw
	C3eXNFPRNsNcUAt2C8+6xD46U0RcqLfbVhaiq3ywq+9K98Z4DCV5Ixn1VKlTWmisJGpo8gO+myvAd
	N2fg0A5Pqykmgj1/ho0T4wX4jtRvuhi0FeG8xq6XbrA9gQpEdahIayjOu1cF4duEbxWyBTme79z11
	2sWMQGzL+A0UbEPiwUfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow2TV-004VEJ-7E; Fri, 18 Nov 2022 14:36:13 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow2RI-004TtB-EJ
	for linux-amlogic@bombadil.infradead.org; Fri, 18 Nov 2022 14:33:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=oZapRJG8z2JCvAvfXBnNMVwxacWcNRQ302sDNi+fas8=; b=CXS5lCKnKnEpfWhjuqENM3n0/b
	1eiJP4fO5yEKoZzMWKmKGw9oFOzTgnDvLTvcjN2ZHtY3xJzSXc0vutLwjRE1xxDRO/eQfm4BMVAEE
	TQ3Ww/ajjMRxHeuSbT6Y54WKWyfOAQxaG3UWx9FNKX3aoWyPjwkNTGN0k1hRuk/cQyfOPd78QzZFA
	dEsuU4ilca1T4VCS2IuggnvynONMZf9satPSEcEuULe4isrngRBARZVVP5UB+iUGNirld+Rm1WA1r
	p8KdWVTMPo4iTYsA1PKcHkz9psKsJVhNX5tEbwPPcnAPXvdUyozHM7zaBoOCJPTKEB5shW9W1Nq7i
	LyKJyttA==;
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow2RJ-002Nfu-Ty
	for linux-amlogic@lists.infradead.org; Fri, 18 Nov 2022 14:34:01 +0000
Received: by mail-wm1-x335.google.com with SMTP id c65-20020a1c3544000000b003cfffd00fc0so3669363wma.1
        for <linux-amlogic@lists.infradead.org>; Fri, 18 Nov 2022 06:33:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oZapRJG8z2JCvAvfXBnNMVwxacWcNRQ302sDNi+fas8=;
        b=NHwf5gzscDKYMdxL3OfdNvxiV73eYzt9izjpEJGw56qyn/2edQPWAXNqpqJqeMJSHf
         MREGqHR85usarI/2xnrbF/tqtjXoIVpAGDdUCKa9NDWKlwnHSqxlgAQzVT9vTL1itUTT
         NxcMawupLX+vL58TS/S4zccA6KBi5QDMDVG8bQXkreRNk4dTQp8T1Bk3bHmQXmszD2iV
         GdzyApU8zF+JRueqj3Jw/e4EA9u8suC4iGZFmwfQrlv23dbuh73YpX7lD5pxURY2ZaED
         0tNJdOxEw/NS7ff2giSBtuuJuL18OpOGATexPhFVj+93aD6OvmPHiSM9m4E3NjoDuU63
         xtvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oZapRJG8z2JCvAvfXBnNMVwxacWcNRQ302sDNi+fas8=;
        b=NKur9OlcMwCFsWNvxOuXgUG4bvUtI5ZAZFjX0oR+DLb7944vFbSCBKofPthlxugRRL
         LFkgn+TJtQIt52biXlTSJ830UapNGpMYmzAOzs5XuLMRi1WqThwHLpRShTqMC7XGGqgZ
         ZTckFjSMzE7BF0AVQQ00F+snM9zF4iT5Yh+2+ayfKKpmkDMMwS3G95g+y7Rk3sKte4D7
         PVmVX6yVUhKyzy8Sn6ZmSEKYJc6usQpzGlog0S0dyNfDLlxhvYYenaXrEpGIXaFeOlxG
         20PsNsZsj3twymez3MQaapenqbihytu6A1kPU3Vt/VfdvUQeAZhrV6M0F8FEZJ9Q6EwE
         CYWA==
X-Gm-Message-State: ANoB5pn6Z4GILac49ZB+Eh6RDAIgn4ofnqcpHQsViJfQcUuSiihf2W67
	hJHK9eCUpZnY0HoCsc3tTSJ/Aw==
X-Google-Smtp-Source: AA0mqf6OgNWA+TIEwY5xvFtwseqvutQkVTW2N8FzT9WEGTWRAZmOEc5lNt7z8CriwQZvELVdMDiZ6w==
X-Received: by 2002:a05:600c:468c:b0:3cf:7c81:caae with SMTP id p12-20020a05600c468c00b003cf7c81caaemr5207895wmo.135.1668782026873;
        Fri, 18 Nov 2022 06:33:46 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id j21-20020a05600c1c1500b003cfb7c02542sm5436726wms.11.2022.11.18.06.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 06:33:46 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 18 Nov 2022 15:33:37 +0100
Subject: [PATCH 11/12] dt-bindings: pcie: convert amlogic,meson-pcie.txt to
 dt-schema
MIME-Version: 1.0
Message-Id: <20221117-b4-amlogic-bindings-convert-v1-11-3f025599b968@linaro.org>
References: <20221117-b4-amlogic-bindings-convert-v1-0-3f025599b968@linaro.org>
In-Reply-To: <20221117-b4-amlogic-bindings-convert-v1-0-3f025599b968@linaro.org>
To: Jakub Kicinski <kuba@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Rob Herring <robh+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Alessandro Zummo <a.zummo@towertech.it>, Eric Dumazet <edumazet@google.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Kevin Hilman <khilman@baylibre.com>, Ulf Hansson <ulf.hansson@linaro.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, Russell King <linux@armlinux.org.uk>, Thomas Gleixner <tglx@linutronix.de>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Paolo Abeni <pabeni@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Cc: linux-media@vger.kernel.org, netdev@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-mmc@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org
X-Mailer: b4 0.10.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_143358_010291_CC9024D0 
X-CRM114-Status: GOOD (  14.16  )
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

Convert the Amlogic Meson AXG DWC PCIE SoC controller bindings to
dt-schema.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/pci/amlogic,axg-pcie.yaml  | 129 +++++++++++++++++++++
 .../devicetree/bindings/pci/amlogic,meson-pcie.txt |  70 -----------
 2 files changed, 129 insertions(+), 70 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/amlogic,axg-pcie.yaml b/Documentation/devicetree/bindings/pci/amlogic,axg-pcie.yaml
new file mode 100644
index 000000000000..563a0a3fa6f0
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/amlogic,axg-pcie.yaml
@@ -0,0 +1,129 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/amlogic,axg-pcie.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Meson AXG DWC PCIE SoC controller
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+
+description:
+  Amlogic Meson PCIe host controller is based on the Synopsys DesignWare PCI core.
+
+allOf:
+  - $ref: snps,dw-pcie.yaml#
+
+# We need a select here so we don't match all nodes with 'snps,dw-pcie'
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - amlogic,axg-pcie
+          - amlogic,g12a-pcie
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
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
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
b4 0.10.1

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
