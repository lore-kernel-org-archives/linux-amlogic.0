Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B7C60A2613
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Nov 2026 08:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ftH+BwQt;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZAFdKLh/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vtJYCAhaG398ZBTbHeySrN4oiKoJAZXip6EumOBARHo=; b=ftH+BwQtI0jggptWud4KJeSCI7
	qPIh75myKBGPxBFSnybP84uFZ1zk12aKsYYFKKBE7Nuas3bd582JNx10yYfV0gmQwVQ4jtGZ4A2j8
	i0cQqRH1XZQsgKR6QqZSiUfI0Dh9AQ0+BnGZRRvOxI0O1EDkq/fPGkCsKYYFCwFw9TIKhGKvMeXjb
	zPW8A+5L3nfOf5chHgWy0YfzKYRq1nCP87QY8rBGtGgWv0hqRe8JpG5o17eMfeh43LVKAEiADXPDK
	4nbf35IyKsjT9jOwNGyOgRVaqKwgU8s/89eC7yzIVEKeoq7rmKBScy1LdKZQ8oqUUzL8WZTo9jUqP
	30oJTX0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQh4w-000000035uP-0aJj;
	Tue, 10 Nov 2026 08:19:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQh4v-000000035td-00Hp
	for linux-amlogic@lists.infradead.org;
	Tue, 10 Nov 2026 08:19:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6D87F4384B;
	Tue, 10 Nov 2026 08:19:40 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794298780;
	b=W8d8Y0jCZRqBmBDtgfrtNupf9PZ1cc2druSV/QTRUVo4ZpPUS2KuO06G3VG+sKhvzOmi
	 axyJtK3jXEgYZNu6y3TaAvKA0jxliZg7beoJ4P08x4c+fdqwij02x/HGDn6RXMyRXzYo/
	 DIC7O1gzt1PmSJ/j1PmID8s5hsAdOHWXc+tgVbNMUq8E6y4MxJHk5+cGv5MuK3v1cQJvS
	 YKLca/s9IGYMCIOFkOTJ6DEr3U1+OTQIiPjQBgC/BdFIpPupro/KHsGGj4JIqe6OlyFnN
	 N+fwzbFTNXpEJjGvBPIyvcJ4njp8seb3HAm5HYzFdynAqpCwn61DL5BPQ8v8BkFbqiQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794298780;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=kNMpvUIklLoqq2U8w19NKhZcvl6ucrqllQnFyuCL2rA=;
	b=S76XXbJ27MVyhzUfzbAS0AKZ0zC1AOyPS1H4Etpu5yJNyUZzjGc0KMGndv01kE6hKU+Y
	 a2ThD3WLBaBKo9oBeOKWp+T9VeYeJUtxtQVdolJ4nQcv4oGX2jNpf0sTw2vJXqVmzqgXl
	 ZgtfgfVl1RF0cNBsg1+jnm0WwwSwqTuvhLBfqY8BM98Fnz3Fx5jGsOg5Nk7thRr5qJigb
	 zvIMSXnZJybEvD4Utc5pMVdKXOLaY4TUOlBnCCZOtCBTdlmu1OQX0pwjILzzptmGN+vB6
	 q274qlEMuCGKO1V2k9Emowhd49wf8CLeO6isu+kSgTfaNipogO0K4TIdgN+ZmuJMKgg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 25AEC1F008A2;
	Tue, 10 Nov 2026 08:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794298780;
	bh=kNMpvUIklLoqq2U8w19NKhZcvl6ucrqllQnFyuCL2rA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ZAFdKLh/wRJff2Fnpc6k5eMvaWOa7/vQVd1K3hf/7zuEm/6m4GqUCQZuCPc+yEM/h
	 wI1qFu1Fd7HA6vfju9yq/epde++kzNOKBtjEzABK2LlmItNg65b9utrHnhm6jhmDvQ
	 HZlcgVjC5vR/N/nDmyFSPbzGdbIzDOb4j6IfkQGPSpk6+lMXxR9hQlrDPDZdfB7xRj
	 spJehndg1V2vJroHXIpxjsYVJ5+DE3A02ru5fdS0JjH6tbkR7G15uXLJg3WtLzuLSp
	 aXuuEC0Oi0j3ay9sKSmJZ+nadhZi2XoqiR4XIiuxl2zM7sf8q0QINqL6ZjviWhC84s
	 mqRl0ve3uZ6zw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 91DDE48A36;
	Tue, 10 Nov 2026 08:19:38 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Tue, 10 Nov 2026 08:19:33 +0000
Subject: [PATCH v8 1/2] dt-bindings: i2c: add Amlogic A9 I2C controller
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261110-a9-i2c-v8-1-1e9d2682f86b@amlogic.com>
References: <20261110-a9-i2c-v8-0-1e9d2682f86b@amlogic.com>
In-Reply-To: <20261110-a9-i2c-v8-0-1e9d2682f86b@amlogic.com>
To: Junyi Zhao <junyi.zhao@amlogic.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Xianwei Zhao <xianwei.zhaol@amlogic.com>
Cc: Junyi Zhao <junyi.zhaol@amlogic.com>, linux-i2c@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794298777; l=1772;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=Sz+UB7O1ObrX0Ep7OtBMUUtSVaLagIleTbf9GlXMQy8=;
 b=ZemSN64rnYCKJWWftuWVcVw2dywgjig/XExYyS9+5LJceYpktptJw38F1NZyXTzvxNDbcJdKD
 1h6l7HWg7+OALX6OJwKgGWECZZ1BlBqbZg9mZefeOZY/m8c+2d0Zq68
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
