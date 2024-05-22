Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C53C25B7D
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 May 2024 08:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nuu90/2WzAzgXlIAON/4O8AJTpDUZ67xN7e/LFSpvTI=; b=GZUiGtWd39ywSZ
	MplXvZVloyN4MFrXV6RJgiHCbqwJxb0HVH+YE70s7RBQm5PYjitZnq4bm0vDpHvibBgkMCJcuQc9+
	9wyCM08sA6YiEbqqqFsLY78wUpYA2Hq0+Z6Xw/6ceDKX5l3nirEFIyofkp9ORU5f9y46dOSDjZ/9s
	QTtOELAlZAzzCqxaKXYeiWKrlP7PeBen/R/+pDSFrGZEq4SqdKJsggB1bi+OXtHcfk18EiNvRcBzV
	V93jkZ9svlg16nxLnShZWM16/p5K0kp447zyTZgO+Z+OpAlMSV0zXxMbIGisbgD0gZxD7LJHF5fmv
	qo3WHvWlDFKOHYP1+VxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9hKS-00000002MYg-3wPJ;
	Wed, 22 May 2024 08:28:09 +0000
Received: from [58.32.228.46] (helo=mail-sh.amlogic.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9hKN-00000002MRZ-3XbA;
	Wed, 22 May 2024 08:28:05 +0000
Received: from droid01-cd.amlogic.com (10.98.11.200) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.6; Wed, 22 May 2024
 16:27:34 +0800
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
To: <linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet
	<jbrunet@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, "Stephen
 Boyd" <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>, Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Chuan Liu <chuan.liu@amlogic.com>
Subject: [PATCH v9 2/5] dt-bindings: clock: add Amlogic C3 SCMI clock controller support
Date: Wed, 22 May 2024 16:27:24 +0800
Message-ID: <20240522082727.3029656-3-xianwei.zhao@amlogic.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20240522082727.3029656-1-xianwei.zhao@amlogic.com>
References: <20240522082727.3029656-1-xianwei.zhao@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.98.11.200]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_012803_948829_CC35CD09 
X-CRM114-Status: UNSURE (   9.42  )
X-CRM114-Notice: Please train this message.
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

Add the SCMI clock controller dt-bindings for Amlogic C3 SoC family

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Co-developed-by: Chuan Liu <chuan.liu@amlogic.com>
Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 .../dt-bindings/clock/amlogic,c3-scmi-clkc.h  | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 include/dt-bindings/clock/amlogic,c3-scmi-clkc.h

diff --git a/include/dt-bindings/clock/amlogic,c3-scmi-clkc.h b/include/dt-bindings/clock/amlogic,c3-scmi-clkc.h
new file mode 100644
index 000000000000..663c9b349275
--- /dev/null
+++ b/include/dt-bindings/clock/amlogic,c3-scmi-clkc.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * Copyright (c) 2023 Amlogic, Inc. All rights reserved.
+ * Author: Chuan Liu <chuan.liu@amlogic.com>
+ */
+
+#ifndef __AMLOGIC_C3_SCMI_CLKC_H
+#define __AMLOGIC_C3_SCMI_CLKC_H
+
+#define CLKID_DDR_PLL_OSC			0
+#define CLKID_DDR_PHY				1
+#define CLKID_TOP_PLL_OSC			2
+#define CLKID_USB_PLL_OSC			3
+#define CLKID_MIPIISP_VOUT			4
+#define CLKID_MCLK_PLL_OSC			5
+#define CLKID_USB_CTRL				6
+#define CLKID_ETH_PLL_OSC			7
+#define CLKID_OSC				8
+#define CLKID_SYS_CLK				9
+#define CLKID_AXI_CLK				10
+#define CLKID_CPU_CLK				11
+#define CLKID_FIXED_PLL_OSC			12
+#define CLKID_GP1_PLL_OSC			13
+#define CLKID_SYS_PLL_DIV16			14
+#define CLKID_CPU_CLK_DIV16			15
+
+#endif /* __AMLOGIC_C3_SCMI_CLKC_H */
-- 
2.39.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
