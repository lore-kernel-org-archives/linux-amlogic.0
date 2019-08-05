Return-Path: <SRS0=EYbA=WB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17E37C0650F
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Aug 2019 12:05:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8E3B206A2
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Aug 2019 12:05:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nmFWKctO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Hp4E2CtC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8E3B206A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jBqcxj9P/84T/JefpuuteLtAs2Czcoy6I02QEogLsV0=; b=nmFWKctOL9Ixdh
	TBqpCJmcD6WAp9pjaiCpOcwFSEZ0W9KcI0zJHcEqYG2no6SN0fj2t8JikhqIc8KA0kdUV+D9Kwg1C
	i5EVPsC/p8H/IfCvZ9BGTRIEcW9vIsHi2+EP7Ttp13eXIFRi3QBCFUysU+3MEaxoh/h4CHLKmQ/+a
	Z0yMy558TEXMEZ4n6duxnH7/5p20mdTYl/CINrXzKy/zv7lOlcUBMLGwi+gDy2PckE3/a6WUGAfr1
	zAV7L+jtZoIgCyFFpuVTvtefQiBiVI37u3O2BraICuBOUMQRCxyqXY2DMav7JUD15++4lBlBX1LrL
	Qyw0xpOP11C9iZKfNpQQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hubjo-0006Rz-Bq; Mon, 05 Aug 2019 12:05:16 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hubi8-0003BF-GP
 for linux-amlogic@lists.infradead.org; Mon, 05 Aug 2019 12:03:35 +0000
Received: by mail-wr1-x430.google.com with SMTP id y4so84161010wrm.2
 for <linux-amlogic@lists.infradead.org>; Mon, 05 Aug 2019 05:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1UVbrDvxHP5fxAN2NFQuc4DUAHk3kIbjh3o2fngqONY=;
 b=Hp4E2CtC/CqVj2zUXcx0mf2aKRE8qNhjqoRkDLzn/2ALVO8KG/wgxj/8JsqNdYoCpX
 LicIz8U0wOImo8ByhkgKlAT2i2vDKQCFheCdpBLfCArxDd6WBiXfwKw7z15Ks2rMXTH2
 NbfvUjP+OL4hyJGMpBylUgSTnW6SvBeZr4SijYlyt7Ei3Rwq6RwHWeIyJ80NaRTUEtBR
 o2pBGhEzT8fF4N0EUANccvuhKuGV/2R9kDehR/iaTt15tVHhUzqE5UDn/VPWAYRpelgb
 ntJl39mCOUe24RS7FdTCz8Y8OCo2nJ7VUEwpnGsXrq+jU3tOcCyJ9LIJAtxHCKzfKtSF
 R5PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1UVbrDvxHP5fxAN2NFQuc4DUAHk3kIbjh3o2fngqONY=;
 b=btwbwkSXhLndbmIuEEhuZPqZ3whkdk9QAk2O1lODl276k4afBlYGGk+nAUeB58tROg
 R370RLeIaB7c6QLj5QTuyXWbotcutQAl+k81bbE8rMiJ1UI5Z0ZmlSV9c/FsrVuiQjs5
 zHuPCHDR2WVzp/pM8PohdrSsslrIQuFd0EikO67M2KB4+eiil3vDomDW6+pIQW4GMrzK
 3hVMs7aadoV7qotqdUInLfjLkiJYj07URWON3paQfGpM4NxOYnRRwBBxp82hHxdQneTY
 RHRnr9lYhZ7AbZeCBeaEseAtuyXnaABN4zkvZ4d1Mv41zc0BRQFFpyXoFaOA0K6cv9EA
 qX3g==
X-Gm-Message-State: APjAAAUzz8vx5JYtq0M/Bg87Vz+xL1lTPpWxHo5klziTxK7+1E2bO3fm
 F+RzfNAydpl1WnJplECbdUsvKA==
X-Google-Smtp-Source: APXvYqyd3wkTX3t9piiXsiUvpCyXSr8KaClorqcwW6T6bYRCzKarSSd9WohTarGxBu0zlFBS9XZbCA==
X-Received: by 2002:a5d:428a:: with SMTP id k10mr4966844wrq.329.1565006607836; 
 Mon, 05 Aug 2019 05:03:27 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id x6sm88683668wrt.63.2019.08.05.05.03.27
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 05 Aug 2019 05:03:27 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: robh+dt@kernel.org
Subject: [RFCv2 3/9] dt-bindings: spi: meson: convert to yaml
Date: Mon,  5 Aug 2019 14:03:14 +0200
Message-Id: <20190805120320.32282-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190805120320.32282-1-narmstrong@baylibre.com>
References: <20190805120320.32282-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190805_050332_731026_56373E03 
X-CRM114-Status: GOOD (  11.97  )
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
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Now that we have the DT validation in place, let's convert the device tree
bindings for the Amlogic SPI controllers over to two separate YAML schemas.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../bindings/spi/amlogic,meson-gx-spicc.yaml  | 67 +++++++++++++++++++
 .../bindings/spi/amlogic,meson6-spifc.yaml    | 53 +++++++++++++++
 .../devicetree/bindings/spi/spi-meson.txt     | 55 ---------------
 3 files changed, 120 insertions(+), 55 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml
 create mode 100644 Documentation/devicetree/bindings/spi/amlogic,meson6-spifc.yaml
 delete mode 100644 Documentation/devicetree/bindings/spi/spi-meson.txt

