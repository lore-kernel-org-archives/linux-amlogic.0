Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CD82C001DE
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Jul 2023 07:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uwHKiMMbwn7XGtMALqmP1Jr2ipxrcdl1UD3BBh5q6aI=; b=Na/KLdiNN3NlnY
	k8u7dLHLk7RjSSHHUOTH3N3gog+idRUafP1JHM/gZdescZGiF/a2MTGVuT7CWZrfiXCgakfJNpIIk
	o9FYdg6uZOiAVdJM5HoUVaFn5odFsF48HkwkVZa8ygbZuPQsaM7z2OWKR6HDbLhSqc/eVXEY3qtZ7
	oY094pOEv7Re+Hf6N0YFpm5sKxl3RBerP3d0BlPtGy+yu0LEq+N/bKMePnYcsJwSk/A9wVx6F4OS5
	EYEmhfOHUlDD4G/SHrQ9zRPqpXv75zLEo9gaUhSfhRN2G9be7+O85cHWl1jjZO5z/q0nSRnl/TJIq
	vWYw9VCtLpqTLieNKVtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMkfM-00DCHC-2O;
	Fri, 21 Jul 2023 07:35:08 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMkfD-00DCC0-3B;
	Fri, 21 Jul 2023 07:35:01 +0000
Received: from rd02-sz.amlogic.software (10.28.11.83) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Fri, 21 Jul 2023
 15:34:31 +0800
From: Huqiang Qin <huqiang.qin@amlogic.com>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>, <neil.armstrong@linaro.org>, <khilman@baylibre.com>,
	<jbrunet@baylibre.com>, <martin.blumenstingl@googlemail.com>,
	<linus.walleij@linaro.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, Huqiang Qin <huqiang.qin@amlogic.com>
Subject: [PATCH 1/3] dt-bindings: interrupt-controller: Add header file for Amlogic Meson-G12A SoCs
Date: Fri, 21 Jul 2023 15:32:12 +0800
Message-ID: <20230721073214.1876417-2-huqiang.qin@amlogic.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230721073214.1876417-1-huqiang.qin@amlogic.com>
References: <20230721073214.1876417-1-huqiang.qin@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.28.11.83]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_003500_022559_CF534AF4 
X-CRM114-Status: GOOD (  10.23  )
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

Add a new dt-binding header that details the interrupt number of the GPIO.

Signed-off-by: Huqiang Qin <huqiang.qin@amlogic.com>
---
 .../irq-meson-g12a-gpio.h                     | 126 ++++++++++++++++++
 1 file changed, 126 insertions(+)
 create mode 100644 include/dt-bindings/interrupt-controller/irq-meson-g12a-gpio.h

