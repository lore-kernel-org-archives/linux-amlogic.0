Return-Path: <SRS0=PyQ3=KM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9296C433ED
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 May 2021 20:38:54 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EAF7610CB
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 May 2021 20:38:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2EAF7610CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2ZVV3+xttQ40FLDXNZg0er4w3Z08umgRPr9+kvd6Dv4=; b=ZkOfBE0v9AHV5kXQMGulVGH4k
	2K+f/B7BDHMvEJYPGdpOoN+rdBNV+o2GYEE54l7jJ5NY4Bq8Zo1Wur2aixyhsp973uyPJ/AFcj8ja
	f808e0v/t1zt3XlvHiiMt5qGIOkW9NWEcZYDXRfIx3DHG/T8ZIlxAHUtsrJKAu0zoqGvmvufr1QbW
	k0wpNfc/2iynnyLPQ6Rw6WpBUHmTW1ytuilGddXrvo6kYuYwh9RWyg8VtFpmUJKhA2Q6wolTY9Zao
	WcZa9cw1blZK/RtwJEdHmT3A5367M3t0yqu0oeraF/Ehk2//QtldyD9w2YZhRniqDagc4qdQaDxeZ
	RChHHQkIA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lik0j-00G6T4-9H; Mon, 17 May 2021 20:38:45 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lijzf-00G69Q-Qq; Mon, 17 May 2021 20:37:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=WyvXp9JIBkDb38VgDaE0Gu4BsKjCEQ64wDu6xyl4Vh0=; b=wWUp8EBqehXl0fOArlTtZjignw
 5om3h2NNc+KYF/SquLAoJ+oZ+e4bt4xXwFL8UbFBfiJoSeUBbpF9QGu/vKodtaiZVioCh/tAuR+MY
 HS+WDeF2ckHEE65Dr4dMA9va4ThrVXpeT8mz/slpdEWbHFUPAZ79zQ2Bp9jJ2kVjEzXtfrLMm+LcJ
 MhZrqEthyAw+yB4Z2XlffHWNGgWT/um3pqLqb+sktAAZ4gyUsA7VF3OgWm60QFcS7dj358UyQ12e6
 97QFq4v7t3IGQUENwB7uRtEZtTAOo9iuF/rOabebDcGbQtSpJrRgVAR/nK6ELtMlUjLweQgptQh7f
 7nN3V4JA==;
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lijzc-00E8bR-QQ; Mon, 17 May 2021 20:37:38 +0000
Received: by mail-wm1-x331.google.com with SMTP id
 b19-20020a05600c06d3b029014258a636e8so299342wmn.2; 
 Mon, 17 May 2021 13:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WyvXp9JIBkDb38VgDaE0Gu4BsKjCEQ64wDu6xyl4Vh0=;
 b=DX84cj7xin3BlWyZgOKjH3yfQPEykMnICRJ+G0I6oNuOUNGPdz8KeChDbJlir7EMRP
 Uxdop8zZVE7Fill0n8PhWvG9CdYqUebfpq6jWxBAFxioA7pNcZcPEgNPfPfVPAbB6WdK
 xlx63HsBayRF/4MHi5nuUu+km9R1o4Isn7CKU3UfyXyT2w1pSeJ2gqo1zw7XKRy4ihOx
 e9HESr/2vFcM93lmUroLtAWN1AGEjVEkMQOIYaN3/cPtR2YLl4dLpmIcsreBhCz4Wyfd
 DxbXYK8UkYkXV8QfeaMLY/4qo+LyEeSsfMQjT0GCvPdT0+Ct0riMxTI/Y0O6z0z742Gj
 WU4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WyvXp9JIBkDb38VgDaE0Gu4BsKjCEQ64wDu6xyl4Vh0=;
 b=hz4YE37r5YU4UxbMmPjeudh68SzpNoz+txj3OatYVyPTe1LfkruNR22iGxpJJCOA9s
 ZYcds7Azjvj8tdqGf0j4fLWsxH2nTKKzOL2xXsGO7d/+8KRFK//1dD482R8fBfU5bzDV
 74p4QDD35OmptBwKmKCPjFlW7GvGONnB7YcyS5x7jEhUcZmJx9NWW9YQ+8Svx95s73JK
 ExBjEAX5z6u+dmfC2QAJZKtnx6Sy+UiruuGIMbpWSF1P/OooaPU2bXC2NNRhj1nqvMNd
 B0KiNJkaSAKv+dM9gdTz9H6YuCRC9KSs+9IexubzigrTGnSbmQfsrFQXLcr79gzxeoDq
 7uxg==
