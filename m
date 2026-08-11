Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F01CC5CFD9
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Aug 2026 08:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9WXGjkoevPLKLrvSY/zaE+cwYHEPdh76uN2pTb4Pwdo=; b=LUwtGia0/3ffz1
	0rzjT7hnG5Tqps7Vk0A9IjpJ93eE1RVHHb3Z543X4QEW3aB+UYd0rrTo0slg/s1HL77DgMiz+jVrq
	EHIwYSHyxbAm3kT8GG5SmWartEGNMyiNrQAHHnWXEGLNbUljMh2ekUFGb2WKhpOc2lPpPXrWGNBOj
	FNqTsJmnYpvUxzFa0OazZSoudsgWQUMVP8AlewQEvOPUJReQCwuHRzf3S7CDER9oJlaRzzsPnqj1m
	uofNad7e7q9x7/TnoRfWfKK/nOU9MWN2FLue8jjSAZpzEm4ZP5yAksK7eFbBQXxanEeq16w/bEF6m
	MooLwFdV5ta8hBAi69vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wthzb-0000000Dcu2-2cbj;
	Tue, 11 Aug 2026 08:37:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wthza-0000000DctW-3MWW
	for linux-amlogic@lists.infradead.org;
	Tue, 11 Aug 2026 08:37:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 16264600E2;
	Tue, 11 Aug 2026 08:37:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AD873C2BCF7;
	Tue, 11 Aug 2026 08:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786437469;
	bh=ch2VZcF0grYih0yOT/whjAaAflovv1AgsISvBsyTzfc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rrgU7J2Y1V9rqx/kqmCd+p24ryn8GdNYFQIdhyyXPjWh9474PD5hjKr+vajyUuh2w
	 0rkOf02D05OUqOb9ZMhREMPNJ7BZ7cKO27WTQrrNxcBbpujrSMW1WRVXlpFh2W8yXH
	 HhoQ+bAggqEoOjELhqvXmX0kZdJ1k+edMG9VFLRddKQ8Lj7nAYjwS+fbcbBCzcgTOf
	 uS0R/xH+ifKUth54aH3bbJVpO/A59mMXrtvpmCiNGCA7YncZXQRGtY2dGl7dOZYof3
	 yHEZWGhOyLiO+Fl+7yRRkI5vSMZAqhgKbydm9Wd7fa21kgpM92JqaHmU3f8oGehpZz
	 T3jcEqEvXpCqQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D6DAC5CFCF;
	Tue, 11 Aug 2026 08:37:49 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Tue, 11 Aug 2026 08:37:43 +0000
Subject: [PATCH v2 1/2] dt-bindings: thermal: amlogic: Add A9 thermal
 bindings
MIME-Version: 1.0
Message-Id: <20260811-a9-thermal-v2-1-7ddc33b11b9a@amlogic.com>
References: <20260811-a9-thermal-v2-0-7ddc33b11b9a@amlogic.com>
In-Reply-To: <20260811-a9-thermal-v2-0-7ddc33b11b9a@amlogic.com>
To: Guillaume La Roque <glaroque@baylibre.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786437467; l=1992;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=gngHN4z9n9SyMoa266ohNEAmKi+Ijay9m70fUU9mI0o=;
 b=37ZiIJ+xetzlRFfaxCJYoIvP1OvG88dwoQmjgOt2EWfSButDyuYBCfWh8YWRam8zT9L9sswQ0
 /nu4f6ZKAdgBdRU37UleFI7zV9sRpkDKL998dVYZoSx1Az1qNyBXccF
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

Describe the required "core" and "plck" clocks, add the optional
"amlogic,hw-reset-temp" property, and update the schema constraints for
A9-specific thermal controllers.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 .../bindings/thermal/amlogic,thermal.yaml          | 28 +++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
index 8cfa44dcda58..f73ee66bcc47 100644
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
@@ -52,6 +59,10 @@ properties:
           - description: phandle to the secure monitor
           - description: sensor index to get specific calibration data
 
+  amlogic,hw-reset-temp:
+    description: The hardware-controlled reset temperature value.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
 required:
   - compatible
   - reg
@@ -73,6 +84,21 @@ allOf:
       required:
         - amlogic,secure-monitor
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - amlogic,a9-thermal
+    then:
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
