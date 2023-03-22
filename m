Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3069FC6FD1C
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 Mar 2023 17:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iifvYpXkHKawEEoXmZjp/vbEHG1mCJRFrcLzgkixk8g=; b=DIuRWWWYe2+ii9
	cpaTR+beqbjsaRUwOyAWqPSRYrQJckAWdY2LJ3Sn2l9Vb8xXn9K/Pb5QDYqBmTyEiLx7dqYLdkozZ
	gujv2kMc8QZ9G/Om4JzyXDIH/F12ivdSRLKzJ91i5LTzOLGxDfK9N71nR+/khPT5iGKEW/sAz6Rz2
	GK30gEVJUGmgyCOvcr09v/ZeJ8PUnRU2te9Q6FAstgBC+OLCuAvubCQwAJu6lp6wnWp9nYQ7mdvbu
	vaUzHT3NjJqDB1giqAlNdh7wW7arfth5Gucv0hVMyMqyGYVRGrCTiP0G8YU2uHy54BgBLqpCM+pxX
	XenhcQerqn8aa3kABQeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pf2Mz-00GrJB-0v;
	Wed, 22 Mar 2023 17:35:29 +0000
Received: from mail-oa1-f46.google.com ([209.85.160.46])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pf2Mn-00GrDJ-0v;
	Wed, 22 Mar 2023 17:35:19 +0000
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-17e140619fdso11673824fac.11;
        Wed, 22 Mar 2023 10:35:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679506515;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DhAZgSsCmRQH32g945/1WVE6nK7KUMTNQYBc4jaotYA=;
        b=O1Fk0OcxUYSLv0jbfDTElIrzOzaTi7WJaBvwCWXo45BVVHiRaA7FQOojq10JOril77
         0TlcK+w728lRlmI3h2muuyScFcDJgAgAxzoicQKitTQslaNViq+cXXD9fALVzYIxS6sk
         nvvRO3XHBZhAGGuEQOR+n+NZfhJcqybfJqktj3dwt1Zsfc59wOYecNlo3qbXHU/0CuEi
         WqEpTh6sT7dmJ9xtFly6QbmITzy6YXhvK+DPdwglvCPv2ZZUd7z/0rtMb0JwfaSoxp5M
         RxHS6SNnA7/+zRKB/A37hf0zYCE8ylkvcz/ifE+vLpdNL/zM4JwimR2a8YoD5KMbYdds
         TR/g==
X-Gm-Message-State: AAQBX9dnRYoleAzzO6tp9tN0UjjhL6p4war3nMll7PWw8kbkdnoGi88+
	Vm5/oDIUAPwQ//jDZOuytg==
X-Google-Smtp-Source: AK7set+M4iXSP+InndXExCJJx+lLTOyyNjKeT0/S7UmBEckCpQGz7BKUcGuKzdFbT9+57wrsAAi/Vg==
X-Received: by 2002:a05:6870:c5a7:b0:179:e07:dbc4 with SMTP id ba39-20020a056870c5a700b001790e07dbc4mr360448oab.48.1679506515161;
        Wed, 22 Mar 2023 10:35:15 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id r2-20020a056808210200b00387160bcd46sm2419874oiw.46.2023.03.22.10.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 10:35:14 -0700 (PDT)
Received: (nullmailer pid 3971307 invoked by uid 1000);
	Wed, 22 Mar 2023 17:35:13 -0000
From: Rob Herring <robh@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Florian Fainelli <f.fainelli@gmail.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Qin Jian <qinjian@cqplus1.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: reset: Drop unneeded quotes
Date: Wed, 22 Mar 2023 12:35:07 -0500
Message-Id: <20230322173508.3971182-1-robh@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_103517_430417_FA379205 
X-CRM114-Status: UNSURE (   9.34  )
X-CRM114-Notice: Please train this message.
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

Cleanup bindings dropping unneeded quotes. Once all these are fixed,
checking for this can be enabled in yamllint.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../bindings/reset/amlogic,meson-axg-audio-arb.yaml         | 4 ++--
 .../devicetree/bindings/reset/amlogic,meson-reset.yaml      | 4 ++--
 .../devicetree/bindings/reset/bitmain,bm1880-reset.yaml     | 4 ++--
 .../devicetree/bindings/reset/brcm,bcm6345-reset.yaml       | 4 ++--
 .../devicetree/bindings/reset/brcm,brcmstb-reset.yaml       | 4 ++--
 .../devicetree/bindings/reset/marvell,berlin2-reset.yaml    | 4 ++--
 Documentation/devicetree/bindings/reset/microchip,rst.yaml  | 6 +++---
 .../devicetree/bindings/reset/qca,ar7100-reset.yaml         | 4 ++--
 Documentation/devicetree/bindings/reset/renesas,rst.yaml    | 4 ++--
 Documentation/devicetree/bindings/reset/sunplus,reset.yaml  | 4 ++--
 10 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/Documentation/devicetree/bindings/reset/amlogic,meson-axg-audio-arb.yaml b/Documentation/devicetree/bindings/reset/amlogic,meson-axg-audio-arb.yaml
index 704a502adc5d..bc1d284785e1 100644
--- a/Documentation/devicetree/bindings/reset/amlogic,meson-axg-audio-arb.yaml
+++ b/Documentation/devicetree/bindings/reset/amlogic,meson-axg-audio-arb.yaml
@@ -2,8 +2,8 @@
 # Copyright 2019 BayLibre, SAS
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/reset/amlogic,meson-axg-audio-arb.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/reset/amlogic,meson-axg-audio-arb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Amlogic audio memory arbiter controller
 
