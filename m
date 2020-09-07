Return-Path: <SRS0=IdmP=CQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F451C433E2
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Sep 2020 08:18:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB7532145D
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Sep 2020 08:18:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eJ0RNStI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="J66KLzlO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB7532145D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=k+P2pqbL7rGKKkB8YQqecYstlLR7lsykYvWfRryrFtI=; b=eJ0RNStIzxDS+BEroL5cELUTh
	MY/d8lUFmiUf0J5tBgIaCvNUXGtr1szfZaDSHJaufwwyosuumBz1gIfxG+bzpVA3rqm7UXIVMNwkp
	8TQrrmfc1u9udp5rxs42TaGLtznIvTd6pOUW3WtkKLs/ZQv9MfjaIywzwycG2SxE11IVA4W0pLwnm
	wY8fPcF9Tw5FzqdgLYri1oRubvzrJfFd2biOFq3z/x/IPrZDrfPfBeQjk2Gs9B1ro5WHHbtviRP0d
	SAbg5xnz7ETcOR0RSGi6WMgq90RIS8m9b346Wc2OdxFL0hAUPjVgpp687n74cezgh1cP2ZJGZ9R5K
	kAMBx0V8g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFCMG-00011n-Qt; Mon, 07 Sep 2020 08:18:36 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFCME-000109-Fh
 for linux-amlogic@lists.infradead.org; Mon, 07 Sep 2020 08:18:35 +0000
Received: by mail-wm1-x330.google.com with SMTP id a65so13456412wme.5
 for <linux-amlogic@lists.infradead.org>; Mon, 07 Sep 2020 01:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/0HsauPurP4GLwNBopn5TZUsUZJKLkyzLDWrJr/4s5U=;
 b=J66KLzlOYfq63rz/EDI2/aR4JNB6BbshNVdCF0X7BoOXx8o3cPwwoD4FA2dtwXw66D
 jIQX9rFkKLZQ9wB/HmiYiMdhuY4afx3UkS2sDyJnZu0cMaNbusqbjiQIaKGtQQuXz/aa
 USbX4T2elF97eM1fMje7fNj8+x9bGo1er6L1qzB42H+G5T3xhG7wbmSuRMy4NbGjnGP8
 d8HEDEEl/qOiT2DY8wQmCwFr4N1VqNLmqeCNyDoHy6g+yjWDcH5WQuUuOsQRrzFxUOaZ
 DnkA/kuikMDBtrB6ybir6wiFs8/gED3EDAbZlYM+oj1M8wV5mSGFFw49l7vloRbfEFTX
 L+zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/0HsauPurP4GLwNBopn5TZUsUZJKLkyzLDWrJr/4s5U=;
 b=RztO+g8n1SHS5vWJNcanQhwyvqui3pPrtkpcPAJBy4AMFkntYYz+O5TFzymwx6tHfW
 7V9jlkkrOtb3OwK/PNcCyUIT5HzZW/9rxYVQVAzi3TdcCPWjnFQ3E7JaEXecwK34AJ6j
 mb4+O0CqVh0fD5R2B4cJrbehgqeLoJkjQcJfPDiPFpEzp/jqMe3GoQgHxur23BZpuo0D
 g4/U+SvhvFzMh26LxaSyS3fhTDGqRHAePzCWyPTleLBOf+XaHm03+bMGE/8R4g8W03qp
 +xzNGSY+2WUUU6ku/fhL5VcZK4i5dgqhj7rEhZ7JjBCXF7z74oVMIBu4yzC1WLjLuH5u
 qO2A==
X-Gm-Message-State: AOAM532mqrBJiGu4BIFlpis5aSxT+yL/PyXLTj3wJwYZtvkngGJ8UxkI
 WQlr0+KdVgHcNgFOTXc44Yz0gw==
