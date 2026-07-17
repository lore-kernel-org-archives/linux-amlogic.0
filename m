Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B13F2C44517
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Jul 2026 07:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XXyW0mV+3m4H+pPgbMgt0A3FURvPtd/e+EI+o06nheM=; b=2CqWm3780MCIZM
	nSfuu9e2isK+BXGl/uZllUR3W6maQ8nLppRWjYeEFYop6FwhHGPR0tRL8vUriDZwsiEqAI/dqEJ2w
	G9OY9Ty6cN+K1cvO7RoLKzqIdf4uzf/okJoEZn6lDeeLgdAy4eA9tLPcwsYDlqNpCMoKiZk1goXkD
	UGcNJVxvHwW2fil/ObCQJJKLVc3XBm+/xxraRAE0bwn0tYWHe1UsYEBcurZQXT8O0Kxfd9lhlBbfm
	OqO/cgqqxPs0917lAFxpqmslYw0KynHX+mldzSjbIITdLEhZq/6TjS1nr3jZGX7WhY/aNMx7HcTt1
	TEz3VfFmBYqG1BX8eadA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdKG-00000001Vf2-1hcw;
	Fri, 17 Jul 2026 07:49:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdKE-00000001Ve9-2kq4
	for linux-amlogic@lists.infradead.org;
	Fri, 17 Jul 2026 07:49:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DA3E060A5E;
	Fri, 17 Jul 2026 07:49:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 879C8C2BCB8;
	Fri, 17 Jul 2026 07:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784274577;
	bh=kH1x/C+bNVBFlqTXRh62APgCks1TYJKRNSlv2U2wXio=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=SZn+1La8IZHMj/F+Hft3XimmAhNKNBbBpY7btB2nCkYzh5uASuYLZCLE0ENd+fKFM
	 hLCcGPga89ooNFyPAyyJZRrmKSWi44Erww+XM0IOqA+KgHfrKmlVHeDmsDarY2jS3g
	 acI83Xe7Vfl5sYCeUa/+WoJuMZVc1WuhM5+RwZYK6ZmsFgbHHnkWl3hHRr1ty3pY0P
	 AAE2g/LLq0uTWmY3UC+deytZfXFP58pRC0XTG6KdS/ESDzb8OGc8cdFT5XTKKOxpEl
	 TkfeEdxImARuwBu9QAnvwjVF7Q/78L14vJWDU7gdAkqLhqNVGX7X9YS5NruwMCds/i
	 cUBw6dqwl25Nw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67BB0C44514;
	Fri, 17 Jul 2026 07:49:37 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Fri, 17 Jul 2026 07:49:33 +0000
Subject: [PATCH 1/3] spi: dt-bindings: amlogic: spisg: Document A9-specific
 properties
MIME-Version: 1.0
Message-Id: <20260717-a9-spisg-v1-1-2eeea77be19f@amlogic.com>
References: <20260717-a9-spisg-v1-0-2eeea77be19f@amlogic.com>
In-Reply-To: <20260717-a9-spisg-v1-0-2eeea77be19f@amlogic.com>
To: Sunny Luo <sunny.luo@amlogic.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-spi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784274574; l=2098;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=S01FdKqQU8iANSc5yRkrElydRThefyYyd4gl5octfjc=;
 b=RG0aRoS+AIlkg4WEA5oEP0heq1kmYDL6XWlS3kIBwjMtntWgPInjtakXqV/ijUzySpVddZLBU
 g1Na4VBY1l6CqcEd8EvWb2p+bXp+8rqZwcb9IglYC6vBAwyXTkrYxvV
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

Document the Amlogic A9 SPISG controller and its additional
Device Tree properties.

Add the "amlogic,a9-spisg" compatible string and define the
A9-specific "amlogic,mo-idle-output" and "amlogic,word-gap"
properties, which configure the MOSI idle output level and
the inter-word gap, respectively.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 .../devicetree/bindings/spi/amlogic,a4-spisg.yaml  | 36 +++++++++++++++++++---
 1 file changed, 32 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/amlogic,a4-spisg.yaml b/Documentation/devicetree/bindings/spi/amlogic,a4-spisg.yaml
index 9bfb8089f7ea..7efdc748d566 100644
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
@@ -42,6 +41,35 @@ required:
   - clocks
   - clock-names
 
+allOf:
+  - $ref: spi-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - amlogic,a9-spisg
+    then:
+      properties:
+        amlogic,mo-idle-output:
+          description: |
+            Controls the MOSI output level when the controller is idle.
+
+            0 - Drive MOSI low
+            1 - Drive MOSI high
+            2 - Follow the last transmitted bit
+          $ref: /schemas/types.yaml#/definitions/uint32
+          enum: [0, 1, 2]
+          default: 0
+
+        amlogic,word-gap:
+          description: |
+            Number of idle clock cycles inserted between consecutive SPI
+            words.
+          $ref: /schemas/types.yaml#/definitions/uint32
+          enum: [0, 1, 2, 3]
+          default: 1
+
 unevaluatedProperties: false
 
 examples:

-- 
2.52.0



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
