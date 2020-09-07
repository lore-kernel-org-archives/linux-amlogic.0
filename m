Return-Path: <SRS0=IdmP=CQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7ACCC433E2
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Sep 2020 07:28:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0B4A20757
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Sep 2020 07:28:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OmRJcAOe";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="dfAa5ahK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F0B4A20757
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mENaOQduIh2PlxsPbNKzjONdJ5Ay8YNshu7bfcKVTeY=; b=OmRJcAOeIqSwpqQOzplgGvra5
	i0QphUXD7ufl2atXYA2d4P31G7s2jOBMteo5KsWr+7f7Rz62h5JtRQivc7FbYPinzWvX5w4swK3HF
	LwDuvrxbgmlesxM8Wj+3fvuri2eYAJCgLIgkVTi1xq9XcqRqMkDv7ooI9POwQ6vz/90Nj5pQj0LBJ
	HD8dc+fuTdc8XM5r1PQ2VlhW+3T7ziEbCR6R7dkgzMf4/hhg4SVMNPaqZEeXGN79ZXzKkGCQoxlW0
	BFSi9023l+bBryJ1OsdhOQo7Fp7LIzcoqbCT2ViphTZZJ2ucL2iULLj+9+eyVQ2YacEj0c+dkY82j
	C12vnPEHg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFBZk-00066K-JN; Mon, 07 Sep 2020 07:28:28 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFBYc-0005RK-Cb
 for linux-amlogic@lists.infradead.org; Mon, 07 Sep 2020 07:27:19 +0000
Received: by mail-wr1-x430.google.com with SMTP id c18so14606243wrm.9
 for <linux-amlogic@lists.infradead.org>; Mon, 07 Sep 2020 00:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2TPEKZsBaI5ym5zLNPRbwhJVAOFuQ97b5/eUYr0rYDc=;
 b=dfAa5ahKol3nYX5fP99OQv9g8cZuwSDzK9qnmdGDEs4UhWg2EsuzIEILHEyi+3HSU5
 vi0F4k+v6dRExbfz+uRjrnhu2hEkiKEyx58bIMKaUtqz+deWPXWsTlv2taoQnkeSTxrh
 lsfg5NqerMjlWhdaoFeZcPCre1Pyt+jfIFyQY6mgxOi+QrAxD9t7dU6rGl+Bsq0M/k5H
 ChNOh7CEbRBycnHqZkRiWFse28/jViwxWz+F2fQNSiPiqkk2WAxD6WUPEnKunP00eIa3
 KCyKDThMrrS5Zg8iQO21hVuzk5/mqZ1TpGjzPDwQ4IJ4f6K5coQY+mQomK+pjfLbGC8O
 q8gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2TPEKZsBaI5ym5zLNPRbwhJVAOFuQ97b5/eUYr0rYDc=;
 b=JU9ArBxqjS57oHdfxcgfOra1tb5JOAlkhgMvNsy2+969CH3H58DhWFs6EhQMW6Pd+9
 xj7vO/1+3fmLYm7bfWMNBQ/bpkkkrH2/tzjOfV7oYu/as2DCMvhFnae7bbATWAYJl2BI
 6V/SDzjLUMcGxTiVWgA8YSS6cGRMFkVftLUpLKR30YhwTpwvZ2maD6f/8C7meZjL37Dk
 xG9dawTk0jIGh1/AzpQbB07cpzNk+u/znTxBeulzYmrY6erFkCEKvu5VgQbIgUgVgXHt
 dsoCKRHe00FeyxTiXvsyROpzXu41mJwQ5mR18Yr46jGJx9pN8RLqerDrHSxQMcQiG7Pf
 TFgA==
X-Gm-Message-State: AOAM53111fZPgiHysIdbNafLJyoPhfqDoq6jB6UWtPN96SgNN/O8ba1M
 T4IFb4VOMCY4fpDb2q9hKQcaFw==
X-Google-Smtp-Source: ABdhPJzENjeeo6XRiHnOARoz14tPkStdsIiGG1vknGWVVW2afjDs6Ovn3bt++gumxHsXNXnA7IHj3Q==
X-Received: by 2002:adf:efc9:: with SMTP id i9mr20929383wrp.187.1599463636463; 
 Mon, 07 Sep 2020 00:27:16 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
 by smtp.gmail.com with ESMTPSA id x16sm25560500wrq.62.2020.09.07.00.27.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 00:27:15 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: kishon@ti.com,
	devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: phy: add Amlogic AXG MIPI D-PHY bindings
Date: Mon,  7 Sep 2020 09:27:07 +0200
Message-Id: <20200907072708.26043-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200907072708.26043-1-narmstrong@baylibre.com>
References: <20200907072708.26043-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_032718_538992_A396A718 
X-CRM114-Status: GOOD (  13.75  )
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
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Amlogic AXg SoCs embeds a MIPI D-PHY to communicate with DSI
panels, this adds the bindings.

This D-PHY depends on a separate analog PHY.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../bindings/phy/amlogic,axg-mipi-dphy.yaml   | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/amlogic,axg-mipi-dphy.yaml

diff --git a/Documentation/devicetree/bindings/phy/amlogic,axg-mipi-dphy.yaml b/Documentation/devicetree/bindings/phy/amlogic,axg-mipi-dphy.yaml
new file mode 100644
index 000000000000..f7ae1135288b
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/amlogic,axg-mipi-dphy.yaml
@@ -0,0 +1,68 @@
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
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
