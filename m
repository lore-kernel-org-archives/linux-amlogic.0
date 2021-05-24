Return-Path: <SRS0=MQG/=KT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 355EDC04FF3
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 May 2021 21:54:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D905561413
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 May 2021 21:54:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D905561413
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AhU/p7QGe+3ByS/1Sf7rty/7uaIKQUV4lp4um2CVQrc=; b=q2m4TTrI7qNAFX
	CvjkcRHZJRTfGQhHKRJdm4KfEgl7X+soMFjQz72T2Fdbr/Gk9X9jbtbnDwOxgz7h6V/3oZ6h4rR7v
	nfWeRQiwuD8rby1qv9QyzrmxBSpi2Nga7k2ZFz3s/2TDwhs1urP6tNiSxdrX19alEtNvwXwss0uR4
	pXWjEO2mflIYN83qq/gG8tS2ydL8NoslbSNnJPdFZzxLj2WjQQnAc5ZZ8BrFXfkWUp1ZFngdM545A
	eDJywWgMLDGP0RgVydhAbs1phUEXEZ471Mxs0QD7oKGmkli/Qq1c6PkT+Vv3YcDrdraOYTDZzbFHr
	7jldQJ9VH2PlZcI6SJOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1llIWa-0020mz-VA; Mon, 24 May 2021 21:54:13 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ll7y2-000puv-9t; Mon, 24 May 2021 10:37:51 +0000
Received: by mail-ed1-x529.google.com with SMTP id a25so31325656edr.12;
 Mon, 24 May 2021 03:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=br2LAkdVkinf4lfGstyxEISEcfDBPafEL/ugOBpOFVs=;
 b=jBG36Q7wVbObvnVdapVzc2TMCF8/w76fE0SYz7u7B6tf90Wm9+dknqvhzTcg438hqe
 pEfe3AYnEqFqkDKgH3+bFnLVJHRcJe3/CeFL+vq5rAx0jgY8W9iIFdqNbQgM+j+1U/zC
 i6MJTN2kuvIOLos3h70NLtEQXg3SkcIw/G+UrFp9gMcUhaLCiJaa91mmp4sSCP803kSz
 7nIu3z79jlPd6MUe5aTQoSMHHuDkgw2baFY/C6WuO2q8zDk5f/bn0cwSHdHH9+TXXD1Z
 E/if+uwcI+knAjSClWqUZiCXjS5+MlDMi3ke3z/MNBxIUkjAzX/l3wl1qAqGmhPFHERp
 5dug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=br2LAkdVkinf4lfGstyxEISEcfDBPafEL/ugOBpOFVs=;
 b=P/A2Gg1td9o9e7A7320B7hh+26wdFLFWM2qvtwqZMj8eqjEL+9ea/Mz7GoJiTcLxER
 zJxI6FypjOBbO6U7UQ0fHUKKr+6iMlcQWGW9yDFUM0aV3eeYXTKlwJQW7iln9CzcrfaX
 TEerZyydBPcv5+HhKWrkA22pzyJyG/zxrdk3y+UOLQ9eHHinZP4RzeJRSDgJlmyWf048
 NgLdXZnJCT+cyd0ANgfSXhB0BQSnAX6GJaxDBVWRDgHsqSvXAu2ckCebooC4v18kTMDb
 3dcIriYlmWKf68YqC8nNIkoehVKcg20ko4CeOcf98k4ewiyGonqz+mvB4R/dBqoThisB
 k2MA==
X-Gm-Message-State: AOAM530W4QbUBdpEkHx0nNZZrPdWUX8HmLq1hKIArmXpWQazeSKCKwdy
 nRrpdjVoFwdvpk4FxE1686g=
X-Google-Smtp-Source: ABdhPJwJC01A6NC8Z1rC637INdrccXaNZyehezoGsf+7Q+DiLbQiYHmT9xwZwNar4OnjaZlO3+UK+A==
X-Received: by 2002:aa7:d413:: with SMTP id z19mr25021347edq.37.1621852668811; 
 Mon, 24 May 2021 03:37:48 -0700 (PDT)
