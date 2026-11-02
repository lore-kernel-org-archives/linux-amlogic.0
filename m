Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2FCE60A2610
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Nov 2026 07:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NNHn17TH;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BFnUArU5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vtJYCAhaG398ZBTbHeySrN4oiKoJAZXip6EumOBARHo=; b=NNHn17THstyEoNX5nHCpau39o5
	7EgmWMtrdOC2c/8mqXHcWmOzsOO6YCxA9DhpEht0fkH8yrvu6SqI0eCa/p5T4Jr3816F0Z1mN/FlL
	L6SZ9WMXyfM7Txjgf5wtGIJYWcnuWHvriJx1VZAkaOZHbDLrx+NlfmFo1DyiG34hjVHUsFYpwNs2F
	CRHtBxWY3P6jonxai7aTFQBwezHGUpGNcY0opBtQEKMytT9LFmlhg4OMgSC/QHDk7/9s8LhnB+0af
	yx1yo1cKn8Lt5NbCtx16kc9HImgz5RGi+9TCb5PAxTqhPvaR05EVetKYWesvWKQfkTeWWnh3RJIHS
	ES5XKaKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNmm7-0000000Fmun-30LV;
	Mon, 02 Nov 2026 07:48:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNmm5-0000000FmuG-3PSh
	for linux-amlogic@lists.infradead.org;
	Mon, 02 Nov 2026 07:48:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 91C2641765;
	Mon,  2 Nov 2026 07:48:13 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793605693;
	b=2aVnclzH9QDgAfo5sw0zaNp5TG1L7zD7DxH+o6Bsvbd2qoBrQfyEwmoVfOmQ2H+bm7yQ
	 BRZHJzvMMoNws9PZKjU67sP8Ghqc5bcmbQI2IOaY+zmJNHR6LGz7ilFPC8baiL+Kscg4l
	 g06k7LToHD3WR/lqKRAYAyApW2qfpYrNKOAERvsJB3zCOFKgdFIZLmS7E3QJN/yb2PEi3
	 4SWfvxTjfLL7NldD7gtp1mELwJe2VT7cBnUDaOsJsjJ43vLbdsSIJ2WCcmCqA3tj945cy
	 whEM9Mcs9095CPRdoVGnAXtR/BXOd43yXYMnqtbPNYCAvnZ7DH7EC/8z6xw73c9GTzw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793605693;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=kNMpvUIklLoqq2U8w19NKhZcvl6ucrqllQnFyuCL2rA=;
	b=RgEtvbaRJsIs/4q7DLf6g811dQz2KX1eY1uQYLZlEt4MfcSWUJDGpFPXd4bk4w0PoReb
	 HQcMWWQ6Li0BajAARtPu6zwAHucltZouccLfVFrP6PeoIKQehqpmDmjH6ex9mqkMaWNIH
	 bJL0mjOMMweBAzk5SmjwwKm9dJFHnAqbTmiE2XM8kv6RmDmKwQfaBD3j24TPhZAe5NFOk
	 7CC1MAghOT+L/EXZp264TPma6+gpaPBSeCfEl7LX5mKYi+lMR8J2uLFf4VDaRJN93IaJB
	 uaUHBoBIF8d+HThuwskofSDggIErVh4MMKoudJ+Z+qRS8kD+2nqxhs/fkqrlh3+idIQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7CCC41F00A15;
	Mon,  2 Nov 2026 07:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793605693;
	bh=kNMpvUIklLoqq2U8w19NKhZcvl6ucrqllQnFyuCL2rA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=BFnUArU516smxMVMPmr9QtuOSrlRXMj8rR8gM8eS0Jf9Q4czUbkEGGsNpVEoj4T+b
	 kzhelQEmn2Iyxz/0/tSxZZkyeL3CfuQiMrMyAgAfnVdVmI5WIF6e1WL+XUiSHCZ8yb
	 ON0kMtQGZHuNFyY7mRBHrzGnNzIEv75Avbp5PWX69WeuGcRaKgwn2KSqfsE9tf70z/
	 pAeUTUlgNPfeJ2nsOluS8TjAD81pAENY+Hs5ATVph/0swaczOHPKlevbkgqgrgb2y8
	 DdK7V/VzFVM2oZgqd+u3HOVCcuQrzS1bVOLD1OpcSsM9hM2XzRUORa2V0BKgkiZnLv
	 N0of9bjYiyPTQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id DB78A463EB;
	Mon,  2 Nov 2026 07:48:11 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Mon, 02 Nov 2026 07:48:05 +0000
Subject: [PATCH v4 1/2] dt-bindings: i2c: add Amlogic A9 I2C controller
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261102-a9-i2c-v4-1-5a169215b8e9@amlogic.com>
References: <20261102-a9-i2c-v4-0-5a169215b8e9@amlogic.com>
In-Reply-To: <20261102-a9-i2c-v4-0-5a169215b8e9@amlogic.com>
To: Junyi Zhao <junyi.zhao@amlogic.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Xianwei Zhao <xianwei.zhaol@amlogic.com>
Cc: Junyi Zhao <junyi.zhaol@amlogic.com>, linux-i2c@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793605689; l=1772;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=Sz+UB7O1ObrX0Ep7OtBMUUtSVaLagIleTbf9GlXMQy8=;
 b=av5Ql9+8d9vLT3ZQYaKplKx2KQx0t1LZ2lKkdNcJiyi6LqOZ06R3jNzZPe2YT+6OwK5363yym
 h4IvLCPjkHaDuRPHx/V3khEQkj9Dc6Ly9V35wPmF3InXjTayIhBYKEd
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
