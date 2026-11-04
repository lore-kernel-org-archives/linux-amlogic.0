Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A41606A31B
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Nov 2026 10:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tDsFaZzp;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cqXuTlax
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vtJYCAhaG398ZBTbHeySrN4oiKoJAZXip6EumOBARHo=; b=tDsFaZzpb/saHjhxWxyzkR3AZl
	biXLNl5aZnQYWaW0uw0Li3ju9yCtCc+5A+lSlu2xojvGIidkBHjxcW7cpM845u3MqKjwN1DVXFYMJ
	BozaXx+sennOiqY4LZ6MpLlT2yVmNMWXXZB3eibQQJNP01KQKPhh5GmCtxRe4mKmzETvJPWC/RkkS
	PtmteJGMJ1IZUsf33r086Q7erxQrFHr/KGM2cRj80DYXwXFT6B7aJ+o25GB6VOV036wdaAa4TPTBP
	/DwHaX7cgO7PAZMS2n79gzDfZmoGyfzSo7GkUdMfoRT2R6vS4Q5N2EyyFUl7mXcNr3UnswcX0YIUX
	768/qUcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOXnm-00000004wc1-3Vuc;
	Wed, 04 Nov 2026 10:01:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOXnm-00000004wbV-0rkp
	for linux-amlogic@lists.infradead.org;
	Wed, 04 Nov 2026 10:01:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2C15560D79;
	Wed,  4 Nov 2026 10:01:05 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793786465;
	b=scNVdgp2rgL4qYKiFohA5AADhM7i3P1qyMfYtWuHqcFiDTnHc161r5kww2VYLRVNTsUw
	 /558y9Hz22RIlJZ560bha+t1nmmTfyDop/s1m9T8pqBayxw8S74oyNUJC/XXph/HuXwdA
	 +71TV/8LHQRwATjn1sYLxeEp/Xcg5s8b5nhwKyqb57rVzxUqyi2TJLEzgGEfRzwJlFkpo
	 cqhdymGVhuN+B0tkcOObNJtKTggiQqP9lhohIkJQWG1JytmvuBsIj2k17/hQQUa26ZLt3
	 kj7b5d77PRteG7QZlYeyEWur+fFJQ/b8uwAOZxbYMPR+MVv0kmbjUz0ZcEKEzkoALtQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793786465;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=kNMpvUIklLoqq2U8w19NKhZcvl6ucrqllQnFyuCL2rA=;
	b=uUaPcWr21hl0DxE/qQlMfqZgYVKhvqC4EqVwsoGpYrXVEaJYawhMwBgeACcvf5944kNJ
	 CH51uqg1ezcJC0dlpWD4fiLehEEU/FE0P5enkB/Yoe4CJUcQWLh5JeghIv5EzrJha5FTm
	 p2fkDLv3m4/biBQJrs/pAloiQF7QVtMElwnDSACLLmlkwHIPDeYQwr1NlyWFimElIrN9R
	 UjITaXHPCfAOIqghpo4HSZY4TfqaYTKky0Gc3K9iVI9fO/Ng+6/r9WWHRpN56m6B5M5ex
	 O4MA1v/06ncXrBG0N/emapgyM44rHtb8zGxs4cU6T91FVU47TLgNRmywF0QQkr/EzNA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6FDC01F0093A;
	Wed,  4 Nov 2026 10:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793786464;
	bh=kNMpvUIklLoqq2U8w19NKhZcvl6ucrqllQnFyuCL2rA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=cqXuTlax2xrNkjJikKcmq3GGRrC5XCO5Y0T1xKuY9UcD+1oO+1pSgf7bKEC0xTh38
	 CXHBC9jELYysMGXdE/v6CiQIt5BnopB4TRuO1F9prvp6EkjMFLiMjyiPFkRE0ggdAJ
	 U8nCN0X5EPKke1HoQaJUOLGwBcT0GLte/IxOmoUkQNfBdxPOKn52b17PXGIiyt8oKo
	 LgmfJVGTz3bTDAlrMZ/uQDYXsMWCXKYlJZqvMAShUb7t0pEEUJ1vVyDzamxk8BOaMV
	 Lj3ESnL8NKM4phWsCcZyH+d4H9vb0BZedkK00EfOzkak4i9uXDUL5EuLZvQayMdsvT
	 sYfJptCdxgLnA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id DCEC146D9D;
	Wed,  4 Nov 2026 10:01:03 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 04 Nov 2026 10:00:59 +0000
Subject: [PATCH v7 1/2] dt-bindings: i2c: add Amlogic A9 I2C controller
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261104-a9-i2c-v7-1-b31f2b53faf4@amlogic.com>
References: <20261104-a9-i2c-v7-0-b31f2b53faf4@amlogic.com>
In-Reply-To: <20261104-a9-i2c-v7-0-b31f2b53faf4@amlogic.com>
To: Junyi Zhao <junyi.zhao@amlogic.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Xianwei Zhao <xianwei.zhaol@amlogic.com>
Cc: Junyi Zhao <junyi.zhaol@amlogic.com>, linux-i2c@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793786462; l=1772;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=Sz+UB7O1ObrX0Ep7OtBMUUtSVaLagIleTbf9GlXMQy8=;
 b=WhtEilMMr8PFBI9Pb17tCw2h/eTSiut7hp/36JutLYvH6xzDA5FVFYAnrXIQWffZnoFVuReL8
 ZoSMrKJfqQFBC+BZT7oS260qrELYZMPCpVwQPCszgatkGwIhHxVh6t7
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
