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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53F04C433ED
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 May 2021 20:38:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD98F610CB
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 May 2021 20:38:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD98F610CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/iHqSF4VrRlf5Q4+Ax+6yaPKwk9kFot1QNgty+hIRUM=; b=GsyIXmfGICBXvDi3Ws38lVX3C
	kUAT+Vg9lI7x/cmNpXHQHGpCwgjkODpnX/7C9V6w2ZomSUO1mWk9r053bWRIAgdEMOicFM6AY0OMD
	NMuSfKzaietgYxSsoy2KtB9+L06mJpkUeUzzfDskEd8M58jADPCK9D6kgwqzLpbOuEOiumZRr99wR
	/rLTkvEbC71mYO5VJHwShUWOtwxCOpOYW3ZBYnkngCC8ava0DtZhJE7vt7ekEn5ZJthnh3ojZSdgY
	Esb39IU7Tm228TlcElRGPAmAu9sGMf0ZBtBZXYSzsYom6i1AoCtrA+Kg2SJWp4g+RbEyc0sQT8HoD
	BJedi1r3Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lik0C-00G6Im-TI; Mon, 17 May 2021 20:38:13 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lijze-00G68r-Fd; Mon, 17 May 2021 20:37:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=tCbbANbTil/Vrfbw1G3IhNkJm7dU8yXSwvHs1y3tpsY=; b=XX2i01qNKOfYA+ybF8Jq7bGDMS
 z65nSzF0vAcYBJhvj3S+DXiOPRMjTM1GIWynPtsF0P1tj/ZqeI9ImOtP8pUjl1gtwvmq9cJ6/ceMx
 ZfprbugVW6EMW6LYyP8ylN+lj1+EkJdB2fBzwNBF63SAQqpowF0NIWmeeWpgnUz0nqELhBWr8rt/a
 2ulJEAWPW7+x2v5PrgaFmWAh8OMhw7tyWGirV3TTx0FlMeBtmRMHN9wq20ouchXgY9rAIbPjPShu4
 B27yIIa+awxD3c748oT1x7W78X2esVKijuDrg5MtJrnKPGO+XUPRnZeO8vI7N+RFVwDuV5tsgMTVZ
 /gLovRQQ==;
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lijzb-00E8bD-Q0; Mon, 17 May 2021 20:37:37 +0000
Received: by mail-wr1-x431.google.com with SMTP id z17so7768525wrq.7;
 Mon, 17 May 2021 13:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tCbbANbTil/Vrfbw1G3IhNkJm7dU8yXSwvHs1y3tpsY=;
 b=Ig2cEeZXfTcxBH7AcezHBXy2YHwkj1VuIxO0VHK8W7rFHK8lNf6G9QCH7LviBZzYFa
 5igJsfTmsZaPj5qHvrs4QExmaiHnz1ZODSipDAn5D/2n6G0BlTOw/S1mP0slZMr/C7ZI
 vyfyUnJ9M5WjdfulYUVhRUfqQwVQcnfWnwqKEeAtscVoYWvaeShV6P7K+ptF2C+CAQO4
 T8ptCnZJkJxF7Yc5MZypq5EHCDEY2mzxBRVxlID1k4J/aMuRJxpfdv8i+XTs/POYTtOh
 3smkcRDol97lMRou/JH2kPSr3FUzTN7W6KLB+s7FJgh0LYgeRM4tAQutl571OMZf8DR7
 w/2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tCbbANbTil/Vrfbw1G3IhNkJm7dU8yXSwvHs1y3tpsY=;
 b=rSLQrDSYRg/fdMAoxIBFw4vqmKyA6NoNa0oh59UmAGnJ8sz0ca3apn+yi65pJ8veJ/
 RMINMQ6JIm144EWbyK7z9/ZP4rZrsXq6Ov/Cd19jLJI6ittjGuPZ906/bArLjdRoxhaK
 wVh3fDy6cd55ZQp2JMQXP/wdHgSgq6iYZOHN5x4hFkvFoIl0YUawZYew1G37WvT1/ZVv
 WR9DVeobA+WUYNuHb6J33sU9S/q+bcUFEFoRY3QcfJ36fUGT82UHsGpT25cOv0G8Z2l3
 nRMlN0WGlKV3W9pvHyaf/LeR2OqWGrk+hMV3gD4odInXITYehGMcwxUBI+wh4Nr1VIVY
 Zajg==
X-Gm-Message-State: AOAM530YxMVQGgrM7HPpU9tUmMK+UmbAOmfnAl7MxNbg6xsLBXq4gF+k
 ZLxODrVBKkzmHHdjhvLzIuRIg9QttXw=
X-Google-Smtp-Source: ABdhPJzQogUEFH902p6lXpnk8H8EXfpQe8tUurU5DTO7pDQR6ficNO6/ZS0v/hDIoPOE+CAzNx/Whg==
X-Received: by 2002:a5d:4b89:: with SMTP id b9mr1815668wrt.238.1621283854559; 
 Mon, 17 May 2021 13:37:34 -0700 (PDT)
Received: from localhost.localdomain
 (p200300f1371adf00428d5cfffeb99db8.dip0.t-ipconnect.de.
 [2003:f1:371a:df00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id p6sm3840448wma.4.2021.05.17.13.37.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 13:37:34 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: mturquette@baylibre.com, sboyd@kernel.org, narmstrong@baylibre.com,
 jbrunet@baylibre.com, linux-clk@vger.kernel.org
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH RFC v1 1/3] clk: divider: Add re-usable determine_rate
 implementations
Date: Mon, 17 May 2021 22:37:22 +0200
Message-Id: <20210517203724.1006254-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517203724.1006254-1-martin.blumenstingl@googlemail.com>
References: <20210517203724.1006254-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210517_133735_863698_2F082351 
X-CRM114-Status: GOOD (  14.57  )
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

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/clk-divider.c    | 39 +++++++++++++++++++++++++++++++++++-
 include/linux/clk-provider.h |  6 ++++++
 2 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
index 344997203f0e..24c94d2a3643 100644
--- a/drivers/clk/clk-divider.c
+++ b/drivers/clk/clk-divider.c
@@ -377,7 +377,6 @@ long divider_ro_round_rate_parent(struct clk_hw *hw, struct clk_hw *parent,
 }
 EXPORT_SYMBOL_GPL(divider_ro_round_rate_parent);
 
-
 static long clk_divider_round_rate(struct clk_hw *hw, unsigned long rate,
 				unsigned long *prate)
 {
@@ -399,6 +398,44 @@ static long clk_divider_round_rate(struct clk_hw *hw, unsigned long rate,
 				  divider->width, divider->flags);
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
 int divider_get_val(unsigned long rate, unsigned long parent_rate,
 		    const struct clk_div_table *table, u8 width,
 		    unsigned long flags)
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
