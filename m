Return-Path: <SRS0=t7Bi=WE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0DE7C0650F
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Aug 2019 08:55:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A07052173E
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Aug 2019 08:55:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hGjHOqfi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Q7rWpRAl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A07052173E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iRMzdIri1v/lUhW0T0+3SaaviJzkcXnnEWphUDR+BeY=; b=hGjHOqfit2S3Y/
	zQtCJGo48VXeIcN2CNgXbmrjz070+3BzY60TlG/eua53r0XqNNIJd0/VlhEJBoOhHWuDfSpjWSB/k
	AX++tc1jXgszA3Uu9GV3slViUvV2RNSfCzMcNTepN5/VhogPEY6mvONr7i1MYaaLCiQjGmw0Fazu8
	Lgyo8DxK5EdMlZ6+98f6HiED1K0zm7NpQCJZVOZfR6WI7hFgNNHj2r82QG8YoXWX1bIrqBtLh2Y9V
	xhP/dFp2VYdMLYa+LaBdHu29dQojUiH8Qy0BQ5b69gjEO8y3WuqvXEIDL7GfdSz3kbmoU07d7zLM9
	Xsw/2ihAKd+Y2rwwT5mw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hveD6-0005Ay-OT; Thu, 08 Aug 2019 08:55:48 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hveCl-0004r8-Du
 for linux-amlogic@lists.infradead.org; Thu, 08 Aug 2019 08:55:30 +0000
Received: by mail-wm1-x32c.google.com with SMTP id v19so1577794wmj.5
 for <linux-amlogic@lists.infradead.org>; Thu, 08 Aug 2019 01:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NVSIoQDQUI59AbtDU6wtNrL9Ak0Km4aJoVNG1T5jUh0=;
 b=Q7rWpRAlxZmePJwFcK/A1Seoos3aHW86F4zqwi6X2K5uJbQUCQoHQjijXhmCxV5Bj+
 O7j1saG4tbzqr5meHTXY97mykA2rU7WEghzcfYrZFztqJV7VkT6AK7EdwG1LjoMKvBs2
 dGjTy4wflmtqhrOAcuv8osb4qT5oovQZdUBlr1suzJSY0e2AjTGGxjR9DCNeRoZkCxNX
 8iQUS0aZH3LrFzY7PpzQsw6kl54Fuk0v51GQ1sRPTFtpSFxiXSk1xqmmi+5uEzK6i3br
 Mx9kdgg1ptLfRkCwL2OJS3rScaDhR4b6hj+KXOYgvpxHhsVthboLLTTXEQoNbzkUnLW3
 8QLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NVSIoQDQUI59AbtDU6wtNrL9Ak0Km4aJoVNG1T5jUh0=;
 b=akvvRFJzYvbWH6fuysXKS8hGrBHM6e07CYVXSKNWCNWn9OjXj8BBf+3r5f2j1Ho9bA
 xwjYseLIvObnt7fBElQ/XnQeqM2npeFxug87mG6+8bTft1xOSjrHwaVzff7Y5PhjEa80
 bVS6Ph9mQ7TZmuc2dO+uLnAqrz6uB+Bw/u/2yuyGwttlEITK+H9O8By9EuL6gz2b1tKW
 UOiRXP0moa3qhp4CySIanud63N5VtCnNDc4eXTq8xuiH9fqeKm1MTGzwdDxHqcdlBhMV
 Z6j8WsiNHEWUUM2iCEU6Qf7Eoz0WziuUK+iyQbT+7PEsZjVXeY8yfAAzZJ9/ykBLvHCT
 zJmA==
X-Gm-Message-State: APjAAAVY7GzbFg5nRbhBTpszQ8D/tj+9QXRODx8ACxfzugdU2z1D1+u5
 6adQDz9RnJ40izZPfQFuaXoiPg==
X-Google-Smtp-Source: APXvYqyu96zGmIOApLPbpBTQ4/4iKEhq0gFuIrKTMrwi5bDmwbLqVtd0bhV3sBSTgavLKkMt5rsUdA==
X-Received: by 2002:a7b:cf21:: with SMTP id m1mr3247605wmg.150.1565254525438; 
 Thu, 08 Aug 2019 01:55:25 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id i66sm3380649wmi.11.2019.08.08.01.55.24
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 08 Aug 2019 01:55:24 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: robh+dt@kernel.org
Subject: [PATCH v3 1/3] dt-bindings: display: amlogic,
 meson-dw-hdmi: convert to yaml
Date: Thu,  8 Aug 2019 10:55:20 +0200
Message-Id: <20190808085522.21950-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190808085522.21950-1-narmstrong@baylibre.com>
References: <20190808085522.21950-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190808_015527_521330_303F252A 
X-CRM114-Status: GOOD (  18.37  )
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
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Now that we have the DT validation in place, let's convert the device tree
bindings for the Amlogic Synopsys DW-HDMI specifics over to YAML schemas.

