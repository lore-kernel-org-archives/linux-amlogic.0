Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93521606A896
	for <linux-amlogic@archiver.kernel.org>; Tue, 17 Nov 2026 05:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=n4mvQixB;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M+tZHM5y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vtJYCAhaG398ZBTbHeySrN4oiKoJAZXip6EumOBARHo=; b=n4mvQixBu7EmSk0BuhRhGCjw2J
	QX92Xzn92Evt/r869GMuyREndMRRAjXybGiI73BNpGtG61xYAkKzMw5b+6wcb3uYipluK9/9SranV
	K1fU36yfZNDIAkakrEja2fhQ3a3KQUgQ8ze96SpKqSHoKJ5Lp1Cb19CcQt59AGmHZDsMg4VZgIt2R
	GumD6RmSpYG7lNZmIk8KYR6poSC1tCP+lxNQDMBE1wtDF5UhyZqFra5sBdmUOIKbcwRbZpn9YPLo3
	PmJJ271SVe58u/ANFQPZvvDul5ayt+LFLpIO12az6rPiiW1Ki8v6L6vRaddiOfcZlUmwvNEh/SV83
	RSV2wrsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTBzv-00000004cex-10Gt;
	Tue, 17 Nov 2026 05:44:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTBzt-00000004cei-3KKk
	for linux-amlogic@lists.infradead.org;
	Tue, 17 Nov 2026 05:44:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6B22740B3A;
	Tue, 17 Nov 2026 05:44:49 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794894289;
	b=kJcy0eRcdoib1/18coylp8GNLOg0xytDI+zByQHgTIZORs7FKzR/806CR9ACFKAJ4nhB
	 vRkTKQyXr5Ml9ogcNaR2DVuQJhcawSYWmqHPnxDDbuIV/yBWnxyknbjYZCmt+MG2qQ8vB
	 LXOhG+JQkpayDfP9OqB87TyaoYw7m/XV+jxA7V7OkY2QDaqRU3/g/ttsihkH1QzGGr4Ca
	 YxbBmiwpselfBalw3LP03b2XTB5vpSsI87msOqKrCB70FLfN1s/0Pw9xnKYrq489yqdrb
	 aU/HR3xToiwZ2/6+3u6D3vx5P/J4uQUA6tY9C1OT4576rbfUMV/xmNe4LJ39tMRn5Dg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794894289;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=kNMpvUIklLoqq2U8w19NKhZcvl6ucrqllQnFyuCL2rA=;
	b=yCV/RAotFvpJy8gxoiunAwb2M6a5SIHm8nW2vvTLmjOOAY8fZW2dmqyhGf3Vos6sYiJR
	 u9IQi8ZTnl4YCUD6VxnhVt36K5Ag/1TwVPbSTtELk9rOostg2JyXWR3xpRBwQJ1BUGPP3
	 6T6eAxQyOLSyFOL1lkVzKK397FnxJAUd4sosCNYJe/rX54oxzi2WFXE5vTv7CxMR+l02C
	 7JVcvTUUZmYiyLcZujpZi+82KjV06C2OBOdYyr+eZW/Qm08DcY3ywiCH/sWpUCm9O/DH0
	 vNJGGc5u4EmVhrOTvAFr1dUWeETOtFrm6+rGTgoX7yvyxLa+nbnGMDKxLM1lSe88ZXA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B526B1F000C4;
	Tue, 17 Nov 2026 05:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794894289;
	bh=kNMpvUIklLoqq2U8w19NKhZcvl6ucrqllQnFyuCL2rA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=M+tZHM5y7v5CGXUaf5sL0TYuqwPuJ3AtiWhEdBiXb4vQUpGep/7MRgAxTndy68EYF
	 9xINx/+5TrFNPWRsEm6VnC6KxqhGLttV2s6rVq8I/u02TPWyWFNJ4X5JtQc3QyYnJ4
	 CbYlUEmSW6VUxwyMghn6GZAeAp7yOIGVVz7KfaSZp0HV6Qv8TkmApn2QnktUwHbvzu
	 P0XCp1aoVeH+Op9U9bBjcOH41gQx4x0D6U8gyXTMr4vZhAwNTxccnAO46ZII0y4zRO
	 CrxkFs5XasuPfm+zkCHAzkeNFBMf9EFYboLOM0qoHCavM33TfczDG7oafkECOxzpqp
	 jTYFroEXp3h6g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 336944A6CB;
	Tue, 17 Nov 2026 05:44:48 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Tue, 17 Nov 2026 05:44:03 +0000
Subject: [PATCH v9 1/2] dt-bindings: i2c: add Amlogic A9 I2C controller
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261117-a9-i2c-v9-1-7b303c894fea@amlogic.com>
References: <20261117-a9-i2c-v9-0-7b303c894fea@amlogic.com>
In-Reply-To: <20261117-a9-i2c-v9-0-7b303c894fea@amlogic.com>
To: Junyi Zhao <junyi.zhao@amlogic.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Xianwei Zhao <xianwei.zhaol@amlogic.com>
Cc: Junyi Zhao <junyi.zhaol@amlogic.com>, 
 Markus Elfring <Markus.Elfring@web.de>, linux-i2c@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794894285; l=1772;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=Sz+UB7O1ObrX0Ep7OtBMUUtSVaLagIleTbf9GlXMQy8=;
 b=LwQtZiDefog/mW5dkWxw9MvfHKtDkGobMBdj/9z6JwJYdJ7dU7R0fwa5XQKpnakw24/v+De2E
 Bh9fo/W5fFdAQmUQ74GatK9xlI2fp4MLlYv3DlYnRKgSdj2NY0jizp4
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Reply-To: xianwei.zhao@amlogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add a Device Tree binding for the I2C controller found on the
Amlogic A9 SoC.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 .../devicetree/bindings/i2c/amlogic,a9-i2c.yaml    | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/amlogic,a9-i2c.yaml b/Documentation/devicetree/bindings/i2c/amlogic,a9-i2c.yaml
new file mode 100644
index 000000000000..31ddc6d23732
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/amlogic,a9-i2c.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/amlogic,a9-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic A9 I2C Controller
+
+maintainers:
+  - Xianwei Zhao <xianwei.zhao@amlogic.com>
+  - Junyi Zhao <junyi.zhao@amlogic.com>
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
+        interrupts = <0 164 1>;
+        clocks = <&clkc_periphs 11>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+    };

-- 
2.52.0



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
