Return-Path: <SRS0=TmCu=WC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AC0DC31E40
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Aug 2019 12:44:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A23E20B1F
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Aug 2019 12:44:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HTr1ULy8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="J8QHtTBc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A23E20B1F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nXqSRyIq6Y3A/Jg8nhx3VdtBI/BH8mm8udIiW2bxsQs=; b=HTr1ULy88Jsw8l
	JvZYC0e9z0hOZL8ilmXyxB6S0r4ehcsA09NWgHGnJKgqtQmfsOGlEvAG3Y+P8S7cgM8WuwxmWqJ/G
	kEWSLkqOuhC5Wo5LWiDAhWokH94sRGLEwvEhCw1HMaGtHvEEnc9T9DHqGPc6IhENwl8F8EkjlD/lS
	AMC/ttjZ1JOowHiPU7sHnqXmgA4y5L2kbqC0BtLeqY7Z2BVSuWlgm4QvUXCaCAesnxf/b8aLlDnRR
	rdRPfQ4jZTuvIvg6tk/WdT0KTCjag9ySZfS7tY4JxicAkjya2HV0aBooYPSf0hifSJ05axSvBiz9+
	e8MJyRx19cX60EeW0Pjw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1huypN-0006Nx-QT; Tue, 06 Aug 2019 12:44:33 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1huypC-0006Do-QG
 for linux-amlogic@lists.infradead.org; Tue, 06 Aug 2019 12:44:26 +0000
Received: by mail-wm1-x344.google.com with SMTP id g67so72218759wme.1
 for <linux-amlogic@lists.infradead.org>; Tue, 06 Aug 2019 05:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2lVMWHx5qAevL1/U6+YnagBJZPJOzF3+ruF+O3h641A=;
 b=J8QHtTBcjHJliMwi++UTONXnx7sAEPSRrnfN5m2eAcJIns1AWrBm+/7aStQt0BBYZo
 11jo9qA+awMsAkdaHs/1vLETxDhJWGFCxrNQb91BNy9K+VKW3F6oJCYteE4RykNMrsEV
 EjnLjvx/loWBHxJ/JsrtdGKNcPbJh2Q1DLU89lqi2NHDA0feXKuFIXuTAKIicoEWvv0a
 GzyBbdChTc0H1ehS+oOZyIS5N9/g+x/fOcWYjFrAnOK31UvFLnrcLLt/XJpvjkqCF2L1
 oMUX47ExVvHsgxkzkgwunPbj1wvLsHq1zHk3eJ6pkOA2/6n2aOhrXkoR53v4nJpuKwC9
 ZmRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2lVMWHx5qAevL1/U6+YnagBJZPJOzF3+ruF+O3h641A=;
 b=jgiccKywQU2/SeEHN4kwJ+G9ysZGeUPaQORznNuZIAJhVX3dPyftzUrtrw+O/VrtdI
 CI71p4Zpr/fMWCEdzJVrPsx378LYVVln/AeIl6lWSRJQlGEw837inPvaYk5QERMuTcky
 VYkIUuUVYld3gMpueWaE+L98ossmP/Z3PPeKG2vKVZBihgboCvgeOYrJsvgmyWF+gVHb
 fPtZMbjjoO2qFnHvJCpFg4V4/HtZ266mRSLQrAPYMHO1c+2lbA8qvMqRnQuOVUyYJ25x
 aDfZ+aaJ1ZGr5jinmhb1vuQ4WQYenvnVdLEzMjByXNLiggGfEKB1RX/erRZDP+RvbdU4
 hDZA==
X-Gm-Message-State: APjAAAXAFGUl9cu/r/N8Mv01jVBhB4UA8CsiAdGvTMoAyobGlEhUfO9Q
 Rw9uihvqjcLVLAAI2xgo42Hv4A==
X-Google-Smtp-Source: APXvYqztmAxv0y8ZkMBX3eyTvSF9JmpiqrOoAwXRiGTmzB1NdBPeAwWghGV1GNc/fuAjMsi5B7nL8w==
X-Received: by 2002:a1c:968c:: with SMTP id y134mr4712041wmd.75.1565095459981; 
 Tue, 06 Aug 2019 05:44:19 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id q20sm3842135wrc.79.2019.08.06.05.44.19
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 05:44:19 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: robh+dt@kernel.org
Subject: [PATCH v2 2/3] dt-bindings: display: amlogic,
 meson-vpu: convert to yaml
Date: Tue,  6 Aug 2019 14:44:15 +0200
Message-Id: <20190806124416.15561-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190806124416.15561-1-narmstrong@baylibre.com>
References: <20190806124416.15561-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190806_054423_001521_22627503 
X-CRM114-Status: GOOD (  19.63  )
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

The port connection table has been dropped in favor of a description
of each port.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../bindings/display/amlogic,meson-vpu.txt    | 121 ---------------
 .../bindings/display/amlogic,meson-vpu.yaml   | 138 ++++++++++++++++++
 2 files changed, 138 insertions(+), 121 deletions(-)
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
index 000000000000..71f572f6cb3b
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml
@@ -0,0 +1,138 @@
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
+      A port node pointing to the CVBS VDAC port node.
+
+  port@1:
+    type: object
+    description:
+      A port node pointing to the HDMI-TX port node.
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
