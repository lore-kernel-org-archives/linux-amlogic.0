Return-Path: <SRS0=HwYM=Y6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C175CC5DF62
	for <linux-amlogic@archiver.kernel.org>; Wed,  6 Nov 2019 10:45:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92015217F5
	for <linux-amlogic@archiver.kernel.org>; Wed,  6 Nov 2019 10:45:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n4VY85ss";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="0Djt5Com"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92015217F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0mwGpsA72X3MK7y0Px2BTzLLxEyBc/k759+rtm7qUlU=; b=n4VY85ss5uQAtU
	e7deurM9xK7FLXYzS15U8HngIaakHumZ43Jx1J1WMrTohNP7QJhLo14xmSESsOyhNkU7lIosflVJ8
	to/zksmDlQ9zi2iPcGXd3xdZNopEZ+wT8hdx9O2GMWQNueDD0+EBwtZE57lvnvN3WL+goXAi3Q+Bp
	SWJl4KiT8E/aU7wciqFuRkqsjwgzpUHMpINvJ1TrnEBzVOJF12SBxg5o7rewt02Et2m2/90+Mqnbo
	4Jd0JRT+GHM6GuPFfy9LZVAOz++exvWxglbMYXKKptyR3IJS073CI3wenoT1eMeq8bWFpteNhcrwe
	lgHcLL5P2uQ+lnl6ZIeA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSIoO-0002Xs-0P; Wed, 06 Nov 2019 10:45:16 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSIoB-0001Dc-25
 for linux-amlogic@lists.infradead.org; Wed, 06 Nov 2019 10:45:06 +0000
Received: by mail-wr1-x444.google.com with SMTP id a15so25120351wrf.9
 for <linux-amlogic@lists.infradead.org>; Wed, 06 Nov 2019 02:45:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ho0IuXnlLSu0S9dl4tyqWJ4wOPukxzFH+rPw8w9IP3U=;
 b=0Djt5Com4Nw6nawSJY2BCWzsF4s4Xk8wxOoGPh18FDbcUJ4GQQiII9UXR5UWrhl9Ho
 1+hy5If3cGGw6wPamrAt2Ck9f3cdm537ILzhsx/nhU40El7Bti+8EM3DtzCwD0lcdJVq
 FsOzwh1Lcgt8dIoSZ2KacYGB0OmM198fRKZq1pTGk9mqNz1pKhSmpGx/4skJR6qKeQH/
 q6yJAgMA1lNxdvJ5c3cg8pzFOPAs5SAPbUukBlMw5+trLF5gSTdqtRrRu8ROe22nAZXh
 8yF6WN0msw88arX4YfEa+tQBnzkjmrmiQ2cIKVPbH6zBTa2Sz+d5UUDMWbYvrs4kVPHw
 y1vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ho0IuXnlLSu0S9dl4tyqWJ4wOPukxzFH+rPw8w9IP3U=;
 b=NaYkfCqFiy58CSP7JLeZRXDg/uZvO9K1PSCIn3Q6wuwwLCFPSQQ69GO2+CQF2eV4Hg
 PezqV1mlVkgExd4d8H79xxIta4mGe4t9KAF4/QzHjJqtoffefbzvCIqbdb5HyoHsAZwn
 ggWlhlTILrIdIsvdmjjeVWu26+AOoySw3zIhexTzaAwC3U2OupIYyPNu9CGZAZfl4Wzj
 KIRQRore6Eplmbpa5rEb5zCSwI1i3TBBCMUpEI2lqEL+KweRYv0kkTfow9KPrEPJAmOk
 A45nZ8gmuw64qYrsOev4sB4r7jebT5tolQXtbYlZjn6qlOhepZ7QfB2FQN0N6Pl6U3a7
 V3RQ==
X-Gm-Message-State: APjAAAU58w+m6t4iuDx675Jc0CD4qGJu7057502riXsAooBEXHkhXkWG
 3lRUYxg9GV7qA+o1KL5+jLQ7dA==
X-Google-Smtp-Source: APXvYqxmFcDntelzvf5oc2kIZGTaA8RcxUIN9ppLG7GpMdMZTeYZT5cyAcYce2korwDEVDossgvHyA==
X-Received: by 2002:adf:fe90:: with SMTP id l16mr1948950wrr.81.1573037100615; 
 Wed, 06 Nov 2019 02:45:00 -0800 (PST)
