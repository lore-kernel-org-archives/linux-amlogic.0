Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AFC1C4828D
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Feb 2024 17:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g0sD0EDV73CGF3dldbhhaZ4fJfTKzdBqPWb8AUbcnpI=; b=xpzNplwrOE1s7x
	Zoj6zuPOZ8OKmLP4kM1aInl6OUV0PwARb5m1e15gKTLZNx1INNwg9o75Pz3cR5D9wC3/ttAMeOwnb
	Huv97eckBpz24ypSu5L7D0R2UC69hztsQBevSIcmgh2Ts0Cagu6wg8Dc3qbBzi5r+8+jiTLF3L++6
	/D9t2aZd0DHqfU/xv1mI+ees9VGdS0bV+EJ8pzOOl8J1aQqh6SxnPqBWjYBrJ2ioeWnmSTx2NVO7X
	+dE5HzOXheutmcOjkOv8I/ETC3PGlB9XYElhiLNXRSy1ck/K8f4qEkCLEuzFvfkO320TcRQWdxDqg
	208XD4H2TfekgR2MPTgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX3CC-00000004GMJ-1c4g;
	Mon, 05 Feb 2024 17:55:52 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX3C0-00000004GB5-11RL
	for linux-amlogic@lists.infradead.org;
	Mon, 05 Feb 2024 17:55:42 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-40f033c2e30so42578845e9.0
        for <linux-amlogic@lists.infradead.org>; Mon, 05 Feb 2024 09:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707155739; x=1707760539; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7IUPR9d02dtJIVzX3UuZrrXfP4OKmNv4PgS6wUBZYrw=;
        b=TzV9cgQvVlmKuxbMurUGhGZvmJxlNaXqncFA0tH3Rro+M532bLVPVLxGOKWG3PhCvN
         hqE6wcUJq9ajRZssfzR/6v3vyndaOg6HuQJ7/Hg8Hz7kLfZl+40GzJQGGQ8pCqDMM997
         F9k3agrHFdRl5hs25aGR4fLFnini3W3CB4jfbEXYNXnjDD82voMdPaHWGid1oInkkZ2e
         o8DBlcJb1NKvK0ZJTW9E97qRvZ7KcZQcBkpMHfC4x4WbdZLI58eVl2DJRUeeb52wAScw
         mghqtW8QFavllklvDM1FG27865cHwdnFRZWI3Jgde5++W/O5M3S6oB2BgfzTXxKGChjv
         ULLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707155739; x=1707760539;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7IUPR9d02dtJIVzX3UuZrrXfP4OKmNv4PgS6wUBZYrw=;
        b=lTr1Uu1BGwILbqP0W3lHp9ry7+JN+yZLbxHZVs8oDiFH5rrDn/VzLOv6anW/1mBKyt
         kZsh1xO5CCxPv3hB/em31prQ8nPlCjfo1MGjn26Sl2gF1OMKkIV9KrRdwyaN2ggkO82r
         4cgSu/BznQVhrws5df4EVTkBlDFAVF96uo3tuKCkXDbIAJ3udTVyeg1nDI/Jehy+l6mR
         Abqg9d5P+gPedWckeFWwbGmLmCIvw4PAXYwds870JWTZyvaJL3Q3vKb8wJ+xYLjHtcjq
         HwIWWKb96kpt17YfQOZ/QT5/2VFNh/H/Rf3AyRDs/P8AxTrHlvjPwHbccfp/TjeUlGOm
         YLGA==
X-Gm-Message-State: AOJu0YwOhXbJoaw544CEoSOZTKUzAitb9a1zeKPgcrHgWWpV3xX6m7+8
	XghafjFpYw2fvsiytJeEl3ndxnhsVJ1jaDMY4RogqKIspyAzY1SIfHMm9Vf93pU=
