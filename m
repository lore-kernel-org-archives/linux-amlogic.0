Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A5F7C7618A
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Mar 2023 11:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=e8GIml7A9f8GzLtKnKs96AtSb+t5Ml/HuqO/M47BhFY=; b=vhdhwlUdiM/Rxc
	Peua59YZrzs84K9MRWYs7SNb9wevB7kLAV82nkpuo/NSNKCsaSiXqSf0dzQPNmzcJntCOUqA9OKah
	D2oez0wb6ZcoMAWvpmEq4rw8xoTVudhzvmEFnRYdYv+Y9OH7rbxhale635T5bJ/EFxVIzUJR8mOuw
	xUrdYn59QQNOb/27ewtUK3n6mnDROcgQ3+xxJ2ncJOlsYHMmxkfMvvTd6lRbX0yXgcn/xvONzfm3R
	SFGhJoZ8MbOzmAXfliEvCldU+rOUHNuhtowXoLkoJdohBeEmkWvhrUEcH+MD3S/Hr0MkvvrFxUFtW
	1MPiXcWwx7U+yhUZbGiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peDnX-008pgN-2E;
	Mon, 20 Mar 2023 11:35:31 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peDnT-008pf7-2r;
	Mon, 20 Mar 2023 11:35:29 +0000
Received: from droid06.amlogic.com (10.18.11.248) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Mon, 20 Mar 2023
 19:35:20 +0800
From: Yu Tu <yu.tu@amlogic.com>
To: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>
CC: <kelvin.zhang@amlogic.com>, <qi.duan@amlogic.com>, Yu Tu
	<yu.tu@amlogic.com>
Subject: [PATCH V2] clk: meson: vid-pll-div: added meson_vid_pll_div_ops support
Date: Mon, 20 Mar 2023 19:34:45 +0800
Message-ID: <20230320113445.17260-1-yu.tu@amlogic.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-Originating-IP: [10.18.11.248]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_043527_950607_91550C67 
X-CRM114-Status: GOOD (  12.17  )
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

Since the previous code only provides "ro_ops" for the vid_pll_div
clock. In fact, the clock can be set. So add "ops" that can set the
clock, especially for later chips like S4 SOC and so on.

Signed-off-by: Yu Tu <yu.tu@amlogic.com>
---
 drivers/clk/meson/vid-pll-div.c | 67 +++++++++++++++++++++++++++++++++
 drivers/clk/meson/vid-pll-div.h |  3 ++
 2 files changed, 70 insertions(+)

diff --git a/drivers/clk/meson/vid-pll-div.c b/drivers/clk/meson/vid-pll-div.c
index daff235bc763..3c9015944f24 100644
--- a/drivers/clk/meson/vid-pll-div.c
+++ b/drivers/clk/meson/vid-pll-div.c
@@ -89,6 +89,73 @@ static unsigned long meson_vid_pll_div_recalc_rate(struct clk_hw *hw,
 	return DIV_ROUND_UP_ULL(parent_rate * div->multiplier, div->divider);
 }
 
+static int meson_vid_pll_div_determine_rate(struct clk_hw *hw,
+					    struct clk_rate_request *req)
+{
+	unsigned long parent_rate, best = 0, now = 0, rate;
+	unsigned long parent_rate_saved = req->best_parent_rate;
+	unsigned int i, best_i = 0;
+
+	for (i = 0 ; i < VID_PLL_DIV_TABLE_SIZE; ++i) {
+		rate = DIV_ROUND_CLOSEST_ULL(req->rate * vid_pll_div_table[i].divider,
+					     vid_pll_div_table[i].multiplier);
+		if (parent_rate_saved == rate) {
+			req->best_parent_rate = parent_rate_saved;
+			best_i = i;
+			break;
+		}
+
+		parent_rate = clk_hw_round_rate(req->best_parent_hw, rate);
+		now = DIV_ROUND_CLOSEST_ULL(parent_rate *
+					    vid_pll_div_table[i].multiplier,
+					    vid_pll_div_table[i].divider);
+		if (abs(now - req->rate) < abs(best - req->rate)) {
+			best = now;
+			best_i = i;
+			req->best_parent_rate = parent_rate;
+		}
+	}
+
+	req->rate = DIV_ROUND_CLOSEST_ULL(req->best_parent_rate *
+					  vid_pll_div_table[best_i].multiplier,
+					  vid_pll_div_table[best_i].divider);
+
+	return 0;
+}
+
+static int meson_vid_pll_div_set_rate(struct clk_hw *hw, unsigned long rate,
+				      unsigned long parent_rate)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct meson_vid_pll_div_data *pll_div = meson_vid_pll_div_data(clk);
+	unsigned long best = 0, now = 0;
+	unsigned int i, best_i = 0;
+
+	for (i = 0 ; i < VID_PLL_DIV_TABLE_SIZE; ++i) {
+		now = DIV_ROUND_CLOSEST_ULL(parent_rate * vid_pll_div_table[i].multiplier,
+					    vid_pll_div_table[i].divider);
+		if (now == rate) {
+			best_i = i;
+			break;
+		} else if (abs(now - rate) < abs(best - rate)) {
+			best = now;
+			best_i = i;
+		}
+	}
+
+	meson_parm_write(clk->map, &pll_div->val, vid_pll_div_table[best_i].shift_val);
+	meson_parm_write(clk->map, &pll_div->sel, vid_pll_div_table[best_i].shift_sel);
+
+	return 0;
+}
+
+const struct clk_ops meson_vid_pll_div_ops = {
+	.recalc_rate	= meson_vid_pll_div_recalc_rate,
+	.determine_rate	= meson_vid_pll_div_determine_rate,
+	.set_rate	= meson_vid_pll_div_set_rate,
+};
+EXPORT_SYMBOL_GPL(meson_vid_pll_div_ops);
+
 const struct clk_ops meson_vid_pll_div_ro_ops = {
 	.recalc_rate	= meson_vid_pll_div_recalc_rate,
 };
diff --git a/drivers/clk/meson/vid-pll-div.h b/drivers/clk/meson/vid-pll-div.h
index c0128e33ccf9..bbccab340910 100644
--- a/drivers/clk/meson/vid-pll-div.h
+++ b/drivers/clk/meson/vid-pll-div.h
@@ -10,11 +10,14 @@
 #include <linux/clk-provider.h>
 #include "parm.h"
 
+#define VID_PLL_DIV_TABLE_SIZE		14
+
 struct meson_vid_pll_div_data {
 	struct parm val;
 	struct parm sel;
 };
 
 extern const struct clk_ops meson_vid_pll_div_ro_ops;
+extern const struct clk_ops meson_vid_pll_div_ops;
 
 #endif /* __MESON_VID_PLL_DIV_H */
-- 
2.33.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
