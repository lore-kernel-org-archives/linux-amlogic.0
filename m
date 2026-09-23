Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA414C9830B
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Sep 2026 14:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NCggaIERO9IhE4BRlBBKGQY6et6jJAMya8cK9ezwjrU=; b=SnYkJ/dRQYzq48
	KBaWi5qdLpYYV6j31LYSk7xcCTpzfabF2NXyWcQm6QClnuIfxUerAgfZjTxR6KgFujekIVX6Q/OPT
	J3G1H6yGuMPvFBAagCfc9n+Kfgo28hF4mWqe5mFE4276f2pKJgffYf0cdKsfXFLBFX76hAw4SoU0X
	2mB4wjKbqp4wgk+gQ3YFQfNN1qAZkN4T4tv/HejAykE7n1yVhiSdltFgeGLlvBES8rOH4HbN0oo4T
	cCro6bHuryRxnywdQcBMGk1FRhrDBZQ/hOrO4erbZ+C7MH8wFmYY9i44wHasKnLDL5K6bP5N9DI5L
	4GJV1zGFP3NranfQQFnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9O7Q-00000008Ycy-2Wtc;
	Wed, 23 Sep 2026 14:38:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9O7O-00000008Yc6-0qe1
	for linux-amlogic@lists.infradead.org;
	Wed, 23 Sep 2026 14:38:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7CBB560A67;
	Wed, 23 Sep 2026 14:38:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DD7DFC2BCB8;
	Wed, 23 Sep 2026 14:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790174320;
	bh=kHBmBVl2JMu6+02FSgWbrN1W6OrCsYXxzGowr9KGA/o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=VqzvuPr2sZvvNnS5gBOfAp1/DKPDSDiP+ottvViCTjRhpwbt1rCHG7x33AJJURvvW
	 4Eezz2EUH+jgcvYEAe0EQVqlW3UmTEc0lwFBZn6mOS/lKlOm/t/AynMoUmBmO2c380
	 Wh39MtZ0rbzljG/Rfb/bXrP4PIpG/LStGpF0JFUVAR8TsureE+9mNQ1jYxBak6bZVR
	 AIH0Qlh54lUxS6ep4KmgDSqPKPtNILdNSWLEuktGxbgo8gONUm2gNHCxFLGyqbKJhX
	 AMCcwjq5jrF4/fmrHEb0X7FS7icchtDz4b1FtWnkd8ejgKVCbKKGuOpXzBNTGSPIx3
	 kOOKJadpIyDpg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE4E7C98304;
	Wed, 23 Sep 2026 14:38:40 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Wed, 23 Sep 2026 16:37:50 +0200
Subject: [PATCH v2 1/2] dt-bindings: thermal: amlogic: describe bus clock
 for t7-thermal
MIME-Version: 1.0
Message-Id: <20260923-fix-t7-thermal-clock-v2-1-bff7a09eb487@aliel.fr>
References: <20260923-fix-t7-thermal-clock-v2-0-bff7a09eb487@aliel.fr>
In-Reply-To: <20260923-fix-t7-thermal-clock-v2-0-bff7a09eb487@aliel.fr>
To: Guillaume La Roque <glaroque@baylibre.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-pm@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ronald Claveau <linux-kernel-dev@aliel.fr>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2573;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=lXYK+uXkBcJdi1W1oKXkGFGmegAqeXjq24I9R+Ha9zQ=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ9bmJzENK2KyWp9JqwS0LY4yE/a88ylD9WC55p7u+XuDU
 pmDFL93lLIwiHExyIopsvTPtTzx7vLRM1/3qKfAzGFlAhnCwMUpABOZws7I8NZhIe/BD3sLTJsD
 toYc2xoftf1Sh6mUhtiV40m+2RFirYwMN5ZffBImk7FX4MUM038LFseru67q3bnBg7MmLXn3hOk
 L+QE=
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
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
Reply-To: linux-kernel-dev@aliel.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Ronald Claveau <linux-kernel-dev@aliel.fr>

The t7 thermal sensor needs a bus clock, in addition to the existing
functional clock, to gate register access to the sensor. This bus
clock is specific to each sensor, unlike the functional clock which
is shared between sensors. The current binding only describes a
single unnamed clock and therefore cannot represent this hardware
requirement, so add a second clock entry and clock-names for clarity.
Make the second clock mandatory for the t7-thermal compatible only,
via an additional if/then/else, to avoid breaking other Amlogic SoCs
that still use a single clock. Update the t7 example to match.

Fixes: b1c8ccdbd4e9 ("dt-bindings: thermal: amlogic: Add support for T7")
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 .../bindings/thermal/amlogic,thermal.yaml          | 29 ++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
index 8cfa44dcda58c..e72cb39ac635d 100644
--- a/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
@@ -32,7 +32,15 @@ properties:
     maxItems: 1
 
   clocks:
-    maxItems: 1
+    minItems: 1
+    items:
+      - description: Bus clock, gates register access to the sensor.
+      - description: Functional clock of the temperature sensor, shared between sensors.
+
+  clock-names:
+    items:
+      - const: bus
+      - const: core
 
   power-domains:
     maxItems: 1
@@ -72,6 +80,22 @@ allOf:
     else:
       required:
         - amlogic,secure-monitor
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: amlogic,t7-thermal
+    then:
+      properties:
+        clocks:
+          minItems: 2
+      required:
+        - clock-names
+    else:
+      properties:
+        clocks:
+          maxItems: 1
+        clock-names: false
 
 unevaluatedProperties: false
 
@@ -94,7 +118,8 @@ examples:
         compatible = "amlogic,t7-thermal";
         reg = <0x20000 0x50>;
         interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
-        clocks = <&clkc_periphs CLKID_TS>;
+        clocks = <&clkc_periphs CLKID_SYS_TS_A73>, <&clkc_periphs CLKID_TS>;
+        clock-names = "bus", "core";
         #thermal-sensor-cells = <0>;
         amlogic,secure-monitor = <&sm 1>;
     };

-- 
2.49.0



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
