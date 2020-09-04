Return-Path: <SRS0=gMfs=CN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 214C7C433E2
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Sep 2020 16:05:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCFD32074D
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Sep 2020 16:05:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MdZtWvix";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="BXn6l57w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCFD32074D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CsiZAUqnwhXWlLJIUAzmGBRMXpPsF+D2xdbHeU0+19M=; b=MdZtWvixO0+BQjj6xQWtvz8p4
	e1T5I8CvzflmoJfAP3QgtqiYeS3vFseD+MhW1zM+KVlSXXKJWIcvKRAUl/XAbZUBscrcPSGnVRNBd
	WcWfJKkl/eOl42ExshjepT9Jb82BYT9N1yx8lx7cU96eCfVcnhooBujfeKlY481pyk6PcQ806PQJy
	YOQ0VyBMPOKrveliq7gPmGZNYzvPS8dDZoa9AxDqw2d/gs6v56/7P71CpRep7P09CA0Q2Z4vUpdOP
	Gt9iJloeRs0IxEWwPENpD+ZJNJq1C4e+YZCFXSCxkGaowpCdMmSirS5FrDI32qWe6gBo91Y9Uygks
	gTHkWGTZw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kEED5-0005SG-RJ; Fri, 04 Sep 2020 16:05:07 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEED2-0005QD-Kr
 for linux-amlogic@lists.infradead.org; Fri, 04 Sep 2020 16:05:05 +0000
Received: by mail-wr1-x442.google.com with SMTP id z4so7271333wrr.4
 for <linux-amlogic@lists.infradead.org>; Fri, 04 Sep 2020 09:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FWk3qVSr7VGifs60LnXL8P2UIqTUMmu89eotjh18HA8=;
 b=BXn6l57w9qyXVibrJ5jp9i/JzzB7TN9JxbjHYo/O+r526kqzhSOyXk9qmnsnZ5VwMe
 LsRiQI0Y0VNBSFNJWrkazfgBZcWbmixUz/l51Lt2E3jJCypNX2eSBd5+sWTBmj5B9zJ/
 qRkyP0l0ly2ICs/EEymKRhkXWq5mjReaPjxsUdOxPXqmpVT0mPwOSe6EyfXqpcxkNg7r
 WjbTgIXvH07ChtQ5xN43TGsCbvTyXHFsvA8Ubi9hg37LLvvyqnYuj+UvCera7/36RjSc
 ezJ5p7OMWU2lsn3z2IjUn4jp5b0Z8UPgrJUXXH0WY6iY4bYczZjsMZjjXc/Y3uSISCM8
 6mug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FWk3qVSr7VGifs60LnXL8P2UIqTUMmu89eotjh18HA8=;
 b=RVqVP0GUiOtLdCoTGpRaMPA4aGcMgTbEPToDgsYG8QqkW6CaZaSSUfytF3VJbP0Cam
 cisUQDuJ51XX048SWloZVWLx1SCTAv38j0mOLq3/nxeVtelQjaZL+9GX7qnYGgUdUVh6
 tkZ4IxkCQTgomlkooOCDOWR/led1BY3hVFBOjTT1fIZCrCMydzWP9MVH8lGqrqLwEVf1
 /ETc9pahokRasbtT7TnVmd3DXzYJKNGoWOyPVcbd4ThHLZxyKsH250DIO3ppm9HAAyc/
 /ER+Mcpq5XR8EaBJNb8rh4cH4J36cKT+8nBsws07qgLQSUo1Gbpa1zlP7Z31tSPsd1rg
 M6Sw==
X-Gm-Message-State: AOAM530QLv7TCATYov9GkfAaVKiX2CBGF9ylDFTptFPdhyFei/WCh0US
 vdLnmWIQrDhW+5ba8b/VnfTOahI5Rq0v2QXB
X-Google-Smtp-Source: ABdhPJyCOtL0gp+SuW6a5ho/NkzYsNKxyg3bl+zCQz5P7ZG/gjzESGsHaNHpYzmDjWXhoLt4yfDN3w==
X-Received: by 2002:adf:eb86:: with SMTP id t6mr1931676wrn.411.1599235503477; 
 Fri, 04 Sep 2020 09:05:03 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
 by smtp.gmail.com with ESMTPSA id o9sm12038486wrw.58.2020.09.04.09.05.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 09:05:02 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 1/2] dt-bindings: power: amlogic,
 meson-ee-pwrc: add Amlogic AXG power controller bindings
Date: Fri,  4 Sep 2020 18:04:59 +0200
Message-Id: <20200904160500.22924-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200904160206.22570-1-narmstrong@baylibre.com>
References: <20200904160206.22570-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200904_120504_798333_497B2C56 
X-CRM114-Status: GOOD (  14.51  )
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

This adds the bindings of the Power Controller found in the Amlogic AXG SoCs.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../bindings/power/amlogic,meson-ee-pwrc.yaml | 23 +++++++++++++++++--
 include/dt-bindings/power/meson-axg-power.h   | 14 +++++++++++
 2 files changed, 35 insertions(+), 2 deletions(-)
 create mode 100644 include/dt-bindings/power/meson-axg-power.h

diff --git a/Documentation/devicetree/bindings/power/amlogic,meson-ee-pwrc.yaml b/Documentation/devicetree/bindings/power/amlogic,meson-ee-pwrc.yaml
index 4f524f822e84..d30f85cc395e 100644
--- a/Documentation/devicetree/bindings/power/amlogic,meson-ee-pwrc.yaml
+++ b/Documentation/devicetree/bindings/power/amlogic,meson-ee-pwrc.yaml
@@ -27,6 +27,7 @@ properties:
       - amlogic,meson8b-pwrc
       - amlogic,meson8m2-pwrc
       - amlogic,meson-gxbb-pwrc
+      - amlogic,meson-axg-pwrc
       - amlogic,meson-g12a-pwrc
       - amlogic,meson-sm1-pwrc
 
@@ -42,11 +43,11 @@ properties:
       - const: vapb
 
   resets:
-    minItems: 11
+    minItems: 5
     maxItems: 12
 
   reset-names:
-    minItems: 11
+    minItems: 5
     maxItems: 12
 
   "#power-domain-cells":
@@ -107,6 +108,24 @@ allOf:
         - resets
         - reset-names
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - amlogic,meson-axg-pwrc
+    then:
+      properties:
+        reset-names:
+          items:
+            - const: viu
+            - const: venc
+            - const: vcbus
+            - const: vencl
+            - const: vid_lock
+      required:
+        - resets
+        - reset-names
+
   - if:
       properties:
         compatible:
diff --git a/include/dt-bindings/power/meson-axg-power.h b/include/dt-bindings/power/meson-axg-power.h
new file mode 100644
index 000000000000..e5243884b249
--- /dev/null
+++ b/include/dt-bindings/power/meson-axg-power.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: (GPL-2.0+ or MIT) */
+/*
+ * Copyright (c) 2020 BayLibre, SAS
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ */
+
+#ifndef _DT_BINDINGS_MESON_AXG_POWER_H
+#define _DT_BINDINGS_MESON_AXG_POWER_H
+
+#define PWRC_AXG_VPU_ID			0
+#define PWRC_AXG_ETHERNET_MEM_ID	1
+#define PWRC_AXG_AUDIO_ID		2
+
+#endif
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