X-Google-Smtp-Source: AGHT+IFN+yLUedhPaehLL/1exsFXa45xhACL3vqMCYezZMmd83Xo2s/0ZMKZ8kYdbpOQcQpnJ5AsgA==
X-Received: by 2002:a05:600c:2255:b0:40e:fa6b:f355 with SMTP id a21-20020a05600c225500b0040efa6bf355mr359245wmm.41.1707155738856;
        Mon, 05 Feb 2024 09:55:38 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXbtuxgYZnfxxF4ZBOxrecZd8vN1RFObCsvN4VGJBdjPqpMMpsJWbmmcBoO9T+cZeYeXGql16IsaeRKHFSO8Psd261DswqFLP4TxLNw8Y7hOoiYtyHRzZHwMIRFVb8IF0VswUblhJduwp00X/uSHcngOk65+1JzCgJ8j84EpMdyKO4P1FdipzjrCzoylVtmE8GORsgl/ITCO54DXfHistXo7GXQo5tpZARko6qVN2L3RNgxvoCFsnrSBdDbR7Ju1B6CQi2mJKDOlNPMNNd+qaGho6nkLDo/YKWmcOGtdSwocllDySDHYcYTaup6Pgs8JK6E0ZzwQ9DUyc+n3wLzSoR0h9laTzDiNghXEv6jAW7oPb6hiXDuaXqp/ibQGoTFiae8nIe1y2RQ/EkANc3E0B6p35PMVgaNBiS1Nas/MEOciOBRu8clyn3htN1KyJmwwyDZeQxmq0DXjBbX5+920N3HksNuQZ1BjqcKMaqGWu3ttCXecWrqWUCHai3iluuA8xobqbsZTNlwn8cZa3xNV9/RYc1YamycMLaM5t5GOxcALQsiBm9KfCOOvhvLSRmNbibIezI0jVQclvsSfFpI2RBep2Le4uYm0nSUptaCDhF06Kb7yJ9GvsX95WKd5AJ+pYeDqSyZ1nZ+JduNGNhUCw0GjvGqTs7TP/K6/AdfZEUIV9mQcLGCwa1kNEXsjBR1ZY1mV1f1zbcHvMsxgzj4eMlyLQvGhTP5i0SxDLi46QLy/kFEcuYQfHuSyBIZxUtB8do=
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id je16-20020a05600c1f9000b0040ee8765901sm517556wmb.43.2024.02.05.09.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 09:55:38 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 05 Feb 2024 18:55:29 +0100
Subject: [PATCH v10 2/7] clk: meson: add vclk driver
MIME-Version: 1.0
Message-Id: <20240205-amlogic-v6-4-upstream-dsi-ccf-vim3-v10-2-dc06073d5330@linaro.org>
References: <20240205-amlogic-v6-4-upstream-dsi-ccf-vim3-v10-0-dc06073d5330@linaro.org>
In-Reply-To: <20240205-amlogic-v6-4-upstream-dsi-ccf-vim3-v10-0-dc06073d5330@linaro.org>
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
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlwSEU8tOZQkTdCjVssb54fByFS/vJM4zBoexrCGED
 yegbuuuJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZcEhFAAKCRB33NvayMhJ0RluEA
 Ccp5IfaBOMWkzrq1HuMxujWIGePdsjqNJ4tL4+GNdykxafMPQQ8vqi5HnZ+O3Q0MJe3YUyhkUyibVH
 JvFPMnKYPHSWxiY0UypgLQg9f6Hd6hKveiGSBHjUAQ7hrMCD/XDNWf8/x6XuuqZhW9pUOjc4WC5Fb+
 zszbRxr1z5y+sPthUyT8zGZnCyiU/cXcq1SgnIXxHnG2Zovv5Z9INvZPLPGL7/oZqD3WvVbRdYFda1
 5WsFRRPY/meR6Dx1y1iUd1KyZs1BJfR6eSmGD23GnYpB0cWUngu8hz8E0Uf6UA/We6M/zSfLTVU5iw
 4CUHIIqUbXpu1OWTNT2j8TwUSWO6/i1PFO8fNwrC6Wby29NzloW0t/0z8mxHO92Z6c8UjzggB1MSYj
 O9EImIqNI3dmGqm8hl6qd4w7M3lPbgXfKayuMTK8clFEU3szCDh+tEdoLC0HS/XlzemASxik6mg1kK
 BoeDLoO5jNG6eM//ITPhYmNvpUO0H2EO2rBVqnFyMFWUakOVngUb5RqqMrdYcia5esrhOrDFBg8RNr
 UVSFoQbzDzx2/etjhH1KNf6iDpNkXNdabOb+Z+X3cmTuofJCfl0ZG9dkOjpUeorbca1YRW8Quxtci/
 2dEmw70wVop+RAwIBjqi1WDHcQT8nEwZ+YhcFHGae5/skwfIPjSZT4+PWsQw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_095540_413116_52967C0A 
X-CRM114-Status: GOOD (  18.46  )
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
