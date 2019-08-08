Return-Path: <SRS0=t7Bi=WE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E270C433FF
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Aug 2019 08:53:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 216252173E
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Aug 2019 08:53:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N09GYVic";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="GAjRm4BI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 216252173E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YSUJSkCAZG6y9Bi1wzrpaYfl7HFzT0IhsaQlINO+wZA=; b=N09GYVic5xikSx
	WMGPMu/k/cPNxm1kHskvbda1XhDsD0RaNbsCbLNizxkaqgxQ4qWHQhlFULdfeMLx52k3MJEQbVw1Y
	NbGBiikXAkOzfeX4kvJarXbbDALx+6hqm4qkwJONWgM0/8XT4Er/O9pOBBGbGV2mn/vwH2wjluI7I
	uhgR5hTxzpIzvuO7jkieCUhqriTDdNJfeKq79eJ089eDxie6Vh6CRftDxH7o2v0zQcheIH+evdcBz
	pqieB+tYTrY9xshfBWb6ooLjkQa3nWIgpxmxL8Jre9DuzEuH2sb4t31TRaOwdApDTjBPdjZcDfPqY
	75TSYAa6ROj6q+NZUJxA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hveBC-0002Mj-2C; Thu, 08 Aug 2019 08:53:50 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hve9D-0000bg-7O
 for linux-amlogic@lists.infradead.org; Thu, 08 Aug 2019 08:51:53 +0000
Received: by mail-wr1-x444.google.com with SMTP id g17so94060718wrr.5
 for <linux-amlogic@lists.infradead.org>; Thu, 08 Aug 2019 01:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UMr8GdCW9yfg8pfq5s4VUilxc4J32ByvgFAWlbIwziA=;
 b=GAjRm4BIvFiMLvxxckU19EerTOdrWD/DbpRVQblgyxBc//HBD/l0BkqMcR16piV4IO
 23hiMBcxj8MPnC+VPXMJaH0tNpjQD+XJAWuRmiBzuZrWW12QOgoUO1suPYqqjQwY0Ur9
 xpMiAJDZN0YwOfdKI0Ph6nFfWtAePtNwZJ696E2V3APDjqOV45moCIX/SZTuIOXr9AUq
 n7yTmcT9/QI+PGt0INU1Q8VTlDf0hHChAX/KCG0c1bNtAgKne7Kt9M0+PwefHDVsH/Gd
 g9POH73jTmCuy7dR04Gji5eBcOJNRhiPx4SiaKdlLf+AJi+NkZGiWNWef1ujiHpD3Bje
 +ysA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UMr8GdCW9yfg8pfq5s4VUilxc4J32ByvgFAWlbIwziA=;
 b=WOCprMvRHslfZ6OIchsdPYa2x0FaQBRxCnXXDiDQDOrT/e2/vc92Yk65bPjk/vdotg
 GtDpjI1yrmGFO0oDQkYvi1ONxHECjYNTe9KHSrMumysxhXRVZlvVFc7ZeZzqI6VK53za
 nyh+pJuy3B5HMeybOWTEF7gn5zr9/Ji42W/cZjusepS7glpbAoIzSrYhybc3f9Lfk/WX
 1nbaWoUdzB3bMlOkGPqwMiCE+fogmPT0piAt3h2z7hDeM/4GUCMPSqVmrwSrjnFGPPvo
 S7Md9vdbEOWk8HkHE0NL9TnqmCczR2DNOF6Ez094Qy5+91uTKgNTWWK5vFHUCBsgCMWf
 teBQ==
X-Gm-Message-State: APjAAAWsfg4OnB1HH6NRjNdgRalBtz1CM6K2OXbV/heG5CPAUmBSP0Oa
 7v94TknZjIIoQOnZuyj3ReUzvQ==
X-Google-Smtp-Source: APXvYqy6qwAlUrF5yzh6QDHSjyGkHiMc8eckATg+XKrl0xTf0XBl00GIzwIiI9AxNOmyUvHOsUMv9Q==
X-Received: by 2002:adf:b612:: with SMTP id f18mr15997677wre.97.1565254305808; 
 Thu, 08 Aug 2019 01:51:45 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id i66sm3360031wmi.11.2019.08.08.01.51.45
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 08 Aug 2019 01:51:45 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: robh+dt@kernel.org
Subject: [PATCH 5/9] dt-bindings: arm: amlogic: amlogic,
 meson-gx-ao-secure: convert to yaml
Date: Thu,  8 Aug 2019 10:51:35 +0200
Message-Id: <20190808085139.21438-6-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190808085139.21438-1-narmstrong@baylibre.com>
References: <20190808085139.21438-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190808_015147_269341_4CB99DAC 
X-CRM114-Status: GOOD (  11.53  )
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
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Now that we have the DT validation in place, let's convert the device tree
bindings for the Amlogic Always-On Secure Registers over to a YAML schemas.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../amlogic/amlogic,meson-gx-ao-secure.txt    | 28 ----------
 .../amlogic/amlogic,meson-gx-ao-secure.yaml   | 52 +++++++++++++++++++
 2 files changed, 52 insertions(+), 28 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.txt
 create mode 100644 Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.yaml

diff --git a/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.txt b/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.txt
deleted file mode 100644
index c67d9f48fb91..000000000000
--- a/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.txt
+++ /dev/null
@@ -1,28 +0,0 @@
-Amlogic Meson Firmware registers Interface
-------------------------------------------
-
-The Meson SoCs have a register bank with status and data shared with the
-secure firmware.
-
-Required properties:
- - compatible: For Meson GX SoCs, must be "amlogic,meson-gx-ao-secure", "syscon"
-
-Properties should indentify components of this register interface :
-
-Meson GX SoC Information
-------------------------
-A firmware register encodes the SoC type, package and revision information on
-the Meson GX SoCs.
-If present, the following property should be added :
-
-Optional properties:
-  - amlogic,has-chip-id: If present, the interface gives the current SoC version.
-
-Example
--------
-
-ao-secure@140 {
-	compatible = "amlogic,meson-gx-ao-secure", "syscon";
-	reg = <0x0 0x140 0x0 0x140>;
-	amlogic,has-chip-id;
-};
diff --git a/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.yaml b/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.yaml
new file mode 100644
index 000000000000..853d7d2b56f5
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2019 BayLibre, SAS
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/arm/amlogic/amlogic,meson-gx-ao-secure.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Amlogic Meson Firmware registers Interface
+
+maintainers:
+  - Neil Armstrong <narmstrong@baylibre.com>
+
+description: |
+  The Meson SoCs have a register bank with status and data shared with the
+  secure firmware.
+
+# We need a select here so we don't match all nodes with 'syscon'
+select:
+  properties:
+    compatible:
+      contains:
+        const: amlogic,meson-gx-ao-secure
+  required:
+    - compatible
+
+properties:
+  compatible:
+   items:
+      - const: amlogic,meson-gx-ao-secure
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+  amlogic,has-chip-id:
+    description: |
+      A firmware register encodes the SoC type, package and revision
+      information on the Meson GX SoCs. If present, the interface gives
+      the current SoC version.
+    type: boolean
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    ao-secure@140 {
+          compatible = "amlogic,meson-gx-ao-secure", "syscon";
+          reg = <0x140 0x140>;
+          amlogic,has-chip-id;
+    };
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
