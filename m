Return-Path: <SRS0=fUxg=V2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 773C1C7618B
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Jul 2019 13:17:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 307ED2070B
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Jul 2019 13:17:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sCZYCufs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Wfz6C774"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 307ED2070B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oKAAgQWsY41xsKA2Y90KcgfPArMwcAaj1IvXWsFC9XM=; b=sCZYCufscrZ5+o
	7qtuBNo5VfAvRADIzG1cu0zbXlm/DF7xekdxap1v1wmrhdRgCa171D55B85CXaCHkk8uuiLv/NjKP
	nmfBp2xsSMVGyYipvSI6cdnViu95ARJd8Da44Dt8BccNUVHtKkXYfqZuLjgk5xhH8SY0jmIjtRO11
	aDKkLYINY+qWn8Wa4ep7OeH4FHp6P7cmwJc8PGV48fvFqOopgHBEy4rJOPZxOnnsTTjrpmxEGq/Z1
	aYzBORxeKyOdAv8ivE7jLqbkyu1nmyYVIc4w7o6a1TPZ/GuprOvvA77DUrcnKh/Sw3sU6HzQvfz3l
	AD0yWAwuCiEp6kN/vmbQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hs5X4-00075q-6G; Mon, 29 Jul 2019 13:17:42 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hs5WQ-0006Hz-Ax
 for linux-amlogic@lists.infradead.org; Mon, 29 Jul 2019 13:17:04 +0000
Received: by mail-wm1-x344.google.com with SMTP id 207so53837693wma.1
 for <linux-amlogic@lists.infradead.org>; Mon, 29 Jul 2019 06:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ilNgiDVSmGak25pg9L0wagvtwRSAZxVDdm8Be33Ze3o=;
 b=Wfz6C774D3WcLjVSRjjQ9Lw6OAiML+fgZ8SRO9mkuLL3Gzg4MPG1wMAJOBhov2Q2BV
 PIgPQfA7tWuphF1Vx2YdRRrTQU+oZU6Ei2Mx+31nEU93c6KlukMw3bv6jtwjnA6WxOJd
 pxaG8IXHlrJjHAWA5Bv3mNNvJ36r8AgsfIgq2zKOOlZBj4yvhdEek/isUR/HhUxe1A6F
 9Tua4I1IPVpvm1aq/GUu4dyAOpFcpxGBnEEg6oNcLhFWYR5I0KnP6jGS6Nc1DEZ0FcO4
 SxDRZYkCUrrh2836Vcvs3RMfmZqivsJraN2vozaJk7mOJAlZpkendo8TlYJGAAa9tq0q
 chOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ilNgiDVSmGak25pg9L0wagvtwRSAZxVDdm8Be33Ze3o=;
 b=lS6+MSYoeZCLjKg7XpsK92lWlKtibRA4kxVEPxxsq4P0x+dj9D9EFpdUNyE7bhQDvc
 aGtVfRW4W8vi6OhfXlftMn6VdsVBMd6ZNmef+QT+WnBBsJQtMRNsv1F0HbEPPzkR2BBy
 wZqy6/c79PmAHAAcANxcgkv8nQqPHc17EW319wWrlebmRRBy9hSDmhxzdQOjzSVYGLHG
 TjksBVyxhnMlA3+ZMBzEPI5u9KybYTOmAzE/q/SK+y+rTl7E0ZT8qBaOU/p+43PoPDrG
 8k7wTWnxnS/hmu27fPX5EWQmnnB1EyX/dASj+ITK8kbDEmjPu2j91FjmhtUeSqDDfApv
 4VUw==
X-Gm-Message-State: APjAAAXkzz1nBXLMzRDgrBU7XF5oL+uQHoYMdQSE0ddLxgWdOPZSe010
 gYyCVqCV1gBKqo7IohtkgyAhpw==
