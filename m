Return-Path: <SRS0=gMfs=CN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C94C1C433E2
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Sep 2020 16:17:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76FBB20795
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Sep 2020 16:17:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tRzgjwmw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="duGjMiYD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 76FBB20795
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CsiZAUqnwhXWlLJIUAzmGBRMXpPsF+D2xdbHeU0+19M=; b=tRzgjwmwGCWPF9qU6GDTl7aOU
	3CwDRBgDcAVpAREiMtnja01fhUAeS2RokskIx+DN7FC2jU/60hQ52nB71HKt4OfpG1bG82BG1QQUH
	1WnRBFz+j94LOm1Lm/N63Fu5zV9ZZrAJwE2ZmkDmptKCaTO4pYBAgJJwYuzC2CzMbvwdgVnKk4nMp
	xicdll6QvXu2qIwo9w2SdH4zh/2PYlJBfs2BTij7Ivuj2n2dwSuK/MHbZz7kSUmAacvwam3Sy5J26
	6GDP0LfbU1CeqzIrh+VPd0DVwlWPJ2YW4k1gB4asl3MSEN7df5GutlaHM0lG52GwSaaYti3QsADAC
	96OLsWlsA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kEEOg-0007yk-Ts; Fri, 04 Sep 2020 16:17:06 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEEOb-0007vh-31
 for linux-amlogic@lists.infradead.org; Fri, 04 Sep 2020 16:17:02 +0000
Received: by mail-wm1-x32e.google.com with SMTP id u18so6572084wmc.3
 for <linux-amlogic@lists.infradead.org>; Fri, 04 Sep 2020 09:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FWk3qVSr7VGifs60LnXL8P2UIqTUMmu89eotjh18HA8=;
 b=duGjMiYDurbAFlsmF2zT3FDS+RxxrgtsawWMtijuXHwZK+Fo1alN7hoZhK4btSdefi
 yvoKS6N4sdY/6xk5ExFmo0Vbijv6Mjv6LzTGDOmxl+RqLLK/A4Es/1fbDI33lDN3myG/
 wufHWYj+8Ts08o6j3WmVcYNI6t2S7MOQfE0lVISwQHlDwS04j1BDHdWu70jx6sokndeL
 1MF2uZTguxpxMy4JHYyosywABiW6fFeTbBuZPz+fJqNOwSLNdTSfrbV5OQTkwGdmPOCp
 b/jmkP5wrSkomwdY8fJcYp+bxLv9xAXj0A9GX0CeWaQI5w2ZRyvshN1qQLsknyQ4pUWg
 NX+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FWk3qVSr7VGifs60LnXL8P2UIqTUMmu89eotjh18HA8=;
 b=d6kDhJF5b/nTlQlY1i70Yz9fQprrJuAp+R/EhJheHZ5fCTtzboELskcb/84o+1YAHf
 pnB1eF1XcmzncsG4NUayZPsAxWQZjKlwIUOJ5HMoISRUKMDBm8AwehrmeovkN0QqbrD1
 QPoT4SofxD/LybeK3/fD/mKn2xoEp9HneHw/ZUHGfR/yf1Ab5KmJWhuYUrmUbXxkj/Gs
 5D0PPuW5sbowKGOxyV06Q8YkTEktNRbIx6W7S/H7A8YeiLGTHXbHcQse8vXWNtgBs0yf
 apeNvePthnOvY63gG7uWXl/lLfHMSDmO04u4GP4evVEbcaDDOpwVtrEKl61YbW3humiN
 kUNQ==
X-Gm-Message-State: AOAM532um+7czJjmPmk0IQCSqo1c+3LUo+Wi7aja46POmNGG4sI+S1Ws
 QDx7H+E4OeoQ1422z08bFFxU7A==
X-Google-Smtp-Source: ABdhPJzUqXDH+qk0EuubbmJKx2M6DzZGUVc61Fkr0PNo8RNjgbB4iQwbqWcR7WrQTW70j4gqOjXsuA==
X-Received: by 2002:a05:600c:245:: with SMTP id 5mr8525601wmj.33.1599236219600; 
 Fri, 04 Sep 2020 09:16:59 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
 by smtp.gmail.com with ESMTPSA id d3sm5129543wrr.84.2020.09.04.09.16.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 09:16:58 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com,
	devicetree@vger.kernel.org
Subject: [PATCH RESEND 1/2] dt-bindings: power: amlogic,
 meson-ee-pwrc: add Amlogic AXG power controller bindings
Date: Fri,  4 Sep 2020 18:16:53 +0200
Message-Id: <20200904161654.24141-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200904161654.24141-1-narmstrong@baylibre.com>
References: <20200904161654.24141-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200904_121701_178156_F72FC4BE 
X-CRM114-Status: GOOD (  14.33  )
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
