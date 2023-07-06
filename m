Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F38EB64DD
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jul 2023 11:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IhmuthIvNs8fTT9/uScTMWq6PCQplY7TfAe1C2aCc4k=; b=0mZOp4Z+uJzj56
	kLxy0zOVGa5WZedWRcJ1cTUDisv9ViTgJH4cbG1Rd301aLEla0s0Vyzox2APCj8RCtS591ErfGFiU
	0TfX6+QY5NzFoFPn+3aYhP0tXRcsH1ngUW53oTEsXw4tInbWDyTpuBps/iN/3Xel/mWIOWzq6HxRi
	3Jj5QtdX+gX8s8RfTVqbBqNaeKueXtReFnv/mMBn3ws3qQqmT8V5wrvnXlJhuqBOCqnKOJcR8ZN8h
	rT3QiS+ILQzSkDkg26heLck9pIs6hgSsuU036iOL5gZDvPELLT3ZSU4ieIk8qBG9RSPpFsQrJoREQ
	3G+islpX/9fFNKgNGKqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHNR3-001WLb-1x;
	Thu, 06 Jul 2023 11:46:09 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHNQz-001WIX-28;
	Thu, 06 Jul 2023 11:46:06 +0000
Received: from rd02-sz.amlogic.software (10.28.11.83) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Thu, 6 Jul 2023
 19:45:48 +0800
From: Huqiang Qin <huqiang.qin@amlogic.com>
To: <linus.walleij@linaro.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<neil.armstrong@linaro.org>, <khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <brgl@bgdev.pl>, <andy@kernel.org>
CC: <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Huqiang Qin <huqiang.qin@amlogic.com>
Subject: [PATCH 1/2] dt-bindings: gpio: Add a header file for Amlogic C3 SoCs
Date: Thu, 6 Jul 2023 19:45:21 +0800
Message-ID: <20230706114522.2490655-2-huqiang.qin@amlogic.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230706114522.2490655-1-huqiang.qin@amlogic.com>
References: <20230706114522.2490655-1-huqiang.qin@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.28.11.83]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_044605_696977_939CA034 
X-CRM114-Status: GOOD (  10.52  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add dt-binding and related header file for Amlogic C3 GPIO

Signed-off-by: Huqiang Qin <huqiang.qin@amlogic.com>
---
 .../pinctrl/amlogic,meson-pinctrl-a1.yaml     |  1 +
 include/dt-bindings/gpio/amlogic-c3-gpio.h    | 72 +++++++++++++++++++
 2 files changed, 73 insertions(+)
 create mode 100644 include/dt-bindings/gpio/amlogic-c3-gpio.h

diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml
index 99080c9eaac3..e019b6aa6ca3 100644
--- a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml
@@ -17,6 +17,7 @@ properties:
     enum:
       - amlogic,meson-a1-periphs-pinctrl
       - amlogic,meson-s4-periphs-pinctrl
+      - amlogic,c3-periphs-pinctrl
 
 required:
   - compatible
diff --git a/include/dt-bindings/gpio/amlogic-c3-gpio.h b/include/dt-bindings/gpio/amlogic-c3-gpio.h
new file mode 100644
index 000000000000..75c8da6f505f
--- /dev/null
+++ b/include/dt-bindings/gpio/amlogic-c3-gpio.h
@@ -0,0 +1,72 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * Copyright (c) 2021 Amlogic, Inc. All rights reserved.
+ * Author: Huqiang Qin <huqiang.qin@amlogic.com>
+ */
+
+#ifndef _DT_BINDINGS_AMLOGIC_C3_GPIO_H
+#define _DT_BINDINGS_AMLOGIC_C3_GPIO_H
+
+#define	GPIOE_0		0
+#define	GPIOE_1		1
+#define	GPIOE_2		2
+#define	GPIOE_3		3
+#define	GPIOE_4		4
+
+#define	GPIOB_0		5
+#define	GPIOB_1		6
+#define	GPIOB_2		7
+#define	GPIOB_3		8
+#define	GPIOB_4		9
+#define	GPIOB_5		10
+#define	GPIOB_6		11
+#define	GPIOB_7		12
+#define	GPIOB_8		13
+#define	GPIOB_9		14
+#define	GPIOB_10	15
+#define	GPIOB_11	16
+#define	GPIOB_12	17
+#define	GPIOB_13	18
+#define	GPIOB_14	19
+
+#define	GPIOC_0		20
+#define	GPIOC_1		21
+#define	GPIOC_2		22
+#define	GPIOC_3		23
+#define	GPIOC_4		24
+#define	GPIOC_5		25
+#define	GPIOC_6		26
+
+#define	GPIOX_0		27
+#define	GPIOX_1		28
+#define	GPIOX_2		29
+#define	GPIOX_3		30
+#define	GPIOX_4		31
+#define	GPIOX_5		32
+#define	GPIOX_6		33
+#define	GPIOX_7		34
+#define	GPIOX_8		35
+#define	GPIOX_9		36
+#define	GPIOX_10	37
+#define	GPIOX_11	38
+#define	GPIOX_12	39
+#define	GPIOX_13	40
+
+#define	GPIOD_0		41
+#define	GPIOD_1		42
+#define	GPIOD_2		43
+#define	GPIOD_3		44
+#define	GPIOD_4		45
+#define	GPIOD_5		46
+#define	GPIOD_6		47
+
+#define	GPIOA_0		48
+#define	GPIOA_1		49
+#define	GPIOA_2		50
+#define	GPIOA_3		51
+#define	GPIOA_4		52
+#define	GPIOA_5		53
+
+#define	GPIO_TEST_N	54
+
+#endif /* _DT_BINDINGS_AMLOGIC_C3_GPIO_H */
-- 
2.37.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
