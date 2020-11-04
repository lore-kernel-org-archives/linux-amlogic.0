Return-Path: <SRS0=aM1E=EK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF608C2D0A3
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Nov 2020 13:47:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2862121556
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Nov 2020 13:47:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Dr3SZDJ/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="jSLbyaxP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2862121556
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jK/gxXalV3ci2HE5w7qxQy31ehVwpVIn8Ru48tBADs4=; b=Dr3SZDJ/O/680UU9I/YJhMcVM
	PsBIwhOSKRkAAQMDa5/JdkDui2ByYxNffAzzim2E1vEBvZQWe/C938xje99ld8M7Eou+4IPCYXCwf
	PcOrU7VhgMiOHUGrudMIsDEtDL+8pAENDxMM7yKsUxQERQDT1kv+Fev6bUncqS1fqvgXTzu1Knf9Q
	KftIuDibwtQSk7xOBGHlW6R96KQwteOLzwSpGNccE4KT/HhkIL1bA8Om9VMbVhB2pC5w0ujLCMryD
	t5eDCNOHFPvzSE7irdI33fMQTIgGw0ixiWZPlT5LTp009oylLiwTVs9oex9AYQLCPHnqclDuXu+mL
	c6t06gCTA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaJ8f-0005ij-K1; Wed, 04 Nov 2020 13:47:49 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaJ8T-0005dJ-Gt
 for linux-amlogic@lists.infradead.org; Wed, 04 Nov 2020 13:47:41 +0000
Received: by mail-wr1-x432.google.com with SMTP id b8so22131093wrn.0
 for <linux-amlogic@lists.infradead.org>; Wed, 04 Nov 2020 05:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X+jktKSyt59M1RlyoUXQDUiIneqQcY7EbqJCiazlG1Y=;
 b=jSLbyaxPZKd2BfEHQR+i4qkHFQUDYYmpFXx9Tdpbb6vvPC8oadefWz+kr1x3IG/Sol
 buywHZChF4DsZQBoxnVS/DQevkehD78cB4ATtgFrnTxucRvG6Blre6vq3Qm59B3+TR13
 kAm37d9G9T2frIkEP0MnEo7NnyDMDBIz+N1KeaZon53e/bcE1yL/ZQPBuDlpA9W7uxxB
 u6XNTSAr/zs1Hj84MneZSTDYs18M5AQZD7yKIl1s1WBeWymzqxV9PZgY01Q0IPdldRKf
 8/UIeV+H9Qb1XCs7yln5l1elr9mWLJdG8sGKenoA5MD5hSarooBJqbpZOQctZoNpkyfh
 yiWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X+jktKSyt59M1RlyoUXQDUiIneqQcY7EbqJCiazlG1Y=;
 b=ep7de2ynjMNSILlPqjJALl4WiZuhyC+mVGG3jl781sIWucWeJC04HMBz0VokbKOkQw
 fd9lcMEVzLe5j0Ae3W+nSuHnHJPrM+Mm/eCPvXukEqKj6UIPH425yu8gCGC+UWCPImeL
 Wu1DxkhkRmYOw0XM1WRT8Q4vwfqDsam84BFarpy20CbZsxd2a33Hdx0lTJKglzCjX97W
 E+kRP7WtCkZKhIznSvCrtDQ8dsrO/1hgnFT0IJqLAc18dv8xuhgDjkMjqBdTDyw9HGUQ
 unxHB35xHjDTEFoy+RojJtGlaUpDvlRF6KK6k3/vShrTPulXkFvOiIHqbytIFb7Jk7os
 NHlA==
X-Gm-Message-State: AOAM532AWpf0cSfOmYu5BsE6jwRSpwnV2X4oj4PLtcAwnUXrvKx7LG0L
 cBRfVkp8ybDztNEc6KuuDwC/tw==
X-Google-Smtp-Source: ABdhPJyBiSSrZ7n/5ZV3G5rqUJ4D+BkannbQm+zSCpWf0KcWLXfH8q7e/EMH258OINRXL5jKjXL9dw==
X-Received: by 2002:adf:8562:: with SMTP id 89mr31867445wrh.214.1604497655706; 
 Wed, 04 Nov 2020 05:47:35 -0800 (PST)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:3d8d:fb08:21c9:faa3])
 by smtp.gmail.com with ESMTPSA id 30sm2759586wrs.84.2020.11.04.05.47.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 05:47:34 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: devicetree@vger.kernel.org,
	kishon@ti.com
Subject: [PATCH v3 1/2] dt-bindings: phy: add Amlogic AXG MIPI D-PHY bindings
Date: Wed,  4 Nov 2020 14:47:29 +0100
Message-Id: <20201104134730.1545875-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201104134730.1545875-1-narmstrong@baylibre.com>
References: <20201104134730.1545875-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201104_084737_678132_2B17D9A3 
X-CRM114-Status: GOOD (  14.22  )
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
Cc: Rob Herring <robh@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Amlogic AXg SoCs embeds a MIPI D-PHY to communicate with DSI
panels, this adds the bindings.

This D-PHY depends on a separate analog PHY.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/phy/amlogic,axg-mipi-dphy.yaml   | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/amlogic,axg-mipi-dphy.yaml

diff --git a/Documentation/devicetree/bindings/phy/amlogic,axg-mipi-dphy.yaml b/Documentation/devicetree/bindings/phy/amlogic,axg-mipi-dphy.yaml
new file mode 100644
index 000000000000..be485f500887
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/amlogic,axg-mipi-dphy.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2020 BayLibre, SAS
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/phy/amlogic,axg-mipi-dphy.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Amlogic AXG MIPI D-PHY
+
+maintainers:
+  - Neil Armstrong <narmstrong@baylibre.com>
+
+properties:
+  compatible:
+    enum:
+      - amlogic,axg-mipi-dphy
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: pclk
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    items:
+      - const: phy
+
+  "#phy-cells":
+    const: 0
+
+  phys:
+    maxItems: 1
+
+  phy-names:
+    items:
+      - const: analog
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
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    phy@ff640000 {
+            compatible = "amlogic,axg-mipi-dphy";
+            reg = <0xff640000 0x100>;
+            clocks = <&clk_mipi_dsi_phy>;
+            clock-names = "pclk";
+            resets = <&reset_phy>;
+            reset-names = "phy";
+            phys = <&mipi_pcie_analog_dphy>;
+            phy-names = "analog";
+            #phy-cells = <0>;
+    };
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
