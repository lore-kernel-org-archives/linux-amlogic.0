Return-Path: <SRS0=Y5gA=R4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 281F8C43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 11:12:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8EC3207DD
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 11:12:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iLz0iv9u";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Ob4wr/p7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8EC3207DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rQ9w4DLEAIYlBtf9HBsktEwZ521NvF3vxtv+x/1dPec=; b=iLz0iv9ua0R1fa
	RPmDHTAa6mrStQU/TVMr/qL2FUlVQ16aWAZrQgCcGz0dcVLVH/4jRt8LYP0JGAxfzD/Tyo66pW7cG
	hrAQCZky5+EOnMzeMITbkgD0eS51iAEXG6zGpg8tD0kmZnXuWtFfoF0l0XDOx2gE0mz3uqtOfy4Ii
	RzIEEjBSvB37U0kEkI/RlIBkqIZC6t9Nlbg3udx2PpUcPppg4BPj3pB0LP/VbQZhPef5Qs/+S7XX2
	+4lo8cyhdjf0VxoGrkDR/vHuuY3WlqGdec1w31tyaMLCWDE6WQrteI7D4k5P5V5kO0SDjaqRxD6lj
	DNJkLSqhLf+Ly0WYOn4w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8NWn-00074H-42; Mon, 25 Mar 2019 11:12:29 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8NWg-0006wc-1z
 for linux-amlogic@lists.infradead.org; Mon, 25 Mar 2019 11:12:27 +0000
Received: by mail-wr1-x444.google.com with SMTP id g3so6120107wrx.9
 for <linux-amlogic@lists.infradead.org>; Mon, 25 Mar 2019 04:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ni9wuRQYti+VN96MUqmtZken5FIKCN6vt8HcbUKOpXk=;
 b=Ob4wr/p7CWJ0/0rb9BiX/8sfRVwR/RvMNb1rQR4KEx5nw/PtNynhStx9LaWhSq0GIP
 xR+C5qFlH4eONwWVhTSqBRlO5OzIDe11Xop0RGfFTLs/8fMOUKuIXIbK1ciFfnkhs0iN
 V6RXmZbqDSOg6MeWgSp6ICBq9mmNE5q8pgR2Zv72oiXpvVphSuXMbBQoZWlTMAQ3gfIm
 xi8bDZS2bD3NZuCZWfJiS95K96NVuddvWL3LoNaAmKDR9lbmL+y7hA2n1TTPBStgBuTw
 YuM/hqcL6Jc7VKb6YlJT4Qfmq6jh8gakcKYYua1swt8xgKWBqIJ9DC2cXnfb/HQyvDin
 XO7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ni9wuRQYti+VN96MUqmtZken5FIKCN6vt8HcbUKOpXk=;
 b=dBakwfd36ZqW2drztydd3VKMcCFcmwVkwBmu62SMxm/dhhXUNRi9o/NjaXxXpwtCxM
 YSxLHpLMHSq06oMDJM1Cu9ECAmEAr9Se4PK8H1sGT9nwFA03eJ+dhatpbvyYQWKE+CFD
 A5IPeGHxXQYmgNsq3bc/JdRSdXRX/SyAXHge5tkWsq58y8/LfBRngZvs6UduJcAIdG+a
 nr/Bojk5dDfqH5vfKcbTDL0B6tv+BA2zEPb0pvOB3RO9kM0wQvEtCYynbQmyE2CX896E
 N8vv/FaqDLbUsPOR2iOLlE942sXDRFBdy3uOQUMpWS83IYbf5z65EXNVdXIQcPjHf0q9
 cVgw==
X-Gm-Message-State: APjAAAV/YlLPGJUZhyJlH7pnee/r+QRD6Gs3hmgO13yn4X0HeYuxeANM
 WsAcK3ascWPIndgHWuXoETOE9g==
