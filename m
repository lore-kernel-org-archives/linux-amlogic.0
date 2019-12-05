Return-Path: <SRS0=R0qk=Z3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7D9AC43603
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Dec 2019 15:35:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B53C821823
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Dec 2019 15:35:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lvyZwLVA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="kK5tYBPe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B53C821823
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JqzmtKlyxpFTvtn5vglTPb2oHaARiPP3mES5RpbbtK8=; b=lvyZwLVAwsOBWr
	vQynvmjzzJv8vu2M8rkdZa1kjfteJRzuoa5w17JlYrVCa63dxRbJP10kerVEp224o2GFElAvVFLWJ
	X3NH/7U9iogCfV8+uEu+GXHIFYCw7ym3MzZXQZZeNKSDkRk2ipSChOTONBCaY0bJwIHBarTdYNhKL
	hPDi6VHV9ngUVtnO6bQ3h6ppllWI2Bq0CU4TwgmCrtc95t6P0KIVDuyY1k04FbyweBaZ/cBash6KK
	hVsseXV/qJhau4sM3NOx15qtt8oPwbq8VC0klee8eL7Tn5x1yVgbTUSZIbUDhs+kqu7b+6O/Rwh6z
	NuNv/JcFBKvqGkqCd0cQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ict9s-0005Rf-U0; Thu, 05 Dec 2019 15:35:12 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ict8y-0003Sn-7P
 for linux-amlogic@lists.infradead.org; Thu, 05 Dec 2019 15:34:19 +0000
Received: by mail-wm1-x341.google.com with SMTP id n9so3824233wmd.3
 for <linux-amlogic@lists.infradead.org>; Thu, 05 Dec 2019 07:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9UAzxsWf4W83oyvFQkH2hZ4vYVx6AktY/uiCE2SmLc4=;
 b=kK5tYBPengXlEp3cXfE31aL8ioJ/Jeb3OtQZRhtxXwubJE9Nd2KtnBcbF/Zk2nmSgN
 nCFQhFu+ptx1ASM6Tncq2RZ0Wf7Li76CdM3/4Aw1dQNwP3w/XBai54MKJfKTN04mor1y
 BoUpLTZFh/stv9NxxbEVM8zVadVW4sM1hMQ4JytGPWU6L1blZFORKQtY+ghZzFH/DzJd
 EDHZjbwYYiH/QSuFJyZky3Sc4YcMTPqR7a6hmUk1tY3jiIm1e0zerfmNPGhD4qAUtbtG
 RxPMxZEIUm/rkkYxZc1eESPgRziIPE3/BuKYCDROguRrpEd/o5+/ZCqqXp8dsFEtaGz+
 Cv0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9UAzxsWf4W83oyvFQkH2hZ4vYVx6AktY/uiCE2SmLc4=;
 b=EnLVjFwYYpUA2WC7UKH3JsJl9/EDIPrSutyf45XNpBLq8DvPdF7NDZ0ef6sCb1UK9n
 sX6AGrQYtl1mu2bLYIyhhSZY4/rEAdYiGnnVlEBNGL9/qqwNN+8aGonoD4WJeKiPvUGo
 9ZggwLZqFNBne1vVwHEU8pserlnvVFAwGXNwtFQedmkQAwzJoudLnUJmkLQ1yj8kY8+x
 D7M+/TgO4csCIjS4LpFOK3Z1VgcAa3YABjx/fY285uEL8tyA3aNObpKCt5Phj5vwSnSy
 8lQE9+tNfEzK4PWyGteh8Dg0KLxPl2gsGqg/DIV8FiQ95lXIRnhs0wUCEev2Me9Yh/5k
 l/KA==
X-Gm-Message-State: APjAAAW9BbYSkZ3yxnuDdav1DqsWYOl/SM9DvisL5ywoOlsJ0GnrFQKJ
 wAGgBXUQehX/6ufc3unh/qAB/w==
