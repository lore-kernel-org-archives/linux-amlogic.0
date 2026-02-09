Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75C2CEF0718
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Feb 2026 05:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W6GeFaam2gNl9OvbvtM97eWH9Zm4krOGNNMNpoBRvYs=; b=ijVdxPWZaRPWpY
	xz2oIlIHD/LuaifRgwdUsAmQNYUSLtDrvhucl0m4P3/lJvVDkCW7W/+oTM6rPIlbz0h7sBqn8gZCV
	YitfNUl05egnz5CcLmrAIGCUt1sHBfnP02k4+JDSWppuJV1nzSLIooer+FahMjJwbiUAInVLKcsO/
	7PZ6gtIOZ5czv+yFxTwFZ90d/UmKIztxuftkPTsX69LwM5DNQ2Ze+1KFSFepJ6y604W1eq0yy9v+q
	IsVeJWgzMaxomi6HOHIF3TQEXFNkBBPA8xV65aEIRbs/JO2bEINPdFVfu/jwU+CN9gLEZ8lRsrS/6
	7lGK3/IB73HRTmJBjGag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpK93-0000000Ergx-2kbx;
	Mon, 09 Feb 2026 05:49:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpK8z-0000000Ercz-1Sks
	for linux-amlogic@lists.infradead.org;
	Mon, 09 Feb 2026 05:49:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0668F44565;
	Mon,  9 Feb 2026 05:49:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DC36FC19424;
	Mon,  9 Feb 2026 05:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770616146;
	bh=e2cihnQveuTVgLjGD3IwfdOobSrsdpfwR1pkwTgP9g4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ZqWy1a30ZziU6Qu+WqEyaFlfXzQCpSTZmxEyZ/V2lqptybBoah/x6+Tgpv4CwsKw8
	 LL9bCvdJlRwvatoFsSsVZC81DRhWlthef1lQUAaACQKc9z7rc5IgWc4pihJOAJo15G
	 b+KKMhcbszf1E5KSOAuUcE09EinIpfue6wXy7+7eBU1UCg2hecev5OTcxI3ptCI2Ms
	 QOgWAsnWnhNMAo9qlD84Q5FjHcoqq/HtZQs9Z/o1ZCcSJaKv+g+KTS78ylHGDPL2Tx
	 sH1hot8n916uP5ttVBFdfLcEtKGVx0KgRmB1XlG2/4gM5rPLupwTUNoWa4JKLmVS2h
	 y4HAXFxrniLMA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3CFBEF070D;
	Mon,  9 Feb 2026 05:49:06 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Mon, 09 Feb 2026 13:48:52 +0800
Subject: [PATCH 06/13] clk: amlogic: Add noglitch clock driver
MIME-Version: 1.0
Message-Id: <20260209-a9_clock_driver-v1-6-a9198dc03d2a@amlogic.com>
References: <20260209-a9_clock_driver-v1-0-a9198dc03d2a@amlogic.com>
In-Reply-To: <20260209-a9_clock_driver-v1-0-a9198dc03d2a@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770616142; l=21782;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=s6jXfzSrDe9HlivCGNmzLi8+HeSP7kAfBpSJrL8xvzU=;
 b=N2LIWPf2DYfNglrm8VFeoMOvsdOpBiobXKAiLLEZ+D5tQegVgtwUiIF4pzrl6vM1wS8bBSl1V
 GFRD8WRXzpFBq9MD18g2yTlk0CQdOelNpQRMFWKtn1s6fFJfSUsuRyy
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260208_214909_506282_7235321E 
X-CRM114-Status: GOOD (  25.80  )
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
Reply-To: chuan.liu@amlogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Chuan Liu <chuan.liu@amlogic.com>

Implement clk_ops support for Amlogic noglitch clocks. The noglitch
clock consists of two Amlogic composite clocks and a noglitch
multiplexer. It ensures output clock continuity through ping-pong
switching between the two composite clocks, with the noglitch mux
suppressing glitches during clock transitions.