X-Gm-Message-State: AOAM531fcSokaSJlVlZHfVSf3AK6+KaQKZb0mpQIS1JwMjcQ7g+ZUN4U
 WM1ItOyJz9L3ZZ8hhlCLbjU=
X-Google-Smtp-Source: ABdhPJyVPcoCkDKXCWePaIDmy/NoeGPDwPZ+hww3qa91Mk6i6IYJg+EBt5pMIkiGK8r+xrX0PfVEdg==
X-Received: by 2002:a05:600c:3796:: with SMTP id
 o22mr840081wmr.139.1621283855411; 
 Mon, 17 May 2021 13:37:35 -0700 (PDT)
Received: from localhost.localdomain
 (p200300f1371adf00428d5cfffeb99db8.dip0.t-ipconnect.de.
 [2003:f1:371a:df00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id p6sm3840448wma.4.2021.05.17.13.37.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 13:37:35 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: mturquette@baylibre.com, sboyd@kernel.org, narmstrong@baylibre.com,
 jbrunet@baylibre.com, linux-clk@vger.kernel.org
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH RFC v1 2/3] clk: meson: regmap: switch to determine_rate for
 the dividers
Date: Mon, 17 May 2021 22:37:23 +0200
Message-Id: <20210517203724.1006254-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517203724.1006254-1-martin.blumenstingl@googlemail.com>
References: <20210517203724.1006254-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210517_133736_874640_3CA1024F 
X-CRM114-Status: GOOD (  13.31  )
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

This increases the maxmium supported frequency on 32-bit systems from
2^31 (signed long as used by clk_ops.round_rate, maximum value:
approx. 2.14GHz) to 2^32 (unsigned long as used by
clk_ops.determine_rate, maximum value: approx. 4.29GHz).
On Meson8/8b/8m2 the HDMI PLL and it's OD (post-dividers) are
capable of running at up to 2.97GHz. So switch the divider
implementation in clk-regmap to clk_ops.determine_rate to support these
higher frequencies on 32-bit systems.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/meson/clk-regmap.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/meson/clk-regmap.c b/drivers/clk/meson/clk-regmap.c
index dcd1757cc5df..8ad8977cf1c2 100644
--- a/drivers/clk/meson/clk-regmap.c
+++ b/drivers/clk/meson/clk-regmap.c
@@ -75,8 +75,8 @@ static unsigned long clk_regmap_div_recalc_rate(struct clk_hw *hw,
 				   div->width);
 }
 
-static long clk_regmap_div_round_rate(struct clk_hw *hw, unsigned long rate,
-				      unsigned long *prate)
+static int clk_regmap_div_determine_rate(struct clk_hw *hw,
+					 struct clk_rate_request *req)
 {
 	struct clk_regmap *clk = to_clk_regmap(hw);
 	struct clk_regmap_div_data *div = clk_get_regmap_div_data(clk);
@@ -87,18 +87,17 @@ static long clk_regmap_div_round_rate(struct clk_hw *hw, unsigned long rate,
 	if (div->flags & CLK_DIVIDER_READ_ONLY) {
 		ret = regmap_read(clk->map, div->offset, &val);
 		if (ret)
-			/* Gives a hint that something is wrong */
-			return 0;
+			return ret;
 
 		val >>= div->shift;
 		val &= clk_div_mask(div->width);
 
-		return divider_ro_round_rate(hw, rate, prate, div->table,
-					     div->width, div->flags, val);
+		return divider_ro_determine_rate(hw, req, div->table,
+						 div->width, div->flags, val);
 	}
 
-	return divider_round_rate(hw, rate, prate, div->table, div->width,
-				  div->flags);
+	return divider_determine_rate(hw, req, div->table, div->width,
+				      div->flags);
 }
 
 static int clk_regmap_div_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -123,14 +122,14 @@ static int clk_regmap_div_set_rate(struct clk_hw *hw, unsigned long rate,
 
 const struct clk_ops clk_regmap_divider_ops = {
 	.recalc_rate = clk_regmap_div_recalc_rate,
-	.round_rate = clk_regmap_div_round_rate,
+	.determine_rate = clk_regmap_div_determine_rate,
 	.set_rate = clk_regmap_div_set_rate,
 };
 EXPORT_SYMBOL_GPL(clk_regmap_divider_ops);
 
 const struct clk_ops clk_regmap_divider_ro_ops = {
 	.recalc_rate = clk_regmap_div_recalc_rate,
-	.round_rate = clk_regmap_div_round_rate,
+	.determine_rate = clk_regmap_div_determine_rate,
 };
 EXPORT_SYMBOL_GPL(clk_regmap_divider_ro_ops);
 
-- 
2.31.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