Received: from localhost.localdomain
 (p200300f1370a3a00f22f74fffe210725.dip0.t-ipconnect.de.
 [2003:f1:370a:3a00:f22f:74ff:fe21:725])
 by smtp.googlemail.com with ESMTPSA id r15sm2616418edm.61.2021.05.24.03.37.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 03:37:48 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: mturquette@baylibre.com, sboyd@kernel.org, narmstrong@baylibre.com,
 jbrunet@baylibre.com, linux-clk@vger.kernel.org
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 2/3] clk: divider: Switch from .round_rate to
 .determine_rate by default
Date: Mon, 24 May 2021 12:37:32 +0200
Message-Id: <20210524103733.554878-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210524103733.554878-1-martin.blumenstingl@googlemail.com>
References: <20210524103733.554878-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210524_033750_362389_08794E6E 
X-CRM114-Status: GOOD (  13.57  )
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

.determine_rate is meant to replace .round_rate. The former comes with a
benefit which is especially relevant on 32-bit systems: since
.determine_rate uses an "unsigned long" (compared to a "signed long"
which is used by .round_rate) the maximum value on 32-bit systems
increases from 2^31 (or approx. 2.14GHz) to 2^32 (or approx. 4.29GHz).
Switch to a .determine_rate implementation by default so 32-bit systems
can benefit from the increased maximum value as well as so we have one
fewer user of .round_rate.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/clk-divider.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
index 87ba4966b0e8..9e05e81116af 100644
--- a/drivers/clk/clk-divider.c
+++ b/drivers/clk/clk-divider.c
@@ -425,8 +425,8 @@ long divider_ro_round_rate_parent(struct clk_hw *hw, struct clk_hw *parent,
 }
 EXPORT_SYMBOL_GPL(divider_ro_round_rate_parent);
 
-static long clk_divider_round_rate(struct clk_hw *hw, unsigned long rate,
-				unsigned long *prate)
+static int clk_divider_determine_rate(struct clk_hw *hw,
+				      struct clk_rate_request *req)
 {
 	struct clk_divider *divider = to_clk_divider(hw);
 
@@ -437,13 +437,13 @@ static long clk_divider_round_rate(struct clk_hw *hw, unsigned long rate,
 		val = clk_div_readl(divider) >> divider->shift;
 		val &= clk_div_mask(divider->width);
 
-		return divider_ro_round_rate(hw, rate, prate, divider->table,
-					     divider->width, divider->flags,
-					     val);
+		return divider_ro_determine_rate(hw, req, divider->table,
+						 divider->width,
+						 divider->flags, val);
 	}
 
-	return divider_round_rate(hw, rate, prate, divider->table,
-				  divider->width, divider->flags);
+	return divider_determine_rate(hw, req, divider->table, divider->width,
+				      divider->flags);
 }
 
 int divider_get_val(unsigned long rate, unsigned long parent_rate,
@@ -500,14 +500,14 @@ static int clk_divider_set_rate(struct clk_hw *hw, unsigned long rate,
 
 const struct clk_ops clk_divider_ops = {
 	.recalc_rate = clk_divider_recalc_rate,
-	.round_rate = clk_divider_round_rate,
+	.determine_rate = clk_divider_determine_rate,
 	.set_rate = clk_divider_set_rate,
 };
 EXPORT_SYMBOL_GPL(clk_divider_ops);
 
 const struct clk_ops clk_divider_ro_ops = {
 	.recalc_rate = clk_divider_recalc_rate,
-	.round_rate = clk_divider_round_rate,
+	.determine_rate = clk_divider_determine_rate,
 };
 EXPORT_SYMBOL_GPL(clk_divider_ro_ops);
 
-- 
2.31.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
