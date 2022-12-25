Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8AA9C46467
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Dec 2022 01:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=coucSxHZTzTXroE4LizW0njbpCYeButT/OU3eloQUWU=; b=yxQhvfXPOC7z0h
	Kmssc48V8BdyLpurWKhqOMGPpyMAc4q2QW1OXkv0obUnxlVFho8B+rei+YZC/Od3m1eJivg+D8RE7
	I2Q8tryxinOKAqsgbinOPNu8DrqPH3MceIVoD1MeZavSnZHkhlEv9OJm/fLq1y4Wjo8Ne87dNYjwW
	lJC+UBhbxoOoikflfAxLzier4aafk3UfjK1aXAVSJ7Vffgr/RkbXZQPhYPJpq/DeJ44Qq5izySCxM
	r23YCccVb0pqXHJYweXdpEdTQz8odtCwYNcWSWHqckI48o9dq/bT6aveRwvBsLVP/+eI375etKMZS
	rhnnnckA/P7AhXmXKpug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9cAx-000AFx-2K; Mon, 26 Dec 2022 01:21:11 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9YW5-00FdTb-6a
	for linux-amlogic@lists.infradead.org; Sun, 25 Dec 2022 21:26:46 +0000
Received: by mail-ej1-x62c.google.com with SMTP id t17so23044695eju.1
        for <linux-amlogic@lists.infradead.org>; Sun, 25 Dec 2022 13:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5KI4GVi+gdxgp2ZGUw6TN4YhL63JS7cfevWElXB6z0s=;
        b=k1dJC42zQSl4nfLJ3K+ztzbqAJDFEdIdZPy7L1D89hkbY9HXKlLJuFXxqcw+FK/TVV
         ORaWIG/HNaJQAbqAPyI+2xwzcx1ahZY8BJEoDP1sNYxx03NhCDNBQjPBeYlUjFko1CD/
         1UIgfoKNhvBPrVy0u3EwiUhk86D0GXglDirGyqsPUsgX3Hbv+3r3k35idjNm+A6EXBKo
         fSRIGXrsl5YQVLyIkXWZERnfTGb9NHOb316NquZAOWKF7AEOBy9GJ1o7Mf/aaU/F9nad
         WUKlGJE3AeozEso1BQe9/tOHkRtMwjM+VjGdnVcAPbrJhBv9SQHd8qBjduSmTpkxxCLt
         OFNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5KI4GVi+gdxgp2ZGUw6TN4YhL63JS7cfevWElXB6z0s=;
        b=V7W/e/hRsHtgpOIhB6cexrGALUKFbA3Ja3uJFIHOTJSfWbB+8BAPt4uvi2YriF2rNy
         DtZpaiujLBdMK9WCqc9VBVvUCF1exsd0xSE0OIraa70iyasqSXMfgiHdHc1Ix8Guzf8+
         moIc2R4VGWdBHBdc9AzAgYUbdsyflp9dtgIJLrY9kAt7MHlCo1W67vYAds8kHmHZGvlY
         xfTgh8BhcaxBOt+0PeuBuy//0VSnR9ZsO0ZHswAhWIXS/AnuJg1CmAcl4T7swWKi+doT
         KTCGczJ9fTEleDzZ9PKzsx3new9LuDjQWpzA8kZ7i7n4y0PCY9WVUJ5gpsom5GOPy0fB
         wSeA==
X-Gm-Message-State: AFqh2korWr6rG4LZDAZaLd/kOdI6ktO5+Q706QAPwJKs6ySE/HPR9Mp6
	z/1uCJdvpDFj3w1bLVqdIDzDv/ABARQ=
X-Google-Smtp-Source: AMrXdXs+KZaDdvm9udYW4BX/Q7fJqqvrvx1jef2GpmyfmYMmtA8FXASDVeM8/iE11rZbyMM520xcFA==
X-Received: by 2002:a17:906:2813:b0:829:59d5:e661 with SMTP id r19-20020a170906281300b0082959d5e661mr13997700ejc.29.1672003602528;
        Sun, 25 Dec 2022 13:26:42 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a01-0c23-c49f-b200-0000-0000-0000-0e63.c23.pool.telefonica.de. [2a01:c23:c49f:b200::e63])
        by smtp.googlemail.com with ESMTPSA id ku22-20020a170907789600b007c10d47e748sm4062567ejc.36.2022.12.25.13.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Dec 2022 13:26:42 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jbrunet@baylibre.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v1 3/4] clk: meson: sclk-div: switch from .round_rate to .determine_rate
Date: Sun, 25 Dec 2022 22:26:31 +0100
Message-Id: <20221225212632.2760126-4-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221225212632.2760126-1-martin.blumenstingl@googlemail.com>
References: <20221225212632.2760126-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221225_132645_293065_F2CF7848 
X-CRM114-Status: GOOD (  11.03  )
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

clk_ops.round_rate will be removed at some point. It's replacement is
.determine_rate. Switch sclk-div over to use .determine_rate.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/meson/sclk-div.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/meson/sclk-div.c b/drivers/clk/meson/sclk-div.c
index 76d31c0a3342..d12c45c4c261 100644
--- a/drivers/clk/meson/sclk-div.c
+++ b/drivers/clk/meson/sclk-div.c
@@ -96,16 +96,17 @@ static int sclk_div_bestdiv(struct clk_hw *hw, unsigned long rate,
 	return bestdiv;
 }
 
-static long sclk_div_round_rate(struct clk_hw *hw, unsigned long rate,
-				unsigned long *prate)
+static int sclk_div_determine_rate(struct clk_hw *hw,
+				   struct clk_rate_request *req)
 {
 	struct clk_regmap *clk = to_clk_regmap(hw);
 	struct meson_sclk_div_data *sclk = meson_sclk_div_data(clk);
 	int div;
 
-	div = sclk_div_bestdiv(hw, rate, prate, sclk);
+	div = sclk_div_bestdiv(hw, req->rate, &req->best_parent_rate, sclk);
+	req->rate = DIV_ROUND_UP_ULL((u64)req->best_parent_rate, div);
 
-	return DIV_ROUND_UP_ULL((u64)*prate, div);
+	return 0;
 }
 
 static void sclk_apply_ratio(struct clk_regmap *clk,
@@ -237,7 +238,7 @@ static int sclk_div_init(struct clk_hw *hw)
 
 const struct clk_ops meson_sclk_div_ops = {
 	.recalc_rate	= sclk_div_recalc_rate,
-	.round_rate	= sclk_div_round_rate,
+	.determine_rate	= sclk_div_determine_rate,
 	.set_rate	= sclk_div_set_rate,
 	.enable		= sclk_div_enable,
 	.disable	= sclk_div_disable,
-- 
2.39.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
