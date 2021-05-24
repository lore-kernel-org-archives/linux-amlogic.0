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
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0817C2B9F7
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 May 2021 23:45:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3CDA61420
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 May 2021 23:45:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3CDA61420
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q8HzZRST7IcSlBbeeu5W6rN8AlQhqGLIT+KTloAJtY0=; b=lQYqLLqJiF695B
	dO8OwY3bVzEhgx0IwCJjfSeliLiO5hhPVJDY3/CvJ7oBHginoAJ//k87Pgb4reOzgH2jlVx4UszbQ
	hp1MkeK4wsoaV/Kbn1o3GMxFRWK4ZJsdB9CmWXQpx6VzYidDcc5UDsd3T9/DkHW/L6+Qe8NSf8nAs
	399Rh2JiIXx9S3RQOJyOXddWvY1sWNqmFTZpQ1ezDcD1EQSFhEIElc6Cc5ExkX4scImKVPWGnMHqe
	Hlti1Ngn5adKEVArVrESzi7ow1wxjtb6hyqLcE4A/shEHeY5eFXEJSjV5tjglmjxVh2qMhXvoTSK1
	OHebYjhDRq9F3z+0qM3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1llKGS-002OnR-TF; Mon, 24 May 2021 23:45:40 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ll7y1-000pue-JL; Mon, 24 May 2021 10:37:51 +0000
Received: by mail-ej1-x62a.google.com with SMTP id z12so39567131ejw.0;
 Mon, 24 May 2021 03:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7DuEzwceNsnqYkEeiiZKaUdLTGoHWRI6KUHxHFfU1j4=;
 b=XasM8I+jWP45hASRQz2pDtCH3J/lY7Vm9kZLI+IH/vZEVthGGV4ROUbUeGU/qIqvVp
 tQdMMqtih8wQ0DYSJCMRCUO5g6Ijf+UZ4dkuZ++sRGlARBzMuJSSAyGvho6twoA3822C
 5gr5iumVWLsBjXgmmmQlppiFHgJFTQPpzdaQRA2Dbyd68/2B0Sv4HxV+DTliZouBpf15
 5C20k6fwKt2Bus2t0kdeOhktpkZwM+tnLrKHAJI8fCjg7cU2VKmRZAAlOzaEs+9zbFeQ
 M72Tu9DFhaNuDokzzr6XwgEwXbiI/9yg3yEhhcjLsg4SU953eiB17wRTlAEGBKVmRAUG
 iRdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7DuEzwceNsnqYkEeiiZKaUdLTGoHWRI6KUHxHFfU1j4=;
 b=r3riALCIufd5R1T2GzkNeNRVgkCu52azE0C8c26446uysxkaNDzmXh21ADUqv53NIo
 GH13LqCdchmpHIinVfFrzXuAud3gpqHOvYVV9aK4P4YJM7K3ECJfWcZ5BRWi6u69PSO2
 nMs2tWJX1DYRApZG8TKwAPf8Ww0qsfpVASnkHqxw3HCoBhmb4tYZ/nvDm6MdyeUpkPJL
 D5FfpNYtQtlaF+i7bpzPUtrECtdmf4Du4KN4qDEddF5bztniJSNTOpJO4oReAxL+Hq6A
 2DL4KNCBCAOIfLGKB7QJ3i+4AFqwRYpt4VG8KvKV9kgm2VWnE+g2QeNF7gy+0GxxQ0Z3
 TMVg==
X-Gm-Message-State: AOAM530HwVXIKAXiKjj4c7EqCR+l9/pGlU85/IHC+gW8Xp5IfRRpsVd/
 Ju+F1uqEfFcEgh9PBd547RQ=
X-Google-Smtp-Source: ABdhPJwQ/2GEiSXKNvjACryhQkePleZPR6KX44B2C0K/pqg7dYhxGhpBo6XdnjV531KBhtbX0t4kCQ==
X-Received: by 2002:a17:907:2136:: with SMTP id
 qo22mr22269933ejb.246.1621852668092; 
 Mon, 24 May 2021 03:37:48 -0700 (PDT)
Received: from localhost.localdomain
 (p200300f1370a3a00f22f74fffe210725.dip0.t-ipconnect.de.
 [2003:f1:370a:3a00:f22f:74ff:fe21:725])
 by smtp.googlemail.com with ESMTPSA id r15sm2616418edm.61.2021.05.24.03.37.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 03:37:47 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: mturquette@baylibre.com, sboyd@kernel.org, narmstrong@baylibre.com,
 jbrunet@baylibre.com, linux-clk@vger.kernel.org
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 1/3] clk: divider: Add re-usable determine_rate
 implementations
Date: Mon, 24 May 2021 12:37:31 +0200
Message-Id: <20210524103733.554878-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210524103733.554878-1-martin.blumenstingl@googlemail.com>
References: <20210524103733.554878-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210524_033749_658435_3A154B30 
X-CRM114-Status: GOOD (  16.33  )
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

