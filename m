Return-Path: <SRS0=7yak=FG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11A84C64E7B
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Dec 2020 17:44:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 729BC2086A
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Dec 2020 17:44:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 729BC2086A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PDz5j0PqdMIf61gSJjGwV6MRg2FCT6DHKzbdMJeWUn4=; b=TyXPd/wMeOOSiHPSp4KkQkjLj
	ydt/wbkAWbewBR6Z+kjd+fJIXNagw61t/60M7OzcixPd9Orjczd+6q5ALZWkq0ACj21Dl1gMdiBJi
	Yd4r0bqLa+L/1PuO/VMyt4oWuomhy+D2Z2HAwnKVHvp6S5OmEbHTWtgkyHN9MeP/o8wud83FOqG5m
	zqkuFKdkuZig/1VIAQ4X3z3apyeVdSZIfOQwMMKXawdNCkDJzjzmPYR0tm+ddigt/n451jrtkw9/S
	rjKjbLPlIBpnx5isMYyIZuEVlayGvXxLG5fNSlhD75kcvvDs10QrSr+HHrM1hPyvcgH+LYZUX98jw
	gRQMPaffw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkWBM-00078S-5n; Wed, 02 Dec 2020 17:44:48 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkWAz-0006xJ-T0
 for linux-amlogic@lists.infradead.org; Wed, 02 Dec 2020 17:44:28 +0000
Received: by mail-wr1-x42c.google.com with SMTP id p8so4967325wrx.5
 for <linux-amlogic@lists.infradead.org>; Wed, 02 Dec 2020 09:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LzZh3XDG0mukcB0i6UGoQqeuQTlDt+ZadapYwoHki6w=;
 b=LjseARAchCVgKr1/xZAS9YlojSC+ZoG1giCXorFxPC/1yrZtu8vKsi1pkAL81PN5PH
 XTczagp8h2VereDh10kVdxOB/K61gmrYm3Lb4hoTsLGdnq4ug925Jlrn7FCjHU2cbuLi
 P9L/Ph2WRYvuX95JMWGibGKalFICJliBSH3n9dJlI9HIrSAS5jFAjOwPs2UlizlUB6S/
 h0TMemPHzdLpMWfkDr1LJKyqyZmHn4TxOL7DW1NvKyAy5hoVn7QSIBmRJlEO8+ij+gFQ
 8DT+17dM+1yQLDZo5WQlgIna3cAup16W8tW+dInT0k19hf55hUJaFfFpL0C4Tk+kRGA9
 ey7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LzZh3XDG0mukcB0i6UGoQqeuQTlDt+ZadapYwoHki6w=;
 b=HGw94Zsi9HMvUeOHym9j6uBQqOpsiJT5uTH8KilYxFnRw0yeuBifcD07qpZhI0y32X
 O7E9Ql15VlC/mXyw1arKGazAxm+WNE5ogmBJtdhw4Ckldtm+c+lZHcV5KrmxN3Zkhju8
 3fMF5eQDNRUTE++ZD0H4g4l6ARduoL3HDROlqttebV/RTm1Ea2q3I/yENzH2Y7nHOCTZ
 8M1XVNZY9rzTlwy1PyE5OYnBGZn0vV7idXTfu41aDq5KCaIHvnij4X58rA+1tmXToFTV
 A7rOJbzuzkcUtHfVRWJZgOn0lCwqmuV6ArPgc6PPOGdRtVrq03bNn3BLlBsYa9Wy17cE
 NmTQ==
X-Gm-Message-State: AOAM531JbIvjsrs+JKtgYkIsRd1P9tFoXU38xO3nwI2AYP6aFbZoWXIW
 rt5TbeJE5NPYXagWf7We8kE9eQ==
X-Google-Smtp-Source: ABdhPJxXihI1yYaKhkVPQ7va1Hj5IAksrWO7UT5NiYAHDfgKyxbFPkv7dmBYZRn2wvuOJpm3PPmYCQ==
X-Received: by 2002:adf:e80b:: with SMTP id o11mr4968215wrm.409.1606931064106; 
 Wed, 02 Dec 2020 09:44:24 -0800 (PST)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:15b4:c668:8f06:1b99])
 by smtp.gmail.com with ESMTPSA id q12sm2842915wrx.86.2020.12.02.09.44.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Dec 2020 09:44:23 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: hverkuil@xs4all.nl,
	devicetree@vger.kernel.org
Subject: [PATCH v4 1/4] dt-bindings: media: Add bindings for the Amlogic GE2D
 Accelerator Unit
Date: Wed,  2 Dec 2020 18:44:14 +0100
Message-Id: <20201202174417.3778306-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201202174417.3778306-1-narmstrong@baylibre.com>
References: <20201202174417.3778306-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201202_124425_971560_C4CFE2FD 
X-CRM114-Status: GOOD (  13.73  )
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
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The GE2D is a 2D accelerator with various features like configurable blitter
with alpha blending, frame rotation, scaling, format conversion and colorspace
conversion.

This adds the bindings for the GE2D version found in the AXG SoCs Family.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/media/amlogic,axg-ge2d.yaml      | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/amlogic,axg-ge2d.yaml

diff --git a/Documentation/devicetree/bindings/media/amlogic,axg-ge2d.yaml b/Documentation/devicetree/bindings/media/amlogic,axg-ge2d.yaml
new file mode 100644
index 000000000000..bee93bd84771
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/amlogic,axg-ge2d.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2020 BayLibre, SAS
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/media/amlogic,axg-ge2d.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Amlogic GE2D Acceleration Unit
+
+maintainers:
+  - Neil Armstrong <narmstrong@baylibre.com>
+
+properties:
+  compatible:
+    enum:
+      - amlogic,axg-ge2d
+
+  interrupts:
+    minItems: 1
+
+  reg:
+    minItems: 1
+
+  resets:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    ge2d: ge2d@ff940000 {
+          compatible = "amlogic,axg-ge2d";
+          reg = <0xff940000 0x10000>;
+          interrupts = <150>;
+          clocks = <&clk_ge2d>;
+          resets = <&reset_ge2d>;
+    };
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
