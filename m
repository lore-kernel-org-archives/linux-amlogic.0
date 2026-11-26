Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988C6606A6B1
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Nov 2026 06:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ADlIRz3y;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HHI7zjh0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=it9HGagXO5CHOBcwkImbn1Ox9T2MVkBruc2vsdAptMw=; b=ADlIRz3yWqdbTsnI2xGZEI9yED
	bxN/KYpybrhRai9lIpiXDA4TXb1pnKT5v9Hv97IH/QRRVpejph5s/tVm1M0N/yZmJr69a7xdwgJ3I
	HLw7NvE20sLAmws3pntVgxCEaYRQeZ15BTTfA05NshLOnLnl1kIhS8Y+6IUsY2idWelE0rTpKudau
	eB4CPGtmiQSk5EgbsZpQN7Y4wDFays2lK5QIrruPlwS7HwiGv1Mb91dKuer8vWXKXmek8yGhfjGfn
	F91VJH1Y19NWxiQWa7AUoCxNvRLRe9ONESS4aiOaQGKa/AzFk90Ds7XZzo3oxtfTR7kq2N8bFzd0p
	yeWn2bSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWT1j-0000000CCZ3-48eR;
	Thu, 26 Nov 2026 06:32:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWT1i-0000000CCYs-2sn8
	for linux-amlogic@lists.infradead.org;
	Thu, 26 Nov 2026 06:32:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E1E6862525;
	Thu, 26 Nov 2026 06:32:13 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795674733;
	b=aprmstfouwmqbVizzoyFxU3UZCaHA300peahhKZsRiB5PsXf64QNZd4+vCFLIi19/8Sk
	 0+OjEUn8IsKRP6BloPhcbdXOVTt3VuliuOlYqw8qFxNFCCQ28Qh3Oy5JYEUCCskjbcS4w
	 /jtbsaD3N8euf1zD/Lh7A0NmGWSqg1jfnhcgFjfgGOp2BfPvhs0Khwwa9oIrZuYpBfrKc
	 dyWH2m9K7LfCOsdvkA3gsimyD5YGHtpCXp557DgUnToZ6wH2dIoNC0PxUkQvZoACyE60J
	 tDw8284M146z6Mj8sUUXVp4NjiAzATEQNkmSTPOYiIxjzgwGU9JzhDv1M8p5VWBT0hw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795674733;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=zhqVKW78IsVSo/xxxITMweMjOylvGKZBxUx2VVamPk0=;
	b=Ax71CpVu1JyviMUuyw1ZyxBM4GOWCtvsNB4hDFJBJNNkZBub8H+jRrAwAIy5U4EQnClf
	 gNSOK9p+PcRJHhtRpbrLPN2M10p1/n3oP0J0jhmpUxOpYJ5+t5LTtfsAsGmMxQNyv/+Em
	 pijw9BoG1jp+57CjW7GVk+KMsamM1XkBee7Q8VEw+4dCIyvSvP4u+wxzRRG7nmSJ83SuG
	 AeodFl33jJ3UuWC8+86dY5yVKv5JudO3zvVpcutPLxUW7GA2akcnPsvQigIF/t5O5uVYP
	 7u03LmN1Vsa4w6MUYHCoMAHLgDAcWzNmfmkrX1bDrONmkL02iFMEDZ6Meoa6DhPX2og==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6E9791F01568;
	Thu, 26 Nov 2026 06:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795674733;
	bh=zhqVKW78IsVSo/xxxITMweMjOylvGKZBxUx2VVamPk0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=HHI7zjh0AxfoFmJI35S0vMPTGVFFxpdKACbboPTMcCwUQDzJYuBC7cNfFsc84bq/e
	 9FKhVm4AKcZR0uKg/LCHfHwUT6girQr5ZiOqfHk044jfVxBWpTVih5a1MdlVOoZG/w
	 f2mq+e5doQr0YklEaKiufrmz+NGsz5oxzq2YgKOk5TPutrSW2GKXB7eIeP+Fq/p/cr
	 gxD2EQu0O2TDzF5qVS6sxhHSYwmxJuMLj8tqTL1rlyhEptUub3JzQQJHoEqfS8F5wt
	 jWTDxRipFp1UVe8MRMKc7FFPX1tglSRbn0HSStKA5ay2aIXPZ2gpKyfHFQrUdy/0bv
	 LuvaLMCFEd8JA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D2E434D253;
	Thu, 26 Nov 2026 06:31:22 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Thu, 26 Nov 2026 06:31:17 +0000
Subject: [PATCH v13 1/2] dt-bindings: i2c: add Amlogic A9 I2C controller
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261126-a9-i2c-v13-1-926e2072cc4f@amlogic.com>
References: <20261126-a9-i2c-v13-0-926e2072cc4f@amlogic.com>
In-Reply-To: <20261126-a9-i2c-v13-0-926e2072cc4f@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795674680; l=1771;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=esNib6Pd+qDIMo/qiM5L3Tv0lFF6FFp/SPxb1xx3C/8=;
 b=utmac9iMD4FvQDAZ9xMSVqnFnxhVQbLoAf4+UlSe/0P1eHYA2q5VRU39DiCEcCcO+6mEdC4z/
 njENA1kG7DlD4we/RzZfYkoKF/MI4wY+Nn+Te4ywvkA7sPpJkwvf0S1
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

Add a Devicetree binding for the I2C controller found on the
Amlogic A9 SoC.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 .../devicetree/bindings/i2c/amlogic,a9-i2c.yaml    | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/amlogic,a9-i2c.yaml b/Documentation/devicetree/bindings/i2c/amlogic,a9-i2c.yaml
new file mode 100644
index 000000000000..e9a4f188aa6d
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
+        interrupts = <0 164 4>;
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
