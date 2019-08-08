Return-Path: <SRS0=t7Bi=WE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F48BC0650F
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Aug 2019 08:54:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13AF52173E
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Aug 2019 08:54:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Qvz0EG/4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="yA5hh0G7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13AF52173E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ARemBq54JRM4EHnqx85qXFRcuHnnCDqP8ke1NrJ2MMA=; b=Qvz0EG/4awa3vD
	l0ZahBF+89RXe2f0n7fYu6SwwbBF3F4AwdfGTHAa2QW/Dw9AtR9WKYVrKrlEeGgwD0N7504w03Cwf
	ycH3HYz/NORVfsiSYSRjJLJ7YCpYBPhBe0FJxtHsAM+T0svMddj8SikBqS8zichWzjqUzb1rDQHPc
	rL9QF9Xs3qn1pp4z4EkIiX1n8AiFcFCKT5NBzmcp7XRD0kAOF4zMi+0aRBRBfUlQTGb9CLpuqTSEF
	FnjUnERZNGNn4xA/iCDmVEPZyyZFTEwMhc94FJt68J7RSLsHxIjORnH4WmSi9lEzfTsOTBftQXTgl
	28BnBWOsvFuoQAuE+gow==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hveC4-00036p-I2; Thu, 08 Aug 2019 08:54:44 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hve9F-0000dZ-MQ
 for linux-amlogic@lists.infradead.org; Thu, 08 Aug 2019 08:51:57 +0000
Received: by mail-wm1-x341.google.com with SMTP id 207so1572971wma.1
 for <linux-amlogic@lists.infradead.org>; Thu, 08 Aug 2019 01:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QuKnpe4s6wxZssdxaTJXUi4v/CLyskF3O3BoNBEfIYk=;
 b=yA5hh0G7Rxyn8Ascb9XWOF7kH4sg1O3CAw8PJf77TPLVmT4vq+bnR5KmKObkuWNMY3
 Tquu8Zn5MxviArmtsQzzlzOL37eWrNCdZxRLYm8EyIJruWHD2FdppmT0A0VsVUivFvx5
 PUpDHBYBidyUNSXGE7Wj/EyhGRV7LFd8Hl4X6QpsH5yA9v42+unJHAIN3q4BT49TOWvt
 JCAuMmxZ41l9iFZNnVOibDrrHaL3OksQjx7OUsKLUE6kBkqgdG0UBkRjuTrguOmLSVbU
 YLyG8woX1NHtlanO9dcfS0AgTf2rv/jm8503HiyxdBOhWHsc5KIdc+DNEEQuEudtr3O0
 F8Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QuKnpe4s6wxZssdxaTJXUi4v/CLyskF3O3BoNBEfIYk=;
 b=fp/OLq3pePdkd8Dy736voKWOiA6vUdsItAVpn/cm7FrTbrmO4gsaEaTHCYoFVycjj3
 HysLxtiBJqIeWd56zvyeHQfHO1Fr98e3YxqFjCNZ5vhniTOz4Cb2zy6dw6ZiwfBlUPKH
 X6uNq7tNUKY1dkrvVXpVDmnlGzuAB89n1nsUD8dTVdvgnkHdHUzUsqd/cgbdoeCp05FJ
 OnKypYtxVN13SjOk6YNn0C449YewJ/C360iuRF/RbqdcGOZZn1eROHZoV9jmeFBTcRC9
 yKtICUvh3nnkpyhv/rG2NpKXoloBfS+M2pc6ysc8eSmGCqv8XnoDtW94qlHL6/fArVXi
 UHzg==
X-Gm-Message-State: APjAAAW+wvU2rjO5VvlquM1dOhLw5j9J100TF9w9dzzINxXOTyfijhRi
 tG6SjCwEgoIswqo6GwDDwxHlSg==
