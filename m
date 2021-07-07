Return-Path: <SRS0=LiOq=L7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15AD3C07E9B
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Jul 2021 14:14:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7F7D61CC5
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Jul 2021 14:14:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7F7D61CC5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=phystech.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=//TgTWIx/Yl5a3ayQYgFt1XE585LEAIX8K7DTFNwvmQ=; b=ZtUsBDaZ9jn33e
	rUNH6pAeF5fsJ+4UmPuBlVb2BIHr71BOJZLP764kY2y5ixNgYqbjxZTr3jSv8XQ6TdpbUU1ltPc6t
	EYFQkQoQp0KsnExukXuJzyQ+gjxBin17LuKpGBeetxKbWSgZADYcLBHfKa8lX+ca2DAIiJp6eYki8
	ltPkpKLjpej62TPIBrcvQ71Gzye3n2xJnO6VRMpiNFrvNSlwuwOtgEMakKsfP2evXotd4H7Oe7emu
	ZF/9xvOWXPoa4V7A1YUVJ2iTVu02OWNa0uOc0em3Z87dHmk/fsC00a2eAe5GUdRPHy8HCSJNS4sxO
	fbz6AVBBShqFLCVYiohg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m18JW-00F2e3-FX; Wed, 07 Jul 2021 14:14:10 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m18J8-00F2Wd-Ev
 for linux-amlogic@lists.infradead.org; Wed, 07 Jul 2021 14:13:48 +0000
Received: by mail-lj1-x22a.google.com with SMTP id q184so2366993ljq.0
 for <linux-amlogic@lists.infradead.org>; Wed, 07 Jul 2021 07:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phystech-edu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D48upNITuZQ7GxH7t+3W6Zs1sM24tqoIWBJvLBt11aY=;
 b=kumI8yaxyXNAjfsGRunvWWmZwcXMYZe8/wCQAMwBdcpsgxLWJaSQ2A+OySWdvoLjYL
 aJI2+0W2ray3WizYeDGQsiEo+yZ7c0MO+XcngdKRGO7uXDzllfbJHUVuZykg55KywFlD
 WxJ1R1kwR6JjPH6ylkLAHzNFS/uUBqCBlWbuUF9+wo+LhKkwnr0kT0Qr3MM9gSbwoAKG
 JV+VuZFqHj+ZaOsunJvMG+L4Ui+fwGnt63sLQ23aDuEeg7q7ehhTfhDUb7ie2WlHAGZG
 Wel9HxdCRPKYDdeuJCbdo63G48z3FryA2rJEHV1Evapb+D28ys/uro7iMWHTWIVhZT6L
 cjDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D48upNITuZQ7GxH7t+3W6Zs1sM24tqoIWBJvLBt11aY=;
 b=uBSvuMnLSJSYQhizmb5m8Aa8GcdA6Nmtsgp5HQ+WeWjW1V1ALujHEyG1xr6AIhoNzG
 kHim8DahuIKOIcXonfiDoolrM4gJJgPjnlhxn2yPuzWTI8mkygYioIlMvMIYvD2YrelP
 YwcGiJhDaA9rTIuxxuyKObKPp0oMotNOk/+FCiJH4PINyQiLdtbr7kclXWxtctMFRQa3
 0n+VfeKGwnK38gwH+9auFXWELjfyEr2qX9q8cWu84VzAQ2+3xy/Nn1zen3JqhzvEp5FI
 GtHpoZzq9zcHeyIvUU6qo9YZ0j2WmSCRDkFvjmGbW+0UsXkbApONaWM+nPhRdYGdesiZ
 13LA==
X-Gm-Message-State: AOAM532svTGOlqLvYspOASwrtiaSVmg0nvGUC0LtiZcFsPrKsGc5+jnR
 C75rNQTQruNBKUFrKS7dbOao3Q==
X-Google-Smtp-Source: ABdhPJwFuTbf0DDVJF2QxYY3TBGA3dij2GWhA8mkPDMipPjERDQrxv5hPiRoDq9+mSPRZFQbH14/cg==
X-Received: by 2002:a2e:7306:: with SMTP id o6mr19670986ljc.125.1625667224544; 
 Wed, 07 Jul 2021 07:13:44 -0700 (PDT)
Received: from 192.168.1.3 ([2a00:1370:810e:abfe:9c62:44e3:b0ab:76fd])
 by smtp.gmail.com with ESMTPSA id a26sm205077ljq.120.2021.07.07.07.13.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jul 2021 07:13:43 -0700 (PDT)
From: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
To: sean@mess.org, mchehab@kernel.org, robh+dt@kernel.org,
 khilman@baylibre.com, narmstrong@baylibre.com
Cc: jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, rockosov@gmail.com,
 Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Subject: [PATCH v2 1/2] media: rc: meson-irblaster: document device tree
 bindings
Date: Wed,  7 Jul 2021 17:13:22 +0300
Message-Id: <20210707141323.20757-2-viktor.prutyanov@phystech.edu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210707141323.20757-1-viktor.prutyanov@phystech.edu>
References: <20210707141323.20757-1-viktor.prutyanov@phystech.edu>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210707_071346_558618_9F57D41B 
X-CRM114-Status: GOOD (  13.21  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patch adds binding documentation for the IR transmitter
available in Amlogic Meson SoCs.

Signed-off-by: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
---
 changes in v2:
   - compatible = "amlogic,meson-g12a-irblaster" added
   - clocks, clock-names and mod-clock updated

 .../media/amlogic,meson-irblaster.yaml        | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/amlogic,meson-irblaster.yaml

diff --git a/Documentation/devicetree/bindings/media/amlogic,meson-irblaster.yaml b/Documentation/devicetree/bindings/media/amlogic,meson-irblaster.yaml
new file mode 100644
index 000000000000..711b7e029275
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/amlogic,meson-irblaster.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/media/amlogic,meson-irblaster.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Amlogic Meson IR blaster
+
+maintainers:
+  - Viktor Prutyanov <viktor.prutyanov@phystech.edu>
+
+description: |
+  Some Amlogic SoCs such as A311D and T950D4 have IR transmitter
+  (blaster) controller onboard. It is capable of sending IR signals
+  with arbitrary carrier frequency and duty cycle.
+
+properties:
+  compatible:
+    oneOf:
+      - const: amlogic,meson-irblaster
+      - items:
+          - const: amlogic,meson-g12a-irblaster
+          - const: amlogic,meson-irblaster
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: sysclk
+      - const: xtal
+
+  mod-clock:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/g12a-clkc.h>
+
+    irblaster@ff80014c {
+      compatible = "amlogic,meson-g12a-irblaster", "amlogic,meson-irblaster";
+      reg = <0xff80014c 0x10>;
+      interrupts = <0 198 IRQ_TYPE_EDGE_RISING>;
+      clocks = <&clkc CLKID_CLK81>, <&xtal>;
+      clock-names = "sysclk", "xtal";
+      mod-clock = "xtal";
+    };
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
