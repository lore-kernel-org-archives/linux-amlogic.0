Return-Path: <SRS0=UIdE=WR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFB5AC3A59E
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Aug 2019 22:24:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6717E233A1
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Aug 2019 22:24:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aLz32lsV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Y19lRcDF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6717E233A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=nFLEBVeWq0y9NvWXFrNXv1u2/E7y/ar5ztU11XUkTiQ=; b=aLz32lsV9FKio9Tj2zTidQd73t
	j0fr1/xKBBbSktXpBK19Vd0kyggl21Ztcm4iP2IAwcYvuUWuvVLLRWdJQ1tanCZeNeQQ0mSwSNYpn
	uKkeFauBXfdx33IwcTHpK1cZgl/K6LTq2EVjBHyiOoZUfybp0KzvQHlkCBsBugyutMpFDPvK5TNuH
	4ObKae98Emltp6lMBIBQ97s++H/wUxtnLj8b/l6y52f8t6Oc3X2T726qG/Seo2diT7HurQVYBHTVw
	ifS24q8jeBaD8DiaEtFlgrELy/ymlLZTn3V/9zKsjpj/xMs9bWrhweMwe1m7A6y5SDKCk713VJe+8
	e7mtSQbw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0Z2B-0002fg-Q5; Wed, 21 Aug 2019 22:24:51 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0Z1o-0002AH-1A
 for linux-amlogic@lists.infradead.org; Wed, 21 Aug 2019 22:24:31 +0000
Received: by mail-wr1-x443.google.com with SMTP id g17so3492924wrr.5
 for <linux-amlogic@lists.infradead.org>; Wed, 21 Aug 2019 15:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=XcX2XfXI5RWl+qmPGtbnaP1+JiH+jtO4YYoKGP+64Jw=;
 b=Y19lRcDFSb95UM2o4oHaVdAKInX7LjtGZ7ONvY71k8sb/Qi4XJNB5NDm0gZnNN4X7m
 vNc1hVwSIMSEFjOv1lkFOHTZ1V9W26/uHhYWFn/Srei6PxJpDIF0gAasNX14rLuRZ4Mh
 m1MSnZcfCTJ+ZtRwjEmGq84hSXItsG/4WnwE3H4WiM3OqI6ZsuufCsxY1bZimNfMcBVE
 IDLvgqkRptXGX4iul+cGO8JqMB+n9kJiwCSJgSFQRnfBqc+QXSDOJBq6yie8VCCyaBX4
 ni0i6EQ5dKFOjV1IWf19d14VDfXrE/2LrshZ02orC624BzJvRl+WRTMxcVbcbiLx34wH
 JLDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=XcX2XfXI5RWl+qmPGtbnaP1+JiH+jtO4YYoKGP+64Jw=;
 b=TyUdQ9J7oUmgf0n4kfoxpiJA+TZ7rkzwNoqvyyL2BpvkTaS5lnUM0lDwKDtsB68ylT
 Rt7dvQSARvq4WjDz+ga1tuX1UfTxAYx182nPS8FW85EKa+hikhYvhWc6xyPGc4C3e8gE
 Qle1UcF4bndmXzi9kQHPYsqBuKCH2KVVxcC/Y3NZfxVL6wJsx3jUVqz/5qDR1HE6+5xG
 k8f2aBQb7XhgrGg8ieG5u8wf/CYoZyeQNK7RfwtD06jL/34RQnXNd5q523JrbzeDKB6Y
 Ewoanxd+PuYgCJ/5E7ARNnKlQ9HuD96FH3Y5VJBS2Rnja8vKOopmz5nKx1E7+VljHHgl
 CCYw==
X-Gm-Message-State: APjAAAVQKAZMOl2LZudoBDKzzfa3Ic4gwZHoATloyL+adirRtnRPYIgC
 xHn2HmnNYe2BeMtN0LymioyFXg==
X-Google-Smtp-Source: APXvYqzio+ssPLSEM+HBqzThdCWa9cLYSj5TVfppU45s05F6VnVEL6giT+0XA9MorRrbp7MOZttjaQ==
X-Received: by 2002:a5d:6606:: with SMTP id n6mr45412511wru.346.1566426264948; 
 Wed, 21 Aug 2019 15:24:24 -0700 (PDT)
Received: from localhost.localdomain ([2a01:cb1d:6e7:d500:82a9:347a:43f3:d2ca])
 by smtp.gmail.com with ESMTPSA id f197sm3548549wme.22.2019.08.21.15.24.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 15:24:24 -0700 (PDT)
From: Guillaume La Roque <glaroque@baylibre.com>
To: rui.zhang@intel.com,
	edubezval@gmail.com,
	daniel.lezcano@linaro.org
Subject: [PATCH v4 1/6] dt-bindings: thermal: Add DT bindings documentation
 for Amlogic Thermal
Date: Thu, 22 Aug 2019 00:24:16 +0200
Message-Id: <20190821222421.30242-2-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190821222421.30242-1-glaroque@baylibre.com>
References: <20190821222421.30242-1-glaroque@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190821_152428_078771_E953D27D 
X-CRM114-Status: UNSURE (   9.95  )
X-CRM114-Notice: Please train this message.
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
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Adding the devicetree binding documentation for the Amlogic temperature
sensor found in the Amlogic Meson G12 SoCs.
the G12A  and G12B SoCs are supported.

Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/thermal/amlogic,thermal.yaml     | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml

diff --git a/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
new file mode 100644
index 000000000000..f761681e4c0d
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/thermal/amlogic,thermal.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Thermal
+
+maintainers:
+  - Guillaume La Roque <glaroque@baylibre.com>
+
+description: Binding for Amlogic Thermal
+
+properties:
+  compatible:
+      items:
+        - enum:
+            - amlogic,g12a-cpu-thermal
+            - amlogic,g12a-ddr-thermal
+        - const: amlogic,g12a-thermal
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  amlogic,ao-secure:
+    description: phandle to the ao-secure syscon
+    $ref: '/schemas/types.yaml#/definitions/phandle'
+
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - amlogic,ao-secure
+
+examples:
+  - |
+        cpu_temp: temperature-sensor@ff634800 {
+                compatible = "amlogic,g12a-cpu-thermal",
+                             "amlogic,g12a-thermal";
+                reg = <0xff634800 0x50>;
+                interrupts = <0x0 0x24 0x0>;
+                clocks = <&clk 164>;
+                #thermal-sensor-cells = <0>;
+                amlogic,ao-secure = <&sec_AO>;
+        };
+...
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
