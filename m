Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7148C79F9F
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Sep 2026 06:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4O57llY9aJ0I077C7Cns6OxnUmyR6T9VBbYWcu9fSp8=; b=rvrT2C1Jes0+/8
	mb4qM8VgxCU8awrZO0G72QFY/CEuYeZAbBHAOVEV8bawA0AB2oC6cTL5Qq7Q9sjEcSem6SKJrWHIW
	pEolsF++RVplEbVqulFfa5Q0v4bBfJVXpD5e+xyBbXOelJLe2OYNyy0P5B0E2MaONN73uozLf/Ptz
	Z6zFGCAXSoqaMYPeGbFWDJZKKuF2GHLTQ3v2dwM9XNnCYGSbyBpKjfSKkYu5WsKM5ePFKJqoIpwUP
	INujLjbsRvjXUufInxPKJ3C3UbKU3KnmSGvCZ88fYubvXIt9pQ9iKI5vNERejFOn3xC31aYgu4DRy
	AOyMHDP/DsQY+XDOocHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4YR0-0000000DY67-2Ni5;
	Thu, 10 Sep 2026 06:38:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4YQz-0000000DY4y-1X5R
	for linux-amlogic@lists.infradead.org;
	Thu, 10 Sep 2026 06:38:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BE7DF4479C;
	Thu, 10 Sep 2026 06:38:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 91F01C2BCFC;
	Thu, 10 Sep 2026 06:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789022336;
	bh=2TU5UtSqlTK5Fx9D95GxY0TfdDPbOgZck8finK/MKtM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=BFsf7P2zElLdbO5Q0ymkbWVfDBWZDNXAgIrMIRK7VgkT45En02HXgiunXNP/8/liU
	 K0ZsJw+yQ9hTTs6Rczdyo5vBDeUfi09GJubqI89hesR7U/9nAQld+IBDuBktxlhB6f
	 UBy82UkmbU2S+CVhQFFUpnescSUFVqvTlLhWbwTqg1UGNY7elBr6ix2V+rjiiah6Vv
	 /5D/zXdb0ag5JEbqzW6Tmvmj7YxkHNxfxNnISxtaYwyuPfpf1swlMLlbVHaUYSttMq
	 J6L0kHq0n5E3BcJc6pL9WSwqec+ESpyl67np9ZkcpL6j+X98YCeI3Y5JMQe3bOW6pl
	 In3Fm/sn88A+g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DFBAC79FB7;
	Thu, 10 Sep 2026 06:38:56 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Thu, 10 Sep 2026 06:38:52 +0000
Subject: [PATCH v5 1/2] dt-bindings: thermal: amlogic: Add A9 thermal
 bindings
MIME-Version: 1.0
Message-Id: <20260910-a9-thermal-v5-1-892d798723e1@amlogic.com>
References: <20260910-a9-thermal-v5-0-892d798723e1@amlogic.com>
In-Reply-To: <20260910-a9-thermal-v5-0-892d798723e1@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789022333; l=1701;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=z03XxmpaVvRhkUiS0uq3ppP3WR/hzF6qXYwRuBxcXJE=;
 b=e5xlU76hScLnEWkvmwjg2BCWQHDq5iPnOnS9y+eaQqxdcGEpopL6reLgsKb3f/49yx6JkQyuI
 XwTcKScieLXC6weiHMdMNl4dIEW4HOEIJMy6NPXF7rCPMdzsP7AYx+V
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