X-Google-Smtp-Source: APXvYqypMagpK7Rn4o7xdy8pV2mv01YyLBmCblc0Qt5Jzfp6qN3KU/2uEbRbZnALWwoGiWLw3SxERA==
X-Received: by 2002:a7b:c947:: with SMTP id i7mr102925593wml.77.1564406220768; 
 Mon, 29 Jul 2019 06:17:00 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id b5sm52520490wru.69.2019.07.29.06.17.00
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 29 Jul 2019 06:17:00 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com
Subject: [PATCH 2/4] clk: meson: regmap: export regmap_div ops functions
Date: Mon, 29 Jul 2019 15:16:54 +0200
Message-Id: <20190729131656.7308-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190729131656.7308-1-narmstrong@baylibre.com>
References: <20190729131656.7308-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190729_061702_372575_A650B68E 
X-CRM114-Status: UNSURE (   8.94  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The G12A CPU Clock Postmux divider needs a custom div_set_rate() call.

Export the clk_regmap_div_round_rate() and clk_regmap_div_recalc_rate()
to be able to override the default clk_regmap_div_set_rate() callback.
---
 drivers/clk/meson/clk-regmap.c | 10 ++++++----
 drivers/clk/meson/clk-regmap.h |  5 +++++
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/meson/clk-regmap.c b/drivers/clk/meson/clk-regmap.c
index dcd1757cc5df..26c8c74a8cf0 100644
--- a/drivers/clk/meson/clk-regmap.c
+++ b/drivers/clk/meson/clk-regmap.c
@@ -56,8 +56,8 @@ const struct clk_ops clk_regmap_gate_ro_ops = {
 };
 EXPORT_SYMBOL_GPL(clk_regmap_gate_ro_ops);
 
-static unsigned long clk_regmap_div_recalc_rate(struct clk_hw *hw,
-						unsigned long prate)
+unsigned long clk_regmap_div_recalc_rate(struct clk_hw *hw,
+					 unsigned long prate)
 {
 	struct clk_regmap *clk = to_clk_regmap(hw);
 	struct clk_regmap_div_data *div = clk_get_regmap_div_data(clk);
@@ -74,9 +74,10 @@ static unsigned long clk_regmap_div_recalc_rate(struct clk_hw *hw,
 	return divider_recalc_rate(hw, prate, val, div->table, div->flags,
 				   div->width);
 }
+EXPORT_SYMBOL_GPL(clk_regmap_div_recalc_rate);
 
-static long clk_regmap_div_round_rate(struct clk_hw *hw, unsigned long rate,
-				      unsigned long *prate)
+long clk_regmap_div_round_rate(struct clk_hw *hw, unsigned long rate,
+			       unsigned long *prate)
 {
 	struct clk_regmap *clk = to_clk_regmap(hw);
 	struct clk_regmap_div_data *div = clk_get_regmap_div_data(clk);
@@ -100,6 +101,7 @@ static long clk_regmap_div_round_rate(struct clk_hw *hw, unsigned long rate,
 	return divider_round_rate(hw, rate, prate, div->table, div->width,
 				  div->flags);
 }
+EXPORT_SYMBOL_GPL(clk_regmap_div_round_rate);
 
 static int clk_regmap_div_set_rate(struct clk_hw *hw, unsigned long rate,
 				   unsigned long parent_rate)
diff --git a/drivers/clk/meson/clk-regmap.h b/drivers/clk/meson/clk-regmap.h
index c4a39604cffd..ebf776a32ce3 100644
--- a/drivers/clk/meson/clk-regmap.h
+++ b/drivers/clk/meson/clk-regmap.h
@@ -78,6 +78,11 @@ clk_get_regmap_div_data(struct clk_regmap *clk)
 	return (struct clk_regmap_div_data *)clk->data;
 }
 
+unsigned long clk_regmap_div_recalc_rate(struct clk_hw *hw,
+					 unsigned long prate);
+long clk_regmap_div_round_rate(struct clk_hw *hw, unsigned long rate,
+			       unsigned long *prate);
+
 extern const struct clk_ops clk_regmap_divider_ops;
 extern const struct clk_ops clk_regmap_divider_ro_ops;
 
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