diff --git a/include/dt-bindings/interrupt-controller/irq-meson-g12a-gpio.h b/include/dt-bindings/interrupt-controller/irq-meson-g12a-gpio.h
new file mode 100644
index 000000000000..bd415cb7b669
--- /dev/null
+++ b/include/dt-bindings/interrupt-controller/irq-meson-g12a-gpio.h
@@ -0,0 +1,126 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * Copyright (c) 2023 Amlogic, Inc. All rights reserved.
+ * Author: Huqiang Qin <huqiang.qin@amlogic.com>
+ */
+
+#ifndef _DT_BINDINGS_IRQ_MESON_G12A_GPIO_H
+#define _DT_BINDINGS_IRQ_MESON_G12A_GPIO_H
+
+/* IRQID[11:0] - GPIOAO[11:0] */
+#define IRQID_GPIOAO_0		0
+#define IRQID_GPIOAO_1		1
+#define IRQID_GPIOAO_2		2
+#define IRQID_GPIOAO_3		3
+#define IRQID_GPIOAO_4		4
+#define IRQID_GPIOAO_5		5
+#define IRQID_GPIOAO_6		6
+#define IRQID_GPIOAO_7		7
+#define IRQID_GPIOAO_8		8
+#define IRQID_GPIOAO_9		9
+#define IRQID_GPIOAO_10		10
+#define IRQID_GPIOAO_11		11
+
+/* IRQID[27:12] - GPIOZ[15:0] */
+#define IRQID_GPIOZ_0		12
+#define IRQID_GPIOZ_1		13
+#define IRQID_GPIOZ_2		14
+#define IRQID_GPIOZ_3		15
+#define IRQID_GPIOZ_4		16
+#define IRQID_GPIOZ_5		17
+#define IRQID_GPIOZ_6		18
+#define IRQID_GPIOZ_7		19
+#define IRQID_GPIOZ_8		20
+#define IRQID_GPIOZ_9		21
+#define IRQID_GPIOZ_10		22
+#define IRQID_GPIOZ_11		23
+#define IRQID_GPIOZ_12		24
+#define IRQID_GPIOZ_13		25
+#define IRQID_GPIOZ_14		26
+#define IRQID_GPIOZ_15		27
+
+/* IRQID[36:28] - GPIOH[8:0] */
+#define IRQID_GPIOH_0		28
+#define IRQID_GPIOH_1		29
+#define IRQID_GPIOH_2		30
+#define IRQID_GPIOH_3		31
+#define IRQID_GPIOH_4		32
+#define IRQID_GPIOH_5		33
+#define IRQID_GPIOH_6		34
+#define IRQID_GPIOH_7		35
+#define IRQID_GPIOH_8		36
+
+/* IRQID[52:37] - BOOT[15:0] */
+#define IRQID_BOOT_0		37
+#define IRQID_BOOT_1		38
+#define IRQID_BOOT_2		39
+#define IRQID_BOOT_3		40
+#define IRQID_BOOT_4		41
+#define IRQID_BOOT_5		42
+#define IRQID_BOOT_6		43
+#define IRQID_BOOT_7		44
+#define IRQID_BOOT_8		45
+#define IRQID_BOOT_9		46
+#define IRQID_BOOT_10		47
+#define IRQID_BOOT_11		48
+#define IRQID_BOOT_12		49
+#define IRQID_BOOT_13		50
+#define IRQID_BOOT_14		51
+#define IRQID_BOOT_15		52
+
+/* IRQID[60:53] - GPIOC[7:0] */
+#define IRQID_GPIOC_0		53
+#define IRQID_GPIOC_1		54
+#define IRQID_GPIOC_2		55
+#define IRQID_GPIOC_3		56
+#define IRQID_GPIOC_4		57
+#define IRQID_GPIOC_5		58
+#define IRQID_GPIOC_6		59
+#define IRQID_GPIOC_7		60
+
+/* IRQID[76:61] - GPIOA[15:0] */
+#define IRQID_GPIOA_0		61
+#define IRQID_GPIOA_1		62
+#define IRQID_GPIOA_2		63
+#define IRQID_GPIOA_3		64
+#define IRQID_GPIOA_4		65
+#define IRQID_GPIOA_5		66
+#define IRQID_GPIOA_6		67
+#define IRQID_GPIOA_7		68
+#define IRQID_GPIOA_8		69
+#define IRQID_GPIOA_9		70
+#define IRQID_GPIOA_10		71
+#define IRQID_GPIOA_11		72
+#define IRQID_GPIOA_12		73
+#define IRQID_GPIOA_13		74
+#define IRQID_GPIOA_14		75
+#define IRQID_GPIOA_15		76
+
+/* IRQID[96:77] - GPIOX[19:0] */
+#define IRQID_GPIOX_0		77
+#define IRQID_GPIOX_1		78
+#define IRQID_GPIOX_2		79
+#define IRQID_GPIOX_3		80
+#define IRQID_GPIOX_4		81
+#define IRQID_GPIOX_5		82
+#define IRQID_GPIOX_6		83
+#define IRQID_GPIOX_7		84
+#define IRQID_GPIOX_8		85
+#define IRQID_GPIOX_9		86
+#define IRQID_GPIOX_10		87
+#define IRQID_GPIOX_11		88
+#define IRQID_GPIOX_12		89
+#define IRQID_GPIOX_13		90
+#define IRQID_GPIOX_14		91
+#define IRQID_GPIOX_15		92
+#define IRQID_GPIOX_16		93
+#define IRQID_GPIOX_17		94
+#define IRQID_GPIOX_18		95
+#define IRQID_GPIOX_19		96
+
+/* IRQID[99:97] - GPIOE[2:0] */
+#define IRQID_GPIOE_0		97
+#define IRQID_GPIOE_1		98
+#define IRQID_GPIOE_2		99
+
+#endif /* _DT_BINDINGS_IRQ_MESON_G12A_GPIO_H */
-- 
2.37.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
