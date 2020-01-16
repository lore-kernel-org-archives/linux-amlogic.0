Return-Path: <SRS0=aHVS=3F=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37016C33CB1
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Jan 2020 08:06:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A5612053B
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Jan 2020 08:06:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TdRqvq3r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A5612053B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i1zlZvTXbzwOitJaDSXLHdYwSmn3yiec2Gu95C4J8f0=; b=TdRqvq3rT2j/FU
	LwrUkqF32RsiHhJ3O7TgU9QpG82jDKBZnxWjFzB1EEaRhaB7p5BfGdx25kL6hFYWx7US5HD9dFVeM
	1jaA/S84lYtuuPfKYsCxFmsoi87ZeIAyu26lu+qKNSzLxLbu+jtfdfPOHTBmFaMKJP9JRxPlow+mE
	dWM+89yY6QktRVB6mvtt6Y3ROVzZGP0mHeRqWaadBWJnlLsWFfkX8uWwrQdkbNw/BNt0wH9n7MVji
	U5IKhy27CXl8dP7YlOLrPPHk2o5f2/Ye2/y8AjIynKhKgBc7F14asoaKrMh/JOsWDgfrNC0T+BuhC
	wm3by3nlkf1FY5qRGMTA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1is0AE-0004i3-R7; Thu, 16 Jan 2020 08:06:02 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1is09M-0002l4-7k; Thu, 16 Jan 2020 08:05:13 +0000
Received: from droid15-sz.amlogic.com (10.28.8.25) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server id 15.1.1591.10; Thu, 16 Jan 2020
 16:05:11 +0800
From: Jian Hu <jian.hu@amlogic.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>
Subject: [PATCH v6 2/5] clk: meson: add support for A1 PLL clock ops
Date: Thu, 16 Jan 2020 16:04:37 +0800
Message-ID: <20200116080440.118679-3-jian.hu@amlogic.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200116080440.118679-1-jian.hu@amlogic.com>
References: <20200116080440.118679-1-jian.hu@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.28.8.25]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200116_000508_310239_8D3F260D 
X-CRM114-Status: GOOD (  11.63  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Rob Herring <robh@kernel.org>, Victor Wan <victor.wan@amlogic.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>, devicetree@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Jian Hu <jian.hu@amlogic.com>,
 linux-arm-kernel@lists.infradead.org, Qiufang Dai <qiufang.dai@amlogic.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 Chandle Zou <chandle.zou@amlogic.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Compared with the previous SoCs, self-adaption current module
is newly added for A1, and there is no reset parm except the
fixed pll. In A1 PLL, the PLL enable sequence is different, using
the new power-on sequence to enable the PLL.

Signed-off-by: Jian Hu <jian.hu@amlogic.com>
---
 drivers/clk/meson/clk-pll.c | 47 +++++++++++++++++++++++++++++++------
 drivers/clk/meson/clk-pll.h |  2 ++
 2 files changed, 42 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
index ddb1e5634739..10926291440f 100644
--- a/drivers/clk/meson/clk-pll.c
+++ b/drivers/clk/meson/clk-pll.c
@@ -283,10 +283,14 @@ static void meson_clk_pll_init(struct clk_hw *hw)
 	struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
 
 	if (pll->init_count) {
-		meson_parm_write(clk->map, &pll->rst, 1);
+		if (MESON_PARM_APPLICABLE(&pll->rst))
+			meson_parm_write(clk->map, &pll->rst, 1);
+
 		regmap_multi_reg_write(clk->map, pll->init_regs,
 				       pll->init_count);
-		meson_parm_write(clk->map, &pll->rst, 0);
+
+		if (MESON_PARM_APPLICABLE(&pll->rst))
+			meson_parm_write(clk->map, &pll->rst, 0);
 	}
 }
 
@@ -295,8 +299,11 @@ static int meson_clk_pll_is_enabled(struct clk_hw *hw)
 	struct clk_regmap *clk = to_clk_regmap(hw);
 	struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
 
-	if (meson_parm_read(clk->map, &pll->rst) ||
-	    !meson_parm_read(clk->map, &pll->en) ||
+	if (MESON_PARM_APPLICABLE(&pll->rst) &&
+	    meson_parm_read(clk->map, &pll->rst))
+		return 0;
+
+	if (!meson_parm_read(clk->map, &pll->en) ||
 	    !meson_parm_read(clk->map, &pll->l))
 		return 0;
 
@@ -323,13 +330,34 @@ static int meson_clk_pll_enable(struct clk_hw *hw)
 		return 0;
 
 	/* Make sure the pll is in reset */
-	meson_parm_write(clk->map, &pll->rst, 1);
+	if (MESON_PARM_APPLICABLE(&pll->rst))
+		meson_parm_write(clk->map, &pll->rst, 1);
 
 	/* Enable the pll */
 	meson_parm_write(clk->map, &pll->en, 1);
 
 	/* Take the pll out reset */
-	meson_parm_write(clk->map, &pll->rst, 0);
+	if (MESON_PARM_APPLICABLE(&pll->rst))
+		meson_parm_write(clk->map, &pll->rst, 0);
+
+	/*
+	 * Compared with the previous SoCs, self-adaption current module
+	 * is newly added for A1, keep the new power-on sequence to enable the
+	 * PLL. The sequence is:
+	 * 1. enable the pll, delay for 10us
+	 * 2. enable the pll self-adaption current module, delay for 40us
+	 * 3. enable the lock detect module
+	 */
+	if (MESON_PARM_APPLICABLE(&pll->current_en)) {
+		udelay(10);
+		meson_parm_write(clk->map, &pll->current_en, 1);
+		udelay(40);
+	};
+
+	if (MESON_PARM_APPLICABLE(&pll->l_detect)) {
+		meson_parm_write(clk->map, &pll->l_detect, 1);
+		meson_parm_write(clk->map, &pll->l_detect, 0);
+	}
 
 	if (meson_clk_pll_wait_lock(hw))
 		return -EIO;
@@ -343,10 +371,15 @@ static void meson_clk_pll_disable(struct clk_hw *hw)
 	struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
 
 	/* Put the pll is in reset */
-	meson_parm_write(clk->map, &pll->rst, 1);
+	if (MESON_PARM_APPLICABLE(&pll->rst))
+		meson_parm_write(clk->map, &pll->rst, 1);
 
 	/* Disable the pll */
 	meson_parm_write(clk->map, &pll->en, 0);
+
+	/* Disable PLL internal self-adaption current module */
+	if (MESON_PARM_APPLICABLE(&pll->current_en))
+		meson_parm_write(clk->map, &pll->current_en, 0);
 }
 
 static int meson_clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
diff --git a/drivers/clk/meson/clk-pll.h b/drivers/clk/meson/clk-pll.h
index 367efd0f6410..a2228c0fdce5 100644
--- a/drivers/clk/meson/clk-pll.h
+++ b/drivers/clk/meson/clk-pll.h
@@ -36,6 +36,8 @@ struct meson_clk_pll_data {
 	struct parm frac;
 	struct parm l;
 	struct parm rst;
+	struct parm current_en;
+	struct parm l_detect;
 	const struct reg_sequence *init_regs;
 	unsigned int init_count;
 	const struct pll_params_table *table;
-- 
2.24.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
