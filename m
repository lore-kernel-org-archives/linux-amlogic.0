Return-Path: <SRS0=nwdc=C2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D6BEC43461
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Sep 2020 06:47:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17AFA2074B
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Sep 2020 06:47:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HnHZQxVO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="QlhqD01D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17AFA2074B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9vkCaURq25DoJJiUtt6/EcCGr2iMKHB3GkZqagec0g4=; b=HnHZQxVOy4nDy2PKbxwX/W/3A
	RFb5rkFRecjwEZCiOKJNbVtWCBALCKLDpe52SG3n/1V2I5oH818KpezZZh2eRxk/HC7BWmu1rjnc2
	IaFwv2YdawRPLGZuUT/5Z8NSFfYIyVsNQgygVMxAfJ/rjr42PyQmE11LN3SLXZExNBHZB3P5lUhmH
	TDy7t/SIBd04GMLANWgp9oD4X4cdnDQo4pIcQqZgi+VxLyoi+c4uOtdpwYro53ZRVYYY2bl0F4yW0
	zhWoEGbySudHl6JnFYTqJRVp1OtyZM2duFwcC6VSWvpeAC8iaDDiE/Y1l34kt9KLw+ksYfrgtLiqb
	Vk5w3T84Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kInhT-0006h5-St; Thu, 17 Sep 2020 06:47:23 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kInhG-0006bg-Ux
 for linux-amlogic@lists.infradead.org; Thu, 17 Sep 2020 06:47:12 +0000
Received: by mail-wr1-x42d.google.com with SMTP id o5so728877wrn.13
 for <linux-amlogic@lists.infradead.org>; Wed, 16 Sep 2020 23:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YHTRbSYxiwB3ZQDUmxVKEyXQSDMyANy7ZOYYgytHKAA=;
 b=QlhqD01DrDGFTX1xNMS4ZO5VEJ9/raT3dY10P/Zw2hTR94Skm6WAiAAU81PST0DAqH
 q+rMkfmQwGpA+ZNn9UOb2tr3/OVYlYJu3t/ilm4+NYTy+pGEW8dbuWpyELG4VVIqdfB8
 4M8RiJZNx47fdlpnwzS5bmfh+VRbYQVQx8txafbC2UqaOG8oFqzV7DY/BI4Poj48RXH5
 +UhvtC8dbScM5tJtksdKLqwSuwHtJVti+ag+4VwC5gebJxrSkNJ3J9nQNLD/KcP3ZBj8
 MW9jGeaLnBkK0RUItsv7nbt3Uvl9h2O/MZGdVWQfTXbL81RTn4pWkhhZklCg0GSSmunY
 11cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YHTRbSYxiwB3ZQDUmxVKEyXQSDMyANy7ZOYYgytHKAA=;
 b=hN55u1hYp1ZvdLNTrhzTpacextHHUjog5u6EvUm6CunQo30o9+d9K816oPs3Fn68EV
 7BfjIHHJcWHNhJ37A+G5630J++jNkEF5/lxa+m9mTB18MrGw33MjQXMBpKVKQ1W3U/KC
 tGDs7touzWtn4IXrzN3EeJStNnz5Sv2rv93sVBngwXoFTwLseYDWBRjzyMt7OZ0Ie1Ix
 CAXARphBg09GqALiDgSW79QQ0+p9g03WAZ7xp1SIFxn0XzsxbGa1bFlGVoTSoQXok0wQ
 kdK/bMT319wttX/evUPfb1U56zeoQvdc/jOm6Hkb6ajF7WZqPrfXrMOEaYbrP8WFNnJk
 rzkw==
X-Gm-Message-State: AOAM532A+3J6xdLev/HINhVMfmbYwXfdGwhO6cj4rv421L7GzkzN2gnu
 hKCGN/QMF/Keizm5cN1uNcYJUg==
X-Google-Smtp-Source: ABdhPJxxOngjpGTOMOIimvND/eMb+ZnzvjapG2m/s/ngeNrtLBfT0YebWIFLbPnbSpWgQt7+efFd9g==
X-Received: by 2002:adf:f106:: with SMTP id r6mr30908636wro.106.1600325228729; 
 Wed, 16 Sep 2020 23:47:08 -0700 (PDT)
Received: from bender.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id q4sm38516552wru.65.2020.09.16.23.47.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2020 23:47:08 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: power: amlogic,
 meson-ee-pwrc: add Amlogic AXG power controller bindings
Date: Thu, 17 Sep 2020 08:47:01 +0200
Message-Id: <20200917064702.1459-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200917064702.1459-1-narmstrong@baylibre.com>
References: <20200917064702.1459-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_024711_029093_C01F0696 
X-CRM114-Status: GOOD (  14.07  )
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
Cc: Rob Herring <robh@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This add the bindings of the Power Controller found in the Amlogic AXG SoCs.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
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
