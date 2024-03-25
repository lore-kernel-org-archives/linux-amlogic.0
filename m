Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B00D4C54E58
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2024 11:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g0sD0EDV73CGF3dldbhhaZ4fJfTKzdBqPWb8AUbcnpI=; b=EaNfzDTBxhW4nr
	Ald1arMeYliekSb2v1f2Eltb5py4P96Erhh0vZoHFpn1aozN5xhr2BdNYRfWNmAaXr68MwZ3VE01T
	6VVhmf9VP7jC1IHeFK8BBZR+X2tfyVT+bygZKPXMTcfUQ4FvnRnsIltWUjCugaX4zkNreAIL4oCGj
	dt5s+hdPjlplRe89hwtI/oSJoNHCwQzQyjAsWxVd4ZzNiWD2h+PT8JrY47iAkkAcS3GDjKw99c4KZ
	sDCj6WE4jnk0JWTnN1mdtkv0M7NX43sgbFgM10B7ihKPJzhXllMM9ZZSBnkaDqlmtbsdaKlSdG6Ph
	+eIGxvEoRJJT6nWoJN1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roiDQ-0000000GxBp-0QAi;
	Mon, 25 Mar 2024 11:10:08 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roiDF-0000000Gx2g-1W92
	for linux-amlogic@lists.infradead.org;
	Mon, 25 Mar 2024 11:09:59 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a466e53f8c0so551760166b.1
        for <linux-amlogic@lists.infradead.org>; Mon, 25 Mar 2024 04:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711364996; x=1711969796; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7IUPR9d02dtJIVzX3UuZrrXfP4OKmNv4PgS6wUBZYrw=;
        b=RmeSabiuajVkK9yjtwu52wz99Jd9SISG46mbKdjUw5iSdpLQadzBSM2AsPFr8xGVCp
         CA52HTOoOah5j7JXD5rMOPHXybQ9AEd2aAeEQ5gyDsBuTfQDWdsEDEwAEP2gX/qW2fzw
         olF1KEJpA6h/r9rwjPwxFeONjpiOUTNIGCLSv5ALaX5q5xxoz2D7Vw65Y5MwN896i+/7
         gnBUlSGoL4eViQ+VwVuK2GcREwIRTzevCNNRWjSQxrkKlMOpnNvMKD0GAHAe8CmnUgjJ
         aAzzNdlUNv3leY/0v32Zf/xnt5evFVzOzir/AgCXwfP2uAZUTV7JV1UnoATdKM21A72E
         FnhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711364996; x=1711969796;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7IUPR9d02dtJIVzX3UuZrrXfP4OKmNv4PgS6wUBZYrw=;
        b=AvSCY1O+VTP+Ru2ji7sSgQ3YAypMh0bTgLS/I37XZ72k83urJ53DbgJojD/9Z2PaOi
         Qf8PP7XAjT0sU2R6/zWp46FFY1xx54+6jakwBLQE6NlYxgIgakx9S/GHt+967T0prXa1
         06MzEdYoRYGwDratWMjdiTfgAsQiU4YIdysDhVcPbz0Y9bWHiGWacU76N53J8uo/8DEf
         4Tb02WVif3GIZpKAan3z3p8nnb7Ik1Db6Z+6mVLDNS+332EpB6jyqgVWlXsAzipNx9jE
         fndSX9AYhfgDMXP9jEHGTmcqZoMTImoFpOm1y7hzbpX7Nx5ilX/2HAkwlQwfqql27rbP
         KyFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcJFNyxujcRQrMhOn3FwQwew88D3Udw2CzR8A3dbWWVbBx4MXw8pQn1sTyVcjIuchofBnV/xruOpVZ2BiAA+FtJzpBth0qU8Rt5U2K7dDYyTE=
X-Gm-Message-State: AOJu0Yxgt/D7EEFkNL55WUtKlmb2irbTSGanwf5iCvuQim3YRK0W5tkn
	gCNRV1bH8fst0IfnA4RaAgPpISE6CmsB9LDx+sntiLSLHeMj1K5oE1YOO9ZQSRw=
X-Google-Smtp-Source: AGHT+IEDzapRzBUhD8Wikei+Fe01fhmJ44zHGQuzWGYETfbOY6sW484hiwXhMxRzNCWm+NyWQJl15Q==
X-Received: by 2002:a17:907:9487:b0:a47:53b2:2045 with SMTP id dm7-20020a170907948700b00a4753b22045mr2605709ejc.3.1711364995658;
        Mon, 25 Mar 2024 04:09:55 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id bw26-20020a170906c1da00b00a4650ec48d0sm2972367ejb.140.2024.03.25.04.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 04:09:55 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 25 Mar 2024 12:09:48 +0100
