Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FDD60A263B
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Oct 2026 09:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NIdeYp2M;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WGkG1Xfn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xj2hScSZUU84VqyzL6Cn6lcPWGJwG7D+AG0N4LL8dJ8=; b=NIdeYp2MJZZoSdvq/ylp1PL5Jy
	zLS7Shrx7etNFahF3BIeHtyxUnSeFAm1Z6VyGK9mdOFFsBBUBmX1+5QCUTyNpejuR+s82RZn3T1It
	OjK80Dnl1BprU2D8bHn3YuzNO8l2uVs59n68NIP20QSY5af+JHKlf/rvK1XglLhsat5qa2cK4t+Nh
	A/ukUHsk9SFir/t1v16BAZpi6p5DcIwOxiP5hMe2werN1tq5GdctSzHnwneR3vcSu10P0wEcRepHf
	1YMksBJfLaKXB0+X6oIestgtm51kzYIfRCExWHj3SwqqzE1R5RfArC8ouy4uVO5HkWoA1LAOiNCC3
	i6cXW5uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJp41-0000000Dple-1TJe;
	Thu, 22 Oct 2026 09:26:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJp3w-0000000DpkH-2DXI
	for linux-amlogic@lists.infradead.org;
	Thu, 22 Oct 2026 09:26:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AB8CB60DCA;
	Thu, 22 Oct 2026 09:26:15 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792661175;
	b=2x/A9+kHehPwnBWi5Bzz+UwX2G1UwxrSYpBGTtkdGYV+6ldVROFJgbMcGlO8ovFQN4hN
	 24sxusthLsnG0eodhzh5axnV/LUD/6CDGbv3DI+ZLbFoSWfij2GC1ZGjRxQWkknRm4gil
	 gf1wLxBsd9S9TKv7YWMIFXaP2/MuWxQARS8dsve9ePcNQ2v3UF9kyw9cItpsGgNGpUbNK
	 j2r8/9dysC6/DGL7hqX0GSYFJ0bEEB/qmb0rZ8rjk7CsxgmCgIx45c4t351BDdnE8fgBI
	 PkXrvOR5uabUei3OGueXMZHkEwCJ5taYMRngYthsdhOvBhHvOwhzCEBKHke8eQCD1nQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792661175;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=wfbg6tsOH+5dCqR6eRG5y+pRRouozsxb6eB2ua5FAlU=;
	b=c2E6ShFWfCSkJizJ8e7woHywVF0tlS12C35j0JFXUGyA9MlGFDmBNg2xPm6RExGMQLhn
	 HyGncRfHp/GOczJA1elhD1qXtJdi0EukVVzL0nxtUv3xjeTNfHQVWhbnLe3yh9fe8y0no
	 TIqdWMI9G7UkNeH9/1p+5ZTbCfF4vMLEoL2mqvVyuoGysGFTdGBW1j8EG34dWizng22jH
	 KvsG72bxnROeAaDAOD2SH+C3F0M4/bn0BFhERfqXtpVxqu68/N4lAR7Erd4MNodZYQIOF
	 BEkJxAN3ozheALihk4Oc/7El1rQXdPTYlH5LpentvP6zpNLHVpp1pS65kGRGy5X4okQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5A1ED1F000C3;
	Thu, 22 Oct 2026 09:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792661175;
	bh=wfbg6tsOH+5dCqR6eRG5y+pRRouozsxb6eB2ua5FAlU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=WGkG1XfnsHj41WZbddQd7Yzx08OpDlMTBDeUidC48mkGhxcCD1vuXagyCC2JoRdjp
	 THU6dkWbXr6bn6jtMwhz9vq9/ynQx32cWKXQPbE7N+qYmTElJujcDntIJwDZBuX82x
	 jPadxivL91niOYUp2zXBesn3FT6qaxBF9F0/+RzMoaBSk2v8gxwaK27X0nJ61u/4ph
	 i9+/WqqKA/7TRnmitfLPnUWerJ1lbci5uYE/YtqYJDlBagd8qlr7dKHkt3s04k39rw
	 EDs+PJ8cdYQ2uKY0v4wGidSjFhWY53QI/hl8o17f32aTCMg05xDGp8ND7M4QGav+Fk
	 ZnZLkpAY8VDtA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B7C5A4352F;
	Thu, 22 Oct 2026 09:26:13 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Thu, 22 Oct 2026 09:26:09 +0000
Subject: [PATCH v2 1/2] dt-bindings: i2c: add Amlogic A9 I2C controller
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261022-a9-i2c-v2-1-45e3cef175bf@amlogic.com>
References: <20261022-a9-i2c-v2-0-45e3cef175bf@amlogic.com>
In-Reply-To: <20261022-a9-i2c-v2-0-45e3cef175bf@amlogic.com>
To: Junyi Zhao <junyi.zhao@amlogic.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Xianwei Zhao <xianwei.zhaol@amlogic.com>
Cc: Junyi Zhao <junyi.zhaol@amlogic.com>, linux-i2c@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792661171; l=1719;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=/oijmKmiPfKgJUJzYs/dQncbUdJ0Rw2jHh3oFq2y0wk=;
 b=ebjO1TsqDS8xEYXSCiVbo1r6Pb2VkTgwhQv6vwAVaGTVcTXnFLAAR9xv9KN/So9DlyDpV/Iju
 2GZaupdC4iVC3Z1LSXZXqy5VuailzKhgqEtrrG1sfWE0evHimY0gT8A
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
