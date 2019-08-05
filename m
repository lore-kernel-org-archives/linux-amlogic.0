Return-Path: <SRS0=EYbA=WB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B75A4C32754
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Aug 2019 13:43:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86AC6216B7
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Aug 2019 13:43:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hu+xZHQz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="X3H61EeZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86AC6216B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9UUjJucWW4xOkBVv0YYavWKtUUIKQ3HJGH70uvCZmx4=; b=hu+xZHQzmCOLvF
	cL1EcAROScrFIELi2Xr2t1YJarxIq9cVaZ/3boDD26wqusH2uW/e4iH9MrRZMCHgLilFzKUkfPWGs
	eFNrQK1nnvt0042R2mir1CiimEyoan1m0OvTgdu5GNDIPHBrBaL7LDpb5cA5Q/4zcq+HNX9E4LqLQ
	y65Jj2Alvhn9fxEKXqeBoquM6CHyiIWYlOXQ+lW9m4wkTLggCh9Qt8hfR8iziihdQevl664GzXMU3
	m2Ilz5f14HCDCjuf4ItdeXXncdUrkpCtdWy4EpUXvqytTngF+gAMLx5V7QNFXoQqH8lsSioZJ1bOe
	ICbZcnk31vcfh/u/6iTA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hudH2-00022R-A6; Mon, 05 Aug 2019 13:43:40 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hudGr-0001rC-9G
 for linux-amlogic@lists.infradead.org; Mon, 05 Aug 2019 13:43:31 +0000
Received: by mail-wm1-x332.google.com with SMTP id a15so74802902wmj.5
 for <linux-amlogic@lists.infradead.org>; Mon, 05 Aug 2019 06:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OSCPlItGEWlq/zWaaPl8f0Fie9eqPLNoGRX2TzT9EMY=;
 b=X3H61EeZrljiaUxoLdMw12cIOTkV8lI/9vaygAaH7Fq5Rq7JlnCofF+OO4M6oHiGys
 xUXvgtEpcg/Gb+LLpMPoH/crXkte0HWInf4rK/Qop1u2ySgmfzVaLfzw1awwPyh2OpIh
 86X07war7icn8rCOmNe+1ihB21fSv+x8oWbvEyIm7Vz1FtH7Rwz+tOYong1gpmCatUZ6
 57mQR9dWRyuEJaJgqIEAtJQmG49BJL9IKoqPxzySlwRQkoS1fs25OgN6VhV+bS2pn/ge
 CDv9qFiLbMr8MVqUuAcyGAHAWzFSMXLcO7OKjM+tYDH8xuJmtRaLMXu0zkq1Gg1BnMM1
 GOqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OSCPlItGEWlq/zWaaPl8f0Fie9eqPLNoGRX2TzT9EMY=;
 b=UKqo+GoGBoy5rgY4kvs+fZjdzfGK7oOb6KlJzOgR9d+LZvIs3z6GeoPIDmgK5JVyp5
 dQpJuS829rdj8VZOQbbN9NfqpsKaldK/ttMTVgnccTTrn1b4/7sMnEzplt7OoWiQ1AaZ
 0WvpLjEvi18coQZa92bmQ9TUYoK0ym+EA4Lzicyu0uVnUDf27MN++DFJwqGH9bS0f+2f
 hOvNRYGWlhmV3oTV6DqeWlsX1BpnyDr15dxGyeOGhpIJXMkGVAv2PQGkm+O8dC7O9z90
 TJYTVySXpmmTxOOBD8KfmTb9Op1mgY5TU9IjQOFwcgxId5gvx723vlfNL2WpT9tGS2SM
 65jQ==
X-Gm-Message-State: APjAAAU046jSPFMtU7207dyjnOIHR+t+kgNGQrnn7TD8iXIVlfnvMlvD
 nzd5Awq2G/5jrj6E/kRuiNRqmA==
