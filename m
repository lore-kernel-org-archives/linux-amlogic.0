Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C0EEC531C7
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Jul 2026 06:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NEZ43b6JYwlkbpf8WOWDV1uuPbkb3XlyzRTd9cqzwYY=; b=ndkyU9KXalF/ry
	bRyQuC9WHMVvFJVhrmaL6SHtfB/fJzmuqw19jgx74SZIKPdRDVMVa/0QPVUB7FlIjnaYjPpzUPsG7
	NZY2GAAzLAlt6n584MU1G27EY4KkH7+5pfIbvqLTOK82u09zjxL2J76zEndWDNHCQwge6rzsgHCJ9
	/77lxvZW9Jf4bId6ZAljMFgaRcn5jV6mFbf1OkzSY70XSX2JnK7T7qCveMPSJZC1eVWkGQQ5H6Fuq
	9wWl4U4paU4dmujNcZkF7D5L/xiBJ09mFb8vSQflzpAytm3P8fT5TU5DS2YHBVE3o7ghagzgFFvpu
	cf1OdZOuhnC0q35bjh+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmnA1-0000000DZJY-0dWE;
	Thu, 23 Jul 2026 06:44:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmn9w-0000000DZHm-3vmv
	for linux-amlogic@lists.infradead.org;
	Thu, 23 Jul 2026 06:43:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9ABDF600DA;
	Thu, 23 Jul 2026 06:43:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 445A3C2BCC7;
	Thu, 23 Jul 2026 06:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784789035;
	bh=XQltrhhdDEOv3aEgBjYadnzuNlFB/71hwbYn4rzhXMQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=gFry3QcnCwvkdi2qBzBIFjd9Ql3ATFJHpLatDTvAYduApTDBQi3/dimZ1FdZ+31EO
	 NcYcAqsGCpe8rvQuifUmrjK+4izhm/6xMOEvln+uX302ZwfKl4jUO5oX5xvxD+T2ii
	 ZmLyMLK1fHgcAcs5qiMBpRz9VpX0z2FAj/BMnvADAlr3A5lPe+75hp4nhiPTRyaNbN
	 ISWkNYUjo1VJKhcPpbXI7IcSWg+ZhyiyER/UX82UMrFLExRGMO4Tydt/0KsSrrJQX8
	 yuuXn9N3W8h+cz5eureSZO7JD9aBOfAVMVtPsPhMQDdkiTUPfiHqB8nX1c2hRXvHEn
	 YsK61Kr/KvJwA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 232A0C531CB;
	Thu, 23 Jul 2026 06:43:55 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Thu, 23 Jul 2026 06:43:42 +0000
Subject: [PATCH v2 1/4] spi: dt-bindings: amlogic: spisg: Document
 A9-specific properties
MIME-Version: 1.0
Message-Id: <20260723-a9-spisg-v2-1-9fc39106b7e2@amlogic.com>
References: <20260723-a9-spisg-v2-0-9fc39106b7e2@amlogic.com>
In-Reply-To: <20260723-a9-spisg-v2-0-9fc39106b7e2@amlogic.com>
To: Sunny Luo <sunny.luo@amlogic.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-spi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784789030; l=2195;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=A2bVyZIU8ueKZKzfA2QNoWvbKtTJ6W1aJGMG6E4FE54=;
 b=AIm5d9oRD0BkkfTz9T/TtZ41z3rKMtlDTNoDIeikQwndF6WXhphmeCUBUwXVK5utHWQKPliUH
 jp/KjYz1l3rDk9TdKThZa8f7XhTRxxVVvfEHmI7Fx7BAd63WOpw/ZAn
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
 .../devicetree/bindings/spi/amlogic,a4-spisg.yaml  | 38 +++++++++++++++++++---
 1 file changed, 34 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/amlogic,a4-spisg.yaml b/Documentation/devicetree/bindings/spi/amlogic,a4-spisg.yaml
index 9bfb8089f7ea..ddef92f3f3b6 100644
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
@@ -35,6 +34,23 @@ properties:
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
+  amlogic,word-gap:
+    description: |
+      Number of idle clock cycles inserted between consecutive SPI words.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1, 2, 3]
+    default: 1
+
 required:
   - compatible
   - reg
@@ -42,6 +58,20 @@ required:
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
+        amlogic,word-gap: false
+
 unevaluatedProperties: false
 
 examples:

-- 
2.52.0



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
