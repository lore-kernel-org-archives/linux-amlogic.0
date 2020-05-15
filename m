Return-Path: <SRS0=wX20=65=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA695C433E0
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 May 2020 20:48:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 826DF20756
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 May 2020 20:48:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LBewgnYV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="lobsCH0E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 826DF20756
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zeuNIReyQvDmFtAug2oFuJhz5RJ+1JpFsISSmVDIrNA=; b=LBewgnYVZ25Lhy
	7Vhag70oaFCNquLkA5dcuiIlp09OU35lZCG9hhiknwSR90Jk7PHHOIYblNIifZmFWyZdNPD7f3p6L
	p7SJ0uTHOnYcvbordE19vhPNHT+JZreZF9UVLf1tgZDA1/qX6NmxLSJ0u1LXgUYq+RK62kvPaJKg9
	ICBfo98cQ1A5l6x1wVhESPL3Tqcl9Rp6Zux4xOcAIw1Xa19Bhjx/8Z2pljXOJnpxtrvLcaIadLFij
	v00Oq7LzFyZrMRE8X59c6Gxb0JS8N5U640syipgnQ9+4YPqoQHD2NWz2aXnsp64WgmF1y/FJ+zJiY
	WZqI7UfE5H/MlQDzn77w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZhFS-00075I-3V; Fri, 15 May 2020 20:48:02 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZhFB-0006pg-JT; Fri, 15 May 2020 20:47:49 +0000
Received: by mail-wr1-x443.google.com with SMTP id l18so4996393wrn.6;
 Fri, 15 May 2020 13:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Aa13zQ7giAP62TWcUaUMtr6UzYCBsQUKHFJYOsGW7SY=;
 b=lobsCH0EYpvxTKHOpF1dKlAqEXOCKQMqI+ptQNtpsMvwS+4O71tcnncrEmcSqLVDIF
 U5iViPOUcAW9Zb9A5rQWzXKe+dhjwkakV90AhK0MTcdunVyA8eCR35+X77yKt8KmshEl
 NI0GQlKPnTvwiycEts0A+pQZzM2jImnws+c467BQID11h2xo35EGEggD6RllSBRNBSsN
 nSu096LX+Kd9K8LGUkWGEe1jldGJZpc/tFAGUjIrmOORB/js20Dn9Qg+f0NuNFipWvAt
 UjLBswsFylNtFPGblQuo3DaFjdPBNh+LFeGUFs5NKv1uuXxE+vzdWMYpdRcaXdTH8qpt
 MIag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Aa13zQ7giAP62TWcUaUMtr6UzYCBsQUKHFJYOsGW7SY=;
 b=JJJkRNKoboiHHL8MUMN5205elYyitxP1xAiJNxoZGwTylo26uVgk6EAKGttjXOyjz3
 Iuq9K3WlB2d207SF+zfoetv5NG/yDIAymOiMLaMEIGQjvG7APIkMlApBk5xG5CJJAq+u
 504nVvQoIzXcCDdquwp/GhlX1ELub7x91LXaAacOJa408w+kO9ZbT8l/eIxlA7z+IEm5
 5eeoqNsf1J9ZtldQg2scvTe3Vi/0Kdpjc03bNTpPDyZSxyFFQFl7gG0hw5KEP9AgPGXN
 hcWfFkkhUI8ncMAKanpOn9P/oxkcK1JpWAr71DKu56HXWBhX1/wMwmFFMMwXg8Erj2Ca
 lO4g==
X-Gm-Message-State: AOAM5338AnMAf6vEMLmz6/RO7aaM4NKZ7y3R6P53WjSd+1zwY129NtEP
 o/NDGjxufYciEss1n8ztdws=
X-Google-Smtp-Source: ABdhPJzSYZVwL0MvX4mnQ019vfEPaARvRU1Y//ent/z/wxWPckJyH5OsTY4DN0SVxaqWOrDeEqcLxw==
X-Received: by 2002:a5d:4747:: with SMTP id o7mr6036241wrs.11.1589575664068;
 Fri, 15 May 2020 13:47:44 -0700 (PDT)
