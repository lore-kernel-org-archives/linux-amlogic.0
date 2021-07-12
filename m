Return-Path: <SRS0=/T27=ME=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB96AC07E9C
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Jul 2021 20:18:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85FB1611CB
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Jul 2021 20:18:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85FB1611CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=phystech.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/XLKHuOdp9oR5D8s5C7LQh5ka7DApOhs6/QADaRhpKk=; b=yNF7AwvlQBC5QR
	DDc0JLAHilHovxuNXOKteZLRov+SWiDXLhPsE7+RMVseNJUezXrYnwqKTvyFSxxhswwwex5GSVM3z
	7ddgkXIjqf1TbJ3/iXzyQ7sNDWvQXKBP30sTW6kNrQDfdRJj3w4lizHRAE6nIyBguCtIP6WysNQdM
	XeQkd9pJvA3kJdLDbyiuV0W9EjEGBCfcUK+wC7Vl+fvwk1TWIpucdU1XfARQT6RhGCEiiSPtGwH/x
	MVN9pNGeK57peeLYmEvI0NJQn3szPDIu1byz5AtRV5+GPgmqqUHYqxa4BqvVTUjzBUPE9T8N5PeGm
	WLWuDJFSRrPREkYIJDeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m32Nm-008NiF-Ge; Mon, 12 Jul 2021 20:18:26 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m32NE-008NXh-C0
 for linux-amlogic@lists.infradead.org; Mon, 12 Jul 2021 20:17:55 +0000
Received: by mail-lj1-x22a.google.com with SMTP id s18so26267316ljg.7
 for <linux-amlogic@lists.infradead.org>; Mon, 12 Jul 2021 13:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phystech-edu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U0CDq6D7N0uIduUXgU1KLby9trLATxgF6NLRtkqcfuM=;
 b=b9j6bpm8dkpT6PGRro5JvQ75E2UnXlmJEjv9qHRrG0cnFhVWHt17uXVLDX79WHns2M
 vFNbFDvRxHSrWYn8s5Zo1pc3UAhcUzRK6N/14DK2Smt4wjN2IALRaX38mC/cq6DQKAZo
 4MErvB7VMDixK4j3iWqCLt/dLEGJfCEoDa4XR2btOvR/IVFHwCICVF2M63aRZVzKu3Vg
 +ArAtZp2tlwkuXI15PRlSMvgALoQHuuELoD2YfVyWi1LNK9qD05JNSmLFKFhAmdEj8aV
 BHZrpPHB/u/xzafqH1EmQ7LGJjqM6+vfsu298Q360OgsPGX+JBOjKSYahRnzjEfh9cuX
 J9QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U0CDq6D7N0uIduUXgU1KLby9trLATxgF6NLRtkqcfuM=;
 b=Y6JpFKyURTntBhc8rOdqLfYjFHcanQbt6RDSL8hMshIOfERBalQ94A5ajywt7UsCPd
 LlHPCZEut+k2pu01grVDW04RePSmrenxKH8mVsWln2PEjnlC2yYmpnr34+lfp7W7ulJB
 iV1Ip6emkgNq1IrtIlk1r7CG4SLz3B8FMgRwtyoGVnRGxEF95B0OJYWkzPq86sOYMaHj
 CHKBELkdBjenDhJL8Sya70pR8VYVnnzdV74s170WONJhFjscIj7VcS51NvmyUFvHPTuH
 vg4nI+m7Dklsq9cV2+f8YQxwDKPBOexqKUXQvlDEf5hk+EM00T03/p/wj9hlSaokvCG6
 hrBw==
X-Gm-Message-State: AOAM531W78i3l1k2Q7mC0loEfPMuHZudLh0TBhFOa0jMhLnKuZTXLW3E
 cGZxE7u9Xuh6wPHGcFcytemcsg==
X-Google-Smtp-Source: ABdhPJzTZJoLVgrTDU8np4pWKdsN7tUpSv2u6WjiSIrEaKKmtPzWt9oa3Fxx3P8mEUtgmbxVBl3dWg==
X-Received: by 2002:a2e:86c5:: with SMTP id n5mr769638ljj.433.1626121070334;
 Mon, 12 Jul 2021 13:17:50 -0700 (PDT)
Received: from 192.168.1.3 ([2a00:1370:810e:abfe:9c62:44e3:b0ab:76fd])
 by smtp.gmail.com with ESMTPSA id p16sm631455lfr.122.2021.07.12.13.17.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 13:17:49 -0700 (PDT)
From: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
To: sean@mess.org, mchehab@kernel.org, robh+dt@kernel.org,
 khilman@baylibre.com, narmstrong@baylibre.com
Cc: jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, rockosov@gmail.com,
 Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Subject: [PATCH v4 1/2] media: rc: meson-ir-tx: document device tree bindings
Date: Mon, 12 Jul 2021 23:17:31 +0300
Message-Id: <20210712201732.31808-2-viktor.prutyanov@phystech.edu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210712201732.31808-1-viktor.prutyanov@phystech.edu>
References: <20210712201732.31808-1-viktor.prutyanov@phystech.edu>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210712_131752_477441_ED660F3C 
X-CRM114-Status: GOOD (  12.68  )
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

 .../bindings/media/amlogic,meson-ir-tx.yaml   | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/amlogic,meson-ir-tx.yaml

diff --git a/Documentation/devicetree/bindings/media/amlogic,meson-ir-tx.yaml b/Documentation/devicetree/bindings/media/amlogic,meson-ir-tx.yaml
new file mode 100644
index 000000000000..f9f20e30be2f
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/amlogic,meson-ir-tx.yaml
@@ -0,0 +1,65 @@
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
+  max-fifo-level:
+    maxItems: 1
+    description:
+      Maximum IR TX FIFO fill level
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
+    };
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