Received: from bender.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id u187sm2483023wme.15.2019.11.06.02.44.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2019 02:45:00 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: robh+dt@kernel.org
Subject: [PATCH v2] dt-bindings: usb: dwc3: Move Amlogic G12A DWC3 Glue
 Bindings to YAML schemas
Date: Wed,  6 Nov 2019 11:44:58 +0100
Message-Id: <20191106104458.23698-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191106_024503_136848_B7945119 
X-CRM114-Status: GOOD (  16.50  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Now that we have the DT validation in place, let's convert the device tree
bindings for the Amlogic G12A DWC3 Glue Bindings over to a YAML schemas,
the AXG and GXL glue bindings will be converted later.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
Changes since v1:
- fixed typo in description
- removed dr-mode definition in favor of "true"

 .../devicetree/bindings/usb/amlogic,dwc3.txt  |  88 ------------
 .../usb/amlogic,meson-g12a-usb-ctrl.yaml      | 128 ++++++++++++++++++
 2 files changed, 128 insertions(+), 88 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml

diff --git a/Documentation/devicetree/bindings/usb/amlogic,dwc3.txt b/Documentation/devicetree/bindings/usb/amlogic,dwc3.txt
index b9f04e617eb7..9a8b631904fd 100644
--- a/Documentation/devicetree/bindings/usb/amlogic,dwc3.txt
+++ b/Documentation/devicetree/bindings/usb/amlogic,dwc3.txt
@@ -40,91 +40,3 @@ Example device nodes:
 				phy-names = "usb2-phy", "usb3-phy";
 			};
 		};
