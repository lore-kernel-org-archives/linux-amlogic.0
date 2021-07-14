Return-Path: <SRS0=cPU3=MG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D71E5C12002
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Jul 2021 23:58:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0D5861377
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Jul 2021 23:58:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0D5861377
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=phystech.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ARMmp0HpSbTZyuYQJJIPacdKpc37ENXyqjKB746hwGw=; b=rlAiQoguC+R9VA
	DkQqklMT0d/h/WChFBBwmRP4sHQJmLokgSGvMgLnNlS7miij3fJtLcHTfY+2kwYsi/XU5Vm9F/cj1
	rQPrQG9aJ3UVqab1frqwNQC2pEl/Ia/OR90gCKEEcLPLK5HVdGVNh59KCen5AiS2BNgIE+2FKQahn
	sxM4jZgOn3amRmtdIdKJ5U/eelDS99VLn3/5RPythQ1Ra+eUEycUf3r1yWwqu4uk0lgFttOhW5ibU
	l82bpLClz27WYZwHB9B6s9NM7YUcbNoGjgq03D59CpR23G/e0jF5cYHDQ+WzoYinxCJk7b8ZT6/bb
	a80BXy2hiyB97HmQVh+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3old-00GU9K-Ie; Wed, 14 Jul 2021 23:58:17 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3mPX-00FP8B-ER
 for linux-amlogic@lists.infradead.org; Wed, 14 Jul 2021 21:27:22 +0000
Received: by mail-lf1-x133.google.com with SMTP id v6so6062109lfp.6
 for <linux-amlogic@lists.infradead.org>; Wed, 14 Jul 2021 14:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phystech-edu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5CCIvm8hXSdx2TujpbrlXspL0g5sYIpZoqTCzlboviQ=;
 b=SfAs/I+2DbGppQtITLGjESg5X+D3FRGlEBimGSQ9WYfp9x3Z17g/7QQzjZ2IAd3CgU
 v5Lh3Z45mdmsv3mmEOSJy9/kdzDi15JmD9fFZ6qjP6wfhGv3IhHjm3k9FOeEPmNf3B+N
 xUoyXhUXOXJBcU9sd0H1zt9nXrlovXPATkYSUVuMzBInpSijGOPBm6Ep6yCMXwD5Ft6a
 zFDxwJnu0v7/LOleaIA8sW1LQtNxnqbb5iysqk4lK7VzcelQgJj47BrHSh08Tm46QYfW
 x6nYlsMu1SUR4qWfze6TrgW1wSIWp3cS+lfDcuayxHZxF9Y5UjrHZmY9MlBhum/8P60i
 ptcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5CCIvm8hXSdx2TujpbrlXspL0g5sYIpZoqTCzlboviQ=;
 b=JtOFwZlIdYEiAv84Q4QbrLzg/CqsFMp5fly7n2QV26QIbGjDBVqc98ZjHiqUhqyVoz
 zp6vY8AND2suVfj6rVjlE1jQgAAs0wmOhYUhv0jF8wLeY32bjJxiQ2Bcsu8IiUNHyENF
 PZ6TVM9mnQ/WaqheyvZlGiY6JvjpdSnHbO8urvVAkJFTi8TVZwIrbOCKcCLLpLUcrEeV
 HkBSwx2WmRtYA9yoi0MX3qCdJqCm7MHLxFv5Qr1Q4DpOMza/+dEapSu7DZy0PAwTdADW
 P9pZ6KP6zBBPtSZKi+dat5U9TAHEHJPYPJWE7GocXDyQNfYz6gRsWGwJ6USggXWMNVGf
 ohAw==
X-Gm-Message-State: AOAM530EN/Shq2KcUtQdewpAbdDoVMjDjG9rIoDm9YSBoEUv4DGrEy9X
 xG4v89+SoeAl56ezqr/iAPLcVg==
X-Google-Smtp-Source: ABdhPJxfJygMkZY4rn0G6iVdyhfLRNVktcKAFttAbaPnqwDALGzDASmXZ7+nQ5CltBFHfnBh6kA0eQ==
X-Received: by 2002:a05:6512:23a6:: with SMTP id
 c38mr190537lfv.78.1626298037592; 
 Wed, 14 Jul 2021 14:27:17 -0700 (PDT)
Received: from 192.168.1.3 ([2a00:1370:810e:abfe:9c62:44e3:b0ab:76fd])
 by smtp.gmail.com with ESMTPSA id f1sm252156lfs.211.2021.07.14.14.27.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 14:27:17 -0700 (PDT)
From: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
To: sean@mess.org, mchehab@kernel.org, robh+dt@kernel.org,
 khilman@baylibre.com, narmstrong@baylibre.com
Cc: jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, rockosov@gmail.com,
 Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Subject: [PATCH v5 1/2] media: rc: meson-ir-tx: document device tree bindings
Date: Thu, 15 Jul 2021 00:27:05 +0300
Message-Id: <20210714212706.24945-2-viktor.prutyanov@phystech.edu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210714212706.24945-1-viktor.prutyanov@phystech.edu>
References: <20210714212706.24945-1-viktor.prutyanov@phystech.edu>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_142719_588446_91971B93 
X-CRM114-Status: GOOD (  12.60  )
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
 changes in v3:
   - mod-clock removed
   - max-fifo-level added
 changes in v4:
   - irblaster -> ir-tx renaming
 changes in v5:
   - max-fifo-level -> amlogic,fifo-threshold (fifo-threshold
     == 128 - max-fifo-level)
   - amlogic,fifo-threshold becomes uint32 in range [0; 127]

 .../bindings/media/amlogic,meson-ir-tx.yaml   | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/amlogic,meson-ir-tx.yaml

diff --git a/Documentation/devicetree/bindings/media/amlogic,meson-ir-tx.yaml b/Documentation/devicetree/bindings/media/amlogic,meson-ir-tx.yaml
new file mode 100644
index 000000000000..88655413495d
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/amlogic,meson-ir-tx.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/media/amlogic,meson-ir-tx.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Amlogic Meson IR transmitter
+
+maintainers:
+  - Viktor Prutyanov <viktor.prutyanov@phystech.edu>
+
+description: |
+  Some Amlogic SoCs such as A311D and T950D4 have IR transmitter
+  (also called blaster) controller onboard. It is capable of
+  sending IR signals with arbitrary carrier frequency and duty cycle.
+
+properties:
+  compatible:
+    oneOf:
+      - const: amlogic,meson-ir-tx
+      - items:
+          - const: amlogic,meson-g12a-ir-tx
+          - const: amlogic,meson-ir-tx
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
+  amlogic,fifo-threshold:
+    description: TX FIFO threshold
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 127
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/g12a-clkc.h>
+
+    ir@ff80014c {
+      compatible = "amlogic,meson-g12a-ir-tx", "amlogic,meson-ir-tx";
+      reg = <0xff80014c 0x10>;
+      interrupts = <0 198 IRQ_TYPE_EDGE_RISING>;
+      clocks = <&clkc CLKID_CLK81>, <&xtal>;
+      clock-names = "sysclk", "xtal";
+      amlogic,fifo-threshold = <32>;
+    };
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
