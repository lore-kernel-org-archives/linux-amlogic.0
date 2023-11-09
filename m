Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58F2FC4332F
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Nov 2023 09:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=djSELi15LolAU49xq9VfSXDAR06Pb5fRAYD52vz+PEg=; b=Ep3CayrUJvZIYz
	dXbVbWMB8oduJyMlIBQAzr3KzyeQuy+/vdI4wHYZx1LP8MT258PwzJ6w7Uw1LvTbTsoknwvyba/Ol
	hWmxr+h0wzQq2uVpmUYIbpvMXfha9JK/HDiITLmBHW4eG7KPY0L9JqnmRwwV4Qr7tkmMUE0keDf4x
	xOPQThFSWVAcQ68JPKJ5B51jOGXugow1groi2GwE4Q3HT35zP9cziuMCxkwlb6GHZwxaYDNxehZ2g
	jjcnz/4LZGukaxbDjM8VLTY9uw3qyxRakubwC6ioY0xpdOo+xk4qXor3fzgS0JSUDCeCimJi6nu3D
	PxWBHI+NZr0A7Iabjaww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r10u3-005h2Z-0f;
	Thu, 09 Nov 2023 09:00:43 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r10tn-005giV-1f
	for linux-amlogic@lists.infradead.org;
	Thu, 09 Nov 2023 09:00:31 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2c523ac38fbso7069741fa.0
        for <linux-amlogic@lists.infradead.org>; Thu, 09 Nov 2023 01:00:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699520423; x=1700125223; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K3jkqVLYPsEBC2yHh5HSbHQhmKply71guvy25cYHi9Y=;
        b=MeTpapJVia7HYifj63a01TEZRuM0Ux+NNyES5WMFyVli0x2JPx3VYTPFccvb4JX8T6
         Kz/G7ZmVNwY2TLEyx1FfqpD1n4tingK0oM3EIruIZU20e9geA3l8IOzX3FeRJYDQT7+V
         H+kJ8avR7GrNv9D+70zjWazzKMih8XAfnXicGp37S+BZ28TIpk1enKOQcIsn0wzCbsho
         M6CoAT/I4L9u4k9EuR3hDhFOoNNrmqyOIO0W6GKcahmBMZYsTqdidYWNUhI/yxSpQTnF
         c0P9LBf19hqM+DzHpypuvKncLLnOmbH39UjOKRzgHn2D31/WSyUJ+H52SZM+Y+tkzHX3
         kKVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699520423; x=1700125223;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K3jkqVLYPsEBC2yHh5HSbHQhmKply71guvy25cYHi9Y=;
        b=FIMroOU2amyPoL9tVg1IDNyMIffwV1WNnL9tAHJpQ5YnTzM0/jdRjVPSzbTjwAU5wG
         wRAMUX0vJOv2shi8vI7b9+CwfbjLtu32s/T4Tb+3hysMA4ks8FMtEcgtZM7MIAuN5Tsb
         oTXFPsmw2Cits+MQOxzfnMvY2UgGJeAqudIhv4XpEvm/HK7ODHnsNZmC1iiyPbG93L0w
         Y8ANQFLP2v4cUEzp0wFvKqkm2WzyaGF0cgPLcopYN4WVbD8qtteH/pRxhJ+yZ6dRWuKH
         qgSlKgGGFdTh8x+fazJfl7LV6+q7Ylvp42TVdbW1W9kanoPG07JLAXXCBPQSmiAcxGbi
         sR1w==
X-Gm-Message-State: AOJu0Yx1/fTzleHegM45YR0PeBTmjIn/k9mTvFtwcGmRbS4f29uMP9lt
	aOZhBkDsfSwzjHK/IyuMsZiC4A==
X-Google-Smtp-Source: AGHT+IGp2IMj82o5qct4HTP3vf0Ilj4Y8QpRWfkxnljspD703hg3wosCw2eGfqZbxHpHZRsvCcL+lQ==
X-Received: by 2002:a05:651c:1a0f:b0:2c5:2103:604b with SMTP id by15-20020a05651c1a0f00b002c52103604bmr4083286ljb.2.1699520422059;
        Thu, 09 Nov 2023 01:00:22 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ay36-20020a05600c1e2400b0040472ad9a3dsm1428484wmb.14.2023.11.09.01.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 01:00:21 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 09 Nov 2023 10:00:08 +0100
