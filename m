Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06913C433EF
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Jan 2022 14:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Umo65ycJby/Q4sMs2ZbJfU5U9Ut+LRrJD9nBv9bdUhQ=; b=Ywv1oWPTpUFT5w
	VQSC+O0E7Q037Xf3KTdZw0dycV+avw0t0gs9VStFQ/Zn1PVP1DKJRtpA4eYADvVJq2aiKpx6gkF85
	gxEmqhgW51s7ZcuuqYqYcWhY+ZgR9G4swLdtBcpbnGMnFi46RL9iyH3FZyZNoyvy4uClthfSrvEQU
	c0oiObrtAdDE5m3vXFMtfM8wiWOYbR1En/u+kAGKdQBt+RO0bAnL6r3DHukoDyNZIDByt6pMC7Exb
	U37Hqn+L9uWgLaiLFqizZeRKILAwr3R3zPcYy5toiRXoqLbLgUpJg/QUP8xsGUNMVrYW9ny5fOU/K
	BKrKETqYMClX4o/hTAEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5qfN-004KLC-0k; Fri, 07 Jan 2022 14:56:29 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5qeP-004JmP-M3
 for linux-amlogic@lists.infradead.org; Fri, 07 Jan 2022 14:55:33 +0000
Received: by mail-wm1-x32d.google.com with SMTP id c66so4064070wma.5
 for <linux-amlogic@lists.infradead.org>; Fri, 07 Jan 2022 06:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i/hFK7bnbyVv/8bagrZIUgrFi4M+cus55rUNMhBhOlY=;
 b=QxcPOOVBsJT1TbTertfVq4dtk+zgpw9B9lO7kmUmxUDaGs9HqYpJL97QVTaH4F6Yko
 0BwpbMqRvA8Tix2+d+7IegIGvGJsKPP7qJtzEBUA3ypgwJhAdOSNBtit6eSi+PS+Wkl+
 MTreGbdmvzbOVm8LNbClt0ntITzlw5aK+wy9Rh48CG5FTNQSc55TduJuw+0qs01TYgqt
 D3ImKrDnm7Kuy87wNftoVBpPesS1ty1jTFqSS7GUvtfqLRsrSZy5KWh6ZEdLpx/M36GQ
 v3s6YO8wjn3tWToHNAiFVIhCbJKQnX3gxFOU//DKHCLHAy6QvpFN4e89+c26AIDG7Gbk
 BaRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i/hFK7bnbyVv/8bagrZIUgrFi4M+cus55rUNMhBhOlY=;
 b=Mc71rxZTtar5Ntqa/091dQcarQxAbwff912NEIoc3gQeb0jOs0XcwcUhkFtO+ZJ45u
 oEO49q0DEbtofTTZ7DFOdJWTCUvlcifwNywj8+pstdC/5pL3a2lyWcuMLewRwmlKJjG1
 saB3+z3T6uuYvdT1kI/Ol0bac3bY1ws/kNJNDDJN4r9NkieVaGNWk+Gs37MDONMsLA+C
 m60wffwUOqKwegWTRiDnEVJQVq5Gh4oqVSuBkQZhlkXG2ep3pvbAZtSxBUx3bmiw2Uig
 fywYxDLdZP15b2V7yT73Wl6BFMRnRFeEhnKJ17JKPApbdLuJG+Ws35ZmFt7+wbymCF9r
 bOWg==
X-Gm-Message-State: AOAM533eTaBBmDpgACwHZ0i1rK8ZFOpWbVyFrh8BRQiDlBqb7BcAqbWN
 4fMiGQZfhKGkVzZ5/5IkBttKIw==
X-Google-Smtp-Source: ABdhPJzNiIlnV5+EKZOxSQ3AuYv+xDs8BOK4BC9sQabhOwnBxMpuZvATOQT2eB0jdqLLJr/t1XxumQ==
X-Received: by 2002:a05:600c:5119:: with SMTP id
 o25mr11741995wms.96.1641567325360; 
 Fri, 07 Jan 2022 06:55:25 -0800 (PST)
Received: from localhost.localdomain ([2001:861:44c0:66c0:fc89:e826:8938:cbde])
 by smtp.gmail.com with ESMTPSA id n8sm5594492wri.47.2022.01.07.06.55.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 06:55:24 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 1/6] dt-bindings: display: add Amlogic MIPI DSI Host
 Controller bindings
Date: Fri,  7 Jan 2022 15:55:10 +0100
Message-Id: <20220107145515.613009-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107145515.613009-1-narmstrong@baylibre.com>
References: <20220107145515.613009-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220107_065529_821673_E5681AF3 
X-CRM114-Status: GOOD (  13.94  )
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

The Amlogic G12A, G12B & SM1 SoCs embeds a Synopsys DW-MIPI-DSI transceiver (ver 1.21a),
with a custom glue managing the IP resets, clock and data input similar to the DW-HDMI Glue
on the same Amlogic SoCs.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../display/amlogic,meson-dw-mipi-dsi.yaml    | 118 ++++++++++++++++++
 1 file changed, 118 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/amlogic,meson-dw-mipi-dsi.yaml

diff --git a/Documentation/devicetree/bindings/display/amlogic,meson-dw-mipi-dsi.yaml b/Documentation/devicetree/bindings/display/amlogic,meson-dw-mipi-dsi.yaml
new file mode 100644
index 000000000000..f3070783d606
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/amlogic,meson-dw-mipi-dsi.yaml
@@ -0,0 +1,118 @@
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
+      - amlogic,meson-g12a-dw-mipi-dsi
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
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: Input node to receive pixel data.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
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
+unevaluatedProperties: false
+
+examples:
+  - |
+    dsi@7000 {
+          compatible = "amlogic,meson-g12a-dw-mipi-dsi";
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
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