diff --git a/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml b/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
index 98db2aa74dc8..d3fdee89d4f8 100644
--- a/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
+++ b/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
@@ -2,8 +2,8 @@
 # Copyright 2019 BayLibre, SAS
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/reset/amlogic,meson-reset.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/reset/amlogic,meson-reset.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Amlogic Meson SoC Reset Controller
 
diff --git a/Documentation/devicetree/bindings/reset/bitmain,bm1880-reset.yaml b/Documentation/devicetree/bindings/reset/bitmain,bm1880-reset.yaml
index f0aca744388c..1f40b654f6a2 100644
--- a/Documentation/devicetree/bindings/reset/bitmain,bm1880-reset.yaml
+++ b/Documentation/devicetree/bindings/reset/bitmain,bm1880-reset.yaml
@@ -2,8 +2,8 @@
 # Copyright 2019 Manivannan Sadhasivam <mani@kernel.org>
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/reset/bitmain,bm1880-reset.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/reset/bitmain,bm1880-reset.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Bitmain BM1880 SoC Reset Controller
 
diff --git a/Documentation/devicetree/bindings/reset/brcm,bcm6345-reset.yaml b/Documentation/devicetree/bindings/reset/brcm,bcm6345-reset.yaml
index 560cf6522cb8..00150b93fca0 100644
--- a/Documentation/devicetree/bindings/reset/brcm,bcm6345-reset.yaml
+++ b/Documentation/devicetree/bindings/reset/brcm,bcm6345-reset.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/reset/brcm,bcm6345-reset.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/reset/brcm,bcm6345-reset.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: BCM6345 reset controller
 
diff --git a/Documentation/devicetree/bindings/reset/brcm,brcmstb-reset.yaml b/Documentation/devicetree/bindings/reset/brcm,brcmstb-reset.yaml
index e00efa88a198..b115b86e2fe6 100644
--- a/Documentation/devicetree/bindings/reset/brcm,brcmstb-reset.yaml
+++ b/Documentation/devicetree/bindings/reset/brcm,brcmstb-reset.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/reset/brcm,brcmstb-reset.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/reset/brcm,brcmstb-reset.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Broadcom STB SW_INIT-style reset controller
 
diff --git a/Documentation/devicetree/bindings/reset/marvell,berlin2-reset.yaml b/Documentation/devicetree/bindings/reset/marvell,berlin2-reset.yaml
index d71d0f0a13ee..dc86568bfd75 100644
--- a/Documentation/devicetree/bindings/reset/marvell,berlin2-reset.yaml
+++ b/Documentation/devicetree/bindings/reset/marvell,berlin2-reset.yaml
@@ -2,8 +2,8 @@
 # Copyright 2015 Antoine Tenart <atenart@kernel.org>
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/reset/marvell,berlin2-reset.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/reset/marvell,berlin2-reset.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Marvell Berlin reset controller
 
diff --git a/Documentation/devicetree/bindings/reset/microchip,rst.yaml b/Documentation/devicetree/bindings/reset/microchip,rst.yaml
index 81cd8c837623..f2da0693b05a 100644
--- a/Documentation/devicetree/bindings/reset/microchip,rst.yaml
+++ b/Documentation/devicetree/bindings/reset/microchip,rst.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/reset/microchip,rst.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/reset/microchip,rst.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Microchip Sparx5 Switch Reset Controller
 
@@ -36,7 +36,7 @@ properties:
     const: 1
 
   cpu-syscon:
-    $ref: "/schemas/types.yaml#/definitions/phandle"
+    $ref: /schemas/types.yaml#/definitions/phandle
     description: syscon used to access CPU reset
 
 required:
diff --git a/Documentation/devicetree/bindings/reset/qca,ar7100-reset.yaml b/Documentation/devicetree/bindings/reset/qca,ar7100-reset.yaml
index 9be60e55cd71..47f8525a9b38 100644
--- a/Documentation/devicetree/bindings/reset/qca,ar7100-reset.yaml
+++ b/Documentation/devicetree/bindings/reset/qca,ar7100-reset.yaml
@@ -2,8 +2,8 @@
 # Copyright 2015 Alban Bedel <albeu@free.fr>
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/reset/qca,ar7100-reset.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/reset/qca,ar7100-reset.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Qualcomm Atheros AR7xxx/AR9XXX reset controller
 
diff --git a/Documentation/devicetree/bindings/reset/renesas,rst.yaml b/Documentation/devicetree/bindings/reset/renesas,rst.yaml
index 0d1b89e2fe9c..e7e487247751 100644
--- a/Documentation/devicetree/bindings/reset/renesas,rst.yaml
+++ b/Documentation/devicetree/bindings/reset/renesas,rst.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/reset/renesas,rst.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/reset/renesas,rst.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Renesas R-Car and RZ/G Reset Controller
 
diff --git a/Documentation/devicetree/bindings/reset/sunplus,reset.yaml b/Documentation/devicetree/bindings/reset/sunplus,reset.yaml
index f24646ba9761..205918ce324c 100644
--- a/Documentation/devicetree/bindings/reset/sunplus,reset.yaml
+++ b/Documentation/devicetree/bindings/reset/sunplus,reset.yaml
@@ -2,8 +2,8 @@
 # Copyright (C) Sunplus Co., Ltd. 2021
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/reset/sunplus,reset.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/reset/sunplus,reset.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Sunplus SoC Reset Controller
 
-- 
2.39.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
