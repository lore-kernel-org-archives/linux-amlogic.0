Return-Path: <SRS0=kycw=MB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C76ECC07E99
	for <linux-amlogic@archiver.kernel.org>; Fri,  9 Jul 2021 16:58:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4453060D07
	for <linux-amlogic@archiver.kernel.org>; Fri,  9 Jul 2021 16:58:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4453060D07
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=phystech.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a1g/TgS2R26hjPR7MgAuRSd/p+BWS46fSbNtV9K2rIE=; b=I3sTFLlZW8uC9v
	WkbRBECGCgojw3aI1fPTiEeLcGhwCRhGLNruYIBnH/Z4YZPxzYuO6+E5HwirhXyH7hY8LvMTTaYE7
	Qs5f/HBPuvdOlcwzHnf+jpSBJHR00/TX8axBFPpLgkwZakDG5qzH15Fh1ytXzK/g2sCExva1oGqBB
	xH6/7LqO4D2UXoD15c46LSUK6kyalqaOSgNQHGdhTBT+VNPu+qmptzdd81hLnx67ZEj+VyuhmWwrF
	2SezJcAI8VYBfvcPNwEO7jMKF57mYaD4Yo9z+uSwcn5TDqa+P9i62V0l4g6+nF909pV/i6ECXPLYu
	BiI6aFx2PKtte0LWfboA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1tpj-002ANy-Al; Fri, 09 Jul 2021 16:58:35 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1tpK-002AHb-LJ
 for linux-amlogic@lists.infradead.org; Fri, 09 Jul 2021 16:58:13 +0000
Received: by mail-lf1-x132.google.com with SMTP id c28so24008762lfp.11
 for <linux-amlogic@lists.infradead.org>; Fri, 09 Jul 2021 09:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phystech-edu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n3cz26qHSCwc2rLWJL4aQ/NbqMK/zt0UOTvUQChL7jo=;
 b=bTgfzISd1HbuqsxfiAosM+S7moL2fCkghg+dY8eRFy1+C0QEl1nosujiaZ+XJJl84S
 ZqhuOlPycRTM6lCl9ehmX+W1QFnbMK/27MI0HI6W6CfoyJeekhGb7we+YzUFeBdlUiQ6
 nrY2jnQTrwkMgok1djyrLfyD7OZlpV5XjqWMBMqoMBspD1WrEm717VkBMzr35HusPghi
 CcFojq1Jqw0a5eQv03V6VoEVUDHRciOuuc+RLA4Y7vBtP5oLOwf11U0aTSaPGLZ6zU14
 uCFTdhe6oLB3YR/6EEaBq1ONocXA7zFRFp94ZaBvaBzwhrP0MdB9hSO1q/OB71eDQ8g8
 FqWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n3cz26qHSCwc2rLWJL4aQ/NbqMK/zt0UOTvUQChL7jo=;
 b=TGzH48+qoce1TTv3B641c32uaxHvZfl8I8f/IoCReqg9OWfQ8EwXmrp+kc6aheiBfT
 8YYYVDJnEY3/fMrteBz6JeUEoUcNhs72IfcFb5ppHjx4lVjWME7OVghA9gsx3PGaB+je
 FxV03X2B7+PqmH0qB/rdmnROlujmlMcbJsT3yYVpBWh93Dqy97r+eaQO919QsuyIEzfV
 lIBd1q/ZJyU6DwabsVdqa6bstFHADXlPr0tzXpnOhlk20ogX8iTJPhYr1NSpktAwhGrt
 sKXBxc0lz0d2sDJBhpEUphTM2RAq3D3zZWu+WzFVqrmDbLlYeDhNXEzZNjWCqtwL3H7j
 HCLw==
X-Gm-Message-State: AOAM532ggGteVxokPia3OY+MVEjbNFzALfgjQU4/xU8KQLEv+NIlfBHu
 xAqEDaYmLU6fvjQR9zs6k5n4Lg==
X-Google-Smtp-Source: ABdhPJz9VvpTDQBL+U/op1YR9gFF1JBbz7jbMDfOvRt9pYy+Xe2MbIx9mWD2BV+gau/jH/Xk4gBAlg==
X-Received: by 2002:ac2:4d42:: with SMTP id 2mr7893418lfp.465.1625849888699;
 Fri, 09 Jul 2021 09:58:08 -0700 (PDT)
Received: from 192.168.1.3 ([2a00:1370:810e:abfe:9c62:44e3:b0ab:76fd])
 by smtp.gmail.com with ESMTPSA id i130sm504107lfd.304.2021.07.09.09.58.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 09:58:08 -0700 (PDT)
From: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
To: sean@mess.org, mchehab@kernel.org, robh+dt@kernel.org,
 khilman@baylibre.com, narmstrong@baylibre.com
Cc: jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, rockosov@gmail.com,
 Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Subject: [PATCH v3 1/2] media: rc: meson-irblaster: document device tree
 bindings
Date: Fri,  9 Jul 2021 19:57:52 +0300
Message-Id: <20210709165753.29353-2-viktor.prutyanov@phystech.edu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210709165753.29353-1-viktor.prutyanov@phystech.edu>
References: <20210709165753.29353-1-viktor.prutyanov@phystech.edu>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210709_095810_764653_950310E8 
X-CRM114-Status: GOOD (  12.30  )
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

 .../media/amlogic,meson-irblaster.yaml        | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/amlogic,meson-irblaster.yaml

diff --git a/Documentation/devicetree/bindings/media/amlogic,meson-irblaster.yaml b/Documentation/devicetree/bindings/media/amlogic,meson-irblaster.yaml
new file mode 100644
index 000000000000..1e10aa0d3a94
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/amlogic,meson-irblaster.yaml
@@ -0,0 +1,65 @@
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
+  max-fifo-level:
+    maxItems: 1
+    description:
+      Maximum IR blaster FIFO fill level
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
+    irblaster@ff80014c {
+      compatible = "amlogic,meson-g12a-irblaster", "amlogic,meson-irblaster";
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