Received: from localhost.localdomain
 (p200300F137132E00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:3713:2e00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id r11sm5296211wma.35.2020.05.15.13.47.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 13:47:43 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: khilman@baylibre.com,
	linux-amlogic@lists.infradead.org
Subject: [PATCH v4 1/4] dt-bindings: power: meson-ee-pwrc: add support for
 Meson8/8b/8m2
Date: Fri, 15 May 2020 22:47:06 +0200
Message-Id: <20200515204709.1505498-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200515204709.1505498-1-martin.blumenstingl@googlemail.com>
References: <20200515204709.1505498-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200515_134745_636447_3A0AF9C3 
X-CRM114-Status: GOOD (  13.25  )
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
Cc: devicetree@vger.kernel.org, narmstrong@baylibre.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The power domains on the 32-bit Meson8/Meson8b/Meson8m2 SoCs are very
similar to what G12A still uses. The (known) differences are:
- Meson8 doesn't use any reset lines at all
- Meson8b and Meson8m2 use the same reset lines, which are different
  from what the 64-bit SoCs use
- there is no "vapb" clock on the older SoCs
- amlogic,ao-sysctrl cannot point to the whole AO sysctrl region but
  only the power management related registers

Add a new compatible string and adjust clock and reset line expectations
for each SoC.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 .../bindings/power/amlogic,meson-ee-pwrc.yaml | 74 +++++++++++++++----
 include/dt-bindings/power/meson8-power.h      | 13 ++++
 2 files changed, 72 insertions(+), 15 deletions(-)
 create mode 100644 include/dt-bindings/power/meson8-power.h

diff --git a/Documentation/devicetree/bindings/power/amlogic,meson-ee-pwrc.yaml b/Documentation/devicetree/bindings/power/amlogic,meson-ee-pwrc.yaml
index 6c6079fe1351..2a1c933ae434 100644
--- a/Documentation/devicetree/bindings/power/amlogic,meson-ee-pwrc.yaml
+++ b/Documentation/devicetree/bindings/power/amlogic,meson-ee-pwrc.yaml
@@ -23,13 +23,19 @@ description: |+
 properties:
   compatible:
     enum:
+      - amlogic,meson8-pwrc
+      - amlogic,meson8b-pwrc
+      - amlogic,meson8m2-pwrc
       - amlogic,meson-g12a-pwrc
       - amlogic,meson-sm1-pwrc
 
   clocks:
-    minItems: 2
+    minItems: 1
+    maxItems: 2
 
   clock-names:
+    minItems: 1
+    maxItems: 2
     items:
       - const: vpu
       - const: vapb
@@ -38,18 +44,7 @@ properties:
     minItems: 11
 
   reset-names:
-    items:
-      - const: viu
-      - const: venc
-      - const: vcbus
-      - const: bt656
-      - const: rdma
-      - const: venci
-      - const: vencp
-      - const: vdac
-      - const: vdi6
-      - const: vencl
-      - const: vid_lock
+    minItems: 11
 
   "#power-domain-cells":
     const: 1
@@ -59,12 +54,61 @@ properties:
     allOf:
       - $ref: /schemas/types.yaml#/definitions/phandle
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          enum:
+            - amlogic,meson8b-pwrc
+            - amlogic,meson8m2-pwrc
+    then:
+      properties:
+        reset-names:
+          items:
+            - const: dblk
+            - const: pic_dc
+            - const: hdmi_apb
+            - const: hdmi_system
+            - const: venci
+            - const: vencp
+            - const: vdac
+            - const: vencl
+            - const: viu
+            - const: venc
+            - const: rdma
+      required:
+        - resets
+        - reset-names
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - amlogic,meson-g12a-pwrc
+            - amlogic,meson-sm1-pwrc
+    then:
+      properties:
+        reset-names:
+          items:
+            - const: viu
+            - const: venc
+            - const: vcbus
+            - const: bt656
+            - const: rdma
+            - const: venci
+            - const: vencp
+            - const: vdac
+            - const: vdi6
+            - const: vencl
+            - const: vid_lock
+      required:
+        - resets
+        - reset-names
+
 required:
   - compatible
   - clocks
   - clock-names
-  - resets
-  - reset-names
   - "#power-domain-cells"
   - amlogic,ao-sysctrl
 
diff --git a/include/dt-bindings/power/meson8-power.h b/include/dt-bindings/power/meson8-power.h
new file mode 100644
index 000000000000..dd8b2ddb82a7
--- /dev/null
+++ b/include/dt-bindings/power/meson8-power.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: (GPL-2.0+ or MIT) */
+/*
+ * Copyright (c) 2019 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
+ */
+
+#ifndef _DT_BINDINGS_MESON8_POWER_H
+#define _DT_BINDINGS_MESON8_POWER_H
+
+#define PWRC_MESON8_VPU_ID			0
+#define PWRC_MESON8_ETHERNET_MEM_ID		1
+#define PWRC_MESON8_AUDIO_DSP_MEM_ID		2
+
+#endif /* _DT_BINDINGS_MESON8_POWER_H */
-- 
2.26.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
