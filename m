Return-Path: <SRS0=apJy=LZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16B05C11F69
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Jul 2021 21:52:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6457613EC
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Jul 2021 21:52:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6457613EC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=phystech.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H0TjD1ho943m3GZrYAAfphoZvI/acI6orovBZG7EtM4=; b=EdKwgQsc+7NR9o
	PdvKQpBQPxMJUkgROt/keNGYolGHt1M3r8xj7z0Or06EgrAKsCa4sCMnOkOxve0mVOui2CpZ/1pzz
	GEAlQ29v3cDDGAwrO8MCXyPOrX0ckuYoUTavz6TB4qqnrKPVNHEmIsLaavMn4mXWeHhHdadB3f7wE
	IH7Bc6CWQfEkfzLwYrlBTKX4FBzhVBgnYGbegSky9wMQdm+fxUYUWbMjALhaDblTjkWWSLEB5uieT
	GHXVZTe0vseDD7CT02l8evUAa6lMrVoFCxN+O+GbfDqeWywTJMIweDCT56fStrA/kvUPoi6IWlPTr
	k0NJxVBn/NA7m93rNBUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lz4bT-001Gnr-FA; Thu, 01 Jul 2021 21:52:11 +0000
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lz4bD-001GjG-Md
 for linux-amlogic@lists.infradead.org; Thu, 01 Jul 2021 21:51:58 +0000
Received: by mail-lf1-x142.google.com with SMTP id a18so14412833lfs.10
 for <linux-amlogic@lists.infradead.org>; Thu, 01 Jul 2021 14:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phystech-edu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n9H2RYUzAxMzTFYa2dyhL6m2ND68O6aW04RdAX2sGhA=;
 b=2E2GLhSab3SSwZCziA849REnaYd7HOMgv/72trOQOqe2WlVPKBwu0Ilzf/1sU6S0n4
 OD5qchiT9lV0bc1nDnwjxhn8srFQRE1Ol+DMWFAKnpgu/J1KQtujpsCn9C2qAiU7hfl/
 QEhUUb1uhY/yf8AAzGZYCa8C+8ujjCaqige5e8sYgvEu1yHrDYF0cgFPyYo9Ue49hgBl
 fiG5uH6KmNytO10UIRgp/XOjrkgLtZk3YN9dFjWrNZ7SXY9Lu1oBNCRYqUhRRodmx3k6
 +UrQlDO+YMgSoPq2zYqTF1FVkbBVJCRHUBKo1Lu1zqxWkQI2U03fSHZQdfA+qiPxhnAc
 DMSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n9H2RYUzAxMzTFYa2dyhL6m2ND68O6aW04RdAX2sGhA=;
 b=pybC3omXs7N1684Xkg8Q4GpjnQpKJ4BydinYng44eaM0fsmOW7D81q1HvJJyc4c2GP
 CSVdRPxQpkyjxzdHrfMxTEkJ0g4r5aPjnkXlRMVwvTwcA7RrwSEloso+xjJ9X4lKciK9
 MoDk3oDWRTLffotrZMnxoH9nPC9JXLkvCQrgvyTtKL1w+hOzZYE5HiL3OmOk+3KyzszI
 djhCCB2bA5cvbxm0XHr/fx0/r4UZT3ASFXVpeuI5Y9mXLqZ7cxS1t//epWC8NTf/x0oT
 ZROOL0lunmkOzmQHEAqi9+GDGtBTGqIb9KQ1DWLegJO9zEGekpN8XwAMljC4wK8wKq5d
 XqaA==
X-Gm-Message-State: AOAM5325SgzEsaS93v+M6AwgR99YzROWBA4rPbjjJxGHnWR4ULAiC3Lt
 B8FYy0S6BghSrasPdiM6mhb6Ig==
X-Google-Smtp-Source: ABdhPJzLqik42pLlcereFPQvwx8ghkJL/Z//ta6UloEqZjal1FWHgHx7gAzvQ3/CwNp57d/yt3qSaQ==
X-Received: by 2002:a19:c015:: with SMTP id q21mr1284580lff.219.1625176314040; 
 Thu, 01 Jul 2021 14:51:54 -0700 (PDT)
Received: from 192.168.1.3 ([2a00:1370:810e:4d3d:fdb7:f150:ee77:eba5])
 by smtp.gmail.com with ESMTPSA id q17sm138623ljp.3.2021.07.01.14.51.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jul 2021 14:51:53 -0700 (PDT)
From: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
To: sean@mess.org, mchehab@kernel.org, robh+dt@kernel.org,
 khilman@baylibre.com, narmstrong@baylibre.com
Cc: jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, rockosov@gmail.com,
 Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Subject: [PATCH 1/2] media: rc: meson-irblaster: document device tree bindings
Date: Fri,  2 Jul 2021 00:51:31 +0300
Message-Id: <20210701215132.16317-2-viktor.prutyanov@phystech.edu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210701215132.16317-1-viktor.prutyanov@phystech.edu>
References: <20210701215132.16317-1-viktor.prutyanov@phystech.edu>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210701_145155_783216_1AE1E745 
X-CRM114-Status: GOOD (  12.52  )
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
 .../media/amlogic,meson-irblaster.yaml        | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/amlogic,meson-irblaster.yaml

diff --git a/Documentation/devicetree/bindings/media/amlogic,meson-irblaster.yaml b/Documentation/devicetree/bindings/media/amlogic,meson-irblaster.yaml
new file mode 100644
index 000000000000..baecda092a78
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/amlogic,meson-irblaster.yaml
@@ -0,0 +1,63 @@
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
+    const: amlogic,meson-irblaster
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    minItems: 1
+    maxItems: 2
+    items:
+      - const: sysclk
+      - const: xtal
+
+  mod-clock:
+    oneOf:
+      - const: sysclk
+      - const: xtal
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
+    meson-irblaster@ff80014c {
+      compatible = "amlogic,meson-irblaster";
+      reg = <0xff80014c 0x10>;
+      interrupts = <0 198 IRQ_TYPE_EDGE_RISING>;
+      clocks = <&clkc CLKID_CLK81 &xtal>;
+      clock-names = "sysclk", "xtal";
+      mod-clock = "xtal";
+    };
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
