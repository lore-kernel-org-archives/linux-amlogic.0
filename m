Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFEEBC5DF8C
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2026 07:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cFCutV9CZIBPeCklMWY0J3UzIpIYvGCWe+Bbg24vP5k=; b=2OtSGFDePx3mtA
	3eDvYSOZdiJutLym28uadbBGVNNuCRXdj4WHJYGRT/frKVkLgbUjOTFsPMjumYir3YbxUDeetM7Jb
	1HY+a8gtQ1XE0QyLP6EnSgPxXMPwnDIM/ttKS6mUzGBQTLOvZbdnP637c0bcEmB1YAdEq+R4+oniq
	MmwiCHgAwz3TyNh/TGzmbhRhXPwLzW7YqFYXH6CZm0fhjuTQbN6VWWZv5z8zHLHPo+e1rbzAporu9
	jkSt9Nelu3zHPM+ofOijrhb4SlKjF9u2TZeqDryziq+h+4nu5f+jw27bhV2rIKIdRmev3EriwcWZW
	XkzJELp+86oE2HNcSPpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxK1J-0000000Ck8G-03z8;
	Fri, 21 Aug 2026 07:50:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxK1H-0000000Ck7y-2YDs
	for linux-amlogic@lists.infradead.org;
	Fri, 21 Aug 2026 07:50:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 31C2D41A60;
	Fri, 21 Aug 2026 07:50:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EB273C2BCF4;
	Fri, 21 Aug 2026 07:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787298631;
	bh=JcXE3R7736uYlQTb71bVCCgfnJkKqAagN9FLzPZ4bzs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Bv1hYRbjaRbpPql6CZziofmWVwrE07kkm5mzs8sdTNxNdeog/ow6lAiHCMg9bdVO4
	 6S9SdT9eggXw63LBL6VOoDvTV5KmW36pFBwG7ePepHfd6amnCHhgKziOdWtkPd+lB+
	 Pp1vuNdGU8anD1eblWWFJ6cRiR0N+clilNsrCFYajPEvqhJEF6NvKeOpZMC9nVSJL2
	 2a2ZA7LzIVkxheTi6pbapsef40Gp1llilcIaf49Eel6PmiZS7gMxAFniAzO6c+3YDU
	 0ICyg1l12eGDUmYgriFfVh8qOJwb2CQK5hoDT8Kqt2MhBaDOQrPymRsc51VWPWESLP
	 1wR/w3lMJM5xg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA5FEC5DF7D;
	Fri, 21 Aug 2026 07:50:30 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Fri, 21 Aug 2026 07:50:22 +0000
Subject: [PATCH v3 1/2] dt-bindings: thermal: amlogic: Add A9 thermal
 bindings
MIME-Version: 1.0
Message-Id: <20260821-a9-thermal-v3-1-0e7abf3941e3@amlogic.com>
References: <20260821-a9-thermal-v3-0-0e7abf3941e3@amlogic.com>
In-Reply-To: <20260821-a9-thermal-v3-0-0e7abf3941e3@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787298628; l=1648;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=RACRXv6wox/b/kJrRZQpbFDTY/mpoFOjI3DgG70KeU0=;
 b=7K5Yu3F5VC+UwdiQX9syws7dn2XX2Xqermn/j9RhUU6zfOwZhKz+4rpBKHUg2PCzRDaTJR9J6
 HGYssEp3iRRCK+iNgWKomzc8Yk4pM4xg2MvnYmOUrmjFQLoXZixvZYB
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

Describe the required "core" and "plck" clocks, and update the schema
constraints for A9-specific thermal controllers.

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
