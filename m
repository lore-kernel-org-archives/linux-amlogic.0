Return-Path: <SRS0=mlCU=YO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0675DCA9EB0
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Oct 2019 13:40:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB51A21BE5
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Oct 2019 13:40:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mDnHo546";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="o3pc+fU/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB51A21BE5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QY8PSbkHjIhgsB6cN6tzhjj/9umgFqcFpA3IU6HWKVI=; b=mDnHo546IW4jnp
	hrDaEjKcBMWPqLf/oDvvkfw5XpvuGI/hyOpYzBJYo11gRzGLznY1WgDleG5HDb4Lf8TZSx6gLAnVy
	gTe3U8ttVUI4W2YDdLbz4In826zvrId8nfZL3SOf826uL08HBVdFyIyuOyaSXhvsZ96QuGyuzFKWJ
	VYCFMm6cp8Qwtce7rNQQG4aVZsYszHkpopo6SUEUyFM/TBY3Frg1FsSLIkgbbQeDDC1b7TrI0cuoG
	AwuKcf3mQrFjtI++WNlOIEHNd9RhmdFCwt8m1tpjXZDoE6lYPxGIKTaWe7yUT+iMth0CDhI+BL5MZ
	Wcy3jLoRGvwesJjI2XPA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iMXuz-0008PH-94; Mon, 21 Oct 2019 13:40:17 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iMXub-0006s5-JM
 for linux-amlogic@lists.infradead.org; Mon, 21 Oct 2019 13:39:55 +0000
Received: by mail-wm1-x341.google.com with SMTP id g24so4208716wmh.5
 for <linux-amlogic@lists.infradead.org>; Mon, 21 Oct 2019 06:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rxZzIwlDD5DO3Dig1AAmB3NX72gSPtCfOYTtxG2Ms5Q=;
 b=o3pc+fU/IFhuH3lLsX421aMMLNgviKUCS8A1bpdOmWwPY+qswyHRHsftp/JYKIgYCT
 FDKGAHGBuyqR6IE5DhsJIbh1tZwPUOfQC9iRtmBMXQINkFEeWondGaIU4S0d3uPPlvZ1
 RywTXQ0VjFlT5oqDG151fTDTrhpQqSr8vUdHplHloWnbCANc+Y0iKvua71c+LMkCJZq/
 a3gXTpfWTSZIYtv+XBfny+NVQIojTHjJbK9l/GUakkcOSw8FqYpwiQJuEV2bhPXsvCui
 RN4vRrsTpwB4XDDjLBDDLu3/nN/uCyuugzpAmsBVbeSzcTya/2YiF2eOS/d1hHTcNSXN
 cPYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rxZzIwlDD5DO3Dig1AAmB3NX72gSPtCfOYTtxG2Ms5Q=;
 b=Efx93T5ygiBNrT9itt4ZTK4fcC+h6RCx/594P5K8upb0i0FcpgOLo98eYl60xjV0ow
 QAQOcac8bs27r5TW0MWvYcehjXZMw7BCDFLplUNnurev06F9iIKkRMQQ12wBDragCkan
 povcQn2eDOrY5qqveomIHjt87ykWuqSE7fFrYHR3FlthG0a7Q4kpprJC6wYblFY4z6hT
 ubCNLhX+BQnfhwa0Op0kyB/wWZoQiDrWFIYOMJ7u9DoHwbip9h6kFwdxtMJfXNR+afAH
 R3u83pajEh29PcpxZkjawGmdU8doXe8ACKbpMVi0jAq00Zd4DzFVr6Fw8V0QnoY/lel5
 cx4Q==
X-Gm-Message-State: APjAAAW1R67MZKCVlNfrJOybnVxEWfNWRdCWg6Vad1qjBeBGqF49TA/G
 3/2wni+tGtamQFfNpSq1I0LSxA==
X-Google-Smtp-Source: APXvYqzYcRG7qQc57VrQDTccwlNW2H5DWKsVDXNVe8OUa6L1J6a/dYF402AJ/L9jlUOo8hOKSLt6TA==
X-Received: by 2002:a1c:39c1:: with SMTP id g184mr1936913wma.75.1571665192059; 
 Mon, 21 Oct 2019 06:39:52 -0700 (PDT)