X-Google-Smtp-Source: ABdhPJwT5w0cdNog5hvbeofOd9g2nUaa5JeJ2ZchwmHJ7pv5qSRDx2+v0cWfcXr2DTx0d7DcEDFbEA==
X-Received: by 2002:a7b:cd05:: with SMTP id f5mr19294990wmj.116.1599466713146; 
 Mon, 07 Sep 2020 01:18:33 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
 by smtp.gmail.com with ESMTPSA id q186sm28032205wma.45.2020.09.07.01.18.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 01:18:32 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch,
	devicetree@vger.kernel.org
Subject: [PATCH 2/6] dt-bindings: display: add Amlogic MIPI DSI Host
 Controller bindings
Date: Mon,  7 Sep 2020 10:18:21 +0200
Message-Id: <20200907081825.1654-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200907081825.1654-1-narmstrong@baylibre.com>
References: <20200907081825.1654-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_041834_529207_7BDE3E09 
X-CRM114-Status: GOOD (  14.11  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Amlogic AXg SoCs embeds a Synopsys DW-MIPI-DSI transceiver (ver 1.21a), with a custom
glue managing the IP resets, clock and data input similar to the DW-HDMI Glue on other
Amlogic SoCs.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../display/amlogic,meson-dw-mipi-dsi.yaml    | 115 ++++++++++++++++++
 1 file changed, 115 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/amlogic,meson-dw-mipi-dsi.yaml

diff --git a/Documentation/devicetree/bindings/display/amlogic,meson-dw-mipi-dsi.yaml b/Documentation/devicetree/bindings/display/amlogic,meson-dw-mipi-dsi.yaml
new file mode 100644
index 000000000000..6177f45ea1a6
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/amlogic,meson-dw-mipi-dsi.yaml
@@ -0,0 +1,115 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2020 BayLibre, SAS
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/display/amlogic,meson-dw-mipi-dsi.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Amlogic specific extensions to the Synopsys Designware MIPI DSI Host Controller
+
+maintainers:
+  - Neil Armstrong <narmstrong@baylibre.com>
+
+description: |
+  The Amlogic Meson Synopsys Designware Integration is composed of
+  - A Synopsys DesignWare MIPI DSI Host Controller IP
+  - A TOP control block controlling the Clocks & Resets of the IP
+
+allOf:
+  - $ref: dsi-controller.yaml#
+
+properties:
+  compatible:
+    enum:
+      - amlogic,meson-axg-dw-mipi-dsi
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 2
+
+  clock-names:
+    minItems: 2
+    items:
+      - const: pclk
+      - const: px_clk
+      - const: meas_clk
+
+  resets:
+    minItems: 1
+
+  reset-names:
+    items:
+      - const: top
+
+  phys:
+    minItems: 1
+
+  phy-names:
+    items:
+      - const: dphy
+
+  ports:
+    type: object
+
+    properties:
+      port@0:
+        type: object
+        description: Input node to receive pixel data.
+      port@1:
+        type: object
+        description: DSI output node to panel.
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - phys
+  - phy-names
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    dsi@7000 {
+          compatible = "amlogic,meson-axg-dw-mipi-dsi";
+          reg = <0x6000 0x400>;
+          resets = <&reset_top>;
+          reset-names = "top";
+          clocks = <&clk_pclk>, <&clk_px>;
+          clock-names = "pclk", "px_clk";
+          phys = <&mipi_dphy>;
+          phy-names = "dphy";
+
+          ports {
+              #address-cells = <1>;
+              #size-cells = <0>;
+
+              /* VPU VENC Input */
+              mipi_dsi_venc_port: port@0 {
+                  reg = <0>;
+
+                  mipi_dsi_in: endpoint {
+                       remote-endpoint = <&dpi_out>;
+                  };
+              };
+
+              /* DSI Output */
+              mipi_dsi_panel_port: port@1 {
+                  reg = <1>;
+
+                  mipi_out_panel: endpoint {
+                      remote-endpoint = <&mipi_in_panel>;
+                  };
+              };
+          };
+    };
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