Subject: [PATCH v8 07/12] clk: meson: add vclk driver
MIME-Version: 1.0
Message-Id: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-7-81e4aeeda193@linaro.org>
References: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-0-81e4aeeda193@linaro.org>
In-Reply-To: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-0-81e4aeeda193@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Nicolas Belin <nbelin@baylibre.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=8101;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=TV2XB6ZHVpJ07IkqSO4nzY+I+xu/Xq9oDCoWcFAVONI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlTJ+YldnNe1t7WVR8u+tFu7gP5BfizqWnuqMNIn8E
 LCKsWf6JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZUyfmAAKCRB33NvayMhJ0XE7D/
 0YfkOcaZle0uROQG5yBSCWK2mYUNg3bHIqZXucVwfk65/RPJT4tvq5VCU05kZFV5sAweNKPFqUgx+r
 9drP+xcUbanJw77yt41SLsE5C1/v2Zq6nt+G/FXwNYAHJPI6QNjsEgOf8vvvFyjNZtCMRlaBPwb9Wv
 6sJgaEA4Few6CaL0Nzz+TiDhcODJObIfTJX+D9XDTkYs9iJlgL8V5vVe5+QLKleyThYa5elchK5n3O
 2PFXsuOiG+PoHXqX/tOtR+d8fwInrk33Tq5YHcIsYbCTP96b0FAzUYCIqXqSfALtqwsj1lDtiyNMSD
 A9y3nHHyE5jbCjKh3dCfb606Tqt7emc6dTcM+lmWLf7e5BuTatuqIGmGNID92l9vP5WWxTUol0qtkc
 nKyOeN4OldpqnXSKQZG21gJLEXuPGu77DowU5/fihwfW5aHxxxe5WZeojXYyUT0U6ELVt/Cwikywm+
 J9joWkFB6uZI/0g3T4+kJzwyguoU/+f8leB3UagFUH3JK4w3UXZZYSJed4nL1LQ/gcboJIL6nlJM6c
 rqD1ptjmFDKbgcO5mHQ3Gb65dY8Pqz9WEA8Ffq8Dwy6inMmbInQCSb2ROFqcnetsJl9sK53nn037q5
 hRLL+fQleANgDwn6/dBU6lqIOtnIBNEivWVdYRAhhrJA0z7q1k3XpqIkP9Gg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_010027_621611_7BE0DB5C 
X-CRM114-Status: GOOD (  19.00  )
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

The VCLK and VCLK_DIV clocks have supplementary bits.

The VCLK has a "SOFT RESET" bit to toggle after the whole
VCLK sub-tree rate has been set, this is implemented in
the gate enable callback.

The VCLK_DIV clocks as enable and reset bits used to disable
and reset the divider, associated with CLK_SET_RATE_GATE it ensures
the rate is set while the divider is disabled and in reset mode.

The VCLK_DIV enable bit isn't implemented as a gate since it's part
of the divider logic and vendor does this exact sequence to ensure
the divider is correctly set.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/clk/meson/Kconfig  |   5 ++
 drivers/clk/meson/Makefile |   1 +
 drivers/clk/meson/vclk.c   | 141 +++++++++++++++++++++++++++++++++++++++++++++
 drivers/clk/meson/vclk.h   |  51 ++++++++++++++++
 4 files changed, 198 insertions(+)

diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
index 29ffd14d267b..59a40a49f8e1 100644
--- a/drivers/clk/meson/Kconfig
+++ b/drivers/clk/meson/Kconfig
@@ -30,6 +30,10 @@ config COMMON_CLK_MESON_VID_PLL_DIV
 	tristate
 	select COMMON_CLK_MESON_REGMAP
 
+config COMMON_CLK_MESON_VCLK
+	tristate
+	select COMMON_CLK_MESON_REGMAP
+
 config COMMON_CLK_MESON_CLKC_UTILS
 	tristate
 
