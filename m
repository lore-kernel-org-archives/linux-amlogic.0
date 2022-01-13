Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95669C433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Jan 2022 11:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yo6c+mfs0RcIXdQeewCUwwZEhOEsE4x/Xn+v74oG5NE=; b=ZoyHp05kuzBRkd
	AM6lDQV9eJkr1egyTJNDZP57+9t4uk9SATHJqdREzi3WYublyRF4PzLs9HrCR68M9OXsOI8WvGvQ4
	bbzeG+aMnTwuesLgDKlQU8KVI3rcEcTny+/LaZDBPrg8B6xH4zNSvg1rnLApadcuHJVHQMzjyU0lP
	h9CqUjpPAoMoqqo6NS44ydlyYCjvlJfAkY3g5HfzYgK/+upDwKiZpOm38g7q8dz2PgYgMxlVua5IP
	i5Jqh0w22dZQuCTCEeGucP/sPeU/WIRD9hcPMo4YqqMg8EnDEWv093By9M881MZL+npnVYvjjjd5j
	FMwPez5ZQTRcooKiO7yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7ykj-005hkz-Un; Thu, 13 Jan 2022 11:58:49 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7yjy-005hIN-7U; Thu, 13 Jan 2022 11:58:04 +0000
Received: from droid11-sz.amlogic.com (10.28.8.21) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server id 15.1.2176.2; Thu, 13 Jan 2022
 19:57:58 +0800
From: Liang Yang <liang.yang@amlogic.com>
To: Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, <linux-clk@vger.kernel.org>
CC: Liang Yang <liang.yang@amlogic.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Jianxin Pan <jianxin.pan@amlogic.com>,
 Victor Wan <victor.wan@amlogic.com>, XianWei Zhao <xianwei.zhao@amlogic.com>, 
 Kelvin Zhang <kelvin.zhang@amlogic.com>, BiChao Zheng
 <bichao.zheng@amlogic.com>, YongHui Yu <yonghui.yu@amlogic.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v9 2/4] clk: meson: add emmc sub clock phase delay driver
Date: Thu, 13 Jan 2022 19:57:43 +0800
Message-ID: <20220113115745.45826-3-liang.yang@amlogic.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220113115745.45826-1-liang.yang@amlogic.com>
References: <20220113115745.45826-1-liang.yang@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.28.8.21]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_035802_340017_E4012097 
X-CRM114-Status: GOOD (  15.31  )
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

Export the emmc sub clock phase delay ops which will be used
by the emmc sub clock driver itself.

Signed-off-by: Liang Yang <liang.yang@amlogic.com>
---
 drivers/clk/meson/Kconfig           |  4 ++
 drivers/clk/meson/Makefile          |  1 +
 drivers/clk/meson/clk-phase-delay.c | 69 +++++++++++++++++++++++++++++
 drivers/clk/meson/clk-phase-delay.h | 20 +++++++++
 4 files changed, 94 insertions(+)
 create mode 100644 drivers/clk/meson/clk-phase-delay.c
 create mode 100644 drivers/clk/meson/clk-phase-delay.h

diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
index 3014e2f1fbb4..bb0f59eea366 100644
--- a/drivers/clk/meson/Kconfig
+++ b/drivers/clk/meson/Kconfig
@@ -18,6 +18,10 @@ config COMMON_CLK_MESON_PHASE
 	tristate
 	select COMMON_CLK_MESON_REGMAP
 
+config COMMON_CLK_MESON_PHASE_DELAY
+	tristate
+	select COMMON_CLK_MESON_REGMAP
+
 config COMMON_CLK_MESON_PLL
 	tristate
 	select COMMON_CLK_MESON_REGMAP
diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
index b3ef5f67820f..c450f38d3801 100644
--- a/drivers/clk/meson/Makefile
+++ b/drivers/clk/meson/Makefile
@@ -11,6 +11,7 @@ obj-$(CONFIG_COMMON_CLK_MESON_PLL) += clk-pll.o
 obj-$(CONFIG_COMMON_CLK_MESON_REGMAP) += clk-regmap.o
 obj-$(CONFIG_COMMON_CLK_MESON_SCLK_DIV) += sclk-div.o
 obj-$(CONFIG_COMMON_CLK_MESON_VID_PLL_DIV) += vid-pll-div.o
