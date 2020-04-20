Return-Path: <SRS0=tbsV=6E=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5022EC3815B
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Apr 2020 20:26:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 259952078C
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Apr 2020 20:26:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="acDHhO0U";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="o/PiQFqk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 259952078C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZGTgvHH3WbNcIPInX0NeGcHgV+q7KbNDRrW42Q92XqQ=; b=acDHhO0UlLD2rB
	k49UnkzXCylS90lh2cfZksySaMSvv1fN8iqRGn2tVJoaIaqzitgL1LkchPYmsAvF3jVxs390z+PgR
	vI/BDPu3nrBjj8j5W3o+wKBLwIQ6D5hW1soWI7FHXssr9o8Ye8/IGRiGjoVnyseSTVrJv/TfGl59E
	kqWis4aHxf7TMDZtXX0bbR1wYtjUswfudzu62Y8lmzh5y08w1/Lp9lajIQSUi47r09WuQ/4wx50vz
	vpquAFIoB8PtbHx12XDFM5jhDaYyhXGYFtFEaZZ8gRa81BTt8ELtuyzPvnKGKnHCMS5z7THhZPCni
	FT6vreanavw+v0Pozr6Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQczt-0000lb-FU; Mon, 20 Apr 2020 20:26:29 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQczp-0000j7-Qh; Mon, 20 Apr 2020 20:26:27 +0000
Received: by mail-wm1-x343.google.com with SMTP id x25so1046953wmc.0;
 Mon, 20 Apr 2020 13:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rnh+McsJx0RoUC/D7GUKGKHfeXKqPCTz0PtdlxFfOB4=;
 b=o/PiQFqksFUYRPMkKFrQgndQGSJI9ciJA357NNeXzTWM8lsoquahb/EEL97Vh+UH2x
 5cTlZIirnZjKLz3ekAkfMfpXBcSccl4hMZbGcyuOlRAkl7ol9DzoVh9o9xxZJH31dxLo
 va3bSTHUakRiApC/nkd6pEKKDqyMyuiXzWxa8p3d2X0YnUcqDzMktzcQGKC7KwSCqtPm
 YhoqjUVq5fCPIIi91mYg72KS5bO407J8/xuqaZ95at7DXw1AEKvioh1gAc4PDviiA64y
 yoqWw+IzQTJFdGQZDMwwYxxYMt21LsfhG+MXDpqeZySPu6Na75Frr7gR/8bRx5gVwYFd
 vmAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rnh+McsJx0RoUC/D7GUKGKHfeXKqPCTz0PtdlxFfOB4=;
 b=IfEXBib74MPJzp8MjH+jNj1WLNXOR7K7htOxaJhJSn89PslfNyN9UhhhrBX/0wAkiL
 diE5z47kBNvAsgxqApXZs98k6AgUUMtlZRYVc14muydCf1LaTq5TJXogyEWWobh78nm+
 7NYRl1pjmqmFDFa+7VPXsYOr6YiTnApPC9iwmX8tOmTu5+ThYkXekG2dZ25XNlXb4xAi
 4tMUI4gOVvajmnccYkCv1hP1Nuyg0pF1k4CfTEVztCbwr8FG8AtIGa9x83+rRTZqYVTv
 P2uA64/qA8G9HF+E+rhPT1OSDvuFzek4QcTFI0bRWTwwKbaD3kLhWEixHZh4fBI4FaSl
 Ztpw==
X-Gm-Message-State: AGi0PuaWrIqDkqxBvqfxjJtGaOuGkLOaHt7Cy3/Ysupn5pMrWTXzvyfF
 OotDYdaeEU4MEAT5d06wQdo=
X-Google-Smtp-Source: APiQypKZQvp7B+IRpQsVNj52BY2L/RrQ0bY8cTNf87BOA6UpV1lzLCYZmUrbDf4YEkV5+FW5fNomog==
X-Received: by 2002:a05:600c:2316:: with SMTP id
 22mr1141143wmo.164.1587414384242; 
 Mon, 20 Apr 2020 13:26:24 -0700 (PDT)
Received: from localhost.localdomain
 (p200300F137142E00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:3714:2e00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id l19sm657846wmj.14.2020.04.20.13.26.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 13:26:23 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: robh+dt@kernel.org, khilman@baylibre.com, narmstrong@baylibre.com,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH v3 1/4] dt-bindings: power: meson-ee-pwrc: add support for
 Meson8/8b/8m2
Date: Mon, 20 Apr 2020 22:26:09 +0200
Message-Id: <20200420202612.369370-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200420202612.369370-1-martin.blumenstingl@googlemail.com>
References: <20200420202612.369370-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200420_132625_860185_AA684656 
X-CRM114-Status: GOOD (  13.30  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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
2.26.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
