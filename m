Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E47DDCFC528
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Oct 2024 09:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+RB7Lp9pcxyrhdHZxMtoPnC3a3RIPE+0MLPeofFbgBE=; b=A7P24SWCS7Lm5Z
	aQ3q3aXeJJAGkN3e7AVcrgnJfH6HMQatr8icSEDJupK5VmRQ8GSsCuX0mFVwoQcqs+8SRCmVXpGdF
	GNiTwok+4/n/mq5HjQibspRRHqPnnLtX4/pic1shIZGrrs2O97O3E1AjkuCThjHWFt6ZkES388vzJ
	+RKEcP8iPCagGU66Fgh3S6+zldhgGKQTueYC44mgC63e2SfjoemcIX5MYfkAPW7F0iZCWp8wpZYKd
	W0bjqkwgUpCsk16tQnuO9iBBYxiBQWPeaUHrwvVrBjZbiN+abZGxHsdoaI16/gyw2C9JQzV+pAgvE
	xsIE9ayPL953VcY4oH9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0HHp-00000004V1G-1HOD;
	Mon, 14 Oct 2024 09:22:45 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0H1h-00000004Qpb-3a9K;
	Mon, 14 Oct 2024 09:06:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D8CC4A4106C;
	Mon, 14 Oct 2024 09:05:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 610CFC4CEC7;
	Mon, 14 Oct 2024 09:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728896764;
	bh=uBz7Xc7gQtf95hJb68A2dT80+ygVVbnU/Cf1MU3Vr9s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=h3gLC+9lwUH84sN9NqAAGl65XttX7p/feuyQzcRoSa3NO98j70VlI0VoJmSmkeFnk
	 lKFC1CLbMG+xBtAfIUHCgMTVM14HTAOaK04EpHRVNWJXg6JnMGA40AQOR1hu9YLWjQ
	 chFj4pPvw15Qh6tI8U893kUeiHmJKzJpecsddgy4MS4jaC7vmKDW3ahe4yeGWH8PO1
	 fvnK07XhHA4hD1QKZTb+H6PQ551+nVKvIhuofKc6jzVB6kNREEBJKSjOQg8jt7jj+W
	 gS+6QPv0wfMGiOR5t1olifPZYztmAv0usUPM6p0O0z+OTIJ2I+xz3ZvUUna1qYUx5i
	 yj5Mg6NOll32A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B2C2CFC50A;
	Mon, 14 Oct 2024 09:06:04 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Mon, 14 Oct 2024 17:05:51 +0800
Subject: [PATCH v2 1/3] dt-bindings: pinctrl: Add support for Amlogic A4
 SoCs
MIME-Version: 1.0
Message-Id: <20241014-a4_pinctrl-v2-1-3e74a65c285e@amlogic.com>
References: <20241014-a4_pinctrl-v2-0-3e74a65c285e@amlogic.com>
In-Reply-To: <20241014-a4_pinctrl-v2-0-3e74a65c285e@amlogic.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728896762; l=2278;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=tfEbx/nawoF1xymN0PzEB9cyZ2GpGq42qC+H+M4aI/8=;
 b=hbSz+mu67oz8Xm3gwvv7Dh0vl4KUYQSgtNRar5EuSG7izhaLeElmw5rswB13rHysVOkjfsYat
 Oxl87PcxB9HD0SW7ijUpWi5fv4tZyx+2WMCKICJSOJ0qIMNpn7HYo7e
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_020606_140145_7ACCE954 
X-CRM114-Status: GOOD (  12.80  )
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

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add the new compatible name for Amlogic A4 pin controller, and add
a new dt-binding header file which document the detail pin names.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 .../bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml |  2 ++
 include/dt-bindings/gpio/amlogic-a4-gpio.h         | 38 ++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml
index d9e0b2c48e84..f5eefa0fab5b 100644
--- a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml
@@ -15,6 +15,8 @@ allOf:
 properties:
   compatible:
     enum:
+      - amlogic,a4-aobus-pinctrl
+      - amlogic,a4-periphs-pinctrl
       - amlogic,c3-periphs-pinctrl
       - amlogic,t7-periphs-pinctrl
       - amlogic,meson-a1-periphs-pinctrl
diff --git a/include/dt-bindings/gpio/amlogic-a4-gpio.h b/include/dt-bindings/gpio/amlogic-a4-gpio.h
new file mode 100644
index 000000000000..e39f5e041875
--- /dev/null
+++ b/include/dt-bindings/gpio/amlogic-a4-gpio.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * Copyright (c) 2024 Amlogic, Inc. All rights reserved.
+ * Author: Xianwei Zhao <xianwei.zhao@amlogic.com>
+ */
+
+#ifndef _DT_BINDINGS_AMLOGIC_A4_GPIO_H
+#define _DT_BINDINGS_AMLOGIC_A4_GPIO_H
+
+/* Standard port */
+#define GPIOB_START	0
+#define GPIOB_NUM	14
+
+#define GPIOD_START	(GPIOB_START + GPIOB_NUM)
+#define GPIOD_NUM	16
+
+#define GPIOE_START	(GPIOD_START + GPIOD_NUM)
+#define GPIOE_NUM	2
+
+#define GPIOT_START	(GPIOE_START + GPIOE_NUM)
+#define GPIOT_NUM	23
+
+#define GPIOX_START	(GPIOT_START + GPIOT_NUM)
+#define GPIOX_NUM	18
+
+#define PERIPHS_PIN_NUM	(GPIOX_START + GPIOX_NUM)
+
+/* Aobus port */
+#define GPIOAO_START	0
+#define GPIOAO_NUM	7
+
+/* It's a special definition, put at the end, just 1 num */
+#define	GPIO_TEST_N	(GPIOAO_START +  GPIOAO_NUM)
+#define	AOBUS_PIN_NUM	(GPIO_TEST_N + 1)
+
+#define AMLOGIC_GPIO(port, offset)	(port##_START + (offset))
+
+#endif /* _DT_BINDINGS_AMLOGIC_A4_GPIO_H */

-- 
2.37.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