+obj-$(CONFIG_COMMON_CLK_MESON_PHASE_DELAY) += clk-phase-delay.o
 
 # Amlogic Clock controllers
 
diff --git a/drivers/clk/meson/clk-phase-delay.c b/drivers/clk/meson/clk-phase-delay.c
new file mode 100644
index 000000000000..3c1ae0ee2a24
--- /dev/null
+++ b/drivers/clk/meson/clk-phase-delay.c
@@ -0,0 +1,69 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2019 Amlogic, Inc. All rights reserved.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+
+#include "clk-regmap.h"
+#include "clk-phase-delay.h"
+
+static inline struct meson_clk_phase_delay_data *
+meson_clk_get_phase_delay_data(struct clk_regmap *clk)
+{
+	return clk->data;
+}
+
+static int meson_clk_phase_delay_get_phase(struct clk_hw *hw)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct meson_clk_phase_delay_data *ph;
+	unsigned long period_ps, p, d;
+	int degrees;
+
+	ph = meson_clk_get_phase_delay_data(clk);
+	p = meson_parm_read(clk->map, &ph->phase);
+	degrees = p * 360 / (1 << (ph->phase.width));
+
+	period_ps = DIV_ROUND_UP_ULL(NSEC_PER_SEC * 1000ull,
+				     clk_hw_get_rate(hw));
+
+	d = meson_parm_read(clk->map, &ph->delay);
+	degrees += d * ph->delay_step_ps * 360 / period_ps;
+	degrees %= 360;
+
+	return degrees;
+}
+
+static int meson_clk_phase_delay_set_phase(struct clk_hw *hw, int degrees)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct meson_clk_phase_delay_data *ph;
+	unsigned long period_ps, d = 0;
+	unsigned int p;
+
+	ph = meson_clk_get_phase_delay_data(clk);
+	period_ps = DIV_ROUND_UP_ULL(NSEC_PER_SEC * 1000ull,
+				     clk_hw_get_rate(hw));
+
+	/*
+	 * First compute the phase index (p), the remainder (r) is the
+	 * part we'll try to acheive using the delays (d).
+	 */
+	p = 360 / 1 << (ph->phase.width);
+	degrees = degrees / p;
+	d = DIV_ROUND_CLOSEST((degrees % p) * period_ps,
+			      360 * ph->delay_step_ps);
+	d = min(d, PMASK(ph->delay.width));
+
+	meson_parm_write(clk->map, &ph->phase, degrees);
+	meson_parm_write(clk->map, &ph->delay, d);
+	return 0;
+}
+
+const struct clk_ops meson_clk_phase_delay_ops = {
+	.get_phase = meson_clk_phase_delay_get_phase,
+	.set_phase = meson_clk_phase_delay_set_phase,
+};
+EXPORT_SYMBOL_GPL(meson_clk_phase_delay_ops);
diff --git a/drivers/clk/meson/clk-phase-delay.h b/drivers/clk/meson/clk-phase-delay.h
new file mode 100644
index 000000000000..b4f211d02c84
--- /dev/null
+++ b/drivers/clk/meson/clk-phase-delay.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
+/*
+ * Copyright (c) 2019 Amlogic, Inc. All rights reserved.
+ */
+
+#ifndef __MESON_CLK_PHASE_DELAY_H
+#define __MESON_CLK_PHASE_DELAY_H
+
+#include <linux/clk-provider.h>
+#include "parm.h"
+
+struct meson_clk_phase_delay_data {
+	struct parm     phase;
+	struct parm     delay;
+	unsigned int    delay_step_ps;
+};
+
+extern const struct clk_ops meson_clk_phase_delay_ops;
+
+#endif /* __MESON_CLK_PHASE_DELAY_H */
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
