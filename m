Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F8ACF58DD
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Sep 2024 08:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lu6N4dQjg5nL5lkhu05J7JFlz733FLA6OoV1rGu6Oa8=; b=CyYK+5ASRy4UZg
	+NPXi1e//HVTR1Pr6hFfgtl9TjMJjgGK8C9XjpgwoeEDLhHp3yOEDcvgu8y990/0/cxiqnC6JdkBG
	ieqpJYDDDTDSW7h6zZEtj8ccZPx6Mrdlg3ha3hAQk5LbG8cwO7BThMvsGrIBEnI+E6IXU21cNCxkx
	+FnZMYRk7deXkyi5eUeNDEeHz7za5ANC82U+rfqgAwlas4DE0kPBKLpMmeQi61c14JDDEuf+w2mb7
	l/+hWWL3Gpv1rhDjq7hSo8dKo2fRNSxOxK26mA8uhUjOF7VTtysWvMlhfakz4R/Qq8eS8I4tebyF0
	yR5N8+ZT3Ns98OaeoL1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srYoO-0000000BiTh-3WqN;
	Fri, 20 Sep 2024 08:16:21 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srYoL-0000000BiQN-034f;
	Fri, 20 Sep 2024 08:16:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0EC06A441BA;
	Fri, 20 Sep 2024 08:16:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A4805C4CECD;
	Fri, 20 Sep 2024 08:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726820175;
	bh=zYrG4JOdof5Kb4KbKr9UqFtgnrrQGTE+AbTafTRVifY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=m7szP3+fwUyzikmJZ2LdFSgLmJZ3olD/2ioaIno0bkiPeKe+WUfWfFsiRGBfarO5g
	 2m+2sgPGZuU9E+0fVUdCdNyRSMJXXp/WWS5+yTyw+DOWvIXvEqn3PR9ZQyrR8aKBz2
	 z5jOE+rqhL86qsUaUr4cvBCo/HwULe1bnqpnGWA3VI0Ds2hv5vNAmpH/KlAiCH5TGu
	 PxZCpp+B+6OyJPynndxV41VuK7yXGt0P3zP9VRwnykSrYwQkRB3lL73OIeZYAnDTzv
	 KtQAVQT5Ah358eGuYn6t7mUPXI9ohR40L6Vk55BC1TdXeFN2hDECqYMSz9xLkQMy9d
	 lZNWTMvDRFesg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F6FCCF58DD;
	Fri, 20 Sep 2024 08:16:15 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Fri, 20 Sep 2024 16:16:11 +0800
Subject: [PATCH 1/6] clk: meson: mpll: Delete a meaningless spinlock from
 the MPLL
MIME-Version: 1.0
Message-Id: <20240920-mpll_spinlock-v1-1-5249a9a7e2b7@amlogic.com>
References: <20240920-mpll_spinlock-v1-0-5249a9a7e2b7@amlogic.com>
In-Reply-To: <20240920-mpll_spinlock-v1-0-5249a9a7e2b7@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726820173; l=1612;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=BZXhg4CTNZVT2pfn9n5YtAFzBvDkKei7u08ePhTMQ5Y=;
 b=c5RWy2so9ARwlG7HP5tJMif6Xs8tPQe83hHw4BrCVOzlgZUKN4PVqezSrnxDy0IjHki3OrbUv
 9rUeCaK7jI7CMadjwdGnhqnZsyzNB6BuZ9yonfem7thhHL6aJo+BlDv
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240920_011617_270101_7CCB0163 
X-CRM114-Status: UNSURE (   9.26  )
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
Reply-To: chuan.liu@amlogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Chuan Liu <chuan.liu@amlogic.com>

The existing locking mechanism of CCF can effectively avoid concurrent
register access. struct meson_clk_mpll_data has no meaning in defining
a spinlock repeatedly.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 drivers/clk/meson/clk-mpll.c | 11 -----------
 drivers/clk/meson/clk-mpll.h |  1 -
 2 files changed, 12 deletions(-)

diff --git a/drivers/clk/meson/clk-mpll.c b/drivers/clk/meson/clk-mpll.c
index f639d56f0fd3..aa9abd06ae65 100644
--- a/drivers/clk/meson/clk-mpll.c
+++ b/drivers/clk/meson/clk-mpll.c
@@ -112,26 +112,15 @@ static int mpll_set_rate(struct clk_hw *hw,
 	struct clk_regmap *clk = to_clk_regmap(hw);
 	struct meson_clk_mpll_data *mpll = meson_clk_mpll_data(clk);
 	unsigned int sdm, n2;
-	unsigned long flags = 0;
 
 	params_from_rate(rate, parent_rate, &sdm, &n2, mpll->flags);
 
-	if (mpll->lock)
-		spin_lock_irqsave(mpll->lock, flags);
-	else
-		__acquire(mpll->lock);
-
 	/* Set the fractional part */
 	meson_parm_write(clk->map, &mpll->sdm, sdm);
 
 	/* Set the integer divider part */
 	meson_parm_write(clk->map, &mpll->n2, n2);
 
-	if (mpll->lock)
-		spin_unlock_irqrestore(mpll->lock, flags);
-	else
-		__release(mpll->lock);
-
 	return 0;
 }
 
diff --git a/drivers/clk/meson/clk-mpll.h b/drivers/clk/meson/clk-mpll.h
index a991d568c43a..4ffd3aeef799 100644
--- a/drivers/clk/meson/clk-mpll.h
+++ b/drivers/clk/meson/clk-mpll.h
@@ -20,7 +20,6 @@ struct meson_clk_mpll_data {
 	struct parm misc;
 	const struct reg_sequence *init_regs;
 	unsigned int init_count;
-	spinlock_t *lock;
 	u8 flags;
 };
 

-- 
2.42.0



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