Subject: [PATCH v11 2/7] clk: meson: add vclk driver
MIME-Version: 1.0
Message-Id: <20240325-amlogic-v6-4-upstream-dsi-ccf-vim3-v11-2-04f55de44604@linaro.org>
References: <20240325-amlogic-v6-4-upstream-dsi-ccf-vim3-v11-0-04f55de44604@linaro.org>
In-Reply-To: <20240325-amlogic-v6-4-upstream-dsi-ccf-vim3-v11-0-04f55de44604@linaro.org>
To: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Nicolas Belin <nbelin@baylibre.com>, 
 Jagan Teki <jagan@amarulasolutions.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=7703;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Smlla1YZJOXz+za+ZZXCQUR8f4zJcKmwkP7WPfkHnjw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmAVt8lufmJtSUzrk5JX5BRPCbAsKVAfZDz2r2ClgZ
 Lmdr8L+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZgFbfAAKCRB33NvayMhJ0SMxD/
 9G3+ufv4b2MeR5wblBw1a0iT81X5deO0bxyyUyryPjkStmsKMPVnagRriJT1iNhAlrLLaVdiAjua3u
 vQGdLoV6m45Vg3aO3rV+IQ3XVjrmi3rw7UT2YukMgKrRMQooFilE4+0IEb5H0uN674HF1/Zdab+GO0
 oJa+LxFiin1SjOc+kkTlUEF7dGOfC0AaZGgFM9Z8ubDojWJxhY/G11AN9iABpnBCu44w5gj/EaS4up
 8Co/bHBq7X/eiH8dkillauBRvkzgOlvDJv3NMiYXOh0JeIAuHgGTiuauKX3VOLnaK+VnRX4439w58t
 9jDJSt8hcVq07OnNCeHtj51Kk3ZWIkMSEFZqeo7v2lW78lTjlqjRiBa0NY6/d+Swctqtka8anWo44+
 Exyfxmd+ay1l+U+M+fyK7I6zzT8blI2iCj/D0rBV7Fz3ygOymkgmjX70q/AzOOgUit09rDOq+z4S9w
 bp4LFDtQZ3nh8zuUlgxXQyHHkBtEwFZ1Uj2d5ZDu79zLUhTWj3bWya3g+OVK8HIPEb/oW/xeGwepw+
 wk0mdwuomBydWZG5qmYd3w8gKpyKr6CFzYhI/Mwd4+lr6c1drFEXzjU75wjkwJSfBWNmxXxc5Yui/x
 f1AAjIC6pGeBos9pbkem6atXcG+B0oFgz3vsYdPXjSXRFMFtS3LRUO010ToA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_040957_538934_5180EE9F 
X-CRM114-Status: GOOD (  18.85  )
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

The VCLK gate has a "SOFT RESET" bit to toggle after the whole
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
 drivers/clk/meson/Kconfig  |   4 ++
 drivers/clk/meson/Makefile |   1 +
 drivers/clk/meson/vclk.c   | 141 +++++++++++++++++++++++++++++++++++++++++++++
 drivers/clk/meson/vclk.h   |  51 ++++++++++++++++
 4 files changed, 197 insertions(+)

diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
index 29ffd14d267b..8a9823789fa3 100644
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
index 000000000000..3ea813a0a995
--- /dev/null
+++ b/drivers/clk/meson/vclk.c
@@ -0,0 +1,141 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2024 Neil Armstrong <neil.armstrong@linaro.org>
+ */
+
+#include <linux/module.h>
+#include "vclk.h"
+
+/* The VCLK gate has a supplementary reset bit to pulse after ungating */
+
+static inline struct meson_vclk_gate_data *
+clk_get_meson_vclk_gate_data(struct clk_regmap *clk)
+{
+	return (struct meson_vclk_gate_data *)clk->data;
+}
+
+static int meson_vclk_gate_enable(struct clk_hw *hw)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct meson_vclk_gate_data *vclk = clk_get_meson_vclk_gate_data(clk);
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
+static void meson_vclk_gate_disable(struct clk_hw *hw)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct meson_vclk_gate_data *vclk = clk_get_meson_vclk_gate_data(clk);
+
+	meson_parm_write(clk->map, &vclk->enable, 0);
+}
+
+static int meson_vclk_gate_is_enabled(struct clk_hw *hw)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct meson_vclk_gate_data *vclk = clk_get_meson_vclk_gate_data(clk);
+
+	return meson_parm_read(clk->map, &vclk->enable);
+}
+
+const struct clk_ops meson_vclk_gate_ops = {
+	.enable = meson_vclk_gate_enable,
+	.disable = meson_vclk_gate_disable,
+	.is_enabled = meson_vclk_gate_is_enabled,
+};
+EXPORT_SYMBOL_GPL(meson_vclk_gate_ops);
+
+/* The VCLK Divider has supplementary reset & enable bits */
+
+static inline struct meson_vclk_div_data *
+clk_get_meson_vclk_div_data(struct clk_regmap *clk)
+{
+	return (struct meson_vclk_div_data *)clk->data;
+}
+
+static unsigned long meson_vclk_div_recalc_rate(struct clk_hw *hw,
+						     unsigned long prate)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct meson_vclk_div_data *vclk = clk_get_meson_vclk_div_data(clk);
+
+	return divider_recalc_rate(hw, prate, meson_parm_read(clk->map, &vclk->div),
+				   vclk->table, vclk->flags, vclk->div.width);
+}
+
+static int meson_vclk_div_determine_rate(struct clk_hw *hw,
+					      struct clk_rate_request *req)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct meson_vclk_div_data *vclk = clk_get_meson_vclk_div_data(clk);
+
+	return divider_determine_rate(hw, req, vclk->table, vclk->div.width,
+				      vclk->flags);
+}
+
+static int meson_vclk_div_set_rate(struct clk_hw *hw, unsigned long rate,
+					unsigned long parent_rate)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct meson_vclk_div_data *vclk = clk_get_meson_vclk_div_data(clk);
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
+static int meson_vclk_div_enable(struct clk_hw *hw)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct meson_vclk_div_data *vclk = clk_get_meson_vclk_div_data(clk);
+
+	/* Unreset the divider when ungating */
+	meson_parm_write(clk->map, &vclk->reset, 0);
+	meson_parm_write(clk->map, &vclk->enable, 1);
+
+	return 0;
+}
+
+static void meson_vclk_div_disable(struct clk_hw *hw)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct meson_vclk_div_data *vclk = clk_get_meson_vclk_div_data(clk);
+
+	/* Reset the divider when gating */
+	meson_parm_write(clk->map, &vclk->enable, 0);
+	meson_parm_write(clk->map, &vclk->reset, 1);
+}
+
+static int meson_vclk_div_is_enabled(struct clk_hw *hw)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct meson_vclk_div_data *vclk = clk_get_meson_vclk_div_data(clk);
+
+	return meson_parm_read(clk->map, &vclk->enable);
+}
+
+const struct clk_ops meson_vclk_div_ops = {
+	.recalc_rate = meson_vclk_div_recalc_rate,
+	.determine_rate = meson_vclk_div_determine_rate,
+	.set_rate = meson_vclk_div_set_rate,
+	.enable = meson_vclk_div_enable,
+	.disable = meson_vclk_div_disable,
+	.is_enabled = meson_vclk_div_is_enabled,
+};
+EXPORT_SYMBOL_GPL(meson_vclk_div_ops);
+
+MODULE_DESCRIPTION("Amlogic vclk clock driver");
+MODULE_AUTHOR("Neil Armstrong <neil.armstrong@linaro.org>");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/clk/meson/vclk.h b/drivers/clk/meson/vclk.h
new file mode 100644
index 000000000000..20b0b181db09
--- /dev/null
+++ b/drivers/clk/meson/vclk.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2024 Neil Armstrong <neil.armstrong@linaro.org>
+ */
+
+#ifndef __VCLK_H
+#define __VCLK_H
+
+#include "clk-regmap.h"
+#include "parm.h"
+
+/**
+ * struct meson_vclk_gate_data - vclk_gate regmap backed specific data
+ *
+ * @enable:	vclk enable field
+ * @reset:	vclk reset field
+ * @flags:	hardware-specific flags
+ *
+ * Flags:
+ * Same as clk_gate except CLK_GATE_HIWORD_MASK which is ignored
+ */
+struct meson_vclk_gate_data {
+	struct parm enable;
+	struct parm reset;
+	u8 flags;
+};
+
+extern const struct clk_ops meson_vclk_gate_ops;
+
+/**
+ * struct meson_vclk_div_data - vclk_div regmap back specific data
+ *
+ * @div:	divider field
+ * @enable:	vclk divider enable field
+ * @reset:	vclk divider reset field
+ * @table:	array of value/divider pairs, last entry should have div = 0
+ *
+ * Flags:
+ * Same as clk_divider except CLK_DIVIDER_HIWORD_MASK which is ignored
+ */
+struct meson_vclk_div_data {
+	struct parm div;
+	struct parm enable;
+	struct parm reset;
+	const struct clk_div_table *table;
+	u8 flags;
+};
+
+extern const struct clk_ops meson_vclk_div_ops;
+
+#endif /* __VCLK_H */

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