@@ -140,6 +144,7 @@ config COMMON_CLK_G12A
 	select COMMON_CLK_MESON_EE_CLKC
 	select COMMON_CLK_MESON_CPU_DYNDIV
 	select COMMON_CLK_MESON_VID_PLL_DIV
+	select COMMON_CLK_MESON_VCLK
 	select MFD_SYSCON
 	help
 	  Support for the clock controller on Amlogic S905D2, S905X2 and S905Y2
diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
index 9ee4b954c896..9ba43fe7a07a 100644
--- a/drivers/clk/meson/Makefile
+++ b/drivers/clk/meson/Makefile
@@ -12,6 +12,7 @@ obj-$(CONFIG_COMMON_CLK_MESON_PLL) += clk-pll.o
 obj-$(CONFIG_COMMON_CLK_MESON_REGMAP) += clk-regmap.o
 obj-$(CONFIG_COMMON_CLK_MESON_SCLK_DIV) += sclk-div.o
 obj-$(CONFIG_COMMON_CLK_MESON_VID_PLL_DIV) += vid-pll-div.o
+obj-$(CONFIG_COMMON_CLK_MESON_VCLK) += vclk.o
 
 # Amlogic Clock controllers
 
diff --git a/drivers/clk/meson/vclk.c b/drivers/clk/meson/vclk.c
new file mode 100644
index 000000000000..47f08a52b49f
--- /dev/null
+++ b/drivers/clk/meson/vclk.c
@@ -0,0 +1,141 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2023 Neil Armstrong <neil.armstrong@linaro.org>
+ */
+
+#include <linux/module.h>
+#include "vclk.h"
+
+/* The VCLK gate has a supplementary reset bit to pulse after ungating */
+
+static inline struct clk_regmap_vclk_data *
+clk_get_regmap_vclk_data(struct clk_regmap *clk)
+{
+	return (struct clk_regmap_vclk_data *)clk->data;
+}
+
+static int clk_regmap_vclk_enable(struct clk_hw *hw)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct clk_regmap_vclk_data *vclk = clk_get_regmap_vclk_data(clk);
+
+	meson_parm_write(clk->map, &vclk->enable, 1);
+
+	/* Do a reset pulse */
+	meson_parm_write(clk->map, &vclk->reset, 1);
+	meson_parm_write(clk->map, &vclk->reset, 0);
+
+	return 0;
+}
+
+static void clk_regmap_vclk_disable(struct clk_hw *hw)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct clk_regmap_vclk_data *vclk = clk_get_regmap_vclk_data(clk);
+
+	meson_parm_write(clk->map, &vclk->enable, 0);
+}
+
+static int clk_regmap_vclk_is_enabled(struct clk_hw *hw)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct clk_regmap_vclk_data *vclk = clk_get_regmap_vclk_data(clk);
+
+	return meson_parm_read(clk->map, &vclk->enable);
+}
+
+const struct clk_ops clk_regmap_vclk_ops = {
+	.enable = clk_regmap_vclk_enable,
+	.disable = clk_regmap_vclk_disable,
+	.is_enabled = clk_regmap_vclk_is_enabled,
+};
+EXPORT_SYMBOL_GPL(clk_regmap_vclk_ops);
+
+/* The VCLK Divider has supplementary reset & enable bits */
+
+static inline struct clk_regmap_vclk_div_data *
+clk_get_regmap_vclk_div_data(struct clk_regmap *clk)
+{
+	return (struct clk_regmap_vclk_div_data *)clk->data;
+}
+
+static unsigned long clk_regmap_vclk_div_recalc_rate(struct clk_hw *hw,
+						     unsigned long prate)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct clk_regmap_vclk_div_data *vclk = clk_get_regmap_vclk_div_data(clk);
+
+	return divider_recalc_rate(hw, prate, meson_parm_read(clk->map, &vclk->div),
+				   vclk->table, vclk->flags, vclk->div.width);
+}
+
+static int clk_regmap_vclk_div_determine_rate(struct clk_hw *hw,
+					      struct clk_rate_request *req)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct clk_regmap_vclk_div_data *vclk = clk_get_regmap_vclk_div_data(clk);
+
+	return divider_determine_rate(hw, req, vclk->table, vclk->div.width,
+				      vclk->flags);
+}
+
+static int clk_regmap_vclk_div_set_rate(struct clk_hw *hw, unsigned long rate,
+					unsigned long parent_rate)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct clk_regmap_vclk_div_data *vclk = clk_get_regmap_vclk_div_data(clk);
+	int ret;
+
+	ret = divider_get_val(rate, parent_rate, vclk->table, vclk->div.width,
+			      vclk->flags);
+	if (ret < 0)
+		return ret;
+
+	meson_parm_write(clk->map, &vclk->div, ret);
+
+	return 0;
+};
+
+static int clk_regmap_vclk_div_enable(struct clk_hw *hw)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct clk_regmap_vclk_div_data *vclk = clk_get_regmap_vclk_div_data(clk);
+
+	/* Unreset the divider when ungating */
+	meson_parm_write(clk->map, &vclk->reset, 0);
+	meson_parm_write(clk->map, &vclk->enable, 1);
+
+	return 0;
+}
+
+static void clk_regmap_vclk_div_disable(struct clk_hw *hw)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct clk_regmap_vclk_div_data *vclk = clk_get_regmap_vclk_div_data(clk);
+
+	/* Reset the divider when gating */
+	meson_parm_write(clk->map, &vclk->enable, 0);
+	meson_parm_write(clk->map, &vclk->reset, 1);
+}
+
+static int clk_regmap_vclk_div_is_enabled(struct clk_hw *hw)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct clk_regmap_vclk_div_data *vclk = clk_get_regmap_vclk_div_data(clk);
+
+	return meson_parm_read(clk->map, &vclk->enable);
+}
+
+const struct clk_ops clk_regmap_vclk_div_ops = {
+	.recalc_rate = clk_regmap_vclk_div_recalc_rate,
+	.determine_rate = clk_regmap_vclk_div_determine_rate,
+	.set_rate = clk_regmap_vclk_div_set_rate,
+	.enable = clk_regmap_vclk_div_enable,
+	.disable = clk_regmap_vclk_div_disable,
+	.is_enabled = clk_regmap_vclk_div_is_enabled,
+};
+EXPORT_SYMBOL_GPL(clk_regmap_vclk_div_ops);
+
+MODULE_DESCRIPTION("Amlogic vclk clock driver");
+MODULE_AUTHOR("Neil Armstrong <neil.armstrong@linaro.org>");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/clk/meson/vclk.h b/drivers/clk/meson/vclk.h
new file mode 100644
index 000000000000..4f25d7ad2717
--- /dev/null
+++ b/drivers/clk/meson/vclk.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2023 Neil Armstrong <neil.armstrong@linaro.org>
+ */
+
+#ifndef __VCLK_H
+#define __VCLK_H
+
+#include "clk-regmap.h"
+#include "parm.h"
+
+/**
+ * struct clk_regmap_vclk_data - vclk regmap backed specific data
+ *
+ * @enable:	vclk enable field
+ * @reset:	vclk reset field
+ * @flags:	hardware-specific flags
+ *
+ * Flags:
+ * Same as clk_gate except CLK_GATE_HIWORD_MASK which is ignored
+ */
+struct clk_regmap_vclk_data {
+	struct parm enable;
+	struct parm reset;
+	u8 flags;
+};
+
+extern const struct clk_ops clk_regmap_vclk_ops;
+
+/**
+ * struct clk_regmap_vclk_div_data - vclk_div regmap back specific data
+ *
+ * @div:	divider field
+ * @enable:	vclk divider enable field
+ * @reset:	vclk divider reset field
+ * @table:	array of value/divider pairs, last entry should have div = 0
+ *
+ * Flags:
+ * Same as clk_divider except CLK_DIVIDER_HIWORD_MASK which is ignored
+ */
+struct clk_regmap_vclk_div_data {
+	struct parm div;
+	struct parm enable;
+	struct parm reset;
+	const struct clk_div_table *table;
+	u8 flags;
+};
+
+extern const struct clk_ops clk_regmap_vclk_div_ops;
+
+#endif /* __VCLK_H */

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
