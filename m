Return-Path: <SRS0=EwLr=QI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C97FCC282D8
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 Feb 2019 14:54:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98AE421872
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 Feb 2019 14:54:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Iongpmdn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="IrpAmkbd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98AE421872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oK5rcsCKK/OF/zgFjwA6Lf61O1jVXjeETfL67sci0oU=; b=IongpmdnMQAcpZ
	EaLhQ7agfCbflNPg7RzAsU83fUjyD6aULcD/JFKCb2aA3oW7AjDnhmVtoCpkH3oe4dDEcWqAAVwcK
	Am5sVbDm0FV9EwCAgk12LXn3APu9QcddumB5Bg5/x+ZzMeI3vQWHdcc4d4XbjNcm/3l+G/xdys1m9
	d+uzR8y4FoNA2YE7XdsFKIZOyUZs05vRkKEwpCvJLLCpPKHaqGALskWHddi7VBfyzWE7IoqddT2hn
	/nH0GgWJ18xl6ClJKKHFm/WrRXMhqX8HApVWgeTOfg3NRw/T7VnnIKdtsJCg9iAzbKtZO8T4s4fLB
	wnAFc8yB2TlgbKpfUcbg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gpaD5-0003we-5T; Fri, 01 Feb 2019 14:54:27 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gpaCZ-0003Qy-7V
 for linux-amlogic@lists.infradead.org; Fri, 01 Feb 2019 14:53:57 +0000
Received: by mail-wr1-x442.google.com with SMTP id a16so1802059wrv.0
 for <linux-amlogic@lists.infradead.org>; Fri, 01 Feb 2019 06:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LqAPPSkjpSJhEFdQOgK6T8VKoQsUzH7Y2wdaiKe2ixw=;
 b=IrpAmkbdL8NZ58a7Tgp+PeKEKuJYitxz8KsnE1OzaoVQvCEcgMVzq+gpdNkaQqXUFU
 utYr/N62X0X7TB81aWh7j9IUOc92aL04D3o+M2P9Z5km+thd/bW5pWpUiDKA9xnvEvZV
 OoEcJ1/DK390MYr+Y8deqzZiJNSNxOFiJeLoKONHd3MJvVvcOaT6CjegKZduBcfpvRnp
 68YQTfo7lBGFDO3m9dnS8MqEvgw1tZFuFyuvYcpRVoUTUgEHxxpXJx41p2fHC/2LoL+t
 vJa023jPppBFT+NceY54wouo3QqcJkujO+tY1h4KKNsyScUXRUVZpSLR+BBBoTbJA4wb
 hNPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LqAPPSkjpSJhEFdQOgK6T8VKoQsUzH7Y2wdaiKe2ixw=;
 b=YorKpfjkRb4X2DQTrBOSeZCoA7c5odSdxXMAUQKlnY2etBYoCW+V6gop6qRp0nAbpQ
 8E7SZm8CwfaNw3YO6tsIk/z4TzvbE7qQvH68nGoFUR+lJu1hVX9Q15uKLKaEntA03xVy
 jyL23uHcnkKGF1r0wACdn4F9lxskNjCcm/IvzWtGo8iamQlFzSvWR05prnUCoaTcX6eb
 5dsrNaDBhAYHvt9GzIxVh/NOqQdVcljeauRnpJO3YRQ6rn6DozQamhKvAoFL/L9JZSBO
 NlDA6kLktMBSydjwMa65dUsn2JvuJmF9MAkQxb+EgEHcBjOCX7UVIYoaGR21qwrk7jrI
 GeRg==
X-Gm-Message-State: AJcUukdtAj+9EEyTjiY+VhVYELS/OdCjeMLAjrxsU4efMa8Wb4xsFR/1
 GwO4eant1nx0+Pl8oNjpj8aRnw==