diff --git a/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml b/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml
new file mode 100644
index 000000000000..49b617c98ae7
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2019 BayLibre, SAS
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/spi/amlogic,meson-gx-spicc.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Amlogic Meson SPI Communication Controller
+
+maintainers:
+  - Neil Armstrong <narmstrong@baylibre.com>
+
+allOf:
+  - $ref: "spi-controller.yaml#"
+
+description: |
+  The Meson SPICC is a generic SPI controller for general purpose Full-Duplex
+  communications with dedicated 16 words RX/TX PIO FIFOs.
+
+properties:
+  compatible:
+    enum:
+      - amlogic,meson-gx-spicc # SPICC controller on Amlogic GX and compatible SoCs
+      - amlogic,meson-axg-spicc # SPICC controller on Amlogic AXG and compatible SoCs
+
+  interrupts:
+    maxItems: 1
+
+  reg:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    description: input clock for the baud rate generator
+    items:
+      - const: core
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+examples:
+  - |
+    spi@c1108d80 {
+          compatible = "amlogic,meson-gx-spicc";
+          reg = <0xc1108d80 0x80>;
+          interrupts = <112>;
+          clocks = <&clk81>;
+          clock-names = "core";
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          ethernet-switch@0 {
+              compatible = "micrel,ks8995m";
+              spi-max-frequency = <1000000>;
+              reg = <0>;
+          };
+    };
+
diff --git a/Documentation/devicetree/bindings/spi/amlogic,meson6-spifc.yaml b/Documentation/devicetree/bindings/spi/amlogic,meson6-spifc.yaml
new file mode 100644
index 000000000000..67dcedc81a5e
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/amlogic,meson6-spifc.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2019 BayLibre, SAS
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/spi/amlogic,meson6-spifc.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Amlogic Meson SPI Flash Controller
+
+maintainers:
+  - Neil Armstrong <narmstrong@baylibre.com>
+
+allOf:
+  - $ref: "spi-controller.yaml#"
+
+description: |
+  The Meson SPIFC is a controller optimized for communication with SPI
+  NOR memories, without DMA support and a 64-byte unified transmit /
+  receive buffer.
+
+properties:
+  compatible:
+    enum:
+      - amlogic,meson6-spifc # SPI Flash Controller on Meson6 and compatible SoCs
+      - amlogic,meson-gxbb-spifc # SPI Flash Controller on GXBB and compatible SoCs
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+examples:
+  - |
+    spi@c1108c80 {
+          compatible = "amlogic,meson6-spifc";
+          reg = <0xc1108c80 0x80>;
+          clocks = <&clk81>;
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          flash: m25p80@0 {
+              compatible = "spansion,m25p80", "jedec,spi-nor";
+              reg = <0>;
+              spi-max-frequency = <40000000>;
+          };
+    };
+
diff --git a/Documentation/devicetree/bindings/spi/spi-meson.txt b/Documentation/devicetree/bindings/spi/spi-meson.txt
deleted file mode 100644
index b7f5e86fed22..000000000000
--- a/Documentation/devicetree/bindings/spi/spi-meson.txt
+++ /dev/null
@@ -1,55 +0,0 @@
-Amlogic Meson SPI controllers
-
-* SPIFC (SPI Flash Controller)
-
-The Meson SPIFC is a controller optimized for communication with SPI
-NOR memories, without DMA support and a 64-byte unified transmit /
-receive buffer.
-
-Required properties:
- - compatible: should be "amlogic,meson6-spifc" or "amlogic,meson-gxbb-spifc"
- - reg: physical base address and length of the controller registers
- - clocks: phandle of the input clock for the baud rate generator
- - #address-cells: should be 1
- - #size-cells: should be 0
-
-	spi@c1108c80 {
-		compatible = "amlogic,meson6-spifc";
-		reg = <0xc1108c80 0x80>;
-		clocks = <&clk81>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-	};
-
-* SPICC (SPI Communication Controller)
-
-The Meson SPICC is generic SPI controller for general purpose Full-Duplex
-communications with dedicated 16 words RX/TX PIO FIFOs.
-
-Required properties:
- - compatible: should be:
-	"amlogic,meson-gx-spicc" on Amlogic GX and compatible SoCs.
-	"amlogic,meson-axg-spicc" on Amlogic AXG and compatible SoCs
- - reg: physical base address and length of the controller registers
- - interrupts: The interrupt specifier
- - clock-names: Must contain "core"
- - clocks: phandle of the input clock for the baud rate generator
- - #address-cells: should be 1
- - #size-cells: should be 0
-
-Optional properties:
- - resets: phandle of the internal reset line
-
-See ../spi/spi-bus.txt for more details on SPI bus master and slave devices
-required and optional properties.
-
-Example :
-	spi@c1108d80 {
-		compatible = "amlogic,meson-gx-spicc";
-		reg = <0xc1108d80 0x80>;
-		interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
-		clock-names = "core";
-		clocks = <&clk81>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-	};
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
