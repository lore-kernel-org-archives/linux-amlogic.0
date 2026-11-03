Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A09F606A33D
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Nov 2026 02:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yYr/NJ33;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZF33uj0P
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vtJYCAhaG398ZBTbHeySrN4oiKoJAZXip6EumOBARHo=; b=yYr/NJ33+fCO2rq1D0Ul+GiBKz
	qhyBwSxRDjSGyvUgsaRpInf6w8oCqAJH2DL4/hIpXjVBNDuTbHpeONwZEmQw5F14YqTuecPD0fvhf
	ABM58gzRwHdIQahc/N7lk+vScBR5VRfv93j1SJ5pVVrCNoY/UCFF3GqHVDiQO9JMPGmtWTvHwPaJE
	y/g7rbu63BJj9nZ/I8MuN1pIg66aDXPvioatqwnLjV45AoltaK+KD9qshChFr1XSqpfnVIB2Le2dK
	lFCgPFBVJ+AEieVZi+ANW/jmU6IZIsnZ5C+EeqqlxgipWdMJAw7wvfyk3pCGC27zhYcRUiujwlY7x
	1d8Bo3bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO4di-00000000tz8-0jcl;
	Tue, 03 Nov 2026 02:52:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO4dg-00000000tyc-3UnI
	for linux-amlogic@lists.infradead.org;
	Tue, 03 Nov 2026 02:52:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A543442E2F;
	Tue,  3 Nov 2026 02:52:43 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793674363;
	b=Wzr1kkHTXmw2t6ybmt/PjiIfMITBGNkzmfYgAH5FYqPGasTrrWj0+bkyqY6X8SeOsTMB
	 Rd1s94F6XMrC1mQcjnk/cORHJgwADiw3plR+aQGgekNL0b16Gvlci0f2U1q4wShIxI8AV
	 gqI4mmy/fv/5aLbF4m27+HRnzvii+PnF0A2q+lls7+4ya4mfBO9+GjRVS6/VuDSPs17PT
	 X8gk+YCGL3u51/ZDeSs4IQ5K4ReC5Q+LVHxoPG9srhFot8DEO4bdC/VFywv74f7luVeFR
	 eF5eVN9pUgmyEa+PL5Ghf4ki+Fe6RFkyF8FeJNZETC69+/0pHGY+L0KAQK6VIeu1q8A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793674363;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=kNMpvUIklLoqq2U8w19NKhZcvl6ucrqllQnFyuCL2rA=;
	b=KjoUhtyjxSh7O55wm5eDq4UJrWjTHzwCRb6FBCb3vQSzS8oblb8gCloTmPHJSbLAmLQk
	 Sf6+NEQXiDIbroYwYIMEZbWUdJSEIsRFuEj/Eg0UZt2WaKpClKCsvsH3vR5wJdGuJzhUI
	 rFb1HnIo85Fzc576UVq4e7vnWypZrF0Wg2WOpDALUPmqsFfWLM+tx+28WTQHAcNs0CFca
	 MiSZmU6UkJQahBG+9DZZEXzbIXL/0j0LyxH/XLYNRt2x99njT33ROFHQGtkTDukQ+WDIz
	 xEuZVSJ+1h1vy5MSibvxQyweCCsBFEYO5roQaMhAF3gtdYi0AX9M5o32iU3l/lVg/tw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 12D931F00919;
	Tue,  3 Nov 2026 02:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793674363;
	bh=kNMpvUIklLoqq2U8w19NKhZcvl6ucrqllQnFyuCL2rA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ZF33uj0PzCSjw77b3ZkdVPLX0/r69alTZTDaRXqrGNDfTsCGIJgPH02gmS0HC2H/k
	 xVjOSYTE8Np8U0/n4/KVrxoZZOCWxMO9rB1T0cdqdT3HY8sZeNrxtARcwBm0HkvwZ4
	 vk0xsE4mlXoERN3wruzzpa8YI1zr4IlmZ8oMEWEgCfs7/tLXMpi6ERwyJrebr23ZIY
	 yzgKfZcoh4mLKiOzXSxEkf6IoukEUNGEbIGXUd4ooz2KjUjJ6v2L1YG0jyywTL+dsk
	 cKN+G3QeY11GHhg101jFPRGHMzkopDtPDL5rpHg8vvSjw37sBNe8HjDHLrctb5VXyK
	 1c+cHvCZRR93A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 94C3246724;
	Tue,  3 Nov 2026 02:52:42 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Tue, 03 Nov 2026 02:52:37 +0000
Subject: [PATCH v5 1/2] dt-bindings: i2c: add Amlogic A9 I2C controller
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261103-a9-i2c-v5-1-86f2dcd179d8@amlogic.com>
References: <20261103-a9-i2c-v5-0-86f2dcd179d8@amlogic.com>
In-Reply-To: <20261103-a9-i2c-v5-0-86f2dcd179d8@amlogic.com>
To: Junyi Zhao <junyi.zhao@amlogic.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Xianwei Zhao <xianwei.zhaol@amlogic.com>
Cc: Junyi Zhao <junyi.zhaol@amlogic.com>, linux-i2c@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793674360; l=1772;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=Sz+UB7O1ObrX0Ep7OtBMUUtSVaLagIleTbf9GlXMQy8=;
 b=kr2LxbDlUScN8iC/AFpWrtMjpomSJf/k3a/RSAvQYAO6W6Inh1FiN5mZCD9znK9eDiVh65Pmy
 VJwp9qJnBmOBMf6eeYUhdIijzyKNg1FcS6XREUoJj3EwQbFybsipGuh
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
