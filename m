Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EF60C55172
	for <linux-amlogic@archiver.kernel.org>; Fri, 31 Jul 2026 09:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eTSpnSf1f9l4iZu3COjw+CMsqaaWXpOmiCYnd1bxXMI=; b=Cq3BeG3WEYiBcw
	y7QGWt25hZq4mttNj6E9M2Vin3VHSZFxqnKEzqzUtfHp70a8tLqdmzGoEw9Im29zD00+F+4C0cZhb
	KHLvtjB5lBQFsCFT+yHYy1UcxquwI0yrgjhxIni0AeLNENS2nXm+iXame2KY/zR6IlPkBrbWPO29j
	DQR05g9RwImvfqsLnWw2PJY18WLN+JFSlXxG4hmmlaMHkFBwUWzHgpaucmU7i2cZ075K5X+W3rTQN
	8Voqsj9jitAY0l44NdSb2uBbUqPGYZBMxU0hyX40+9DQ3g7Nw3UCim+RerWTMcPpNiNfwETVMUrDD
	rPAim+r8iFo9lnZ6Gbpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpjEN-0000000C8XD-3KYh;
	Fri, 31 Jul 2026 09:08:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpjEG-0000000C8US-0ePJ
	for linux-amlogic@lists.infradead.org;
	Fri, 31 Jul 2026 09:08:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5B82B600AF;
	Fri, 31 Jul 2026 09:08:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 011C3C2BCF4;
	Fri, 31 Jul 2026 09:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785488910;
	bh=Mmb3oMAuheR21ckKDdPOPrg5ggrRiQ6j9iZ1meDpgMQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ud8y8e/rOWlmmYP4+3ZmilFqCfz4oLvEn+kEJ+jiYL6k4qWiOjwb/Ygwjd5Pwot//
	 kDJhgdzY9GnC76gOftXclMlvNjE8YYEnpIgdpBSo+goFPPJu4w1JMmaRTwaZb2oUV3
	 jvYLjqxBQg+D7QTpBTmafxMuHnzHuerK1Pgh+5MKL9p5Lv0GVw/7DqJUbZylUd19u7
	 o9dTcpoJio5etOiCr36nDHzM55lrCdLq4SAFAqdr9F0Eva2+T46y0eNsTfIVr58lU+
	 +PNerP3W7B85PMAXDGCWPAFI5UYR3WZAj1if0buuM+afVkdZhVatrkQIvIS9eb7mEd
	 SjN+G37LyyxSA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6698C5516D;
	Fri, 31 Jul 2026 09:08:29 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Fri, 31 Jul 2026 09:08:25 +0000
Subject: [PATCH v3 1/4] spi: dt-bindings: amlogic: spisg: Document
 A9-specific properties
MIME-Version: 1.0
Message-Id: <20260731-a9-spisg-v3-1-a15da3f70029@amlogic.com>
References: <20260731-a9-spisg-v3-0-a15da3f70029@amlogic.com>
In-Reply-To: <20260731-a9-spisg-v3-0-a15da3f70029@amlogic.com>
To: Sunny Luo <sunny.luo@amlogic.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-spi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785488907; l=1955;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=QmBAAmHCz75ak/gTg3Z9nJO6Jq52E/H1aEusSVZgdR4=;
 b=6bqBPyY+DBxWpopJLpgnlBtH3rVrZ5+pz5Wlt8IJ1ilczXy3WgZjCdg9Gjx4dtyQzwq4Fyv+6
 yK3E5ed6SLFBwOJq2eLWHDSc2TherqH/VVAuog4cO1XYJs5L8vxb1U8
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

Document the Amlogic A9 SPISG controller and its additional Device Tree
properties.

Add the "amlogic,a9-spisg" compatible string and define the A9-specific
"amlogic,mo-idle-output" property, which configure the MOSI idle output
level.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 .../devicetree/bindings/spi/amlogic,a4-spisg.yaml  | 30 +++++++++++++++++++---
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/amlogic,a4-spisg.yaml b/Documentation/devicetree/bindings/spi/amlogic,a4-spisg.yaml
index 9bfb8089f7ea..427d8883009c 100644
--- a/Documentation/devicetree/bindings/spi/amlogic,a4-spisg.yaml
+++ b/Documentation/devicetree/bindings/spi/amlogic,a4-spisg.yaml
@@ -11,12 +11,11 @@ maintainers:
   - Xianwei Zhao <xianwei.zhao@amlogic.com>
   - Sunny Luo <sunny.luo@amlogic.com>
 
-allOf:
-  - $ref: spi-controller.yaml#
-
 properties:
   compatible:
-    const: amlogic,a4-spisg
+    enum:
+      - amlogic,a4-spisg
+      - amlogic,a9-spisg
 
   reg:
     maxItems: 1
@@ -35,6 +34,16 @@ properties:
   resets:
     maxItems: 1
 
+  amlogic,mo-idle-output:
+    description: |
+      Controls the MOSI output level when the controller is idle.
+      0 - Drive MOSI low
+      1 - Drive MOSI high
+      2 - Follow the last transmitted bit
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1, 2]
+    default: 0
+
 required:
   - compatible
   - reg
@@ -42,6 +51,19 @@ required:
   - clocks
   - clock-names
 
+allOf:
+  - $ref: spi-controller.yaml#
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - amlogic,a9-spisg
+    then:
+      properties:
+        amlogic,mo-idle-output: false
+
 unevaluatedProperties: false
 
 examples:

-- 
2.52.0



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