The original example and usage of clock-names uses a reversed "isfr"
and "iahb" clock-names, the rewritten YAML bindings uses the reversed
instead of fixing the device trees order.

The #sound-dai-cells optional property has been added to match this node
as a sound dai.

The port connection table has been dropped in favor of a description
of each port.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../display/amlogic,meson-dw-hdmi.txt         | 119 --------------
 .../display/amlogic,meson-dw-hdmi.yaml        | 150 ++++++++++++++++++
 2 files changed, 150 insertions(+), 119 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.txt
 create mode 100644 Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml

diff --git a/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.txt b/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.txt
deleted file mode 100644
index 3a50a7862cf3..000000000000
--- a/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.txt
+++ /dev/null
@@ -1,119 +0,0 @@
-Amlogic specific extensions to the Synopsys Designware HDMI Controller
-======================================================================
-
-The Amlogic Meson Synopsys Designware Integration is composed of :
-- A Synopsys DesignWare HDMI Controller IP
-- A TOP control block controlling the Clocks and PHY
-- A custom HDMI PHY in order to convert video to TMDS signal
- ___________________________________
-|            HDMI TOP               |<= HPD
-|___________________________________|
-|                  |                |
-|  Synopsys HDMI   |   HDMI PHY     |=> TMDS
-|    Controller    |________________|
-|___________________________________|<=> DDC
-
-The HDMI TOP block only supports HPD sensing.
-The Synopsys HDMI Controller interrupt is routed through the
-TOP Block interrupt.
-Communication to the TOP Block and the Synopsys HDMI Controller is done
-via a pair of dedicated addr+read/write registers.
-The HDMI PHY is configured by registers in the HHI register block.
-
-Pixel data arrives in 4:4:4 format from the VENC block and the VPU HDMI mux
-selects either the ENCI encoder for the 576i or 480i formats or the ENCP
-encoder for all the other formats including interlaced HD formats.
-
-The VENC uses a DVI encoder on top of the ENCI or ENCP encoders to generate
-DVI timings for the HDMI controller.
-
-Amlogic Meson GXBB, GXL and GXM SoCs families embeds the Synopsys DesignWare
-HDMI TX IP version 2.01a with HDCP and I2C & S/PDIF
-audio source interfaces.
-
-Required properties:
-- compatible: value should be different for each SoC family as :
-	- GXBB (S905) : "amlogic,meson-gxbb-dw-hdmi"
-	- GXL (S905X, S905D) : "amlogic,meson-gxl-dw-hdmi"
-	- GXM (S912) : "amlogic,meson-gxm-dw-hdmi"
-	followed by the common "amlogic,meson-gx-dw-hdmi"
-	- G12A (S905X2, S905Y2, S905D2) : "amlogic,meson-g12a-dw-hdmi"
-- reg: Physical base address and length of the controller's registers.
-- interrupts: The HDMI interrupt number
-- clocks, clock-names : must have the phandles to the HDMI iahb and isfr clocks,
-  and the Amlogic Meson venci clocks as described in
-  Documentation/devicetree/bindings/clock/clock-bindings.txt,
-  the clocks are soc specific, the clock-names should be "iahb", "isfr", "venci"
-- resets, resets-names: must have the phandles to the HDMI apb, glue and phy
-  resets as described in :
-  Documentation/devicetree/bindings/reset/reset.txt,
-  the reset-names should be "hdmitx_apb", "hdmitx", "hdmitx_phy"
-
-Optional properties:
-- hdmi-supply: Optional phandle to an external 5V regulator to power the HDMI
-  logic, as described in the file ../regulator/regulator.txt
-
-Required nodes:
-
-The connections to the HDMI ports are modeled using the OF graph
-bindings specified in Documentation/devicetree/bindings/graph.txt.
-
-The following table lists for each supported model the port number
-corresponding to each HDMI output and input.
-
-		Port 0		Port 1
------------------------------------------
- S905 (GXBB)	VENC Input	TMDS Output
- S905X (GXL)	VENC Input	TMDS Output
- S905D (GXL)	VENC Input	TMDS Output
- S912 (GXM)	VENC Input	TMDS Output
- S905X2 (G12A)	VENC Input	TMDS Output
- S905Y2 (G12A)	VENC Input	TMDS Output
- S905D2 (G12A)	VENC Input	TMDS Output
-
-Example:
-
-hdmi-connector {
-	compatible = "hdmi-connector";
-	type = "a";
-
-	port {
-		hdmi_connector_in: endpoint {
-			remote-endpoint = <&hdmi_tx_tmds_out>;
-		};
-	};
-};
-
-hdmi_tx: hdmi-tx@c883a000 {
-	compatible = "amlogic,meson-gxbb-dw-hdmi", "amlogic,meson-gx-dw-hdmi";
-	reg = <0x0 0xc883a000 0x0 0x1c>;
-	interrupts = <GIC_SPI 57 IRQ_TYPE_EDGE_RISING>;
-	resets = <&reset RESET_HDMITX_CAPB3>,
-		 <&reset RESET_HDMI_SYSTEM_RESET>,
-		 <&reset RESET_HDMI_TX>;
-	reset-names = "hdmitx_apb", "hdmitx", "hdmitx_phy";
-	clocks = <&clkc CLKID_HDMI_PCLK>,
-		 <&clkc CLKID_CLK81>,
-		 <&clkc CLKID_GCLK_VENCI_INT0>;
-	clock-names = "isfr", "iahb", "venci";
-	#address-cells = <1>;
-	#size-cells = <0>;
-
-	/* VPU VENC Input */
-	hdmi_tx_venc_port: port@0 {
-		reg = <0>;
-
-		hdmi_tx_in: endpoint {
-			remote-endpoint = <&hdmi_tx_out>;
-		};
-	};
-
-	/* TMDS Output */
-	hdmi_tx_tmds_port: port@1 {
-		reg = <1>;
-
-		hdmi_tx_tmds_out: endpoint {
-			remote-endpoint = <&hdmi_connector_in>;
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml b/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
new file mode 100644
index 000000000000..fb747682006d
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
@@ -0,0 +1,150 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2019 BayLibre, SAS
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/display/amlogic,meson-dw-hdmi.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Amlogic specific extensions to the Synopsys Designware HDMI Controller
+
+maintainers:
+  - Neil Armstrong <narmstrong@baylibre.com>
+
+description: |
+  The Amlogic Meson Synopsys Designware Integration is composed of
+  - A Synopsys DesignWare HDMI Controller IP
+  - A TOP control block controlling the Clocks and PHY
+  - A custom HDMI PHY in order to convert video to TMDS signal
+   ___________________________________
+  |            HDMI TOP               |<= HPD
+  |___________________________________|
+  |                  |                |
+  |  Synopsys HDMI   |   HDMI PHY     |=> TMDS
+  |    Controller    |________________|
+  |___________________________________|<=> DDC
+
+  The HDMI TOP block only supports HPD sensing.
+  The Synopsys HDMI Controller interrupt is routed through the
+  TOP Block interrupt.
+  Communication to the TOP Block and the Synopsys HDMI Controller is done
+  via a pair of dedicated addr+read/write registers.
+  The HDMI PHY is configured by registers in the HHI register block.
+
+  Pixel data arrives in "4:4:4" format from the VENC block and the VPU HDMI mux
+  selects either the ENCI encoder for the 576i or 480i formats or the ENCP
+  encoder for all the other formats including interlaced HD formats.
+
+  The VENC uses a DVI encoder on top of the ENCI or ENCP encoders to generate
+  DVI timings for the HDMI controller.
+
+  Amlogic Meson GXBB, GXL and GXM SoCs families embeds the Synopsys DesignWare
+  HDMI TX IP version 2.01a with HDCP and I2C & S/PDIF
+  audio source interfaces.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - amlogic,meson-gxbb-dw-hdmi # GXBB (S905)
+              - amlogic,meson-gxl-dw-hdmi # GXL (S905X, S905D)
+              - amlogic,meson-gxm-dw-hdmi # GXM (S912)
+          - const: amlogic,meson-gx-dw-hdmi
+      - enum:
+          - amlogic,meson-g12a-dw-hdmi # G12A (S905X2, S905Y2, S905D2)
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 3
+
+  clock-names:
+    items:
+      - const: isfr
+      - const: iahb
+      - const: venci
+
+  resets:
+    minItems: 3
+
+  reset-names:
+    items:
+      - const: hdmitx_apb
+      - const: hdmitx
+      - const: hdmitx_phy
+
+  hdmi-supply:
+    description: phandle to an external 5V regulator to power the HDMI logic
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/phandle
+
+  port@0:
+    type: object
+    description:
+      A port node pointing to the VENC Input port node.
+
+  port@1:
+    type: object
+    description:
+      A port node pointing to the TMDS Output port node.
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  "#sound-dai-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - port@0
+  - port@1
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    hdmi_tx: hdmi-tx@c883a000 {
+        compatible = "amlogic,meson-gxbb-dw-hdmi", "amlogic,meson-gx-dw-hdmi";
+        reg = <0xc883a000 0x1c>;
+        interrupts = <57>;
+        resets = <&reset_apb>, <&reset_hdmitx>, <&reset_hdmitx_phy>;
+        reset-names = "hdmitx_apb", "hdmitx", "hdmitx_phy";
+        clocks = <&clk_isfr>, <&clk_iahb>, <&clk_venci>;
+        clock-names = "isfr", "iahb", "venci";
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        /* VPU VENC Input */
+        hdmi_tx_venc_port: port@0 {
+            reg = <0>;
+
+            hdmi_tx_in: endpoint {
+                remote-endpoint = <&hdmi_tx_out>;
+            };
+        };
+
+        /* TMDS Output */
+        hdmi_tx_tmds_port: port@1 {
+             reg = <1>;
+
+             hdmi_tx_tmds_out: endpoint {
+                 remote-endpoint = <&hdmi_connector_in>;
+             };
+        };
+    };
+
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
