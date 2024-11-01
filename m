Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AAE6E67495
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 Nov 2024 02:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fImEVd8MSeEmhD35Ir+2/kwiJamQpck1EawVGXJ551Y=; b=zEEm7Epiqi3r2/
	ntURDLbDzd7BPSvrqOLpah/uRjWf9PAv3yYmsyQCWKLdlgdQhsAMv+PdKpMsUjwve/qdDMxgySsxP
	d8LPIN5mGPq1LTe5nBCJ/adBi8suOMe/oQ0uxu8Uh26glxUqKQZsdoDJW6pxB1NMgZW/4zM/RLRpw
	0eT2g8Be538v7/vHAqw8PrS1EQAYyKfsY69f8J3uodpQngLHHTrUcBoI3S6nKHFHTTMjvH2IYEefr
	11uJbKNv+88m2SX+4/w2VXX3MiOq/hT4NFjlX00iN4tr6QzpGmMyYrUmjcadNNFeunP5ZgDBLj362
	jyF6LjWyPVWpVwfvtrkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6h44-00000005W1q-0YD1;
	Fri, 01 Nov 2024 02:07:04 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6h41-00000005W0I-1ZTv
	for linux-amlogic@lists.infradead.org;
	Fri, 01 Nov 2024 02:07:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4D1FFA43293;
	Fri,  1 Nov 2024 02:05:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 341CEC4CED0;
	Fri,  1 Nov 2024 02:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730426819;
	bh=HJE0pA+74tCzliJNJXQ3Kg9jGHLW4xMEmX5HYgB7ZDs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=nbI2aEUosBSJv3GlQshLPt85YkkeNb6SNij+jUZN4zIcFc36rd4IwBWSP9iE6CqaV
	 8gxSwp2DfY4PcbLVDboPyXk0OL5GU1BPX4hVymqJ7ISLk60p5STpPRkZH8Yhh65eUs
	 yvP3tAiqV3b4f8ACjd3uIBuCe64gU9w+qlIK6Ix67pvgwbEovX9q9do92oibplJdhM
	 xxiB0cB1QhkfV7QhaHDM8JE9TmLWimQIQOVHmrBhETZekJQKhkFoLMdXg+QnGD/jp5
	 6eeuRoJRJZQBlR1JntSQmto0oYBbhvoQpLUdNmJLfgG2G2YE44X6tXBHCB9K23p8xR
	 XmCiHvLoIeWyA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25872E67493;
	Fri,  1 Nov 2024 02:06:59 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Fri, 01 Nov 2024 10:06:47 +0800
Subject: [PATCH RESEND v4 1/3] dt-bindings: rtc: Add Amlogic A4 and A5 RTC
MIME-Version: 1.0
Message-Id: <20241101-rtc-v4-1-14e1ed486ed8@amlogic.com>
References: <20241101-rtc-v4-0-14e1ed486ed8@amlogic.com>
In-Reply-To: <20241101-rtc-v4-0-14e1ed486ed8@amlogic.com>
To: Yiting Deng <yiting.deng@amlogic.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730426817; l=2146;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=SnfWHSIVk7X6HuExSpIoFJO0hQjcCpxtc5dtKXQKyis=;
 b=nXxB8Wus/Y3aWjqRDZOyufw/qV8rYOBKCa/et3kx8ABYVdS1/qy+g4AEeXysSnib0Bw+6uNsD
 yC/KmSjzereDN5hXVziUBrIgQLqTvvOnyF9Xh3YuyiU8XkUQQwxNq7I
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_190701_592969_87CDEEE8 
X-CRM114-Status: GOOD (  10.77  )
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

Add documentation describing the Amlogic A4(A113L2) and A5(A113X2) RTC.

Signed-off-by: Yiting Deng <yiting.deng@amlogic.com>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 .../devicetree/bindings/rtc/amlogic,a4-rtc.yaml    | 63 ++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/amlogic,a4-rtc.yaml b/Documentation/devicetree/bindings/rtc/amlogic,a4-rtc.yaml
new file mode 100644
index 000000000000..5d3ac737abcb
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/amlogic,a4-rtc.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2024 Amlogic, Inc. All rights reserved
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/amlogic,a4-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic A4 and A5 RTC
+
+maintainers:
+  - Yiting Deng <yiting.deng@amlogic.com>
+  - Xianwei Zhao <xianwei.zhao@amlogic.com>
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
+  - clocks
+  - clock-names
+  - interrupts
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
+            clocks = <&xtal_32k>, <&clkc_periphs 1>;
+            clock-names = "osc", "sys";
+            interrupts = <GIC_SPI 131 IRQ_TYPE_EDGE_RISING>;
+        };
+    };

-- 
2.37.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
