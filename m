Return-Path: <SRS0=mlCU=YO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B38DCA9EAF
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Oct 2019 12:11:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DCC7205C9
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Oct 2019 12:11:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EfsVgUMj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="O0RqyHH9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6DCC7205C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fqdd8cyj2Nk6rzylLcbqmxnLu60eIJgAEY/DFHoI9uY=; b=EfsVgUMjvXXU//
	60tJdqIZSAWT6LtIweOcBXrKbwlyRgBdz3KTljqJA7HbRQna/C5bcRlGcEmTkeeo1tah726EM/zJG
	XXKC+hYQwVjfqtHuC+YBw61r85gM7MLc8W4qOn14urJZmI0H81jmjWNgaYD5chVBbzHTX/C/c6qvU
	ADO7bSRrLcXZn8ATtN0/BYESL8xi7GLMR8vUJ2G8r9sexyt1AE8+2+WCMx9gLB5CyJsCibtYlnD0a
	hrl/rbEGCVtFMVCcGU/edv3O1swZUxgaNkl5JCbDRvgb/PtFI50b4RDcSgHfa0I8saxrERsytR1VL
	whNMiryj+nsji4IWbqgA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iMWXP-0003M5-Dw; Mon, 21 Oct 2019 12:11:51 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iMWXC-0003C3-Iq
 for linux-amlogic@lists.infradead.org; Mon, 21 Oct 2019 12:11:40 +0000
Received: by mail-wm1-x344.google.com with SMTP id 3so12540079wmi.3
 for <linux-amlogic@lists.infradead.org>; Mon, 21 Oct 2019 05:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1nWQn9JHkIyWFzO1YTIzRNr08Bu0P25VLya5djrPvZU=;
 b=O0RqyHH9x9W9yuRreDzZfFvFCw2aKlpuUJgDs6q19bDn3KmMxUrSbA9wuy+igBdgoV
 AL4qmZzd5gwAvvAVfKCLwxaTDQLMIuYJvNr/J2a4J1UBvJX1HTwibetWsV7OTv8XIGN5
 tN8U06/qtKqaGeOT3y67gZpufPwEuyYXrq0q3LCD1ipoQRL1gW/QXPjNVNRA8KqgZel5
 nzRVSGGB/aL2tawRPdzwft1pbqsP6ZoRVJsr8fMUqxHsTwoSZBJc6VUkllpWh3XFoVqi
 IdYff/AvvJJrvYMMnLWsHpi3nUo2dzpv0Fx2a4xuxmbItbZZBMX593IO2makCLOpruqZ
 +xmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1nWQn9JHkIyWFzO1YTIzRNr08Bu0P25VLya5djrPvZU=;
 b=LzzKCoIMyVJYE7L9yxNOndo428Kejq72kMkqCUUQtiMvrFp+k303/KOSPhvZ9rEVbh
 G8RBdug8anYmhM67zHK6iEIeu18LE4ndv9bJt7KBueDRbQPqicsTVYgGJuIA6wOofn3A
 USpNt10nnplDdfIS5HmbIvM0YAF1lDfpzqfDIIlSIOezTak3gQhKKRsN9LmODGSp/asq
 f2TXcJUMpkKT3QAXbjXiDB/45xSA8F3BOYjIdCBdJPolXfFevliKhnTEalBGFbyIV0EG
 CAWwwkddoUvhbli3wE/lY8SCc1s91GPwLzzqvj1cVnxsYM8DA2h6CE8624PsGcAFrBPa
 lLKw==
X-Gm-Message-State: APjAAAXzLAXqQbAJsJL3EO+LMLhKx9/BODa1O1jReBo4biKTcUqo/19h
 390btfes1xkzzxNCEKCrQ/fwEw==
X-Google-Smtp-Source: APXvYqzsTud6HllbIVok9Dz0padLasdwgqohMnlleYLHymDpbxyY63+6giaeoHjz0duHKZWc1tYEvA==
X-Received: by 2002:a7b:c05a:: with SMTP id u26mr18887164wmc.128.1571659894688; 
 Mon, 21 Oct 2019 05:11:34 -0700 (PDT)