X-Google-Smtp-Source: APXvYqwcFxJqyNOkSqAjk6X+AhxICLKJQREHSLxv7WELpuv38fpDdjQoI7dcc0hb9DhLMJnBEaY8XQ==
X-Received: by 2002:a5d:68cf:: with SMTP id p15mr11536669wrw.301.1553512329569; 
 Mon, 25 Mar 2019 04:12:09 -0700 (PDT)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id
 n188sm15134301wme.13.2019.03.25.04.12.08
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 25 Mar 2019 04:12:08 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 1/4] clk: meson: mpll: add init callback and regs
Date: Mon, 25 Mar 2019 12:11:57 +0100
Message-Id: <20190325111200.15940-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190325111200.15940-1-jbrunet@baylibre.com>
References: <20190325111200.15940-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_041222_098089_DFC777DE 
X-CRM114-Status: GOOD (  15.42  )
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
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Until now (gx and axg), the mpll setting on boot (whatever the
bootloader) was good enough generate a clean fractional division.

It is not the case on the g12a. While moving away from the vendor u-boot,
it was noticed the fractional part of the divider was no longer applied.
Like on the pll, some magic settings need to applied on the mpll
register.

This change adds the ability to do that on the mpll driver.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/clk-mpll.c | 33 +++++++++++++++++++++++----------
 drivers/clk/meson/clk-mpll.h |  2 ++
 2 files changed, 25 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/meson/clk-mpll.c b/drivers/clk/meson/clk-mpll.c
index f76850d99e59..64d31c8ba3d0 100644
--- a/drivers/clk/meson/clk-mpll.c
+++ b/drivers/clk/meson/clk-mpll.c
@@ -115,21 +115,12 @@ static int mpll_set_rate(struct clk_hw *hw,
 	else
 		__acquire(mpll->lock);
 
-	/* Enable and set the fractional part */
+	/* Set the fractional part */
 	meson_parm_write(clk->map, &mpll->sdm, sdm);
-	meson_parm_write(clk->map, &mpll->sdm_en, 1);
-
-	/* Set additional fractional part enable if required */
-	if (MESON_PARM_APPLICABLE(&mpll->ssen))
-		meson_parm_write(clk->map, &mpll->ssen, 1);
 
 	/* Set the integer divider part */
 	meson_parm_write(clk->map, &mpll->n2, n2);
 
-	/* Set the magic misc bit if required */
-	if (MESON_PARM_APPLICABLE(&mpll->misc))
-		meson_parm_write(clk->map, &mpll->misc, 1);
-
 	if (mpll->lock)
 		spin_unlock_irqrestore(mpll->lock, flags);
 	else
@@ -138,6 +129,27 @@ static int mpll_set_rate(struct clk_hw *hw,
 	return 0;
 }
 
+static void mpll_init(struct clk_hw *hw)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct meson_clk_mpll_data *mpll = meson_clk_mpll_data(clk);
+
+	if (mpll->init_count)
+		regmap_multi_reg_write(clk->map, mpll->init_regs,
+				       mpll->init_count);
+
+	/* Enable the fractional part */
+	meson_parm_write(clk->map, &mpll->sdm_en, 1);
+
+	/* Set additional fractional part enable if required */
+	if (MESON_PARM_APPLICABLE(&mpll->ssen))
+		meson_parm_write(clk->map, &mpll->ssen, 1);
+
+	/* Set the magic misc bit if required */
+	if (MESON_PARM_APPLICABLE(&mpll->misc))
+		meson_parm_write(clk->map, &mpll->misc, 1);
+}
+
 const struct clk_ops meson_clk_mpll_ro_ops = {
 	.recalc_rate	= mpll_recalc_rate,
 	.round_rate	= mpll_round_rate,
@@ -148,6 +160,7 @@ const struct clk_ops meson_clk_mpll_ops = {
 	.recalc_rate	= mpll_recalc_rate,
 	.round_rate	= mpll_round_rate,
 	.set_rate	= mpll_set_rate,
+	.init		= mpll_init,
 };
 EXPORT_SYMBOL_GPL(meson_clk_mpll_ops);
 
diff --git a/drivers/clk/meson/clk-mpll.h b/drivers/clk/meson/clk-mpll.h
index cf79340006dd..2925fb939fdd 100644
--- a/drivers/clk/meson/clk-mpll.h
+++ b/drivers/clk/meson/clk-mpll.h
@@ -18,6 +18,8 @@ struct meson_clk_mpll_data {
 	struct parm n2;
 	struct parm ssen;
 	struct parm misc;
+	const struct reg_sequence *init_regs;
+	unsigned int init_count;
 	spinlock_t *lock;
 	u8 flags;
 };
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
