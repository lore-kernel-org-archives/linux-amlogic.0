Return-Path: <SRS0=t7Bi=WE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C43BC433FF
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Aug 2019 08:55:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D03B72173E
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Aug 2019 08:55:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZljzkXU7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="085HPgPD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D03B72173E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JnjyH++OUBpL3zjgmvok/6cLz0ie0zRyjX/U41usz1c=; b=ZljzkXU7sOKWDG
	7p7ms7z74qPRKCUY5xiP8yseeEOAgzXqwZdFR2smQilcZz6m8BDq+gRMtUEF47HgTs58Jd8Eee1va
	X6w+Ggx7sZT3rA5rDG73csRy9jJrsO0brOrRIlsCSwiqqut4o2iVodpdj/8ke1xAwHzj6is/T32Pw
	AI+yRNAQiDiDg6U9jA6LIE9Bss7gOAINe3E2tx/vORrmVv4Sgpq3oMnfmkqpROEcKKEoujQTi9/pB
	KM6KQCwryeiNmMDCx8p5IatAmBhHUWwRll+AIQy2L2uR/w8Y5xI25mdoFYQFpzsLCAoS+b8p/oOsD
	Pwm/oze8f81qoORb6ezw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hveCW-0004bx-2O; Thu, 08 Aug 2019 08:55:12 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hve9G-0000eI-Jq
 for linux-amlogic@lists.infradead.org; Thu, 08 Aug 2019 08:51:58 +0000
Received: by mail-wm1-x344.google.com with SMTP id p74so1556558wme.4
 for <linux-amlogic@lists.infradead.org>; Thu, 08 Aug 2019 01:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x4bXtEWTaRCFx8YfX85ELnedQT6Jwcsnd8GE4lw4kXo=;
 b=085HPgPDQ0N5PTt53cQWFodc9dxIUFjGs+st4Q2qtb+nGm/5Af05U4Yx9B9cewCCud
 JKPEk0gvFur0u7DpSraYsjcBaq3SbePLfLgomfjRuLEm0pias7afDstgDZGmcCaMljEP
 yGhtdOBwlRAS6ll8OWzoWqBT1gq9DPC2f2uwtfzpJKehETZqBbtQwKdt2r8Rp8R3keCy
 Am4fvyistL5qnOv8I6NlrMUq8i67kX74Dn2PhxXrmsEvDjO8i9IA9yI804ojl77jrkMp
 QxZMQGJfcK0WMQYoZ3OgS1k45KWtMiFbnkWdJINPnhkSqFpw4nUTZNpUD6hluhZUEMCg
 uLqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x4bXtEWTaRCFx8YfX85ELnedQT6Jwcsnd8GE4lw4kXo=;
 b=cm7BOgSAIJ3vA0PLp3Jr8hwEmqd6kZWZpmX7V7+x/ST0MiEPo+AHZ45YmNhkYZwjH+
 6a6cjNGqibhanWglzMbyNjREScUnOhsplEtc1/Z+Td4shIFnUzpBrrVB3xmRZd/brb9p
 +6dx3lWVArF4/MosPIe6aNZUsbSP5vqNq3KgIT3aatOUuMU8soXaa5X9Wb2SfmmDGiT5
 ODLqZvEhVevKpepzH/lSShTKl9vXt39iIWT/CetrQWbY9zd/LFbOuGS23joHujYW1Euw
 R+kezXYT7+SpmtUoTecYp+HYGJoqET7PR4AQnI0LFLJLq4CkXRkKfJPECXcJUyl80zDn
 4oRA==
X-Gm-Message-State: APjAAAXLHfVcZFD5sFd4V9NXVBxO1VQJnZNF2Xy44yEQp14u2NerP4L+
 jX7hxAZ3sWyre1ri6UhkDAk+0g==
X-Google-Smtp-Source: APXvYqzAOom3OF14Yxh8TWXbG4DY8j5GejfsQ9NTKdZAyaXdE18kUaBOcC7YBG8YJKoUPv99y3WXfQ==
X-Received: by 2002:a1c:7e85:: with SMTP id z127mr3125738wmc.95.1565254308991; 
 Thu, 08 Aug 2019 01:51:48 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id i66sm3360031wmi.11.2019.08.08.01.51.48
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 08 Aug 2019 01:51:48 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: robh+dt@kernel.org
Subject: [PATCH 9/9] dt-bindings: watchdog: meson-gxbb-wdt: convert to yaml
Date: Thu,  8 Aug 2019 10:51:39 +0200
Message-Id: <20190808085139.21438-10-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190808085139.21438-1-narmstrong@baylibre.com>
References: <20190808085139.21438-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190808_015150_967709_EBC1A96B 
X-CRM114-Status: GOOD (  11.85  )
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
Cc: Rob Herring <robh@kernel.org>, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Guenter Roeck <linux@roeck-us.net>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Now that we have the DT validation in place, let's convert the device tree
bindings for the Amlogic GXBB Watchdog timer over to a YAML schemas.

Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../watchdog/amlogic,meson-gxbb-wdt.yaml      | 37 +++++++++++++++++++
 .../bindings/watchdog/meson-gxbb-wdt.txt      | 16 --------
 2 files changed, 37 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml
 delete mode 100644 Documentation/devicetree/bindings/watchdog/meson-gxbb-wdt.txt

diff --git a/Documentation/devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml b/Documentation/devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml
new file mode 100644
index 000000000000..d7352f709b37
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml
@@ -0,0 +1,37 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2019 BayLibre, SAS
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/watchdog/amlogic,meson-gxbb-wdt.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Meson GXBB SoCs Watchdog timer
+
+maintainers:
+  - Neil Armstrong <narmstrong@baylibre.com>
+
+properties:
+  compatible:
+    enum:
+      - amlogic,meson-gxbb-wdt
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description:
+      A phandle to the clock of this PHY
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+examples:
+  - |
+    watchdog@98d0 {
+          compatible = "amlogic,meson-gxbb-wdt";
+          reg = <0x98d0 0x10>;
+          clocks = <&xtal>;
+    };
diff --git a/Documentation/devicetree/bindings/watchdog/meson-gxbb-wdt.txt b/Documentation/devicetree/bindings/watchdog/meson-gxbb-wdt.txt
deleted file mode 100644
index c7fe36fa739c..000000000000
--- a/Documentation/devicetree/bindings/watchdog/meson-gxbb-wdt.txt
+++ /dev/null
@@ -1,16 +0,0 @@
-Meson GXBB SoCs Watchdog timer
-
-Required properties:
-
-- compatible : should be "amlogic,meson-gxbb-wdt"
-- reg : Specifies base physical address and size of the registers.
-- clocks : Should be a phandle to the Watchdog clock source, for GXBB the xtal
-	   is the default clock source.
-
-Example:
-
-wdt: watchdog@98d0 {
-	compatible = "amlogic,meson-gxbb-wdt";
-	reg = <0 0x98d0 0x0 0x10>;
-	clocks = <&xtal>;
-};
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
