Return-Path: <SRS0=mKTp=LV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EC24C48BC2
	for <linux-amlogic@archiver.kernel.org>; Sun, 27 Jun 2021 22:41:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4983B61A1D
	for <linux-amlogic@archiver.kernel.org>; Sun, 27 Jun 2021 22:41:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4983B61A1D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tn97nmH/7jCezX0Rx2wjwFOa426LHK4MVnvKi2T9ZWk=; b=dRaiIUv4zOcYHE
	V37D1QvgyTz+2U7mQeWalLCBo38beSQQPVMrX2bG9v1lFQQt2pAibWVkfcxZQGMz90QZVeDyDmx8A
	OANWE6UbN2B6nfs5XloQSUZP6Jgn9DTYvQvB1xzZLwgK+nB9OldFsFuspnRdBYJ1EvspxSmsJi8dd
	kV8cwziKITq/XxAoArZi+GwJi1TWrx4lQg12PH1AAp1SBl9MNz8CyxrAb0+TFbK4M0peFmyXlz/PT
	hVEx9jX1Cor/xY3nS9C8JyPM8k6D+s3F8Q8WgKS1dOwd230w6qzzZIwcIW8D3VQMYlAq8UYFacS7g
	18tidyYzdS1Fp5hNje0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lxdSS-006FmZ-9o; Sun, 27 Jun 2021 22:40:56 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lxdRt-006Fc2-Ki; Sun, 27 Jun 2021 22:40:23 +0000
Received: by mail-ed1-x529.google.com with SMTP id i5so22700728eds.1;
 Sun, 27 Jun 2021 15:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1RGvFAm9Ts+UzLEA4XCpJmqflkt+KrOpeV6KcGxPufo=;
 b=lx2WKNqvydIxgPqbA9zQ9ngA2x1DrB09LYObbLZfVaFLrAo7/hK0BuEwpdUQXFwwAc
 eWtg17oO5QFwAAnoP5Aa/zmODTUvlZLnWrv778ysdLrO7G9eUgsE4SM727kwmnUbrILb
 Nv3PhnBLvgygh2rAOFCI+oJ01xV/pDTBYlq6QKBS67G6/jsGPjWiBvDhCp5MORh17mGf
 AbnY8YXD8PVw50EO9EuefIT45qeIzdcJOnvzDU9j3NNtSSyV/R2BlUgUyQPMXbjwD6II
 8KtTlAJm3+5UPu4Dmf/nrqgf6LVWEuVW1hYa0gzi44319BkFbM9lM/STIH2tkfnNIeaH
 VfXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1RGvFAm9Ts+UzLEA4XCpJmqflkt+KrOpeV6KcGxPufo=;
 b=TvWPznmLxORs9zagjXBfc01UnU5MIbzTLN2RjBeiKYRpbRiJqeZAaYF5VCvv5tmXa8
 Xxgj6lVEeSw1icPXLv6+QfrRFu7JIAvqobV0z/UzKROWeEL/XPDTy004o+B2/22KrmDL
 5Mg6hexhGKh7+RZ9gcw18XDMMnkYCP5XfYaHPne9/GP5VKjqjEYkKaboCfQ+r9Fk4B+D
 IpTsYRG7YXtQqLwOUju9fD53A34/HlQcDHfQPFob1KIQHNVogdPVs0emjNCSmpM4VPgA
 z4YT7I1USKfm/k53EvyFaa/85rpAVEDlXrPQR5elvV42bgZTtEP2G4DaE3o9r88CLjVk
 KmNw==
X-Gm-Message-State: AOAM533Nlsein142YFzO3YwphQm4DxzCFPVsdNUExaxSXtS9XlipDhM8
 dEztb+yc6NWaX2BOFhO1TQ8=
X-Google-Smtp-Source: ABdhPJwtBJNk1GE9pddy37EiixHhFNKzp8fbC0MRAbqMv+j7mhB9VGsAF3sYuSOdKXVboJ25Up0Vpg==
X-Received: by 2002:aa7:c845:: with SMTP id g5mr29233940edt.306.1624833620156; 
 Sun, 27 Jun 2021 15:40:20 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-2a01-0c23-bd64-8b00-f22f-74ff-fe21-0725.c23.pool.telefonica.de.
 [2a01:c23:bd64:8b00:f22f:74ff:fe21:725])
 by smtp.googlemail.com with ESMTPSA id jz27sm6048861ejc.33.2021.06.27.15.40.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jun 2021 15:40:19 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	linux-clk@vger.kernel.org
Cc: narmstrong@baylibre.com, jbrunet@baylibre.com, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v3 3/3] clk: meson: regmap: switch to determine_rate for the
 dividers
Date: Mon, 28 Jun 2021 00:39:59 +0200
Message-Id: <20210627223959.188139-4-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210627223959.188139-1-martin.blumenstingl@googlemail.com>
References: <20210627223959.188139-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210627_154021_740464_7BCCB38A 
X-CRM114-Status: GOOD (  14.16  )
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
2.32.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