X-Google-Smtp-Source: APXvYqzf3IvUysp9SHEIyOI9Ravq473uhNgKOkJg6XjWyMPccF9z8PlWHurczH7dyYV43r/AweDWmw==
X-Received: by 2002:a1c:a909:: with SMTP id s9mr18760125wme.20.1565012607356; 
 Mon, 05 Aug 2019 06:43:27 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id t3sm67835842wmi.6.2019.08.05.06.43.26
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 05 Aug 2019 06:43:26 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: robh+dt@kernel.org
Subject: [PATCH 2/3] dt-bindings: display: amlogic,meson-vpu: convert to yaml
Date: Mon,  5 Aug 2019 15:43:18 +0200
Message-Id: <20190805134319.737-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190805134319.737-1-narmstrong@baylibre.com>
References: <20190805134319.737-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190805_064329_420896_2BED393D 
X-CRM114-Status: GOOD (  19.68  )
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
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Now that we have the DT validation in place, let's convert the device tree
bindings for the Amlogic Display Controller over to YAML schemas.

The original example has a leftover "dmc" memory cell, that has been
removed in the yaml rewrite.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../bindings/display/amlogic,meson-vpu.txt    | 121 --------------
 .../bindings/display/amlogic,meson-vpu.yaml   | 153 ++++++++++++++++++
 2 files changed, 153 insertions(+), 121 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/amlogic,meson-vpu.txt
 create mode 100644 Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml

diff --git a/Documentation/devicetree/bindings/display/amlogic,meson-vpu.txt b/Documentation/devicetree/bindings/display/amlogic,meson-vpu.txt
deleted file mode 100644
index be40a780501c..000000000000
--- a/Documentation/devicetree/bindings/display/amlogic,meson-vpu.txt
+++ /dev/null
@@ -1,121 +0,0 @@
-Amlogic Meson Display Controller
-================================
-
-The Amlogic Meson Display controller is composed of several components
-that are going to be documented below:
-
-DMC|---------------VPU (Video Processing Unit)----------------|------HHI------|
-   | vd1   _______     _____________    _________________     |               |
-D  |-------|      |----|            |   |                |    |   HDMI PLL    |
-D  | vd2   | VIU  |    | Video Post |   | Video Encoders |<---|-----VCLK      |
-R  |-------|      |----| Processing |   |                |    |               |
-   | osd2  |      |    |            |---| Enci ----------|----|-----VDAC------|
-R  |-------| CSC  |----| Scalers    |   | Encp ----------|----|----HDMI-TX----|
-A  | osd1  |      |    | Blenders   |   | Encl ----------|----|---------------|
-M  |-------|______|----|____________|   |________________|    |               |
-___|__________________________________________________________|_______________|
-
-
-VIU: Video Input Unit
----------------------
-
-The Video Input Unit is in charge of the pixel scanout from the DDR memory.
-It fetches the frames addresses, stride and parameters from the "Canvas" memory.
-This part is also in charge of the CSC (Colorspace Conversion).
-It can handle 2 OSD Planes and 2 Video Planes.
-
-VPP: Video Post Processing
---------------------------
-
-The Video Post Processing is in charge of the scaling and blending of the
-various planes into a single pixel stream.
-There is a special "pre-blending" used by the video planes with a dedicated
-scaler and a "post-blending" to merge with the OSD Planes.
-The OSD planes also have a dedicated scaler for one of the OSD.
-
-VENC: Video Encoders
---------------------
-
-The VENC is composed of the multiple pixel encoders :
- - ENCI : Interlace Video encoder for CVBS and Interlace HDMI
- - ENCP : Progressive Video Encoder for HDMI
- - ENCL : LCD LVDS Encoder
-The VENC Unit gets a Pixel Clocks (VCLK) from a dedicated HDMI PLL and clock
-tree and provides the scanout clock to the VPP and VIU.
-The ENCI is connected to a single VDAC for Composite Output.
-The ENCI and ENCP are connected to an on-chip HDMI Transceiver.
-
-Device Tree Bindings:
----------------------
-
-VPU: Video Processing Unit
---------------------------
-
-Required properties:
-- compatible: value should be different for each SoC family as :
-	- GXBB (S905) : "amlogic,meson-gxbb-vpu"
-	- GXL (S905X, S905D) : "amlogic,meson-gxl-vpu"
-	- GXM (S912) : "amlogic,meson-gxm-vpu"
-	followed by the common "amlogic,meson-gx-vpu"
-	- G12A (S905X2, S905Y2, S905D2) : "amlogic,meson-g12a-vpu"
-- reg: base address and size of he following memory-mapped regions :
-	- vpu
-	- hhi
-- reg-names: should contain the names of the previous memory regions
-- interrupts: should contain the VENC Vsync interrupt number
-- amlogic,canvas: phandle to canvas provider node as described in the file
-	../soc/amlogic/amlogic,canvas.txt
-
-Optional properties:
-- power-domains: Optional phandle to associated power domain as described in
-	the file ../power/power_domain.txt
-
-Required nodes:
-
-The connections to the VPU output video ports are modeled using the OF graph
-bindings specified in Documentation/devicetree/bindings/graph.txt.
-
-The following table lists for each supported model the port number
-corresponding to each VPU output.
-
-		Port 0		Port 1
------------------------------------------
- S905 (GXBB)	CVBS VDAC	HDMI-TX
- S905X (GXL)	CVBS VDAC	HDMI-TX
- S905D (GXL)	CVBS VDAC	HDMI-TX
- S912 (GXM)	CVBS VDAC	HDMI-TX
- S905X2 (G12A)	CVBS VDAC	HDMI-TX
- S905Y2 (G12A)	CVBS VDAC	HDMI-TX
- S905D2 (G12A)	CVBS VDAC	HDMI-TX
-
-Example:
-
-tv-connector {
-	compatible = "composite-video-connector";
-
-	port {
-		tv_connector_in: endpoint {
-			remote-endpoint = <&cvbs_vdac_out>;
-		};
-	};
-};
-
-vpu: vpu@d0100000 {
-	compatible = "amlogic,meson-gxbb-vpu";
-	reg = <0x0 0xd0100000 0x0 0x100000>,
-	      <0x0 0xc883c000 0x0 0x1000>,
-	      <0x0 0xc8838000 0x0 0x1000>;
-	reg-names = "vpu", "hhi", "dmc";
-	interrupts = <GIC_SPI 3 IRQ_TYPE_EDGE_RISING>;
-	#address-cells = <1>;
-	#size-cells = <0>;
-
-	/* CVBS VDAC output port */
-	port@0 {
-		reg = <0>;
-
-		cvbs_vdac_out: endpoint {
-			remote-endpoint = <&tv_connector_in>;
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml b/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml
new file mode 100644
index 000000000000..9eba13031998
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml
@@ -0,0 +1,153 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2019 BayLibre, SAS
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/display/amlogic,meson-vpu.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Amlogic Meson Display Controller
+
+maintainers:
+  - Neil Armstrong <narmstrong@baylibre.com>
+
+description: |
+  The Amlogic Meson Display controller is composed of several components
+  that are going to be documented below
+
+  DMC|---------------VPU (Video Processing Unit)----------------|------HHI------|
+     | vd1   _______     _____________    _________________     |               |
+  D  |-------|      |----|            |   |                |    |   HDMI PLL    |
+  D  | vd2   | VIU  |    | Video Post |   | Video Encoders |<---|-----VCLK      |
+  R  |-------|      |----| Processing |   |                |    |               |
+     | osd2  |      |    |            |---| Enci ----------|----|-----VDAC------|
+  R  |-------| CSC  |----| Scalers    |   | Encp ----------|----|----HDMI-TX----|
+  A  | osd1  |      |    | Blenders   |   | Encl ----------|----|---------------|
+  M  |-------|______|----|____________|   |________________|    |               |
+  ___|__________________________________________________________|_______________|
+
+
+  VIU: Video Input Unit
+  ---------------------
+
+  The Video Input Unit is in charge of the pixel scanout from the DDR memory.
+  It fetches the frames addresses, stride and parameters from the "Canvas" memory.
+  This part is also in charge of the CSC (Colorspace Conversion).
+  It can handle 2 OSD Planes and 2 Video Planes.
+
+  VPP: Video Post Processing
+  --------------------------
+
+  The Video Post Processing is in charge of the scaling and blending of the
+  various planes into a single pixel stream.
+  There is a special "pre-blending" used by the video planes with a dedicated
+  scaler and a "post-blending" to merge with the OSD Planes.
+  The OSD planes also have a dedicated scaler for one of the OSD.
+
+  VENC: Video Encoders
+  --------------------
+
+  The VENC is composed of the multiple pixel encoders
+   - ENCI : Interlace Video encoder for CVBS and Interlace HDMI
+   - ENCP : Progressive Video Encoder for HDMI
+   - ENCL : LCD LVDS Encoder
+  The VENC Unit gets a Pixel Clocks (VCLK) from a dedicated HDMI PLL and clock
+  tree and provides the scanout clock to the VPP and VIU.
+  The ENCI is connected to a single VDAC for Composite Output.
+  The ENCI and ENCP are connected to an on-chip HDMI Transceiver.
+
+  The following table lists for each supported model the port number
+  corresponding to each VPU output.
+
+                  Port 0       Port 1
+  -----------------------------------------
+   S905 (GXBB)	  CVBS VDAC	   HDMI-TX
+   S905X (GXL)	  CVBS VDAC	   HDMI-TX
+   S905D (GXL)	  CVBS VDAC	   HDMI-TX
+   S912 (GXM)	    CVBS VDAC	   HDMI-TX
+   S905X2 (G12A)	CVBS VDAC	   HDMI-TX
+   S905Y2 (G12A)	CVBS VDAC	   HDMI-TX
+   S905D2 (G12A)	CVBS VDAC	   HDMI-TX
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - amlogic,meson-gxbb-vpu # GXBB (S905)
+              - amlogic,meson-gxl-vpu # GXL (S905X, S905D)
+              - amlogic,meson-gxm-vpu # GXM (S912)
+          - const: amlogic,meson-gx-vpu
+      - enum:
+          - amlogic,meson-g12a-vpu # G12A (S905X2, S905Y2, S905D2)
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+   items:
+     - const: vpu
+     - const: hhi
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    description: phandle to the associated power domain
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/phandle
+
+  port@0:
+    type: object
+    description:
+      A port node modeled using the OF graph
+      bindings specified in Documentation/devicetree/bindings/graph.txt.
+
+  port@1:
+    type: object
+    description:
+      A port node modeled using the OF graph
+      bindings specified in Documentation/devicetree/bindings/graph.txt.
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - port@0
+  - port@1
+  - "#address-cells"
+  - "#size-cells"
+
+examples:
+  - |
+    vpu: vpu@d0100000 {
+        compatible = "amlogic,meson-gxbb-vpu", "amlogic,meson-gx-vpu";
+        reg = <0xd0100000 0x100000>, <0xc883c000 0x1000>;
+        reg-names = "vpu", "hhi";
+        interrupts = <3>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        /* CVBS VDAC output port */
+        port@0 {
+            reg = <0>;
+
+            cvbs_vdac_out: endpoint {
+                remote-endpoint = <&tv_connector_in>;
+            };
+        };
+
+        /* HDMI TX output port */
+        port@1 {
+            reg = <1>;
+
+            hdmi_tx_out: endpoint {
+                remote-endpoint = <&hdmi_tx_in>;
+            };
+        };
+    };
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