Amlogic noglitch clocks are used for modules requiring high clock
quality, such as GPU, video codecs, and other sensitive peripherals.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 drivers/clk/amlogic/Makefile       |   1 +
 drivers/clk/amlogic/clk-noglitch.c | 584 +++++++++++++++++++++++++++++++++++++
 drivers/clk/amlogic/clk-noglitch.h |  29 ++
 drivers/clk/amlogic/clk.c          |   5 +
 drivers/clk/amlogic/clk.h          |   1 +
 5 files changed, 620 insertions(+)

diff --git a/drivers/clk/amlogic/Makefile b/drivers/clk/amlogic/Makefile
index 58a5e7bc8993..72cd2525e078 100644
--- a/drivers/clk/amlogic/Makefile
+++ b/drivers/clk/amlogic/Makefile
@@ -5,3 +5,4 @@ obj-$(CONFIG_COMMON_CLK_AMLOGIC) += clk-amlogic.o
 clk-amlogic-y += clk.o
 clk-amlogic-y += clk-basic.o
 clk-amlogic-y += clk-composite.o
+clk-amlogic-y += clk-noglitch.o
diff --git a/drivers/clk/amlogic/clk-noglitch.c b/drivers/clk/amlogic/clk-noglitch.c
new file mode 100644
index 000000000000..1290e266d33b
--- /dev/null
+++ b/drivers/clk/amlogic/clk-noglitch.c
@@ -0,0 +1,584 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
+/*
+ * Copyright (c) 2026 Amlogic, Inc. All rights reserved
+ */
+
+#include <linux/err.h>
+#include <linux/module.h>
+
+#include "clk.h"
+#include "clk-noglitch.h"
+
+/*
+ * Amlogic no-glitch clock module:
+ *
+ *             mux0       div0        gate0     noglitch_mux
+ *              |  mux1    |    div1    |    gate1  |
+ *              |   |      |     |      |      |    |
+ *         +----|---|------|-----|------|------|----|----+
+ *         |   \|/  |      |     |      |      |    |    |
+ *         |   |\   |      |     |      |      |    |    |
+ * clk0 ------>| |  |      |     |      |      |    |    |
+ * clk1 ------>| |  |      |     |      |      |    |    |
+ * clk2 ------>| |  |     \|/    |     \|/     |   \|/   |
+ * clk3 ------>| |  |   +-----+  |   +------+  |   |\    |
+ *         |   | |--o-->| div |--o-->| gate |--o-->| |   |
+ * clk4 ------>| |  |   +-----+  |   +------+  |   | |   |
+ * clk5 ------>| |  |            |             |   | |   |
+ * clk6 ------>| |  |            |             |   | |   |
+ * clk7 ------>| |  |            |             |   | |   |
+ *         |   |/   |            |             |   | |   |
+ *         |        |            |             |   | |   |
+ *         |    +---+      +-----+      +------+   | |-------> clk out
+ *         |   \|/         |            |          | |   |
+ *         |   |\          |            |          | |   |
+ * clk0 ------>| |         |            |          | |   |
+ * clk1 ------>| |         |            |          | |   |
+ * clk2 ------>| |        \|/          \|/         | |   |
+ * clk3 ------>| |      +-----+     +------+       | |   |
+ *         |   | |--- ->| div |---->| gate |------>| |   |
+ * clk4 ------>| |      +-----+     +------+       |/    |
+ * clk5 ------>| |                                       |
+ * clk6 ------>| |                                       |
+ * clk7 ------>| |                                       |
+ *         |   |/                                        |
+ *         |                                             |
+ *         +---------------------------------------------+
+ *
+ * The purpose of the Amlogic no-glitch clock is to suppress glitches generated
+ * during mux switching.
+ *
+ * Its internal implementation consists of two Amlogic composite clocks and one
+ * noglitch_mux. The noglitch_mux filters out a certain number of clock cycles
+ * from both the original channel and the new channel, and then continuously
+ * outputs the clock from the new channel. This prevents glitches caused by an
+ * insufficient settling time when switching clocks. The timing diagram of
+ * noglitch_mux clock switching is shown below.
+ *
+ *        __    __    __    __    __    __    __    __
+ * ori:  |  |__|  |__|  |__|  |__|  |__|  |__|  |__|  |__|
+ *                   ^
+ *                   1 * cycle original channel
+ *        _   _   _   _   _   _   _   _   _   _   _   _
+ * new:  | |_| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_|
+ *                                       ^
+ *                                       5 * cycles new channel
+ *        __    __                        _   _   _   _
+ * out:  |  |__|  |______________________| |_| |_| |_| |_|
+ *              ^                        ^
+ *              start switching mux      switch to new channel
+ *
+ * To prevent glitches from propagating to clk_out and affecting the normal
+ * operation of glitch-sensitive modules, the no-glitch clock must be configured
+ * following the specified sequence:
+ *   - When the clock gate is disabled: configure it as a normal composite clock
+ *     (any glitches generated will be blocked by the gate and will not
+ *     propagate to clk_out).
+ *   - When the clock gate is enabled: configure it according to the following
+ *     sequence to suppress glitches:
+ *       - Configure and enable the idle composite clock path of the
+ *         noglitch_mux with the target frequency/parent clock.
+ *       - Switch the noglitch_mux to the channel prepared in the previous step.
+ *       - Disable the clock of the original noglitch_mux channel.
+ */
+
+union aml_clk_noglitch_reg {
+	struct {
+		u32 div0		:8;  /* bit0 - bit7 */
+		u32 gate0		:1;  /* bit8 */
+		u32 mux0		:3;  /* bit9 - bit11 */
+		u32 reserved		:4;  /* bit12 - bit15 */
+		u32 div1		:8;  /* bit16 - bit23 */
+		u32 gate1		:1;  /* bit24 */
+		u32 mux1		:3;  /* bit25 - bit27 */
+		u32 reserved1		:3;  /* bit28 - bit30 */
+		u32 noglitch_mux	:1;  /* bit31 */
+
+	} bits;
+	u32 val;
+};
+
+static u8 aml_clk_noglitch_get_parent(struct clk_hw *hw)
+{
+	struct aml_clk *clk = to_aml_clk(hw);
+	struct aml_clk_noglitch_data *noglitch = clk->data;
+	union aml_clk_noglitch_reg reg;
+	int ret;
+
+	ret = regmap_read(clk->map, noglitch->reg_offset, &reg.val);
+	if (ret)
+		return ret;
+
+	if (reg.bits.noglitch_mux)  /* mux1 */
+		return clk_mux_val_to_index(hw, noglitch->table, 0,
+					    reg.bits.mux1);
+	else  /* mux0 */
+		return clk_mux_val_to_index(hw, noglitch->table, 0,
+					    reg.bits.mux0);
+}
+
+static int aml_clk_noglitch_set_parent(struct clk_hw *hw, u8 index)
+{
+	struct aml_clk *clk = to_aml_clk(hw);
+	struct aml_clk_noglitch_data *noglitch = clk->data;
+	unsigned int val = clk_mux_index_to_val(noglitch->table, 0, index);
+	union aml_clk_noglitch_reg reg;
+	int ret;
+
+	ret = regmap_read(clk->map, noglitch->reg_offset, &reg.val);
+	if (ret)
+		return ret;
+
+	if (reg.bits.noglitch_mux) {  /* mux1 */
+		/*
+		 * When the no-glitch output is enabled, the clock must be
+		 * configured with the following timing sequence to suppress
+		 * glitches:
+		 *
+		 * step1: Configure and enable Channel 0 clock.
+		 * step2: Switch the no-glitch mux to Channel 0.
+		 * step3: Disable Channel 1 clock.
+		 */
+		if (reg.bits.gate1) {
+			/* step1: Configure and enable Channel 0 clock */
+			reg.bits.mux0 = val;
+			reg.bits.gate0 = 1;
+			ret = regmap_write(clk->map, noglitch->reg_offset,
+					   reg.val);
+			if (ret)
+				return ret;
+
+			/* step2: Switch the no-glitch mux to Channel 0 */
+			reg.bits.noglitch_mux = 0;
+			ret = regmap_write(clk->map, noglitch->reg_offset,
+					   reg.val);
+			if (ret)
+				return ret;
+
+			/* step3: Disable Channel 1 clock */
+			reg.bits.gate1 = 0;
+			ret = regmap_write(clk->map, noglitch->reg_offset,
+					   reg.val);
+			if (ret)
+				return ret;
+		} else {
+			/*
+			 * When no-glitch is disabled, no glitch will occur,
+			 * allowing direct clock source switching.
+			 */
+			reg.bits.mux1 = val;
+			ret = regmap_write(clk->map, noglitch->reg_offset,
+					   reg.val);
+			if (ret)
+				return ret;
+		}
+	} else {  /* mux0 */
+		if (reg.bits.gate0) {
+			reg.bits.mux1 = val;
+			reg.bits.gate1 = 1;
+			ret = regmap_write(clk->map, noglitch->reg_offset,
+					   reg.val);
+			if (ret)
+				return ret;
+
+			reg.bits.noglitch_mux = 1;
+			ret = regmap_write(clk->map, noglitch->reg_offset,
+					   reg.val);
+			if (ret)
+				return ret;
+
+			reg.bits.gate0 = 0;
+			ret = regmap_write(clk->map, noglitch->reg_offset,
+					   reg.val);
+			if (ret)
+				return ret;
+		} else {
+			reg.bits.mux0 = val;
+			ret = regmap_write(clk->map, noglitch->reg_offset,
+					   reg.val);
+			if (ret)
+				return ret;
+		}
+	}
+
+	return 0;
+}
+
+static unsigned long aml_clk_noglitch_recalc_rate(struct clk_hw *hw,
+						  unsigned long parent_rate)
+{
+	struct aml_clk *clk = to_aml_clk(hw);
+	struct aml_clk_noglitch_data *noglitch = clk->data;
+	union aml_clk_noglitch_reg reg;
+	int ret;
+
+	ret = regmap_read(clk->map, noglitch->reg_offset, &reg.val);
+	if (ret)
+		return ret;
+
+	if (reg.bits.noglitch_mux)  /* mux1 */
+		return divider_recalc_rate(hw, parent_rate, reg.bits.div1, NULL,
+					   0, CLK_NOGLITCH_DIV_WIDTH);
+	else  /* mux0 */
+		return divider_recalc_rate(hw, parent_rate, reg.bits.div0, NULL,
+					   0, CLK_NOGLITCH_DIV_WIDTH);
+}
+
+static int
+aml_clk_noglitch_determine_rate_for_parent(struct clk_hw *rate_hw,
+					   struct clk_rate_request *req,
+					   struct clk_hw *parent_hw)
+{
+	req->best_parent_hw = parent_hw;
+	req->best_parent_rate = clk_hw_get_rate(parent_hw);
+
+	return divider_determine_rate(rate_hw, req, NULL,
+				      CLK_NOGLITCH_DIV_WIDTH, 0);
+}
+
+static int aml_clk_noglitch_determine_rate(struct clk_hw *hw,
+					   struct clk_rate_request *req)
+{
+	struct clk_hw *parent;
+	struct clk_rate_request tmp_req;
+	unsigned long rate_diff;
+	unsigned long best_rate_diff = ULONG_MAX;
+	unsigned long best_rate = 0;
+	int i, ret;
+
+	req->best_parent_hw = NULL;
+
+	parent = clk_hw_get_parent(hw);
+	clk_hw_forward_rate_request(hw, req, parent, &tmp_req, req->rate);
+	ret = aml_clk_noglitch_determine_rate_for_parent(hw, &tmp_req,
+							 parent);
+	if (ret)
+		return ret;
+
+	/*
+	 * Check if rate can be satisfied by current parent clock. Avoid parent
+	 * switching when possible to reduce glitches.
+	 */
+	if (req->rate == tmp_req.rate ||
+	    (clk_hw_get_flags(hw) & CLK_SET_RATE_NO_REPARENT)) {
+		req->rate = tmp_req.rate;
+		req->best_parent_hw = tmp_req.best_parent_hw;
+		req->best_parent_rate = tmp_req.best_parent_rate;
+
+		return 0;
+	}
+
+	for (i = 0; i < clk_hw_get_num_parents(hw); i++) {
+		parent = clk_hw_get_parent_by_index(hw, i);
+		if (!parent)
+			continue;
+
+		clk_hw_forward_rate_request(hw, req, parent, &tmp_req,
+					    req->rate);
+		ret = aml_clk_noglitch_determine_rate_for_parent(hw, &tmp_req,
+								 parent);
+		if (ret)
+			continue;
+
+		if (req->rate >= tmp_req.rate)
+			rate_diff = req->rate - tmp_req.rate;
+		else
+			rate_diff = tmp_req.rate - req->rate;
+
+		if (!rate_diff || !req->best_parent_hw ||
+		    best_rate_diff > rate_diff) {
+			req->best_parent_hw = parent;
+			req->best_parent_rate = tmp_req.best_parent_rate;
+			best_rate_diff = rate_diff;
+			best_rate = tmp_req.rate;
+		}
+
+		if (!rate_diff)
+			return 0;
+	}
+
+	req->rate = best_rate;
+	return 0;
+}
+
+static int aml_clk_noglitch_set_rate(struct clk_hw *hw, unsigned long rate,
+				     unsigned long parent_rate)
+{
+	struct aml_clk *clk = to_aml_clk(hw);
+	struct aml_clk_noglitch_data *noglitch = clk->data;
+	union aml_clk_noglitch_reg reg;
+	int ret, div;
+
+	div = divider_get_val(rate, parent_rate, NULL,
+			      CLK_NOGLITCH_DIV_WIDTH, 0);
+	if (div < 0)
+		return div;
+
+	ret = regmap_read(clk->map, noglitch->reg_offset, &reg.val);
+	if (ret)
+		return ret;
+
+	if (reg.bits.noglitch_mux) {  /* mux1 */
+		/*
+		 * When the no-glitch output is enabled, the clock must be
+		 * configured with the following timing sequence to suppress
+		 * glitches:
+		 *
+		 * step1: Configure and enable Channel 0 clock.
+		 * step2: Switch the no-glitch mux to Channel 0.
+		 * step3: Disable Channel 1 clock.
+		 */
+		if (reg.bits.gate1) {
+			/* step1: Configure and enable Channel 0 clock */
+			reg.bits.div0 = div;
+			reg.bits.gate0 = 1;
+			ret = regmap_write(clk->map, noglitch->reg_offset,
+					   reg.val);
+			if (ret)
+				return ret;
+
+			/* step2: Switch the no-glitch mux to Channel 0 */
+			reg.bits.noglitch_mux = 0;
+			ret = regmap_write(clk->map, noglitch->reg_offset,
+					   reg.val);
+			if (ret)
+				return ret;
+
+			/* step3: Disable Channel 1 clock */
+			reg.bits.gate1 = 0;
+			ret = regmap_write(clk->map, noglitch->reg_offset,
+					   reg.val);
+			if (ret)
+				return ret;
+		} else {
+			/*
+			 * When no-glitch is disabled, no glitch will occur,
+			 * allowing direct clock source switching.
+			 */
+			reg.bits.div1 = div;
+			ret = regmap_write(clk->map, noglitch->reg_offset,
+					   reg.val);
+			if (ret)
+				return ret;
+		}
+	} else {  /* mux0 */
+		if (reg.bits.gate0) {
+			reg.bits.div1 = div;
+			reg.bits.gate1 = 1;
+			ret = regmap_write(clk->map, noglitch->reg_offset,
+					   reg.val);
+			if (ret)
+				return ret;
+
+			reg.bits.noglitch_mux = 1;
+			ret = regmap_write(clk->map, noglitch->reg_offset,
+					   reg.val);
+			if (ret)
+				return ret;
+
+			reg.bits.gate0 = 0;
+			ret = regmap_write(clk->map, noglitch->reg_offset,
+					   reg.val);
+			if (ret)
+				return ret;
+		} else {
+			reg.bits.div0 = div;
+			ret = regmap_write(clk->map, noglitch->reg_offset,
+					   reg.val);
+			if (ret)
+				return ret;
+		}
+	}
+
+	regmap_read(clk->map, noglitch->reg_offset, &reg.val);
+
+	return 0;
+}
+
+static int aml_clk_noglitch_set_rate_and_parent(struct clk_hw *hw,
+					       unsigned long rate,
+					       unsigned long parent_rate,
+					       u8 index)
+{
+	struct aml_clk *clk = to_aml_clk(hw);
+	struct aml_clk_noglitch_data *noglitch = clk->data;
+	unsigned int parent_index = clk_mux_index_to_val(noglitch->table, 0,
+							 index);
+	union aml_clk_noglitch_reg reg;
+	int ret, div;
+
+	div = divider_get_val(rate, parent_rate, NULL,
+			      CLK_NOGLITCH_DIV_WIDTH, 0);
+	if (div < 0)
+		return div;
+
+	ret = regmap_read(clk->map, noglitch->reg_offset, &reg.val);
+	if (ret)
+		return ret;
+
+	if (reg.bits.noglitch_mux) {  /* mux1 */
+		/*
+		 * When the no-glitch output is enabled, the clock must be
+		 * configured with the following timing sequence to suppress
+		 * glitches:
+		 *
+		 * step1: Configure and enable Channel 0 clock.
+		 * step2: Switch the no-glitch mux to Channel 0.
+		 * step3: Disable Channel 1 clock.
+		 */
+		if (reg.bits.gate1) {
+			/* step1: Configure and enable Channel 0 clock */
+			reg.bits.mux0 = parent_index;
+			reg.bits.div0 = div;
+			reg.bits.gate0 = 1;
+			ret = regmap_write(clk->map, noglitch->reg_offset,
+					   reg.val);
+			if (ret)
+				return ret;
+
+			/* step2: Switch the no-glitch mux to Channel 0 */
+			reg.bits.noglitch_mux = 0;
+			ret = regmap_write(clk->map, noglitch->reg_offset,
+					   reg.val);
+			if (ret)
+				return ret;
+
+			/* step3: Disable Channel 1 clock */
+			reg.bits.gate1 = 0;
+			ret = regmap_write(clk->map, noglitch->reg_offset,
+					   reg.val);
+			if (ret)
+				return ret;
+		} else {
+			/*
+			 * When no-glitch is disabled, no glitch will occur,
+			 * allowing direct clock source switching.
+			 */
+			reg.bits.mux1 = parent_index;
+			reg.bits.div1 = div;
+			ret = regmap_write(clk->map, noglitch->reg_offset,
+					   reg.val);
+			if (ret)
+				return ret;
+		}
+	} else {  /* mux0 */
+		if (reg.bits.gate0) {
+			reg.bits.mux1 = parent_index;
+			reg.bits.div1 = div;
+			reg.bits.gate1 = 1;
+			ret = regmap_write(clk->map, noglitch->reg_offset,
+					   reg.val);
+			if (ret)
+				return ret;
+
+			reg.bits.noglitch_mux = 1;
+			ret = regmap_write(clk->map, noglitch->reg_offset,
+					   reg.val);
+			if (ret)
+				return ret;
+
+			reg.bits.gate0 = 0;
+			ret = regmap_write(clk->map, noglitch->reg_offset,
+					   reg.val);
+			if (ret)
+				return ret;
+		} else {
+			reg.bits.mux0 = parent_index;
+			reg.bits.div0 = div;
+			ret = regmap_write(clk->map, noglitch->reg_offset,
+					   reg.val);
+			if (ret)
+				return ret;
+		}
+	}
+
+	regmap_read(clk->map, noglitch->reg_offset, &reg.val);
+
+	return 0;
+}
+
+static int aml_clk_noglitch_is_enabled(struct clk_hw *hw)
+{
+	struct aml_clk *clk = to_aml_clk(hw);
+	struct aml_clk_noglitch_data *noglitch = clk->data;
+	union aml_clk_noglitch_reg reg;
+	int ret;
+
+	ret = regmap_read(clk->map, noglitch->reg_offset, &reg.val);
+	if (ret)
+		return ret;
+
+	if (reg.bits.noglitch_mux)  /* mux1 */
+		return reg.bits.gate1;
+	else
+		return reg.bits.gate0;
+}
+
+static int aml_clk_noglitch_enable(struct clk_hw *hw)
+{
+	struct aml_clk *clk = to_aml_clk(hw);
+	struct aml_clk_noglitch_data *noglitch = clk->data;
+	union aml_clk_noglitch_reg reg;
+	int ret;
+
+	ret = regmap_read(clk->map, noglitch->reg_offset, &reg.val);
+	if (ret)
+		return ret;
+
+	if (reg.bits.noglitch_mux)  /* mux1 */
+		reg.bits.gate1 = 1;
+	else
+		reg.bits.gate0 = 1;
+
+	return regmap_write(clk->map, noglitch->reg_offset, reg.val);
+}
+
+static void aml_clk_noglitch_disable(struct clk_hw *hw)
+{
+	struct aml_clk *clk = to_aml_clk(hw);
+	struct aml_clk_noglitch_data *noglitch = clk->data;
+	union aml_clk_noglitch_reg reg;
+
+	if (regmap_read(clk->map, noglitch->reg_offset, &reg.val))
+		return;
+
+	if (reg.bits.noglitch_mux)  /* mux1 */
+		reg.bits.gate1 = 0;
+	else
+		reg.bits.gate0 = 0;
+
+	regmap_write(clk->map, noglitch->reg_offset, reg.val);
+}
+
+#ifdef CONFIG_DEBUG_FS
+#include <linux/debugfs.h>
+
+static void
+aml_clk_noglitch_debug_init(struct clk_hw *hw, struct dentry *dentry)
+{
+	debugfs_create_file("clk_type", 0444, dentry, hw, &aml_clk_type_fops);
+	debugfs_create_file("clk_available_rates", 0444, dentry, hw,
+			    &aml_clk_div_available_rates_fops);
+}
+#endif /* CONFIG_DEBUG_FS */
+
+const struct clk_ops aml_clk_noglitch_ops = {
+	.get_parent = aml_clk_noglitch_get_parent,
+	.set_parent = aml_clk_noglitch_set_parent,
+	.determine_rate = aml_clk_noglitch_determine_rate,
+	.recalc_rate = aml_clk_noglitch_recalc_rate,
+	.set_rate = aml_clk_noglitch_set_rate,
+	.set_rate_and_parent = aml_clk_noglitch_set_rate_and_parent,
+	.enable = aml_clk_noglitch_enable,
+	.disable = aml_clk_noglitch_disable,
+	.is_enabled = aml_clk_noglitch_is_enabled,
+#ifdef CONFIG_DEBUG_FS
+	.debug_init = aml_clk_noglitch_debug_init,
+#endif /* CONFIG_DEBUG_FS */
+};
+EXPORT_SYMBOL_NS_GPL(aml_clk_noglitch_ops, "CLK_AMLOGIC");
+
+MODULE_DESCRIPTION("Amlogic Noglitch Clock Driver");
+MODULE_AUTHOR("Chuan Liu <chuan.liu@amlogic.com>");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("CLK_AMLOGIC");
diff --git a/drivers/clk/amlogic/clk-noglitch.h b/drivers/clk/amlogic/clk-noglitch.h
new file mode 100644
index 000000000000..3b8408afd77a
--- /dev/null
+++ b/drivers/clk/amlogic/clk-noglitch.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * Copyright (c) 2026 Amlogic, Inc. All rights reserved
+ */
+
+#ifndef __AML_CLK_NOGLITCH_H
+#define __AML_CLK_NOGLITCH_H
+
+#include <linux/clk-provider.h>
+
+/*
+ * NOTE: Currently, the divider of the AM no-glitch clock uses a fixed 7-bit
+ * register field width.
+ *
+ * To better consolidate the code, the implementation for calculating
+ * "clk_available_rates" for divider, composite, and no-glitch clocks has been
+ * unified into a single function (in clk.c). Therefore, this macro is defined
+ * here for use by the related functions.
+ */
+#define CLK_NOGLITCH_DIV_WIDTH		7
+
+struct aml_clk_noglitch_data {
+	unsigned int	reg_offset;
+	u32		*table;
+};
+
+extern const struct clk_ops aml_clk_noglitch_ops;
+
+#endif /* __AML_CLK_NOGLITCH_H */
diff --git a/drivers/clk/amlogic/clk.c b/drivers/clk/amlogic/clk.c
index e71dcb6b46b7..12e9596668d2 100644
--- a/drivers/clk/amlogic/clk.c
+++ b/drivers/clk/amlogic/clk.c
@@ -11,6 +11,7 @@
 #include "clk.h"
 #include "clk-basic.h"
 #include "clk-composite.h"
