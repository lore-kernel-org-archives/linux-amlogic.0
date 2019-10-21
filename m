Return-Path: <SRS0=mlCU=YO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0932EC47E49
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Oct 2019 14:01:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3EB52054F
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Oct 2019 14:01:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fOsswJM1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="y3Y9t5g8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3EB52054F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CQ+P1d6YUs0no3Ypanxdnw2OM28YgzavRNZdwlKEhjc=; b=fOsswJM1j1R6Hv
	8yIA6rX6za2vDQPWZOTqs5pqoVPLZJfPurknglzHoMnJTLLvLB34l2JFo8NZ856T0jT/ZoAShlfEX
	Xx27xjYYTUQdk2awG/axzn7TbvNsUeh5gLtPqbPlA9OrvmhURKH3YEIBEmn8JgHILo1m8ONToVLf9
	38p9ofZ+FK7NUqilJCImCXmdnJpT4Cx6HQe+NDjLVxPyg8uAi6nDMRaQPD8r2nqUWL/jGntn6aw5a
	Dqva0sHDxnhneyTxMSvSHSX7yQOFCtuTwF6OcrqY9h6JmO+zO7yT1LkcwY4B4/3k831bYJxdD/YgQ
	0HVYco/dUHBGfTzXjN2w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iMYFA-0002fA-TV; Mon, 21 Oct 2019 14:01:08 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iMYF0-0002UN-Gi
 for linux-amlogic@lists.infradead.org; Mon, 21 Oct 2019 14:01:00 +0000
Received: by mail-wm1-x342.google.com with SMTP id q13so3423637wmj.0
 for <linux-amlogic@lists.infradead.org>; Mon, 21 Oct 2019 07:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=b4PdhEAPlrJQgSDJoJmuRL85NouJ7ey9Hv6QLfk9XSI=;
 b=y3Y9t5g8UXkkEk/00dSN4HFMLQNR1yycajblNd55Mh8D4IdBHbxNogOQw5CGlkWQgH
 YwcR14PT4H4XOyFvcpLXb2jem2PSSobcm/TCiRmHYUETMTAjbhcKpRgg+RXAR31DUH8w
 LEKk6fiQb9Vv3bXL39T06H2HOUcudGeaO3dCD4xEm5VdtPaYDtn3BXmOlWi/tbCDhzPk
 a6/lGZIUFpgwK4nchsikZ9XwgrQxydZFvzJlXZ9Au4AzEBHHCaXo6ZywnfrY0FTP9TvE
 OID99UCsNywxSBSGRKmhM5WLpFU7uedHqlisx7W+DKJoiBOHlHY/fiVOd8ChrhyHNE/1
 jw9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=b4PdhEAPlrJQgSDJoJmuRL85NouJ7ey9Hv6QLfk9XSI=;
 b=uV49DjI+cnDRJPjyN6xSBlgyOQp6bL9AJRURPzKXNGJ+j7hbLtKDB7ZiNQU4jUXZT0
 2JEremIWBQrieh+jZcJtIH2nzGaacsrC9Q2I8OgN0qkO0HjvWD3+G7WY2mO7Qyq0GJ28
 bHg28uaWHXghVOczUDIfBOZY6E00e7q/E7jMU3DcZLgHR6LRaGv70OTmL++RZUlnap7m
 SyoJH3Jp2LVZMiJIKW9pHJxVJKDBuE8h6T7Xi+8CQ0RD4eBL0fpBUNWAEMojga6o8XhP
 6B8LMMOlBVA6MX7OFMdEfUuqSQrVXzIjq/J8XuL3h6IgMs8ttWJJrzjpNtsGw/1c6Bzb
 y3cg==
X-Gm-Message-State: APjAAAWdRr9m/C9pk7dOTs/Iq55QH5md/r39+F2O68cOoQ8kq2z7F0lq
 PHqbUAcAlKG3/6wlhsvqos6E9Q==
X-Google-Smtp-Source: APXvYqzGAP+ASrRHNvDQUcOJw1l35OBgxCv/k+On7Hb80R6kwIsPcNWJRm1NTKq/GbYZO3CC6+L4kw==
X-Received: by 2002:a1c:68c5:: with SMTP id d188mr3522182wmc.139.1571666455508; 
 Mon, 21 Oct 2019 07:00:55 -0700 (PDT)
Received: from localhost.localdomain
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id f83sm14859235wmf.43.2019.10.21.07.00.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2019 07:00:55 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: robh+dt@kernel.org
Subject: [PATCH] dt-bindings: i2c: meson: convert to yaml
Date: Mon, 21 Oct 2019 16:00:53 +0200
Message-Id: <20191021140053.9525-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191021_070058_553548_60807EB6 
X-CRM114-Status: GOOD (  12.54  )
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
 linux-kernel@vger.kernel.org, Beniamino Galvani <b.galvani@gmail.com>,
 linux-i2c@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Now that we have the DT validation in place, let's convert the device tree
bindings for the Amlogic I2C Controller over to YAML schemas.

Cc: Beniamino Galvani <b.galvani@gmail.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../bindings/i2c/amlogic,meson6-i2c.yaml      | 53 +++++++++++++++++++
 .../devicetree/bindings/i2c/i2c-meson.txt     | 30 -----------
 2 files changed, 53 insertions(+), 30 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-meson.txt

diff --git a/Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml b/Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml
new file mode 100644
index 000000000000..49cad273c8e5
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2019 BayLibre, SAS
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/i2c/amlogic,meson6-i2c.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Amlogic Meson I2C Controller
+
+maintainers:
+  - Neil Armstrong <narmstrong@baylibre.com>
+  - Beniamino Galvani <b.galvani@gmail.com>
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+properties:
+  compatible:
+    enum:
+      - amlogic,meson6-i2c # Meson6, Meson8 and compatible SoCs
+      - amlogic,meson-gxbb-i2c # GXBB and compatible SoCs
+      - amlogic,meson-axg-i2c # AXG and compatible SoCs
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+examples:
+  - |
+    i2c@c8100500 {
+        compatible = "amlogic,meson6-i2c";
+        reg = <0xc8100500 0x20>;
+        interrupts = <92>;
+        clocks = <&clk81>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        eeprom@52 {
+            compatible = "atmel,24c32";
+            reg = <0x52>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/i2c/i2c-meson.txt b/Documentation/devicetree/bindings/i2c/i2c-meson.txt
deleted file mode 100644
index 13d410de077c..000000000000
--- a/Documentation/devicetree/bindings/i2c/i2c-meson.txt
+++ /dev/null
@@ -1,30 +0,0 @@
-Amlogic Meson I2C controller
-
-Required properties:
- - compatible: must be:
-	"amlogic,meson6-i2c" for Meson8 and compatible SoCs
-	"amlogic,meson-gxbb-i2c" for GXBB and compatible SoCs
-	"amlogic,meson-axg-i2c"for AXG and compatible SoCs
-
- - reg: physical address and length of the device registers
- - interrupts: a single interrupt specifier
- - clocks: clock for the device
- - #address-cells: should be <1>
- - #size-cells: should be <0>
-
-For details regarding the following core I2C bindings see also i2c.txt.
-
-Optional properties:
-- clock-frequency: the desired I2C bus clock frequency in Hz; in
-  absence of this property the default value is used (100 kHz).
-
-Examples:
-
-	i2c@c8100500 {
-		compatible = "amlogic,meson6-i2c";
-		reg = <0xc8100500 0x20>;
-		interrupts = <0 92 1>;
-		clocks = <&clk81>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-	};
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
