Return-Path: <SRS0=t7Bi=WE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEE31C0650F
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Aug 2019 08:56:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF6742173E
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Aug 2019 08:56:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MulnTcJW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="A+kkErXG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF6742173E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6I8X1pfBWqe3xx89MrgFCnyJ4iPQhON7Zsod+Di3ZjE=; b=MulnTcJW6/iT3T
	zGlzzRNeVPVfdSd085PE1aqvttetX0nOIYjRwri3pOTgSYMgoekVrxzEBx0v4op6nKNbVNPGf8FyW
	/IMMlsVXXDZVcLr9gafMoz9IRaSUgBZ1DKGHwu4wKOwNQ1cqFc7DW61hNe5G6A+yGsZKsqwGzu9FL
	669JLqHsfBnUYDMXGULUFxWEDa2x/76wsIC7LlIz7gP1h6tucG5lOwYVVWjdtjgzG6DIbFzRGjPVk
	pExbHAJ3VPqwwl9ndTp4yshycMyVdfQc6gWu/IWNwOKgJXRGCC4DZYKidHoC3/8RPqoN2scx0BMrt
	rLv3WebYAfGqthBADIIw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hveDC-0005Ga-OD; Thu, 08 Aug 2019 08:55:54 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hveCl-0004rk-NZ
 for linux-amlogic@lists.infradead.org; Thu, 08 Aug 2019 08:55:30 +0000
Received: by mail-wm1-x343.google.com with SMTP id s3so1578444wms.2
 for <linux-amlogic@lists.infradead.org>; Thu, 08 Aug 2019 01:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VV1jWbnzW24I6En/1U+UxSEaYb+5WNXCQ6+O1asOzXc=;
 b=A+kkErXG9cblz1KQT7bOfGdXXPZpbhLN7+zHiLtOukxnrKxqppGa4N6RvWHp6PTIu1
 jemiZzl0fGPAsDH019ieXu6KLP6g/27nLz4RghapqKC71qc+9qnC5mJDx9payvpZnLC7
 UzFwkR205mCMFy5YmlX5aAbwpvxIoHt/796mX0wvLN35SSAJfMHmbn8FsBwej1es9R1M
 U5Qwf/frDsxebbz99qef5jedk81sP1hA6ARClT8O0jr4ljaLlZIaC3abp1hK8kJfrai4
 Ne4bl1ec6QOKOJRtYqlEl0br/4xh9HWdVGB/1RciFUG9o9wvVLCYixpTvyG8HNgfjcFZ
 jsKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VV1jWbnzW24I6En/1U+UxSEaYb+5WNXCQ6+O1asOzXc=;
 b=L6GJbMYANlHezrE8ESjOaq/JvNlnDUWOHw84e1gtAybE5iRx0CeL155OXUV2B3z0KH
 QLTuv/gM0emc2jxOli9k8crWtbV0Eosl126HEKRJNUop4tBUUFLHh4xNM/iwbg9MqC8J
 g+FO2okHmXjm/XAfrxRt1/Mc95zoMzrVYi17W3uQLseuz4+61lJWDBQouwKQ3F79g7om
 FQw0jUYZiVguElSPMyrULXBLkKH/gHwF0t/iWat0CwA9o/mgsusHRhLA8QrBIPEO+2HG
 DtJEVrcVU2ZKKxrHGfep0i6MVxB89dl5W9u8L783X/8SKOda6o6+ehdNUQkNVlaByw7u
 7acQ==
X-Gm-Message-State: APjAAAUCdmXzrCtEYpgRoE+cWAPyhtrZxMlT8kPGzLasDyDagY03z6jl
 O9eCNa6DUFDUIXMsr9jflvN+xoncYcxhEw==
X-Google-Smtp-Source: APXvYqwr6L+PSTMxIlBYXtBh9xC8GM7/6hoDrQlqGbesfxXSXTWwOEJgPTASwN27Sbt4y1RhmGl8Bg==
X-Received: by 2002:a1c:2582:: with SMTP id l124mr3237931wml.153.1565254526128; 
 Thu, 08 Aug 2019 01:55:26 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id i66sm3380649wmi.11.2019.08.08.01.55.25
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 08 Aug 2019 01:55:25 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: robh+dt@kernel.org
Subject: [PATCH v3 2/3] dt-bindings: display: amlogic,
 meson-vpu: convert to yaml
Date: Thu,  8 Aug 2019 10:55:21 +0200
Message-Id: <20190808085522.21950-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190808085522.21950-1-narmstrong@baylibre.com>
References: <20190808085522.21950-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190808_015528_008319_6C75D501 
X-CRM114-Status: GOOD (  19.61  )
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
 .../bindings/display/amlogic,meson-vpu.txt    | 121 ----------------
 .../bindings/display/amlogic,meson-vpu.yaml   | 137 ++++++++++++++++++
 2 files changed, 137 insertions(+), 121 deletions(-)
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
index 000000000000..d1205a6697a0
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml
@@ -0,0 +1,137 @@
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
+    maxItems: 1
+    description: phandle to the associated power domain
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
