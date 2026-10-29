Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D6D606A320
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Oct 2026 08:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1K5NKWUO;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ku5KAvPV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xj2hScSZUU84VqyzL6Cn6lcPWGJwG7D+AG0N4LL8dJ8=; b=1K5NKWUODqfgG6reJXS9h0B4Lr
	XZvUFf4Rkt1tNb0stnfomJJWXu+vMiIgEZ5wIXoXioX0H01LWrlwv4EGVuV0E6lIqi0bGYCCSMP2g
	oZb0qWfSoiheTFFmC6ovHMSQ3jplA9Nc+DRPCehRn5t1BWaLeXXacTsYTQNUj3VjrIBSOdQXXRgyt
	sr8x9pAr2UFtGOxA3F7LyowoRT1ReEiSeXpMxJgluFwbVG4ylGiJFR2v2rKr35YtwACk4IUENyy1f
	Aj/0d56np9fs4+nogBKWxLY7TkOLXYDYGIsesXF9CzavPEXZYzPI4m7UTEQmHOXZqA1+d6zB/pKFS
	mOPSi6lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMLZt-00000008jzm-3pjd;
	Thu, 29 Oct 2026 08:33:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMLZs-00000008jzV-0snM
	for linux-amlogic@lists.infradead.org;
	Thu, 29 Oct 2026 08:33:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E93C541190;
	Thu, 29 Oct 2026 08:33:39 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793262819;
	b=O6avYZVzfb8mu6p+Qd0in6LHmWBZPL3YJLnIHF/qFOlHHcle3mdFXqRJ6+yZyeB5WUj7
	 roxgr3k1rLfomqcEWzX+Gnep6J1B0KM3Xanb3zJRbkcuEmA543C7EimAimwmDYpkEiRNV
	 177Le3BbaC7eWSj5G1AK8sva7ABYNpj5JmxTXA+dODEDGXNq1niE0NNtBRwrIZ22CdUgW
	 5SlvdO98yUOEBiM9qgqwXM0RP7ky0DH7hshdxxhG9zOFVRxpRU/GXjfomC6VznrZOAyfM
	 xvaVALRldHIE1xdWi7Vh6Ul1sNPpUNWdJBPaLnr3uHRwxmHwpG8o0vtdwsGmaFqDugg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793262819;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=wfbg6tsOH+5dCqR6eRG5y+pRRouozsxb6eB2ua5FAlU=;
	b=Uz6vt0BmlSFdSYFJSUiOXx2XSzjySRQ68UCQHn8WZ+mzKgDxF6/hm6nMbRuGXArcKh9j
	 TEfxoi5vVVr0/l49ZDp6nE92n77anUgK1oo22CJfxFrzOMAK84ZCGJwJ0rWXy2yrB4YQf
	 k+ycFdrwDfYxMG9ZpReZ5bA2AP4QQUm9qs3r7emPxxISvtD1O9VmPz8wA7Wt7vYv+N+aQ
	 SKEyLXg3VIJ+rVwvgqElDH4lit2M6ZrlWvHsgwgeNLNEu2nscRIjd2Vw5h8UpYSgk3Xbu
	 JyZbAnbOU8TMZURV5bL/zNmAwzsqx3I5M0zDyIuuWy9IF0FyI34oTxhbg01Qpce2/tw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B81401F031E0;
	Thu, 29 Oct 2026 08:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793262819;
	bh=wfbg6tsOH+5dCqR6eRG5y+pRRouozsxb6eB2ua5FAlU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ku5KAvPVzn5kgug5VlO5pFM01dkfJlKS3q7oFnPtx1ZBQ6RL4Xbs5+f8TUvxoWFvz
	 PM3J1STdrAdcfJQSTHVIibCgPqIG4XGUwmiQU/KpM7up3npkObPcO8UyeGmIf4swNI
	 ZU5fpUyXIe6DGBlKmggLWUdJPE7jf0yyd1IzBC5imiv8uNRX4arkelEEFk31S+EJpU
	 ugn2vvSmBdBbb/dtTLqpJN5RoCPILWHjQdYIr0KJq/2qdY1ZeIYSR1pt7/Os5Egbrd
	 bt5WSvHN66OjC/L5Q1PPazpy1IqTT28De2xW418kGhw+ePhTFuyTZeo4uQ68AXNo/h
	 QY0xmPpLbwqrg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 282E645798;
	Thu, 29 Oct 2026 08:33:38 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Thu, 29 Oct 2026 08:33:31 +0000
Subject: [PATCH v3 1/2] dt-bindings: i2c: add Amlogic A9 I2C controller
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261029-a9-i2c-v3-1-7b30ccc00533@amlogic.com>
References: <20261029-a9-i2c-v3-0-7b30ccc00533@amlogic.com>
In-Reply-To: <20261029-a9-i2c-v3-0-7b30ccc00533@amlogic.com>
To: Junyi Zhao <junyi.zhao@amlogic.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Xianwei Zhao <xianwei.zhaol@amlogic.com>
Cc: Junyi Zhao <junyi.zhaol@amlogic.com>, linux-i2c@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793262816; l=1719;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=/oijmKmiPfKgJUJzYs/dQncbUdJ0Rw2jHh3oFq2y0wk=;
 b=K3lpRC3GsEy/4C7xa6a2wK8dpLUAkKyhjF28mJILjbzgr+/D3ksobgpAXTC6XiZjmTDjikxGY
 8p69WsNvLQ/Chgom/hRUwpPYlwbONwTYbVi9E0FRlrQxNYVPZF3rknh
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
