Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70260CD3430
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Sep 2024 07:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yQP0OrPF6FwzXP+MrZYfkr2WoX6v7IXC3YttBxqbK3s=; b=fJeePyrOuh2Mop
	cPjDEclUTCdheP06QefiCbm7ZSoCPuZ1K8Cq5RQmfppyb9h64A2/LjlWLm9OLSylo88ZrFryYBJCO
	ZYs6ZUODZEFBslxR1AsTjxNv78cwn/StqInLHssyJheh+UgNCbNwFZG1VX0vzSWSn/uYViruI8Onr
	yQK+EqLpYjQ0I6RJpJCzmgki7iGQuArbe+ZhFIXVGSw7r/5iteZIhRKezqHhz4ucDTYfLyKed+ocN
	X5Baxq9MrdOzz0NueoDJmoFZWqberFdh6WQWIWaI2NRjIZgNes7KjopwnWHBBFJHn/SAjOEr7QrRg
	yWWYGb3fduKX5WXfQ1Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slNXW-0000000GZdL-3tWD;
	Tue, 03 Sep 2024 07:01:22 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slNWy-0000000GZTy-34ys
	for linux-amlogic@lists.infradead.org;
	Tue, 03 Sep 2024 07:00:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7E801A414A7;
	Tue,  3 Sep 2024 07:00:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 087B5C4CEC6;
	Tue,  3 Sep 2024 07:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725346847;
	bh=9lC0b/hC6Itnw/Lz1IKa8Nfwz/BjMlUk+OvIfGmqruQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=SZdE1RcBQ+eamILjh1zF49paf8hKKzY0kADnAub8DzDMVoX8m+d3tiKjII/dNmyei
	 RLcD66nOBbOyUwmxbrlNvQ+N0kLeJEpTotTSv69rDJ2jKJte82xc7lBJy/a5/TR2P2
	 IFY9QDfcXdYpnikEvhnaxcTPdbblTi0cW3VA2CGxAQ7YacTEJOX9S3PeGdV99rWyOb
	 9FPY8DmwYt3qoTfnTW8jGhTaW6CBzj9mMrne3htgh7Xqbic+X5iyfWdII5wacw/A0w
	 fHd3lhgEiX5jaVjGKYuLIOnevU35bokvc8LdkQR0CzESaXRozCQBCaxSQ67mEqDrg0
	 sW3i8wra6rqeg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E909DCD342E;
	Tue,  3 Sep 2024 07:00:46 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Tue, 03 Sep 2024 15:00:45 +0800
Subject: [PATCH v2 1/3] dt-bindings: rtc: Add Amlogic A4 and A5 rtc
MIME-Version: 1.0
Message-Id: <20240903-rtc-v2-1-05da5755b8d9@amlogic.com>
References: <20240903-rtc-v2-0-05da5755b8d9@amlogic.com>
In-Reply-To: <20240903-rtc-v2-0-05da5755b8d9@amlogic.com>
To: Yiting Deng <yiting.deng@amlogic.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725346845; l=2215;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=6EOnWaPKquIIloeXnJxYL8qcuh/homZJSOyDiv+sQAI=;
 b=c5sxbiBQLtdl3PtkTuITSGLV8md0Cj2hMnZUzjO5fG4hot1b0Q2H7lO+bTCW8iB88qbs3PoSN
 8YlvLQKBrwVDjIGNmtDLpj1/58DMflSjiLEcIUXb9cRXDGvHyXR9W6f
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240903_000049_002291_828B864C 
X-CRM114-Status: GOOD (  11.50  )
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

From: Yiting Deng <yiting.deng@amlogic.com>

Add documentation describing the Amlogic A4(A113L2) and A5(A113X2)
rtc controller.

Signed-off-by: Yiting Deng <yiting.deng@amlogic.com>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 .../bindings/rtc/amlogic,amlogic-rtc.yaml          | 66 ++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/amlogic,amlogic-rtc.yaml b/Documentation/devicetree/bindings/rtc/amlogic,amlogic-rtc.yaml
new file mode 100644
index 000000000000..128c60b623e1
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/amlogic,amlogic-rtc.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2024 Amlogic, Inc. All rights reserved
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/amlogic,amlogic-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Real Time Clock controller include a4, a5
+
+maintainers:
+  - Yiting Deng <yiting.deng@amlogic.com>
+  - Xianwei Zhao <xianwei.zhao@amlogic.com>
+
+description:
+  The Amlogic new chips used RTC module.
+
+allOf:
+  - $ref: rtc.yaml#
+
+properties:
+  compatible:
+    enum:
+      - amlogic,a4-rtc
+      - amlogic,a5-rtc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: RTC clock source, available 24M or 32K crystal
+          oscillator source. when using 24M, need to divide 24M into 32K.
+      - description: RTC module accesses the clock of the apb bus.
+
+  clock-names:
+    items:
+      - const: osc
+      - const: sys
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    apb {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        rtc@8e600 {
+            compatible = "amlogic,a4-rtc";
+            reg = <0x0 0x8e600 0x0 0x38>;
+            interrupts = <GIC_SPI 131 IRQ_TYPE_EDGE_RISING>;
+            clocks = <&xtal_32k>, <&clkc_periphs 1>;
+            clock-names = "osc", "sys";
+        };
+    };

-- 
2.37.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