These are useful when running on 32-bit systems to increase the upper
supported frequency limit. clk_ops.round_rate returns a signed long
which limits the maximum rate on 32-bit systems to 2^31 (or approx.
2.14GHz). clk_ops.determine_rate internally uses an unsigned long so
the maximum rate on 32-bit systems is 2^32 or approx. 4.29GHz.

To avoid code-duplication switch over divider_{ro_,}round_rate_parent
to use the new divider_{ro_,}determine_rate functions.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/clk-divider.c    | 75 +++++++++++++++++++++++++++++-------
 include/linux/clk-provider.h |  6 +++
 2 files changed, 67 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
index 344997203f0e..87ba4966b0e8 100644
--- a/drivers/clk/clk-divider.c
+++ b/drivers/clk/clk-divider.c
@@ -343,16 +343,63 @@ static int clk_divider_bestdiv(struct clk_hw *hw, struct clk_hw *parent,
 	return bestdiv;
 }
 
+int divider_determine_rate(struct clk_hw *hw, struct clk_rate_request *req,
+			   const struct clk_div_table *table, u8 width,
+			   unsigned long flags)
+{
+	int div;
+
+	div = clk_divider_bestdiv(hw, req->best_parent_hw, req->rate,
+				  &req->best_parent_rate, table, width, flags);
+
+	req->rate = DIV_ROUND_UP_ULL((u64)req->best_parent_rate, div);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(divider_determine_rate);
+
+int divider_ro_determine_rate(struct clk_hw *hw, struct clk_rate_request *req,
+			      const struct clk_div_table *table, u8 width,
+			      unsigned long flags, unsigned int val)
+{
+	int div;
+
+	div = _get_div(table, val, flags, width);
+
+	/* Even a read-only clock can propagate a rate change */
+	if (clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) {
+		if (!req->best_parent_hw)
+			return -EINVAL;
+
+		req->best_parent_rate = clk_hw_round_rate(req->best_parent_hw,
+							  req->rate * div);
+	}
+
+	req->rate = DIV_ROUND_UP_ULL((u64)req->best_parent_rate, div);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(divider_ro_determine_rate);
+
 long divider_round_rate_parent(struct clk_hw *hw, struct clk_hw *parent,
 			       unsigned long rate, unsigned long *prate,
 			       const struct clk_div_table *table,
 			       u8 width, unsigned long flags)
 {
-	int div;
+	struct clk_rate_request req = {
+		.rate = rate,
+		.best_parent_rate = *prate,
+		.best_parent_hw = parent,
+	};
+	int ret;
 
-	div = clk_divider_bestdiv(hw, parent, rate, prate, table, width, flags);
+	ret = divider_determine_rate(hw, &req, table, width, flags);
+	if (ret)
+		return ret;
 
-	return DIV_ROUND_UP_ULL((u64)*prate, div);
+	*prate = req.best_parent_rate;
+
+	return req.rate;
 }
 EXPORT_SYMBOL_GPL(divider_round_rate_parent);
 
@@ -361,23 +408,23 @@ long divider_ro_round_rate_parent(struct clk_hw *hw, struct clk_hw *parent,
 				  const struct clk_div_table *table, u8 width,
 				  unsigned long flags, unsigned int val)
 {
-	int div;
-
-	div = _get_div(table, val, flags, width);
+	struct clk_rate_request req = {
+		.rate = rate,
+		.best_parent_rate = *prate,
+		.best_parent_hw = parent,
+	};
+	int ret;
 
-	/* Even a read-only clock can propagate a rate change */
-	if (clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) {
-		if (!parent)
-			return -EINVAL;
+	ret = divider_ro_determine_rate(hw, &req, table, width, flags, val);
+	if (ret)
+		return ret;
 
-		*prate = clk_hw_round_rate(parent, rate * div);
-	}
+	*prate = req.best_parent_rate;
 
-	return DIV_ROUND_UP_ULL((u64)*prate, div);
+	return req.rate;
 }
 EXPORT_SYMBOL_GPL(divider_ro_round_rate_parent);
 
-
 static long clk_divider_round_rate(struct clk_hw *hw, unsigned long rate,
 				unsigned long *prate)
 {
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 162a2e5546a3..d83b829305c0 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -629,6 +629,12 @@ long divider_ro_round_rate_parent(struct clk_hw *hw, struct clk_hw *parent,
 				  unsigned long rate, unsigned long *prate,
 				  const struct clk_div_table *table, u8 width,
 				  unsigned long flags, unsigned int val);
+int divider_determine_rate(struct clk_hw *hw, struct clk_rate_request *req,
+			   const struct clk_div_table *table, u8 width,
+			   unsigned long flags);
+int divider_ro_determine_rate(struct clk_hw *hw, struct clk_rate_request *req,
+			      const struct clk_div_table *table, u8 width,
+			      unsigned long flags, unsigned int val);
 int divider_get_val(unsigned long rate, unsigned long parent_rate,
 		const struct clk_div_table *table, u8 width,
 		unsigned long flags);
-- 
2.31.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