+#include "clk-noglitch.h"
 
 static const struct {
 	unsigned int type;
@@ -21,6 +22,7 @@ static const struct {
 	ENTRY(AML_CLKTYPE_DIV),
 	ENTRY(AML_CLKTYPE_GATE),
 	ENTRY(AML_CLKTYPE_COMPOSITE),
+	ENTRY(AML_CLKTYPE_NOGLITCH),
 #undef ENTRY
 };
 
@@ -102,6 +104,9 @@ static int aml_clk_div_available_rates_show(struct seq_file *s, void *data)
 
 		div_val = (1 << composite->div_width) - 1;
 		div_width = composite->div_width;
+	} else if (clk->type == AML_CLKTYPE_NOGLITCH) {
+		div_val = (1 << CLK_NOGLITCH_DIV_WIDTH) - 1;
+		div_width = CLK_NOGLITCH_DIV_WIDTH;
 	} else {
 		pr_err("%s: Unsupported clock type\n", clk_hw_get_name(hw));
 		return -EINVAL;
diff --git a/drivers/clk/amlogic/clk.h b/drivers/clk/amlogic/clk.h
index e5fe85c2969f..14045fa109c0 100644
--- a/drivers/clk/amlogic/clk.h
+++ b/drivers/clk/amlogic/clk.h
@@ -15,6 +15,7 @@ enum aml_clk_type {
 	AML_CLKTYPE_DIV		= 2,
 	AML_CLKTYPE_GATE	= 3,
 	AML_CLKTYPE_COMPOSITE	= 4,
+	AML_CLKTYPE_NOGLITCH	= 5,
 };
 
 struct aml_clk {

-- 
2.42.0



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