X-Google-Smtp-Source: APXvYqytDDgpTYAFLUeWNzloXYLz3bfneqtytMmrNgelFHFkE8a3YG2PQkv47tfqpbhGNV2Q/AK2xg==
X-Received: by 2002:a1c:4f:: with SMTP id 76mr3234343wma.69.1575560053556;
 Thu, 05 Dec 2019 07:34:13 -0800 (PST)
Received: from bender.baylibre.local
 (wal59-h01-176-150-251-154.dsl.sta.abo.bbox.fr. [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id u26sm191894wmj.9.2019.12.05.07.34.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2019 07:34:13 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: mjourdan@baylibre.com,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/4] dt-bindings: media: amlogic,vdec: convert to yaml
Date: Thu,  5 Dec 2019 16:34:05 +0100
Message-Id: <20191205153408.26500-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191205153408.26500-1-narmstrong@baylibre.com>
References: <20191205153408.26500-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191205_073416_284638_F2665FAA 
X-CRM114-Status: GOOD (  12.70  )
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
Cc: Rob Herring <robh@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Now that we have the DT validation in place, let's convert the device tree
bindings for the Amlogic Video Controller over to YAML schemas.

This yaml bindings will then be extended to support new SoCs.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/media/amlogic,gx-vdec.yaml       | 107 ++++++++++++++++++
 .../bindings/media/amlogic,vdec.txt           |  72 ------------
 2 files changed, 107 insertions(+), 72 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/amlogic,gx-vdec.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/amlogic,vdec.txt

diff --git a/Documentation/devicetree/bindings/media/amlogic,gx-vdec.yaml b/Documentation/devicetree/bindings/media/amlogic,gx-vdec.yaml
new file mode 100644
index 000000000000..878944867d6e
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/amlogic,gx-vdec.yaml
@@ -0,0 +1,107 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2019 BayLibre, SAS
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/media/amlogic,gx-vdec.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Amlogic Video Decoder
+
+maintainers:
+  - Neil Armstrong <narmstrong@baylibre.com>
+  - Maxime Jourdan <mjourdan@baylibre.com>
+
+description: |
+  The video decoding IP lies within the DOS memory region,
+  except for the hardware bitstream parser that makes use of an undocumented
+  region.
+
+  It makes use of the following blocks:
+  - ESPARSER is a bitstream parser that outputs to a VIFIFO. Further VDEC blocks
+    then feed from this VIFIFO.
+  - VDEC_1 can decode MPEG-1, MPEG-2, MPEG-4 part 2, MJPEG, H.263, H.264, VC-1.
+  - VDEC_HEVC can decode HEVC and VP9.
+
+  Both VDEC_1 and VDEC_HEVC share the "vdec" IRQ and as such cannot run
+  concurrently.
+
+properties:
+  compatible:
+    items:
+      - enum:
+        - amlogic,gxbb-vdec # GXBB (S905)
+        - amlogic,gxl-vdec # GXL (S905X, S905D)
+        - amlogic,gxm-vdec # GXM (S912)
+      - const: amlogic,gx-vdec
+
+  interrupts:
+    minItems: 2
+
+  interrupt-names:
+    items:
+      - const: vdec
+      - const: esparser
+
+  reg:
+    minItems: 2
+
+  reg-names:
+    items:
+      - const: dos
+      - const: esparser
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    items:
+      - const: esparser
+
+  clocks:
+    minItems: 4
+
+  clock-names:
+    items:
+      - const: dos_parser
+      - const: dos
+      - const: vdec_1
+      - const: vdec_hevc
+
+  amlogic,ao-sysctrl:
+    description: should point to the AOBUS sysctrl node
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/phandle
+
+  amlogic,canvas:
+    description: should point to a canvas provider node
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/phandle
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - interrupt-names
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - amlogic,ao-sysctrl
+  - amlogic,canvas
+
+examples:
+  - |
+    vdec: video-decoder@c8820000 {
+          compatible = "amlogic,gxl-vdec", "amlogic,gx-vdec";
+          reg = <0xc8820000 0x10000>, <0xc110a580 0xe4>;
+          reg-names = "dos", "esparser";
+          interrupts = <44>, <32>;
+          interrupt-names = "vdec", "esparser";
+          clocks = <&clk_dos_parser> ,<&clk_dos>, <&clk_vdec_1>, <&clk_vdec_hevc>;
+          clock-names = "dos_parser", "dos", "vdec_1", "vdec_hevc";
+          resets = <&reset_parser>;
+          reset-names = "esparser";
+          amlogic,ao-sysctrl = <&sysctrl_AO>;
+          amlogic,canvas = <&canvas>;
+    };
diff --git a/Documentation/devicetree/bindings/media/amlogic,vdec.txt b/Documentation/devicetree/bindings/media/amlogic,vdec.txt
deleted file mode 100644
index 9b6aace86ca7..000000000000
--- a/Documentation/devicetree/bindings/media/amlogic,vdec.txt
+++ /dev/null
@@ -1,72 +0,0 @@
-Amlogic Video Decoder
-================================
-
-The video decoding IP lies within the DOS memory region,
-except for the hardware bitstream parser that makes use of an undocumented
-region.
-
-It makes use of the following blocks:
-
-- ESPARSER is a bitstream parser that outputs to a VIFIFO. Further VDEC blocks
-then feed from this VIFIFO.
-- VDEC_1 can decode MPEG-1, MPEG-2, MPEG-4 part 2, MJPEG, H.263, H.264, VC-1.
-- VDEC_HEVC can decode HEVC and VP9.
-
-Both VDEC_1 and VDEC_HEVC share the "vdec" IRQ and as such cannot run
-concurrently.
-
-Device Tree Bindings:
----------------------
-
-VDEC: Video Decoder
---------------------------
-
-Required properties:
-- compatible: value should be different for each SoC family as :
-	- GXBB (S905) : "amlogic,gxbb-vdec"
-	- GXL (S905X, S905D) : "amlogic,gxl-vdec"
-	- GXM (S912) : "amlogic,gxm-vdec"
-	followed by the common "amlogic,gx-vdec"
-- reg: base address and size of he following memory-mapped regions :
-	- dos
-	- esparser
-- reg-names: should contain the names of the previous memory regions
-- interrupts: should contain the following IRQs:
-	- vdec
-	- esparser
-- interrupt-names: should contain the names of the previous interrupts
-- amlogic,ao-sysctrl: should point to the AOBUS sysctrl node
-- amlogic,canvas: should point to a canvas provider node
-- clocks: should contain the following clocks :
-	- dos_parser
-	- dos
-	- vdec_1
-	- vdec_hevc
-- clock-names: should contain the names of the previous clocks
-- resets: should contain the parser reset
-- reset-names: should be "esparser"
-
-Example:
-
-vdec: video-codec@c8820000 {
-	compatible = "amlogic,gxbb-vdec", "amlogic,gx-vdec";
-	reg = <0x0 0xc8820000 0x0 0x10000>,
-	      <0x0 0xc110a580 0x0 0xe4>;
-	reg-names = "dos", "esparser";
-
-	interrupts = <GIC_SPI 44 IRQ_TYPE_EDGE_RISING>,
-		     <GIC_SPI 32 IRQ_TYPE_EDGE_RISING>;
-	interrupt-names = "vdec", "esparser";
-
-	amlogic,ao-sysctrl = <&sysctrl_AO>;
-	amlogic,canvas = <&canvas>;
-
-	clocks = <&clkc CLKID_DOS_PARSER>,
-		 <&clkc CLKID_DOS>,
-		 <&clkc CLKID_VDEC_1>,
-		 <&clkc CLKID_VDEC_HEVC>;
-	clock-names = "dos_parser", "dos", "vdec_1", "vdec_hevc";
-
-	resets = <&reset RESET_PARSER>;
-	reset-names = "esparser";
-};
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
