Return-Path: <SRS0=sVtX=EW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B958BC4742C
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2020 10:13:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F98920709
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2020 10:13:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sK9P7kHa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="i5E0jmsm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F98920709
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jK/gxXalV3ci2HE5w7qxQy31ehVwpVIn8Ru48tBADs4=; b=sK9P7kHaHcVyG/TSHGHW/wIRt
	hN/YXp2vRnKPy6VO1kpqLwAAmsQoOa7ScB+637I8Pu5mvLYb1sF56P8GA9ok0pM3QEe9duMq/AhgQ
	azDxBDAFn3IBp+IZCETKuFMM8pjO6Drz9sdc/22f8q2SfpfGHb16+G72rqIOElVBzqAhuH2HE96zj
	8uUU+RjlzY1i/XftZWLZLeJDEsl65zQ3ouEaMMNrR/EZaJlS3Vnu+K41dZDqu1+qhUesG9HrAu0Q3
	+4J4pbHcXkd1RpyLDmlWFZJk3GBEBDOBg0YMbpiHqAh5IdUHk6A9m3zXwx4evUtvGBR8C7zd5fnGR
	HK0y/pxxw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kebVn-0008H9-Mi; Mon, 16 Nov 2020 10:13:27 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kebVh-0008Eg-Ot
 for linux-amlogic@lists.infradead.org; Mon, 16 Nov 2020 10:13:23 +0000
Received: by mail-wr1-x431.google.com with SMTP id p1so17994544wrf.12
 for <linux-amlogic@lists.infradead.org>; Mon, 16 Nov 2020 02:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X+jktKSyt59M1RlyoUXQDUiIneqQcY7EbqJCiazlG1Y=;
 b=i5E0jmsmNyqdoUSm84mjuIsvNHBhir03FpDaC3SMoi9kLZUyAn5LtMejHw4iI2aD/C
 kJkp37MNw6Il00+yD+5jr2D4No4GLU3VRbioOxxFlTNsT7y39QsT7tJ7Jz1aauH5VO+B
 jizfQ79qJlsFiS+JhJiAZ+v0f5WBBOe74o045qBHQglWGuVPNGYGqHTVwSRZtWSFSWrk
 GWfka0JgYa1hBg5Vf5CKdxFhWg0KB3NPBM6AOmOd+rcGPJz0W8LIv/UCPV/vnf9NILzV
 WxpW5iWo0UTjYl5UbLc2gctXbyI+lYc7yeTcnzQxvm1tgO0KuRcaTrA3+HRwghvmYpzw
 pa/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X+jktKSyt59M1RlyoUXQDUiIneqQcY7EbqJCiazlG1Y=;
 b=WvFqAxlLODGZBOq9NMqzdKI6W4afFdx2rNk9ynuI57x7btfYusUUyztOuSznNfmAzE
 xBfnq8Ck2Y51ALK+9+eWX9xHGfKbcmTYP3z5sf2CmzXtx+n83P9xZJgjkcb1f1OOBT4g
 2a3M4X7PCL8aUqPErjvqW7TEAyKZMe7OToDR2UZrAW3Nag5nOo26G8AXBF5vcyhquTva
 NVg6l1av2rzg6dTNnL52zWWXmFsIfk0LAr/oYmiUgNqnIAkSgB1ebYj1fhARXqIqV6LC
 nlxm+hhdJoHjKLNC452eGEIzBoGglm+gX6boKtO2DXwRp77O+wpm4214PgbBuY86PZfL
 zjYg==
X-Gm-Message-State: AOAM532AkQ420WsBFJn76o6SEicDAPvzqukn/bRVuBCmCdcaEDzuwHfO
 Wm0m+YYw04jisC6L/J8aN74YgQ==
X-Google-Smtp-Source: ABdhPJzzawClAU+KtOLWRR/v6L2Sy0PuBtshrLlL9wKHSAIMeuqAUnlakL7MgC7U+8MHRcgIcEiPrQ==
X-Received: by 2002:adf:9407:: with SMTP id 7mr19583282wrq.182.1605521600399; 
 Mon, 16 Nov 2020 02:13:20 -0800 (PST)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:edb9:72a:9e35:6eb])
 by smtp.gmail.com with ESMTPSA id
 g66sm19082228wmg.37.2020.11.16.02.13.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 02:13:19 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: devicetree@vger.kernel.org,
	kishon@ti.com,
	vkoul@kernel.org
Subject: [RESEND PATCH v3 1/2] dt-bindings: phy: add Amlogic AXG MIPI D-PHY
 bindings
Date: Mon, 16 Nov 2020 11:13:14 +0100
Message-Id: <20201116101315.71720-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116101315.71720-1-narmstrong@baylibre.com>
References: <20201116101315.71720-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_051321_820264_02C0286C 
X-CRM114-Status: GOOD (  13.93  )
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