Received: from localhost.localdomain
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id 37sm21660508wrc.96.2019.10.21.05.11.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2019 05:11:34 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: robh+dt@kernel.org
Subject: [PATCH] dt-bindings: media: meson-ao-cec: convert to yaml
Date: Mon, 21 Oct 2019 14:11:31 +0200
Message-Id: <20191021121131.25017-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191021_051138_652672_B3A5D176 
X-CRM114-Status: GOOD (  11.15  )
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
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Now that we have the DT validation in place, let's convert the device tree
bindings for the Amlogic AO-CEC controller over to a YAML schemas.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../media/amlogic,meson-gx-ao-cec.yaml        | 91 +++++++++++++++++++
 .../bindings/media/meson-ao-cec.txt           | 37 --------
 2 files changed, 91 insertions(+), 37 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/amlogic,meson-gx-ao-cec.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/meson-ao-cec.txt

diff --git a/Documentation/devicetree/bindings/media/amlogic,meson-gx-ao-cec.yaml b/Documentation/devicetree/bindings/media/amlogic,meson-gx-ao-cec.yaml
new file mode 100644
index 000000000000..41197578f19a
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/amlogic,meson-gx-ao-cec.yaml
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2019 BayLibre, SAS
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/media/amlogic,meson-gx-ao-cec.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Amlogic Meson AO-CEC Controller
+
+maintainers:
+  - Neil Armstrong <narmstrong@baylibre.com>
+
+description: |
+  The Amlogic Meson AO-CEC module is present is Amlogic SoCs and its purpose is
+  to handle communication between HDMI connected devices over the CEC bus.
+
+properties:
+  compatible:
+    enum:
+      - amlogic,meson-gx-ao-cec # GXBB, GXL, GXM, G12A and SM1 AO_CEC_A module
+      - amlogic,meson-g12a-ao-cec # G12A AO_CEC_B module
+      - amlogic,meson-sm1-ao-cec # SM1 AO_CEC_B module
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  hdmi-phandle:
+    description: phandle to the HDMI controller
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/phandle
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - amlogic,meson-gx-ao-cec
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: AO-CEC clock
+
+        clock-names:
+          maxItems: 1
+          items:
+            - const: core
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - amlogic,meson-g12a-ao-cec
+              - amlogic,meson-sm1-ao-cec
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: AO-CEC clock generator source
+
+        clock-names:
+          maxItems: 1
+          items:
+            - const: oscin
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - hdmi-phandle
+  - clocks
+  - clock-names
+
+examples:
+  - |
+    cec_AO: cec@100 {
+        compatible = "amlogic,meson-gx-ao-cec";
+        reg = <0x0 0x00100 0x0 0x14>;
+        interrupts = <199>;
+        clocks = <&clkc_cec>;
+        clock-names = "core";
+        hdmi-phandle = <&hdmi_tx>;
+    };
+
diff --git a/Documentation/devicetree/bindings/media/meson-ao-cec.txt b/Documentation/devicetree/bindings/media/meson-ao-cec.txt
deleted file mode 100644
index ad92ee41c0dd..000000000000
--- a/Documentation/devicetree/bindings/media/meson-ao-cec.txt
+++ /dev/null
@@ -1,37 +0,0 @@
-* Amlogic Meson AO-CEC driver
-
-The Amlogic Meson AO-CEC module is present is Amlogic SoCs and its purpose is
-to handle communication between HDMI connected devices over the CEC bus.
-
-Required properties:
-  - compatible : value should be following depending on the SoC :
-	For GXBB, GXL, GXM, G12A and SM1 (AO_CEC_A module) :
-	"amlogic,meson-gx-ao-cec"
-	For G12A (AO_CEC_B module) :
-	"amlogic,meson-g12a-ao-cec"
-	For SM1 (AO_CEC_B module) :
-	"amlogic,meson-sm1-ao-cec"
-
-  - reg : Physical base address of the IP registers and length of memory
-	  mapped region.
-
-  - interrupts : AO-CEC interrupt number to the CPU.
-  - clocks : from common clock binding: handle to AO-CEC clock.
-  - clock-names : from common clock binding, must contain :
-		For GXBB, GXL, GXM, G12A and SM1 (AO_CEC_A module) :
-		- "core"
-		For G12A, SM1 (AO_CEC_B module) :
-		- "oscin"
-		corresponding to entry in the clocks property.
-  - hdmi-phandle: phandle to the HDMI controller
-
-Example:
-
-cec_AO: cec@100 {
-	compatible = "amlogic,meson-gx-ao-cec";
-	reg = <0x0 0x00100 0x0 0x14>;
-	interrupts = <GIC_SPI 199 IRQ_TYPE_EDGE_RISING>;
-	clocks = <&clkc_AO CLKID_AO_CEC_32K>;
-	clock-names = "core";
-	hdmi-phandle = <&hdmi_tx>;
-};
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