Received: from localhost.localdomain
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id 17sm4050552wmg.29.2019.10.21.06.39.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2019 06:39:51 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: robh+dt@kernel.org
Subject: [PATCH] dt-bindings: soc: amlogic: canvas: convert to yaml
Date: Mon, 21 Oct 2019 15:39:50 +0200
Message-Id: <20191021133950.30490-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191021_063953_651386_8DCC47D7 
X-CRM114-Status: GOOD (  12.28  )
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
Cc: mjourdan@baylibre.com, devicetree@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Now that we have the DT validation in place, let's convert the device tree
bindings for the Amlogic Canvas over to a YAML schemas.

Cc: Maxime Jourdan <mjourdan@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../bindings/soc/amlogic/amlogic,canvas.txt   | 33 -------------
 .../bindings/soc/amlogic/amlogic,canvas.yaml  | 49 +++++++++++++++++++
 2 files changed, 49 insertions(+), 33 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/soc/amlogic/amlogic,canvas.txt
 create mode 100644 Documentation/devicetree/bindings/soc/amlogic/amlogic,canvas.yaml

diff --git a/Documentation/devicetree/bindings/soc/amlogic/amlogic,canvas.txt b/Documentation/devicetree/bindings/soc/amlogic/amlogic,canvas.txt
deleted file mode 100644
index e876f3ce54f6..000000000000
--- a/Documentation/devicetree/bindings/soc/amlogic/amlogic,canvas.txt
+++ /dev/null
@@ -1,33 +0,0 @@
-Amlogic Canvas
-================================
-
-A canvas is a collection of metadata that describes a pixel buffer.
-Those metadata include: width, height, phyaddr, wrapping and block mode.
-Starting with GXBB the endianness can also be described.
-
-Many IPs within Amlogic SoCs rely on canvas indexes to read/write pixel data
-rather than use the phy addresses directly. For instance, this is the case for
-the video decoders and the display.
-
-Amlogic SoCs have 256 canvas.
-
-Device Tree Bindings:
----------------------
-
-Video Lookup Table
---------------------------
-
-Required properties:
-- compatible: has to be one of:
-		- "amlogic,meson8-canvas", "amlogic,canvas" on Meson8
-		- "amlogic,meson8b-canvas", "amlogic,canvas" on Meson8b
-		- "amlogic,meson8m2-canvas", "amlogic,canvas" on Meson8m2
-		- "amlogic,canvas" on GXBB and newer
-- reg: Base physical address and size of the canvas registers.
-
-Example:
-
-canvas: video-lut@48 {
-	compatible = "amlogic,canvas";
-	reg = <0x0 0x48 0x0 0x14>;
-};
diff --git a/Documentation/devicetree/bindings/soc/amlogic/amlogic,canvas.yaml b/Documentation/devicetree/bindings/soc/amlogic/amlogic,canvas.yaml
new file mode 100644
index 000000000000..4322f876753d
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/amlogic/amlogic,canvas.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2019 BayLibre, SAS
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/soc/amlogic/amlogic,canvas.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Amlogic Canvas
+
+maintainers:
+  - Neil Armstrong <narmstrong@baylibre.com>
+  - Maxime Jourdan <mjourdan@baylibre.com>
+
+description: |
+  A canvas is a collection of metadata that describes a pixel buffer.
+  Those metadata include: width, height, phyaddr, wrapping and block mode.
+  Starting with GXBB the endianness can also be described.
+
+  Many IPs within Amlogic SoCs rely on canvas indexes to read/write pixel data
+  rather than use the phy addresses directly. For instance, this is the case for
+  the video decoders and the display.
+
+  Amlogic SoCs have 256 canvas.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+        - enum:
+          - amlogic,meson8-canvas
+          - amlogic,meson8b-canvas
+          - amlogic,meson8m2-canvas
+        - const: amlogic,canvas
+      - const: amlogic,canvas # GXBB and newer SoCs
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    canvas: video-lut@48 {
+        compatible = "amlogic,canvas";
+        reg = <0x48 0x14>;
+    };
+
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
