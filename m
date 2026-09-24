Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04707C98319
	for <linux-amlogic@archiver.kernel.org>; Thu, 24 Sep 2026 08:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4SJbdr8vojLd4YkgAQ4HWAVsm/x6LRInkZXNw0SJWU8=; b=QzxlmLUrZOecwL
	LdmGAj1Q8QzXashEQppwwsfWmWxDIihvgztf8pgBlYcRu12RoKOjW50rlkNkJqrlJtuV//Vbmp1pI
	4huZaSBTLFkf18L2iSsbGvMwSVJg/3Ji4ohCuc3Y6Si9LQC4R3ZPIbWEASBvnLObkn42vWCs3xB5d
	QmqZah3jsF/21wY9JVvSRt9kcxwzTtXdlLtAZxSpCZMF5KSfz4lVarz58sekWSAHKLcDILAI+1EZg
	rce9oMYbr3fNqIweSgwPaERpJQUd2xonPHwKUN6MzA5NeP5TEB9jzFNxMHZWpme/7L8USmfe/X/Za
	4mSvFztyY1PHOT9u+8Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ezo-0000000ASjM-2EPt;
	Thu, 24 Sep 2026 08:40:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ezf-0000000ASfR-0SpY
	for linux-amlogic@lists.infradead.org;
	Thu, 24 Sep 2026 08:39:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6F554406A7;
	Thu, 24 Sep 2026 08:39:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 41C2FC2BCF7;
	Thu, 24 Sep 2026 08:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790239190;
	bh=tyHH4L3DGufAt8GupUTrMc0T9R0V1+3nBPRA9FAGefA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=un87LFM/SdM7zUUyWttCvejIYVBRbyv7CxziDIiwCGvhZk67/hoiIZn2NSt/4Kf//
	 qohxgCQJAkq9SDqVQS7i6SXGU47egkrhL/+E5+oCTSFtLzG5FH7ti4ti+ZC6XdsmEQ
	 mYLBpc2Qk/4ib1NwixT7KUa9rdaBdZKGfeLf5KYLPb4b2H3zhZdQFBb9qHZqecbP1M
	 F7beG36OKfKsO07tTPtoycTZ7eK33Mi2YV2Qdbk08J6H5IzJNioab5mG3zmle3kMRz
	 VWLUDI4bGsTGSZRFYgx8B1NH5rNgPfPmOEKLwGzgV0W+AKIDnCAo8KMKfojkJZOTZk
	 +nOvkmI/qyN8g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FD25C9830E;
	Thu, 24 Sep 2026 08:39:50 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Thu, 24 Sep 2026 08:39:34 +0000
Subject: [PATCH 1/3] dt-bindings: i2c: add Amlogic A9 I2C controller
MIME-Version: 1.0
Message-Id: <20260924-a9-i2c-v1-1-b8ad9b46f4a8@amlogic.com>
References: <20260924-a9-i2c-v1-0-b8ad9b46f4a8@amlogic.com>
In-Reply-To: <20260924-a9-i2c-v1-0-b8ad9b46f4a8@amlogic.com>
To: Junyi Zhao <junyi.zhao@amlogic.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Xianwei Zhao <xianwei.zhaol@amlogic.com>
Cc: Junyi Zhao <junyi.zhaol@amlogic.com>, linux-i2c@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790239188; l=1829;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=8nPKQyYtI2lpcMKTMVFToJQCxayAS/dbNUlO8hvofKk=;
 b=0Wk7LfDx9kVpBCfkt8bPhxBnKK64RuxW6FmEd5xylS3bXhpniIAl7TFFAB1fprg47pGF5cSaK
 GwESv07Ekr+C2FQ0YCx4uGDV1c3o1/tKM/quDnq4n6jKgHLJ8TOs1v/
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

Add a Device Tree binding for the I2C controller found on the
Amlogic A9 SoC.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 .../devicetree/bindings/i2c/amlogic,a9-i2c.yaml    | 61 ++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/amlogic,a9-i2c.yaml b/Documentation/devicetree/bindings/i2c/amlogic,a9-i2c.yaml
new file mode 100644
index 000000000000..681241a52680
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/amlogic,a9-i2c.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/amlogic,a9-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic A9 I2C Controller
+
+maintainers:
+  - Xianwei Zhao <xianwei.zhaol@amlogic.com>
+  - Junyi Zhao <junyi.zhaol@amlogic.com>
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+properties:
+  compatible:
+    const: amlogic,a9-i2c
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  dmas:
+    items:
+      - description: DMA controller phandle and request line for RX
+      - description: DMA controller phandle and request line for TX
+
+  dma-names:
+    items:
+      - const: rx
+      - const: tx
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c@3a4400 {
+        compatible = "amlogic,a9-i2c";
+        reg = <0x3a4400 0x3c>;
+        interrupts = <1 164 1>;
+        clocks = <&clkc_periphs 11>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        eeprom@52 {
+            compatible = "atmel,24c32";
+            reg = <0x52>;
+        };
+    };

-- 
2.52.0



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
