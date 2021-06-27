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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82F69C48BC2
	for <linux-amlogic@archiver.kernel.org>; Sun, 27 Jun 2021 22:40:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4369561469
	for <linux-amlogic@archiver.kernel.org>; Sun, 27 Jun 2021 22:40:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4369561469
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bMcEDkGhTcetNwldjdKgz9qT2mW4Zrct5pEcEcynsxM=; b=mWS7sdUXGTJc2l
	3E+aeKF5lx+qijCxYM1T4IahT+JDHtBEYuKGT8hwmEuuZXcj87BkeDoJJC+tcCPxGJeV+5JwAdnH2
	zzkouDDXhe7H679tW5gSuUy2dx/t4kBrAIt/wpLB625TirXIatb3CXTohg8LXLCpdzu6m/7IcmE3Y
	ssMmPMaFJyWeU88Kl1OdMoOOCnnqpcz/L4qbGSzC080zZMKA9tMSK2fULLAvvupOIZH2JoQlSGgoN
	tV+HRQDTK+8OclXJo2NT4XmUXGyXIuZ6/AZU0il6iKfClJZ9PM/AEZYtDP59NL45PBeA9g0qpp8GU
	G+/46KP2G7UwIvqlaYOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lxdS5-006Ffj-2J; Sun, 27 Jun 2021 22:40:33 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lxdRs-006FbV-4Z; Sun, 27 Jun 2021 22:40:21 +0000
Received: by mail-ed1-x52b.google.com with SMTP id df12so22667691edb.2;
 Sun, 27 Jun 2021 15:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PGONBXxvlhJmqdlV0gc3mwlikq8hNJaflhau0UlR32c=;
 b=tZrzV+ig6jKUQBbzQWnL09J6iWbBXMV6GCuURJsqjq/LgXjRJkkGGoivmqEqqOLnUG
 IdxSmPH8hvG/bHKoVrNBur1zg80tQ7vjBWb6tMpa6SjEt9BZsvIUP817R3FwS7R+3s1+
 efcA74IJEoL8Ld52nywX7Afxkdba3Tk+pqimGw6MYVudeiVpq75O3xpinBAd3irc4eQL
 jOI+NEfYN2iZW8DaFj5s6MYteT2hLpptvQ5wKKNC6SDux7rNsfsxxeeQ4BZp+5Agh3qH
 l2qyTIMuXAyB+Z1Fq7eZtWJ+xwDcfGqrKGIRl+DesRHahvXHsr5ToMK3F3VfG4OHsNur
 zl5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PGONBXxvlhJmqdlV0gc3mwlikq8hNJaflhau0UlR32c=;
 b=BPZY44NO/pZ+/ppgnF/A5hYIur1qotF9wLvU8AMW0l87ZSg+FYZnyo/4RI1wRiPrtv
 7RRicw1CFxpDG9wugn0JBVQBcRXdLZFPHS7H98E9H3mfEzfPkKny1Re8kFO4z+QqrsTD
 mNKCWkEkTr2X7dcjg1Fk+0fShCYsRaMz200r5kU/dRG3wrYuDl4Kkt8a2QbE32va3ELI
 WSyH81IXYQYs3J0myiAQ3cNtFVLHX6Pn/KMAxKE9755tw9WVCCjfSSDMe4cNaKgMiT+/
 qImWOM8OVFd9Lyq6qDN/SDwtu7HqWueGP3lkC2erBYma8+NGE2ckPlqNOfDJmn+rY8wI
 tiZA==
X-Gm-Message-State: AOAM531optPP+1fa4H7DR4+NYfiAKHCGplWz7xrKOlGjUIvLt0FKEzUg
 LpmHrAKS+WveVF2kgdUhtEg=
X-Google-Smtp-Source: ABdhPJwaBo9OJa6uSLaQbTxVXjuNc27ehqTlKZ3Gf9dHqHGB3kIAQP/8zSGbtC6DahQ4NzLAmgERbQ==
X-Received: by 2002:a05:6402:1103:: with SMTP id
 u3mr29293230edv.342.1624833618675; 
 Sun, 27 Jun 2021 15:40:18 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-2a01-0c23-bd64-8b00-f22f-74ff-fe21-0725.c23.pool.telefonica.de.
 [2a01:c23:bd64:8b00:f22f:74ff:fe21:725])
 by smtp.googlemail.com with ESMTPSA id jz27sm6048861ejc.33.2021.06.27.15.40.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jun 2021 15:40:18 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	linux-clk@vger.kernel.org
Cc: narmstrong@baylibre.com, jbrunet@baylibre.com, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v3 1/3] clk: divider: Add re-usable determine_rate
 implementations
Date: Mon, 28 Jun 2021 00:39:57 +0200
Message-Id: <20210627223959.188139-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210627223959.188139-1-martin.blumenstingl@googlemail.com>
References: <20210627223959.188139-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210627_154020_220689_373C2B18 
X-CRM114-Status: GOOD (  16.31  )
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

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
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
2.32.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