X-Google-Smtp-Source: APXvYqxY+fZCA8sP5uDcKzjh0AosyO7e8SkHTxEHpKA8LYVoRk+dlpyZtIsrOORhJJIK9nHKYpW1yw==
X-Received: by 2002:a1c:a8d7:: with SMTP id r206mr3070378wme.47.1565254308227; 
 Thu, 08 Aug 2019 01:51:48 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id i66sm3360031wmi.11.2019.08.08.01.51.47
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 08 Aug 2019 01:51:47 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: robh+dt@kernel.org
Subject: [PATCH 8/9] dt-bindings: serial: meson-uart: convert to yaml
Date: Thu,  8 Aug 2019 10:51:38 +0200
Message-Id: <20190808085139.21438-9-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190808085139.21438-1-narmstrong@baylibre.com>
References: <20190808085139.21438-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190808_015149_903049_F8502BCC 
X-CRM114-Status: GOOD (  14.88  )
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
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-serial@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Now that we have the DT validation in place, let's convert the device tree
bindings for the Amlogic UART Serial controller over to a YAML schemas.

Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../bindings/serial/amlogic,meson-uart.txt    | 38 ----------
 .../bindings/serial/amlogic,meson-uart.yaml   | 73 +++++++++++++++++++
 2 files changed, 73 insertions(+), 38 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/serial/amlogic,meson-uart.txt
 create mode 100644 Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml

diff --git a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.txt b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.txt
deleted file mode 100644
index c06c045126fc..000000000000
--- a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.txt
+++ /dev/null
@@ -1,38 +0,0 @@
-Amlogic Meson SoC UART Serial Interface
-=======================================
-
-The Amlogic Meson SoC UART Serial Interface is present on a large range
-of SoCs, and can be present either in the "Always-On" power domain or the
-"Everything-Else" power domain.
-
-The particularity of the "Always-On" Serial Interface is that the hardware
-is active since power-on and does not need any clock gating and is usable
-as very early serial console.
-
-Required properties:
-- compatible : compatible: value should be different for each SoC family as :
-	- Meson6 : "amlogic,meson6-uart"
-	- Meson8 : "amlogic,meson8-uart"
-	- Meson8b : "amlogic,meson8b-uart"
-	- GX (GXBB, GXL, GXM) : "amlogic,meson-gx-uart"
-	eventually followed by : "amlogic,meson-ao-uart" if this UART interface
-	is in the "Always-On" power domain.
-- reg : offset and length of the register set for the device.
-- interrupts : identifier to the device interrupt
-- clocks : a list of phandle + clock-specifier pairs, one for each
-	   entry in clock names.
-- clock-names :
-   * "xtal" for external xtal clock identifier
-   * "pclk" for the bus core clock, either the clk81 clock or the gate clock
-   * "baud" for the source of the baudrate generator, can be either the xtal
-	or the pclk.
-
-e.g.
-uart_A: serial@84c0 {
-	compatible = "amlogic,meson-gx-uart";
-	reg = <0x0 0x84c0 0x0 0x14>;
-	interrupts = <GIC_SPI 26 IRQ_TYPE_EDGE_RISING>;
-	/* Use xtal as baud rate clock source */
-	clocks = <&xtal>, <&clkc CLKID_UART0>, <&xtal>;
-	clock-names = "xtal", "pclk", "baud";
-};
diff --git a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
new file mode 100644
index 000000000000..214fe8beddc3
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2019 BayLibre, SAS
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/serial/amlogic,meson-uart.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Amlogic Meson SoC UART Serial Interface
+
+maintainers:
+  - Neil Armstrong <narmstrong@baylibre.com>
+
+description: |
+  The Amlogic Meson SoC UART Serial Interface is present on a large range
+  of SoCs, and can be present either in the "Always-On" power domain or the
+  "Everything-Else" power domain.
+
+  The particularity of the "Always-On" Serial Interface is that the hardware
+  is active since power-on and does not need any clock gating and is usable
+  as very early serial console.
+
+properties:
+  compatible:
+    oneOf:
+      - description: Always-on power domain UART controller
+        items:
+        - enum:
+          - amlogic,meson6-uart
+          - amlogic,meson8-uart
+          - amlogic,meson8b-uart
+          - amlogic,meson-gx-uart
+        - const: amlogic,meson-ao-uart
+      - description: Everything-Else power domain UART controller
+        enum:
+        - amlogic,meson6-uart
+        - amlogic,meson8-uart
+        - amlogic,meson8b-uart
+        - amlogic,meson-gx-uart
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: external xtal clock identifier
+      - description: the bus core clock, either the clk81 clock or the gate clock
+      - description: the source of the baudrate generator, can be either the xtal or the pclk
+
+  clock-names:
+    items:
+      - const: xtal
+      - const: pclk
+      - const: baud
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+examples:
+  - |
+    serial@84c0 {
+          compatible = "amlogic,meson-gx-uart";
+          reg = <0x84c0 0x14>;
+          interrupts = <26>;
+          clocks = <&xtal>, <&pclk>, <&xtal>;
+          clock-names = "xtal", "pclk", "baud";
+    };
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
