Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9BED606A31C
	for <linux-amlogic@archiver.kernel.org>; Tue, 17 Nov 2026 11:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TPUIiMfe;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d4NuoOmU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/DKFIb/EnDY52qR/ev9MXwyJCJGpXNjZqLA0l8kVebQ=; b=TPUIiMfeXk29Qjcl+PMoqSC55d
	//cKecQ/tRYbjgjb4TJam8iN6Bvp9u2Hr00WFY2ZnI32ImV5MS5zSi7ozBHtNKQJL0yg2c2DaWgtP
	VVeb1dQyIMvk3VZUlvmq6sIq888b4BbxJ/p5WlxxDNajJOu+LyJ8VWHKWQ+YoMZRgF4Qy7sdx8Ilp
	CfbCFZit/jTLuAI6bNKmdShAWgCi38x456CnpnIC9/V8kokvZYfYt0xZ+8RNALzWPD37toX3kvbch
	UdgQFjqYDyukTN6r1dTXPUWkmRZBYKmf4MT5KAMJVPzEW45H0Zhyfa+bsFomJrcRKLgPmcql5fkdF
	rQUH2u9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTHqW-00000005WBA-0OeX;
	Tue, 17 Nov 2026 11:59:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTHq4-00000005W9r-2scF
	for linux-amlogic@lists.infradead.org;
	Tue, 17 Nov 2026 11:59:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BC456601CF;
	Tue, 17 Nov 2026 11:59:03 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794916743;
	b=Be+Rb4G2jpVf42MkQ+fNnG9AkkhwrP37RiYuRSGtB2F5jrLPBdJe8Tg1i5c5UwCiT05f
	 wGys3LIn30DiX4EKShR2pttifWI/CHcRDn6HholTSgsIawbn6lf7/G4dhndGfJp7dZMKL
	 wFzJXqS4WbG009laz9mLpwZkcyhNunSeIuypYiWLFm6UNNIKxAs6wxnUv8BOPNnqH8GMV
	 w/InSGmdhoMJ/RCZfk9kJG/6a+qhv5JYQ7kVNA4z5hZXVuetpVWDkIvYBfy0395GNymBK
	 6wLfEQOZzuLB01Oh1HYicdX3xNnZ6wsxLVbsrvGQ9IxPTZ0aNHJtj6BStq+If0Sb67A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794916743;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=hzfOUTtrb4gURy/ze3K34NDYNNCwcpFVgEVGom5qxcU=;
	b=x+RFpTC+Ip363HimUqyZmjx51kbKjoWEw3FOM/J8tBMmwQ6ypDIJEIAX3Z5rE0A7+QdS
	 qlyqydz5mRyCfwwsEoT6NrH6wbNwYOSiN5yRkLdduSzikggE5noZjuXFKafLHIrJoY6bf
	 OX0wNucequG/ZK07+doYHRxu9hUd4Bdc4BWPLkMRfVzWvKoo/0C/BrxeeFgi7bhgI/Aqo
	 xBCsdtpN6yOmbuH7a6Zl4GinXTPjpPdOaglB+aGsNxcekNidSbYeOAdOPy4nliSRqjjCB
	 /wo7dpPaVbADeGGNGnevI87iLlq3MsQ9TlV0LVE4KpCsC+l5TV32nV/53rfmSjV0AJg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CAD111F000C5;
	Tue, 17 Nov 2026 11:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794916743;
	bh=hzfOUTtrb4gURy/ze3K34NDYNNCwcpFVgEVGom5qxcU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=d4NuoOmUdWtwhAdSqUiCa3+LozeP0ncJpDDouO7f0DID5KaIviZ8QdB3PdR4KT44n
	 VI9w6MlowIEYnJgYMXYT+cBOn7AF+VT8gJLAcuy9exexeX/zjV1Xvf0F2fARldQGf1
	 YALvP3S+YE1AJrYV8FfT5uqCNrmIrwM/3Ik9d6Z9RX5o5xorVh8C+wDg7BsLC2Nj1A
	 cwSed25Caqv4lQ2cQQuL2rlM/kAXEDd0Lpvy1SYulgIvjRe0GMgoABERwOokWiqp8s
	 h932hfw4yZq0LcOpIzJQlqAwxY9Km9LDtGM6J4MmhIkn/wSE60h+cpFcpe5u0tkYKZ
	 cnV//nYSp2PYQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 46C3F4A829;
	Tue, 17 Nov 2026 11:59:02 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Tue, 17 Nov 2026 11:58:56 +0000
Subject: [PATCH v10 1/2] dt-bindings: i2c: add Amlogic A9 I2C controller
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261117-a9-i2c-v10-1-33ea9aefce20@amlogic.com>
References: <20261117-a9-i2c-v10-0-33ea9aefce20@amlogic.com>
In-Reply-To: <20261117-a9-i2c-v10-0-33ea9aefce20@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794916741; l=1772;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=iah66EzLU1pEytVqMNVVA1xNmz2D/VOvKtLvjcbBFk4=;
 b=3GGZM+bn2Jmb5O7qdF184r5WouD9/Zl9wk+Q45sX98ioLD2maUiU7hrGTya/C2U1NxYbB/4UT
 ZMMeZ5+mod3CZf89+JN+Xa08ts5JRbRNFa1y9Glc9RmN4VOkI4ueZoq
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

Add a device tree binding for the I2C controller found on the
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
