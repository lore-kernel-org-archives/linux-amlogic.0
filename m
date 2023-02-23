Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9F99C636D7
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Feb 2023 06:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GT+Z4+zL/2CRcw6Ky0hoyPxf3lOvltqU52eFF/Os8/g=; b=DPUQl8h03oMctD
	AjTu1jkMfD1L2b4PXNvWy+wxJLrw5PXvqHUKrEq01U1u8l3thgDA61oK2xcoeY6Ps/S40uGBKqPPV
	cxAMQFVWbdJLowL3ri1b6q/GYU4n6J+n/0PcxGQHkRcUpZ4JCpfDTbozVho25fLAloU3hXhGnowPU
	UyQ138KXe5KcZPqakIA1NjpyEIkSGd3YHe/SKwZ0BcOnHk8jYJpxvvcChVGAUXUCmn3b549OtJ0tI
	ZLWH4PW/Rve9KhRcMgLtM9rraEm4Z4KSzRLVvlAebrHisY/sBCV64WPIbWIQlhWmO2LGGi+cHQppO
	JkBO34T73D+KY39di3Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV58L-00FIEm-Ty; Thu, 23 Feb 2023 06:31:13 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV58B-00FICX-Ok; Thu, 23 Feb 2023 06:31:05 +0000
Received: from droid06.amlogic.com (10.18.11.248) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Thu, 23 Feb 2023
 14:30:55 +0800
From: Yu Tu <yu.tu@amlogic.com>
To: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>
CC: <kelvin.zhang@amlogic.com>, <qi.duan@amlogic.com>, Yu Tu
	<yu.tu@amlogic.com>
Subject: [PATCH] clk: meson: vid-pll-div: added meson_vid_pll_div_ops support to enable vid_pll_div to meet clock setting requirements, especially for late chip
Date: Thu, 23 Feb 2023 14:27:23 +0800
Message-ID: <20230223062723.4770-1-yu.tu@amlogic.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-Originating-IP: [10.18.11.248]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_223103_843451_2FAA42A9 
X-CRM114-Status: GOOD (  13.65  )
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

The previous chip only provides "ro_ops" for the vid_pll_div clock,
which is not satisfied with the operation requirements of the later
chip for this clock, so the ops that can be set for the clock is added.

Signed-off-by: Yu Tu <yu.tu@amlogic.com>
---
 drivers/clk/meson/vid-pll-div.c | 59 +++++++++++++++++++++++++++++++++
 drivers/clk/meson/vid-pll-div.h |  1 +
 2 files changed, 60 insertions(+)

diff --git a/drivers/clk/meson/vid-pll-div.c b/drivers/clk/meson/vid-pll-div.c
index daff235bc763..e75fa6f75efe 100644
--- a/drivers/clk/meson/vid-pll-div.c
+++ b/drivers/clk/meson/vid-pll-div.c
@@ -89,6 +89,65 @@ static unsigned long meson_vid_pll_div_recalc_rate(struct clk_hw *hw,
 	return DIV_ROUND_UP_ULL(parent_rate * div->multiplier, div->divider);
 }
 
+static int meson_vid_pll_div_determine_rate(struct clk_hw *hw,
+					    struct clk_rate_request *req)
+{
+	unsigned long best = 0, now = 0;
+	unsigned int i, best_i = 0;
+
+	for (i = 0 ; i < ARRAY_SIZE(vid_pll_div_table) ; ++i) {
+		now = DIV_ROUND_CLOSEST_ULL(req->best_parent_rate *
+					    vid_pll_div_table[i].multiplier,
+					    vid_pll_div_table[i].divider);
+		if (req->rate == now) {
+			return 0;
+		} else if (abs(now - req->rate) < abs(best - req->rate)) {
+			best = now;
+			best_i = i;
+		}
+	}
+
+	if (best_i < ARRAY_SIZE(vid_pll_div_table))
+		req->rate = DIV_ROUND_CLOSEST_ULL(req->best_parent_rate *
+						  vid_pll_div_table[best_i].multiplier,
+						  vid_pll_div_table[best_i].divider);
+	else
+		req->rate = meson_vid_pll_div_recalc_rate(hw, req->best_parent_rate);
+
+	return 0;
+}
+
+static int meson_vid_pll_div_set_rate(struct clk_hw *hw, unsigned long rate,
+				      unsigned long parent_rate)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct meson_vid_pll_div_data *pll_div = meson_vid_pll_div_data(clk);
+	int i;
+
+	for (i = 0 ; i < ARRAY_SIZE(vid_pll_div_table) ; ++i) {
+		if (DIV_ROUND_CLOSEST_ULL(parent_rate * vid_pll_div_table[i].multiplier,
+					  vid_pll_div_table[i].divider) == rate) {
+			meson_parm_write(clk->map, &pll_div->val, vid_pll_div_table[i].shift_val);
+			meson_parm_write(clk->map, &pll_div->sel, vid_pll_div_table[i].shift_sel);
+			break;
+		}
+	}
+
+	if (i >= ARRAY_SIZE(vid_pll_div_table)) {
+		pr_debug("%s: Invalid rate value for vid_pll_div\n", __func__);
+		return -EINVAL;
+	}
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
index c0128e33ccf9..3ab729b85fde 100644
--- a/drivers/clk/meson/vid-pll-div.h
+++ b/drivers/clk/meson/vid-pll-div.h
@@ -16,5 +16,6 @@ struct meson_vid_pll_div_data {
 };
 
 extern const struct clk_ops meson_vid_pll_div_ro_ops;
+extern const struct clk_ops meson_vid_pll_div_ops;
 
 #endif /* __MESON_VID_PLL_DIV_H */

base-commit: 8a9fbf00acfeeeaac8efab8091bb464bd71b70ea
-- 
2.33.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
