Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0DCEFC6194
	for <linux-amlogic@archiver.kernel.org>; Sat, 14 Sep 2024 05:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0N6AF79sSZwOD09zVsaRaJWHLPFnjPBqz7Sx8lNS758=; b=r7ZxpMtpeDvZpv
	qV3MsckzZ/hb7EA+8ahbTUjZbb+UvEE1f8yoQYxx5Dz6Zmibmwgger8RHDmlTK6UQ1GtVBe2A5Ega
	h4XZOXbCY2egwsxXTxFu1kuKruLUKcuuE0ohIeLGF6CVnkCFVvJetFrvB9z6pitoGX2c0z+SN6aOf
	ob+jg7U/ReUo0y+a6XXMqL2muLKfedIMMpf8E8wU72/7c4XPELcEy7egi6C2Scwe41NclXox6SI99
	41t+kBHlemhWOLW1wKCJWMtjAUDAuU/nj4z9MGLkopNDl9NCO02KDWVqO0DxHx25gjf8yLWhtfuH3
	HCXYu26hI0uD0y747BQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spLOd-000000007bk-0v2k;
	Sat, 14 Sep 2024 05:32:35 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spLHq-000000005qn-2COR;
	Sat, 14 Sep 2024 05:25:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6776AA40207;
	Sat, 14 Sep 2024 05:25:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 78A9DC4CECE;
	Sat, 14 Sep 2024 05:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726291532;
	bh=JFXL0kBIFjySYpsf7icuA3X2ZFh5pKvYLb8OeVi+vM4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=r695Jcj9zH6a9UXm0MJjXmP0PrcHPBoYA0R06h8hnrD8VLMRKmHA5CaCq3HV+ixpO
	 1pYVw6djM4guJ90RBZSaNckypcFa9hmAYa9krPQbc2sXmxIhH7VG1AZthzQ+jmaRSn
	 dIClF3PH8klnyhaYbVBQJldmvFLGtVhaE+sIOGNcyrnsH4+wAAkhfO4HCwuzwstjlQ
	 fpm0C5mgFFKfoCDk6esDLvkiud8FN+pX/Dyx6W5E8ytW0Ao0hJa1GCx0P3GZiuLXA5
	 0KG/BLxwyv71U3e6Uv+bCu72H0tSgp7Fi6e4lPz7ZBuC7WsDcBIjFpFO0CLhy3SXEc
	 6bEM0kdH1Zh3g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67BB9FC6190;
	Sat, 14 Sep 2024 05:25:32 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Sat, 14 Sep 2024 13:25:24 +0800
Subject: [PATCH 2/5] dt-bindings: clock: add Amlogic A5 SCMI clock
 controller support
MIME-Version: 1.0
Message-Id: <20240914-a5-clk-v1-2-5ee2c4f1b08c@amlogic.com>
References: <20240914-a5-clk-v1-0-5ee2c4f1b08c@amlogic.com>
In-Reply-To: <20240914-a5-clk-v1-0-5ee2c4f1b08c@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chuan Liu <chuan.liu@amlogic.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726291530; l=1704;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=0VCFX2M/yMc0qFVf2pmxfgH7H6Hn/BYk4VGTASRH4GA=;
 b=px+kiFx0mdhXES0XOipO96yHeklV9a3/lQKjlLMzizKg/LpwjHRjuxA6w5hmuihPkXCK0Io+t
 oqr9LBja/8nDeYrshGL6w+md5QIH/yPRJTym02nPg5ceoWGs6sL+TtR
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_222534_819773_67EC4E61 
X-CRM114-Status: UNSURE (   9.49  )
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
Reply-To: xianwei.zhao@amlogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Chuan Liu <chuan.liu@amlogic.com>

Add the SCMI clock controller dt-bindings for Amlogic A5 SoC family.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 include/dt-bindings/clock/amlogic,a5-scmi-clkc.h | 37 ++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/include/dt-bindings/clock/amlogic,a5-scmi-clkc.h b/include/dt-bindings/clock/amlogic,a5-scmi-clkc.h
new file mode 100644
index 000000000000..d35d1ff6bab3
--- /dev/null
+++ b/include/dt-bindings/clock/amlogic,a5-scmi-clkc.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * Copyright (c) 2024 Amlogic, Inc. All rights reserved.
+ * Author: Chuan Liu <chuan.liu@amlogic.com>
+ */
+
+#ifndef __AMLOGIC_A5_SCMI_CLKC_H
+#define __AMLOGIC_A5_SCMI_CLKC_H
+
+#define CLKID_OSC				0
+#define CLKID_SYS_CLK				1
+#define CLKID_AXI_CLK				2
+#define CLKID_CPU_CLK				3
+#define CLKID_DSU_CLK				4
+#define CLKID_GP1_PLL				5
+#define CLKID_FIXED_PLL_DCO			6
+#define CLKID_FIXED_PLL				7
+#define CLKID_ACLKM				8
+#define CLKID_SYS_PLL_DIV16			9
+#define CLKID_CPU_CLK_DIV16			10
+#define CLKID_FCLK_50M_PREDIV			11
+#define CLKID_FCLK_50M_DIV			12
+#define CLKID_FCLK_50M				13
+#define CLKID_FCLK_DIV2_DIV			14
+#define CLKID_FCLK_DIV2				15
+#define CLKID_FCLK_DIV2P5_DIV			16
+#define CLKID_FCLK_DIV2P5			17
+#define CLKID_FCLK_DIV3_DIV			18
+#define CLKID_FCLK_DIV3				19
+#define CLKID_FCLK_DIV4_DIV			20
+#define CLKID_FCLK_DIV4				21
+#define CLKID_FCLK_DIV5_DIV			22
+#define CLKID_FCLK_DIV5				23
+#define CLKID_FCLK_DIV7_DIV			24
+#define CLKID_FCLK_DIV7				25
+
+#endif /* __AMLOGIC_A5_SCMI_CLKC_H */

-- 
2.37.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
