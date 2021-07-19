Return-Path: <SRS0=+Him=ML=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED409C07E95
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Jul 2021 17:05:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 942E160FDB
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Jul 2021 17:05:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 942E160FDB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=phystech.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bFcNAJRtxtinnIaRGiJk+ZHJxQPw67uwhvMJcW9I5jk=; b=1PObzTI9135/qR
	fqM9F7wbr2WcApsMaPnUC8mzw+5BdayfkHI6vrjtPcCPgtYJCGDQwGnIMSpx0rB8m1D4WmweAUMqq
	7ySwCW4XrAxuaxVkQnZHgMEG6E9MTXa5ZOk75xC+EiZaZiSahtQgFTO3xzfaa5aptInJLsijzrBYu
	itav0/IN3lUDF6yo5L3EkQAMyRw1Zj2DHTU3643BxmjMcknsPmTxZTo5a92leBUusXB8j1pDADavB
	jAV9FDrFnzcPg609or/2iDMAryK+Dw4c6F+yRAvi78GNkt0/XgYCdq3oNRaZ4tudMbIO0GorkOH6q
	YCe7iIJ2tm1YQFFOGBuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5Wi9-00AhLm-KK; Mon, 19 Jul 2021 17:05:45 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5Whj-00AhFe-Vu
 for linux-amlogic@lists.infradead.org; Mon, 19 Jul 2021 17:05:23 +0000
Received: by mail-lj1-x232.google.com with SMTP id q4so27260939ljp.13
 for <linux-amlogic@lists.infradead.org>; Mon, 19 Jul 2021 10:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phystech-edu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SwQ5WIYCU+Iw0FKCHUpemUOKm2/bld2/msmvptg5xQo=;
 b=LS9NBl4p0lof0NUwVXBpRejKAMayY3KAb9qd5S6zm+yblqlquYhOrdUY4SZfQmo4ya
 ay85BuSGLOjWveXYjTDrLRf0vsC2J+ec+hlh6Ol1AWXu0hSEILtRytK+TtdHDLW6IH3q
 a+bRO0I0/XYHqnUstI8Ych1ueWVauJpQvI0/jLJpW7D1xNqTlOSmmIqa6dU0FB1TKf3h
 92kj3574+H97vvNvMNiDoxC43hqhQN34rRwbtbTg2ZMEwoG71fDYgIZY8XtTJr5rDg0W
 S+e1n9sEF8/UY2KFLvHmRGWhbdkxL+B+6A6VFFxzBN+Y64FXtSCkbWJPrzfxsVZ9Q1no
 V4NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SwQ5WIYCU+Iw0FKCHUpemUOKm2/bld2/msmvptg5xQo=;
 b=gip5O23neeaBvhKqYuUWa0RTngDQrxR1B3tPkZ5S6K7dYC6BdVJWzGXV40g8qoxtQ0
 kN6lJiDTHSjxMCD/fmo6sTgUdsPgtFsXEz5aCtQG3MY2QZ2YfAa+7Dq6zSAcRLHjcaRp
 WGyHCteFOL4mhxaL/8xizvZdvn7LOU85HYWT2nFOI9QObvjeS/ZOyEsDd74kRE/TF0Oz
 mrYBPpHpNoH6bPYb/9xyy6xAivFR3zxvwM8oJh1W+sca3H6/Ousb5IM6x0x+Bpjqx2BX
 LWXGm5EDXQeE9IfildQAUS5WVITeA3FvBwlGHv32I9q/Z6wL67xSssYkZ2ygJa5oL0BX
 fsag==
X-Gm-Message-State: AOAM532yhUKW0/R3nuRLgeoblwB4t+hvq9MWV9AHLUHDnxFshEcxBxyX
 gUWtzL/umCihkoNlscEtNCTflw==
X-Google-Smtp-Source: ABdhPJz4RWfEM6/7kxVUqcXSf3tITVQ2PFomqMF6vQ1qfwkGAMyCQoKxRLRNgeJs96WSISiMczhVDQ==
X-Received: by 2002:a2e:9c19:: with SMTP id s25mr23852580lji.478.1626714317299; 
 Mon, 19 Jul 2021 10:05:17 -0700 (PDT)
Received: from 192.168.1.3 ([2a00:1370:810e:b7ea:7e3d:4f4b:921e:b1ff])
 by smtp.gmail.com with ESMTPSA id z8sm1330749lfh.119.2021.07.19.10.05.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 10:05:16 -0700 (PDT)
From: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
To: sean@mess.org, mchehab@kernel.org, robh+dt@kernel.org,
 khilman@baylibre.com, narmstrong@baylibre.com
Cc: jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, rockosov@gmail.com,
 Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Subject: [PATCH v7 1/2] media: rc: meson-ir-tx: document device tree bindings
Date: Mon, 19 Jul 2021 20:05:05 +0300
Message-Id: <20210719170506.13539-2-viktor.prutyanov@phystech.edu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210719170506.13539-1-viktor.prutyanov@phystech.edu>
References: <20210719170506.13539-1-viktor.prutyanov@phystech.edu>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210719_100520_067481_6E9AD525 
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
 changes in v7:
  - fifo-threshold property removed

 .../bindings/media/amlogic,meson-ir-tx.yaml   | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/amlogic,meson-ir-tx.yaml

diff --git a/Documentation/devicetree/bindings/media/amlogic,meson-ir-tx.yaml b/Documentation/devicetree/bindings/media/amlogic,meson-ir-tx.yaml
new file mode 100644
index 000000000000..4432fea32650
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/amlogic,meson-ir-tx.yaml
@@ -0,0 +1,60 @@
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
