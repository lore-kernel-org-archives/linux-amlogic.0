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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 997ACC04FF3
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 May 2021 21:56:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A42E600CD
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 May 2021 21:56:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A42E600CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gPe2VLP4rmyuID4jhLRGoEM65WfRbH+pNqsZOcc8bQ4=; b=HzD0KL8pAdWlj/
	EmB9ArMn8Z4oA3oaJrbaW8iAXSPGqmsxTDHGGE8W8lumrNyB8TdAaAgbtnMQF7mbRHyu7UBJ/lWap
	pD52IO6cnlDp7RSJ7MZcARmI44YaZPM63yu2PPGdEPR/xLUNMM2JNgAHc5AjA9DtH9P5VpobEBE77
	cZSmJrwjeqJj0hYY0guhXoOjxaQVqFH5+ghVN+2TnKst7cRdi7/w7Wu9nI5/8VurPAbMHW/q3yTVx
	CZaNEaTXkAEp1OWD7xlbXG7/ts7KvqdXDK7ZMnKV9gVAUH7k5lD5aqsgLY0ryWAslgwueZ2sBQ/Rc
	NSFDxJno+Ab3zN0juAqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1llIYI-00218s-OY; Mon, 24 May 2021 21:55:58 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ll7y2-000pv9-Jz; Mon, 24 May 2021 10:37:52 +0000
Received: by mail-ej1-x62e.google.com with SMTP id s22so40804634ejv.12;
 Mon, 24 May 2021 03:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D9PoKK0/f5+W8bgWFgVSBXS4bTp3NbAEIo6GlJr5v8A=;
 b=XUPX+sm0RNbOl3akoKmJdcug6VvbFVss7IrvGZFOHF5FdfguqhCkHq65S57Ilk5f/3
 p1ua+E5zOQJNBiRMiDO4wEoSWhudhNUp6/urdIjRJ0NPeMruTG16PCnnzvPg7YKphCDK
 vJOtSZ4qClvDCcAOIYO/ELwFVrOuf5PY8qRqB70zHxMgrkJ2RfvIiNR9Mh4ISz7xCDij
 q2rtBm7rl6vNUlTiN5sBRevkobxNR6APjypX8tKGkS4dOTT1U8ll3tR2YXRhyD38X3T+
 8xP5YJdM1DoyqaIAawr1D5GwvpTLbOxHLiir78pNcbOucV7CcWdyJvb5teip623/IF6D
 hCyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D9PoKK0/f5+W8bgWFgVSBXS4bTp3NbAEIo6GlJr5v8A=;
 b=q0hJsjXvGD0vNXGtGosYHh5cGof8iZ59AZAdu/hvHZRxiVjlGwfhJ4qLvdRtEqEg7Y
 hBL0ikd9bAo9gggjobXbhG0YIGGGvpmpPKOKP7YikUtGA9VzlnqIUfLAdrAmjLzLzAkc
 X0hESboKkd5Rpz0NIMOa/4nWgXbEfvEuyrE26Xn+ilvFFAehO9+5HuzTuTdb1ZjyqV+S
 vvsCbhnlK85U5mEKr9Tp+z5xYaW3tyJ82RfuZKFsh5Q2EzmyeSlXqxXOBZzX356wxjRB
 wEV980XEaRWlYDEPlGLepjbfl/59JFODFxFPO+SQsV2RcXmlv1SNsP0BRqvjZXXxFDq7
 lm2w==
X-Gm-Message-State: AOAM533ZnZPtCMW8JgLUJZR7ds7xHgx043Fde76nICrdzfSorRWfNLjM
 k57JQC+RSzkABaJlOGrXEd4=
X-Google-Smtp-Source: ABdhPJxji7Msow1IjPo9+v0JxjQuF/MZH2cI9E+oqnbxbvprgU3c/OuibsfJWHOyfd84x1jHbdz2jw==
X-Received: by 2002:a17:906:fc1e:: with SMTP id
 ov30mr22364766ejb.526.1621852669408; 
 Mon, 24 May 2021 03:37:49 -0700 (PDT)
Received: from localhost.localdomain
 (p200300f1370a3a00f22f74fffe210725.dip0.t-ipconnect.de.
 [2003:f1:370a:3a00:f22f:74ff:fe21:725])
 by smtp.googlemail.com with ESMTPSA id r15sm2616418edm.61.2021.05.24.03.37.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 03:37:49 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: mturquette@baylibre.com, sboyd@kernel.org, narmstrong@baylibre.com,
 jbrunet@baylibre.com, linux-clk@vger.kernel.org
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 3/3] clk: meson: regmap: switch to determine_rate for the
 dividers
Date: Mon, 24 May 2021 12:37:33 +0200
Message-Id: <20210524103733.554878-4-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210524103733.554878-1-martin.blumenstingl@googlemail.com>
References: <20210524103733.554878-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210524_033750_691756_4DEEF946 
X-CRM114-Status: GOOD (  13.81  )
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

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
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