-
-Amlogic Meson G12A DWC3 USB SoC Controller Glue
-
-The Amlogic G12A embeds a DWC3 USB IP Core configured for USB2 and USB3
-in host-only mode, and a DWC2 IP Core configured for USB2 peripheral mode
-only.
-
-A glue connects the DWC3 core to USB2 PHYs and optionnaly to an USB3 PHY.
-
-One of the USB2 PHY can be re-routed in peripheral mode to a DWC2 USB IP.
-
-The DWC3 Glue controls the PHY routing and power, an interrupt line is
-connected to the Glue to serve as OTG ID change detection.
-
-Required properties:
-- compatible:	Should be "amlogic,meson-g12a-usb-ctrl"
-- clocks:	a handle for the "USB" clock
-- resets:	a handle for the shared "USB" reset line
-- reg:		The base address and length of the registers
-- interrupts:	the interrupt specifier for the OTG detection
-- phys: 	handle to used PHYs on the system
-	- a <0> phandle can be used if a PHY is not used
-- phy-names:	names of the used PHYs on the system :
-	- "usb2-phy0" for USB2 PHY0 if USBHOST_A port is used
-	- "usb2-phy1" for USB2 PHY1 if USBOTG_B port is used
-	- "usb3-phy0" for USB3 PHY if USB3_0 is used
-- dr_mode:	should be "host", "peripheral", or "otg" depending on
-	the usage and configuration of the OTG Capable port.
-	- "host" and "peripheral" means a fixed Host or Device only connection
-	- "otg" means the port can be used as both Host or Device and
-	  be switched automatically using the OTG ID pin.
-
-Optional properties:
-- vbus-supply:	should be a phandle to the regulator controlling the VBUS
-		power supply when used in OTG switchable mode
-
-Required child nodes:
-
-A child node must exist to represent the core DWC3 IP block. The name of
-the node is not important. The content of the node is defined in dwc3.txt.
-
-A child node must exist to represent the core DWC2 IP block. The name of
-the node is not important. The content of the node is defined in dwc2.txt.
-
-PHY documentation is provided in the following places:
-- Documentation/devicetree/bindings/phy/meson-g12a-usb2-phy.txt
-- Documentation/devicetree/bindings/phy/meson-g12a-usb3-pcie-phy.txt
-
-Example device nodes:
-	usb: usb@ffe09000 {
-			compatible = "amlogic,meson-g12a-usb-ctrl";
-			reg = <0x0 0xffe09000 0x0 0xa0>;
-			interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
-
-			clocks = <&clkc CLKID_USB>;
-			resets = <&reset RESET_USB>;
-
-			dr_mode = "otg";
-
-			phys = <&usb2_phy0>, <&usb2_phy1>,
-			       <&usb3_pcie_phy PHY_TYPE_USB3>;
-			phy-names = "usb2-phy0", "usb2-phy1", "usb3-phy0";
-
-			dwc2: usb@ff400000 {
-				compatible = "amlogic,meson-g12a-usb", "snps,dwc2";
-				reg = <0x0 0xff400000 0x0 0x40000>;
-				interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&clkc CLKID_USB1_DDR_BRIDGE>;
-				clock-names = "ddr";
-				phys = <&usb2_phy1>;
-				dr_mode = "peripheral";
-				g-rx-fifo-size = <192>;
-				g-np-tx-fifo-size = <128>;
-				g-tx-fifo-size = <128 128 16 16 16>;
-			};
-
-			dwc3: usb@ff500000 {
-				compatible = "snps,dwc3";
-				reg = <0x0 0xff500000 0x0 0x100000>;
-				interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
-				dr_mode = "host";
-				snps,dis_u2_susphy_quirk;
-				snps,quirk-frame-length-adjustment;
-			};
-	};
diff --git a/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml b/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
new file mode 100644
index 000000000000..2b2dae2e6b7f
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
@@ -0,0 +1,128 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2019 BayLibre, SAS
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/usb/amlogic,meson-g12a-usb-ctrl.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Amlogic Meson G12A DWC3 USB SoC Controller Glue
+
+maintainers:
+  - Neil Armstrong <narmstrong@baylibre.com>
+
+description: |
+  The Amlogic G12A embeds a DWC3 USB IP Core configured for USB2 and USB3
+  in host-only mode, and a DWC2 IP Core configured for USB2 peripheral mode
+  only.
+
+  A glue connects the DWC3 core to USB2 PHYs and optionally to an USB3 PHY.
+
+  One of the USB2 PHYs can be re-routed in peripheral mode to a DWC2 USB IP.
+
+  The DWC3 Glue controls the PHY routing and power, an interrupt line is
+  connected to the Glue to serve as OTG ID change detection.
+
+properties:
+  compatible:
+    enum:
+      - amlogic,meson-g12a-usb-ctrl
+
+  ranges: true
+
+  "#address-cells":
+    enum: [ 1, 2 ]
+
+  "#size-cells":
+    enum: [ 1, 2 ]
+
+  clocks:
+    minItems: 1
+
+  resets:
+    minItems: 1
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  phy-names:
+    items:
+      - const: usb2-phy0 # USB2 PHY0 if USBHOST_A port is used
+      - const: usb2-phy1 # USB2 PHY1 if USBOTG_B port is used
+      - const: usb3-phy0 # USB3 PHY if USB3_0 is used
+
+  phys:
+    minItems: 1
+    maxItems: 3
+
+  dr_mode: true
+
+  power-domains:
+    maxItems: 1
+
+  vbus-supply:
+    description: VBUS power supply when used in OTG switchable mode
+    maxItems: 1
+
+patternProperties:
+  "^usb@[0-9a-f]+$":
+    type: object
+
+additionalProperties: false
+
+required:
+  - compatible
+  - "#address-cells"
+  - "#size-cells"
+  - ranges
+  - clocks
+  - resets
+  - reg
+  - interrupts
+  - phy-names
+  - phys
+  - dr_mode
+
+examples:
+  - |
+    usb: usb@ffe09000 {
+          compatible = "amlogic,meson-g12a-usb-ctrl";
+          reg = <0x0 0xffe09000 0x0 0xa0>;
+          interrupts = <16>;
+          #address-cells = <1>;
+          #size-cells = <1>;
+          ranges;
+
+          clocks = <&clkc_usb>;
+          resets = <&reset_usb>;
+
+          dr_mode = "otg";
+
+          phys = <&usb2_phy0>, <&usb2_phy1>, <&usb3_phy0>;
+          phy-names = "usb2-phy0", "usb2-phy1", "usb3-phy0";
+
+          dwc2: usb@ff400000 {
+              compatible = "amlogic,meson-g12a-usb", "snps,dwc2";
+              reg = <0xff400000 0x40000>;
+              interrupts = <31>;
+              clocks = <&clkc_usb1>;
+              clock-names = "ddr";
+              phys = <&usb2_phy1>;
+              dr_mode = "peripheral";
+              g-rx-fifo-size = <192>;
+              g-np-tx-fifo-size = <128>;
+              g-tx-fifo-size = <128 128 16 16 16>;
+          };
+
+          dwc3: usb@ff500000 {
+              compatible = "snps,dwc3";
+              reg = <0xff500000 0x100000>;
+              interrupts = <30>;
+              dr_mode = "host";
+              snps,dis_u2_susphy_quirk;
+              snps,quirk-frame-length-adjustment;
+          };
+    };
+
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