X-Google-Smtp-Source: ALg8bN7ZKsX4+eFRIyZedX79JpPhzMtgOwDe5l7oPr6h5a7/T1En3wYxotcPtTeqhdGqr+YN1sBnhQ==
X-Received: by 2002:adf:8068:: with SMTP id 95mr39813273wrk.181.1549032833723; 
 Fri, 01 Feb 2019 06:53:53 -0800 (PST)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id x186sm4754644wmg.41.2019.02.01.06.53.51
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 01 Feb 2019 06:53:52 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH v6 1/4] clk: meson: pll: update driver for the g12a
Date: Fri,  1 Feb 2019 15:53:42 +0100
Message-Id: <20190201145345.6795-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190201145345.6795-1-jbrunet@baylibre.com>
References: <20190201145345.6795-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190201_065355_413267_DFA1AE7A 
X-CRM114-Status: GOOD (  21.58  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Jian Hu <jian.hu@amlogic.com>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The g12a use fractional parameter of 17 useful bits. At the moment, this
parameter in encoded using u16 value. Use this opportunity to switch all
the pll to parameter to unsigned int. This should save us some annoying
trouble shooting when and m and n field eventually grow as well.

This patch also introduce pll multiplier range. On the g12a, the hifi and
gp0 plls are able to lock as long as the following condition is met:
55 <= m/n <= 255.

The param table describing this would be huge which is a waste of memory.
Using ranges, we can save memory. Ranges also help find the best pll
parameter significantly faster since we don't have to try all the possible
settings.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---

Side note:
You may notice that the g12a documentation says that the fractional
parameter of the hifi and gp0 pll is actually 19 bits long.

On older plls, frac was a ratio in the [0, 1[ range.
On the newer plls, the range is ]-2, 2[.

The last 2 bits give the sign and allows to go over 1. Supporting this
would complicate things a lot while not bringing anything useful.
Instead of using this extended frac range, we can simply adjust m and
reach the same solution.

Discarding the last two bits allows to treat older and newer pll models
indifferently.

 drivers/clk/meson/clk-pll.c | 203 ++++++++++++++++++++++++++----------
 drivers/clk/meson/clk-pll.h |  10 +-
 2 files changed, 154 insertions(+), 59 deletions(-)

diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
index 4a8c68ae8801..7946d21a4ff4 100644
--- a/drivers/clk/meson/clk-pll.c
+++ b/drivers/clk/meson/clk-pll.c
@@ -32,6 +32,7 @@
 #include <linux/io.h>
 #include <linux/math64.h>
 #include <linux/module.h>
+#include <linux/rational.h>
 
 #include "clk-regmap.h"
 #include "clk-pll.h"
@@ -42,12 +43,21 @@ meson_clk_pll_data(struct clk_regmap *clk)
 	return (struct meson_clk_pll_data *)clk->data;
 }
 
+static int __pll_round_closest_mult(struct meson_clk_pll_data *pll)
+{
+	if ((pll->flags & CLK_MESON_PLL_ROUND_CLOSEST) &&
+	    !MESON_PARM_APPLICABLE(&pll->frac))
+		return 1;
+
+	return 0;
+}
+
 static unsigned long __pll_params_to_rate(unsigned long parent_rate,
-					  const struct pll_params_table *pllt,
-					  u16 frac,
+					  unsigned int m, unsigned int n,
+					  unsigned int frac,
 					  struct meson_clk_pll_data *pll)
 {
-	u64 rate = (u64)parent_rate * pllt->m;
+	u64 rate = (u64)parent_rate * m;
 
 	if (frac && MESON_PARM_APPLICABLE(&pll->frac)) {
 		u64 frac_rate = (u64)parent_rate * frac;
@@ -56,7 +66,7 @@ static unsigned long __pll_params_to_rate(unsigned long parent_rate,
 					 (1 << pll->frac.width));
 	}
 
-	return DIV_ROUND_UP_ULL(rate, pllt->n);
+	return DIV_ROUND_UP_ULL(rate, n);
 }
 
 static unsigned long meson_clk_pll_recalc_rate(struct clk_hw *hw,
@@ -64,35 +74,39 @@ static unsigned long meson_clk_pll_recalc_rate(struct clk_hw *hw,
 {
 	struct clk_regmap *clk = to_clk_regmap(hw);
 	struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
-	struct pll_params_table pllt;
-	u16 frac;
+	unsigned int m, n, frac;
 
-	pllt.n = meson_parm_read(clk->map, &pll->n);
-	pllt.m = meson_parm_read(clk->map, &pll->m);
+	n = meson_parm_read(clk->map, &pll->n);
+	m = meson_parm_read(clk->map, &pll->m);
 
 	frac = MESON_PARM_APPLICABLE(&pll->frac) ?
 		meson_parm_read(clk->map, &pll->frac) :
 		0;
 
-	return __pll_params_to_rate(parent_rate, &pllt, frac, pll);
+	return __pll_params_to_rate(parent_rate, m, n, frac, pll);
 }
 
-static u16 __pll_params_with_frac(unsigned long rate,
-				  unsigned long parent_rate,
-				  const struct pll_params_table *pllt,
-				  struct meson_clk_pll_data *pll)
+static unsigned int __pll_params_with_frac(unsigned long rate,
+					   unsigned long parent_rate,
+					   unsigned int m,
+					   unsigned int n,
+					   struct meson_clk_pll_data *pll)
 {
-	u16 frac_max = (1 << pll->frac.width);
-	u64 val = (u64)rate * pllt->n;
+	unsigned int frac_max = (1 << pll->frac.width);
+	u64 val = (u64)rate * n;
+
+	/* Bail out if we are already over the requested rate */
+	if (rate < parent_rate * m / n)
+		return 0;
 
 	if (pll->flags & CLK_MESON_PLL_ROUND_CLOSEST)
 		val = DIV_ROUND_CLOSEST_ULL(val * frac_max, parent_rate);
 	else
 		val = div_u64(val * frac_max, parent_rate);
 
-	val -= pllt->m * frac_max;
+	val -= m * frac_max;
 
-	return min((u16)val, (u16)(frac_max - 1));
+	return min((unsigned int)val, (frac_max - 1));
 }
 
 static bool meson_clk_pll_is_better(unsigned long rate,
@@ -100,45 +114,123 @@ static bool meson_clk_pll_is_better(unsigned long rate,
 				    unsigned long now,
 				    struct meson_clk_pll_data *pll)
 {
-	if (!(pll->flags & CLK_MESON_PLL_ROUND_CLOSEST) ||
-	    MESON_PARM_APPLICABLE(&pll->frac)) {
-		/* Round down */
-		if (now < rate && best < now)
-			return true;
-	} else {
+	if (__pll_round_closest_mult(pll)) {
 		/* Round Closest */
 		if (abs(now - rate) < abs(best - rate))
 			return true;
+	} else {
+		/* Round down */
+		if (now < rate && best < now)
+			return true;
 	}
 
 	return false;
 }
 
-static const struct pll_params_table *
-meson_clk_get_pll_settings(unsigned long rate,
-			   unsigned long parent_rate,
-			   struct meson_clk_pll_data *pll)
+static int meson_clk_get_pll_table_index(unsigned int index,
+					 unsigned int *m,
+					 unsigned int *n,
+					 struct meson_clk_pll_data *pll)
 {
-	const struct pll_params_table *table = pll->table;
-	unsigned long best = 0, now = 0;
-	unsigned int i, best_i = 0;
+	if (!pll->table[index].n)
+		return -EINVAL;
+
+	*m = pll->table[index].m;
+	*n = pll->table[index].n;
+
+	return 0;
+}
+
+static unsigned int meson_clk_get_pll_range_m(unsigned long rate,
+					      unsigned long parent_rate,
+					      unsigned int n,
+					      struct meson_clk_pll_data *pll)
+{
+	u64 val = (u64)rate * n;
+
+	if (__pll_round_closest_mult(pll))
+		return DIV_ROUND_CLOSEST_ULL(val, parent_rate);
 
-	if (!table)
-		return NULL;
+	return val / parent_rate;
+}
+
+static int meson_clk_get_pll_range_index(unsigned long rate,
+					 unsigned long parent_rate,
+					 unsigned int index,
+					 unsigned int *m,
+					 unsigned int *n,
+					 struct meson_clk_pll_data *pll)
+{
+	*n = index + 1;
+
+	/* Check the predivider range */
+	if (*n >= (1 << pll->n.width))
+		return -EINVAL;
+
+	if (*n == 1) {
+		/* Get the boundaries out the way */
+		if (rate <= pll->range->min * parent_rate) {
+			*m = pll->range->min;
+			return -ENODATA;
+		} else if (rate >= pll->range->max * parent_rate) {
+			*m = pll->range->max;
+			return -ENODATA;
+		}
+	}
+
+	*m = meson_clk_get_pll_range_m(rate, parent_rate, *n, pll);
+
+	/* the pre-divider gives a multiplier too big - stop */
+	if (*m >= (1 << pll->m.width))
+		return -EINVAL;
+
+	return 0;
+}
+
+static int meson_clk_get_pll_get_index(unsigned long rate,
+				       unsigned long parent_rate,
+				       unsigned int index,
+				       unsigned int *m,
+				       unsigned int *n,
+				       struct meson_clk_pll_data *pll)
+{
+	if (pll->range)
+		return meson_clk_get_pll_range_index(rate, parent_rate,
+						     index, m, n, pll);
+	else if (pll->table)
+		return meson_clk_get_pll_table_index(index, m, n, pll);
+
+	return -EINVAL;
+}
 
-	for (i = 0; table[i].n; i++) {
-		now = __pll_params_to_rate(parent_rate, &table[i], 0, pll);
+static int meson_clk_get_pll_settings(unsigned long rate,
+				      unsigned long parent_rate,
+				      unsigned int *best_m,
+				      unsigned int *best_n,
+				      struct meson_clk_pll_data *pll)
+{
+	unsigned long best = 0, now = 0;
+	unsigned int i, m, n;
+	int ret;
+
+	for (i = 0, ret = 0; !ret; i++) {
+		ret = meson_clk_get_pll_get_index(rate, parent_rate,
+						  i, &m, &n, pll);
+		if (ret == -EINVAL)
+			break;
 
-		/* If we get an exact match, don't bother any further */
-		if (now == rate) {
-			return &table[i];
-		} else if (meson_clk_pll_is_better(rate, best, now, pll)) {
+		now = __pll_params_to_rate(parent_rate, m, n, 0, pll);
+		if (meson_clk_pll_is_better(rate, best, now, pll)) {
 			best = now;
-			best_i = i;
+			*best_m = m;
+			*best_n = n;
+
+			if (now == rate)
+				break;
 		}
 	}
 
-	return (struct pll_params_table *)&table[best_i];
+	return best ? 0 : -EINVAL;
 }
 
 static long meson_clk_pll_round_rate(struct clk_hw *hw, unsigned long rate,
@@ -146,15 +238,15 @@ static long meson_clk_pll_round_rate(struct clk_hw *hw, unsigned long rate,
 {
 	struct clk_regmap *clk = to_clk_regmap(hw);
 	struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
-	const struct pll_params_table *pllt =
-		meson_clk_get_pll_settings(rate, *parent_rate, pll);
+	unsigned int m, n, frac;
 	unsigned long round;
-	u16 frac;
+	int ret;
 
-	if (!pllt)
+	ret = meson_clk_get_pll_settings(rate, *parent_rate, &m, &n, pll);
+	if (ret)
 		return meson_clk_pll_recalc_rate(hw, *parent_rate);
 
-	round = __pll_params_to_rate(*parent_rate, pllt, 0, pll);
+	round = __pll_params_to_rate(*parent_rate, m, n, 0, pll);
 
 	if (!MESON_PARM_APPLICABLE(&pll->frac) || rate == round)
 		return round;
@@ -163,9 +255,9 @@ static long meson_clk_pll_round_rate(struct clk_hw *hw, unsigned long rate,
 	 * The rate provided by the setting is not an exact match, let's
 	 * try to improve the result using the fractional parameter
 	 */
-	frac = __pll_params_with_frac(rate, *parent_rate, pllt, pll);
+	frac = __pll_params_with_frac(rate, *parent_rate, m, n, pll);
 
-	return __pll_params_to_rate(*parent_rate, pllt, frac, pll);
+	return __pll_params_to_rate(*parent_rate, m, n, frac, pll);
 }
 
 static int meson_clk_pll_wait_lock(struct clk_hw *hw)
@@ -252,30 +344,27 @@ static int meson_clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 {
 	struct clk_regmap *clk = to_clk_regmap(hw);
 	struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
-	const struct pll_params_table *pllt;
-	unsigned int enabled;
+	unsigned int enabled, m, n, frac = 0, ret;
 	unsigned long old_rate;
-	u16 frac = 0;
 
 	if (parent_rate == 0 || rate == 0)
 		return -EINVAL;
 
 	old_rate = rate;
 
-	pllt = meson_clk_get_pll_settings(rate, parent_rate, pll);
-	if (!pllt)
-		return -EINVAL;
+	ret = meson_clk_get_pll_settings(rate, parent_rate, &m, &n, pll);
+	if (ret)
+		return ret;
 
 	enabled = meson_parm_read(clk->map, &pll->en);
 	if (enabled)
 		meson_clk_pll_disable(hw);
 
-	meson_parm_write(clk->map, &pll->n, pllt->n);
-	meson_parm_write(clk->map, &pll->m, pllt->m);
-
+	meson_parm_write(clk->map, &pll->n, n);
+	meson_parm_write(clk->map, &pll->m, m);
 
 	if (MESON_PARM_APPLICABLE(&pll->frac)) {
-		frac = __pll_params_with_frac(rate, parent_rate, pllt, pll);
+		frac = __pll_params_with_frac(rate, parent_rate, m, n, pll);
 		meson_parm_write(clk->map, &pll->frac, frac);
 	}
 
diff --git a/drivers/clk/meson/clk-pll.h b/drivers/clk/meson/clk-pll.h
index 5ccf0854d932..55af2e285b1b 100644
--- a/drivers/clk/meson/clk-pll.h
+++ b/drivers/clk/meson/clk-pll.h
@@ -12,8 +12,13 @@
 #include "parm.h"
 
 struct pll_params_table {
-	u16		m;
-	u16		n;
+	unsigned int	m;
+	unsigned int	n;
+};
+
+struct pll_mult_range {
+	unsigned int	min;
+	unsigned int	max;
 };
 
 #define PLL_PARAMS(_m, _n)						\
@@ -34,6 +39,7 @@ struct meson_clk_pll_data {
 	const struct reg_sequence *init_regs;
 	unsigned int init_count;
 	const struct pll_params_table *table;
+	const struct pll_mult_range *range;
 	u8 flags;
 };
 
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
