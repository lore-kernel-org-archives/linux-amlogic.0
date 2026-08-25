Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23737C5DF94
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 Aug 2026 06:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4O57llY9aJ0I077C7Cns6OxnUmyR6T9VBbYWcu9fSp8=; b=Ezcl1vkvqX7PUd
	1CmPeUIou//T4VEeOciOf5K1UJgLEvmAzUoqM/weCqqN8hLKtExz52PFXQhp3XuaJJGz7vlxoPj+O
	bTv2+d2CNUQYWQjyAw3ivqunPQsp92OjBNsVl9eCs4oqrav+FTNlaqeD2kWmi6rpCktZA6DxJx5oI
	p5Q8k5t7ivxnEF9E3A6b8ZrgtmHsHG7qLrl0X9EjZDHBy2OaHqtTU12t8auTpJQo0+2IEzhpUMFNb
	7ccIy5e11DQjTrcWI95Te8KkJ1EF/ZBf0nxyKZpRMib+uRf3U08xtF7baBLNylsm+xo+p+R2rljUG
	WOTe6Mld4qlneRm2Cu1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wykeC-00000000EFd-1RUq;
	Tue, 25 Aug 2026 06:28:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wykeB-00000000EFG-196x
	for linux-amlogic@lists.infradead.org;
	Tue, 25 Aug 2026 06:28:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 74C0443A0B;
	Tue, 25 Aug 2026 06:28:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4D6C6C2BCF6;
	Tue, 25 Aug 2026 06:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787639314;
	bh=2TU5UtSqlTK5Fx9D95GxY0TfdDPbOgZck8finK/MKtM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=HwqEGci2IieJ0DgW5CB/7HVRGN7RykD4quUqNH+gTq38Aj9yu0a2NzhqbNoaLbRAK
	 gIOBOWtTa27Pxs6foXlollH1F5vAGG4m6w31deG5rX42kbtJmPMvTVWiGlqOQ1pN7d
	 ME/JDTNHs5PZEjjP+AksDVH7gXQzgwdbty9Z6bc7KKu26cnihkQb8GqLtnrUoPqngN
	 YoQgfyBWiYE2PB+2HdkkS4x6vs0C3l6W59fRFT24/NejugJMLXz670VUVEQU458rC/
	 d+ZmlpqBQTxUz4L3g0KRjF0xAY3Q0eBDs62rENV6tBkBhCkpwzFYOtyfoYGbH2UTEe
	 DTB/s6Piu5kJg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ECD5C61CE3;
	Tue, 25 Aug 2026 06:28:34 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Tue, 25 Aug 2026 06:28:29 +0000
Subject: [PATCH v4 1/2] dt-bindings: thermal: amlogic: Add A9 thermal
 bindings
MIME-Version: 1.0
Message-Id: <20260825-a9-thermal-v4-1-d8fc9859cf22@amlogic.com>
References: <20260825-a9-thermal-v4-0-d8fc9859cf22@amlogic.com>
In-Reply-To: <20260825-a9-thermal-v4-0-d8fc9859cf22@amlogic.com>
To: Guillaume La Roque <glaroque@baylibre.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787639310; l=1701;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=z03XxmpaVvRhkUiS0uq3ppP3WR/hzF6qXYwRuBxcXJE=;
 b=4ecCzrDqMsskePU+vwx0rj+vxH6zsH2Qc+c3HyewSXxo2Jp51pPujjQvYl8vIzXaMPnmLPAbT
 OkCiwm9I48EAYVfH3irVJUWOpcsH0doxK78fJQiYVtZCdhSfESh84E/
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
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
Reply-To: xianwei.zhao@amlogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Document the thermal controller compatibles for the Amlogic A9 SoC.

Describe the required "core" and "pclk" clocks, and update the schema
constraints for A9-specific thermal controllers.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 .../bindings/thermal/amlogic,thermal.yaml          | 27 +++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
index 8cfa44dcda58..1b02404d67d5 100644
--- a/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
@@ -23,6 +23,7 @@ properties:
           - const: amlogic,g12a-thermal
       - enum:
           - amlogic,a1-cpu-thermal
+          - amlogic,a9-thermal
           - amlogic,t7-thermal
 
   reg:
@@ -32,7 +33,13 @@ properties:
     maxItems: 1
 
   clocks:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: core
+      - const: pclk
 
   power-domains:
     maxItems: 1
@@ -73,6 +80,24 @@ allOf:
       required:
         - amlogic,secure-monitor
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - amlogic,a9-thermal
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
+
 unevaluatedProperties: false
 
 examples:

-- 
2.52.0



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
