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
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECC12C433B4
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 May 2021 20:39:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73E4C610CB
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 May 2021 20:39:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73E4C610CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=t7xotfjLWw1rHLB0iHXyVrgoGvVNTeQYqTB86VcdLxk=; b=Bfq5gJtliBDcMK+RW7FRiGwY8
	d6wX/SbHOEP03BV6ruGFcu/wxjvDiwEWViVnI/5ofSTMbJBRZ1EKhbkPHmvu7C0QzBOC99g711kxA
	shLDDJfWudMoQCvJniimcS9gNP8MeMesklo7zzbSb2p7oXiHIK5cBGPRcl4PlEdLre+tsI73PX7xn
	nNbphxq/xSkr1T836wZT7DHYRtikdUUM4wU3cuSvfF8yXRE17U3ATBHwKqujH0obTitNZf4pvr7Z8
	DzYA9EBqURlzyf9xXrrGLlI6D1XBSIcTuPAsszDDamvcvxDE40mO5c5+R4vXNT56zUijEMCwASbfv
	E1rrDmCXw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lik0q-00G6Uq-FY; Mon, 17 May 2021 20:38:52 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lijzg-00G69g-Bx; Mon, 17 May 2021 20:37:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=JdlOUWCFrqhk74UvYiMcqHdWI1N1+oYHII4ZRq2kZ3Q=; b=MgbKy/Qi0z9IqKs93H/rSytLTn
 h+NaCsbD58VyrY20RVmRWRda0hwaP7OjBZI821aX12wMwx2yk1twYCwkAjR98dosR4ARiDL012hnl
 5FT51tGcBu8YSxm1T+yQwtlLYoQoBN/3YqxTRuUOJgGTyTdC0LGn599Xn4amNQCNizvrYvWBLMC6R
 gi3NbAPaUTO4t713aFUbfeyb3KlYLZCF5TGsyD5mRwB+d9h0zRNIx1dHz5+fE+aJTaaksDC4BJiAu
 f42meDM1fLYDYcd83DTowxev2LV/gR62LO0PWTFLiUHVArQoVzsCZ/sQzchXYM92QOCqhRSq9f0qC
 EQsIAT6Q==;
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lijzd-00E8c0-KD; Mon, 17 May 2021 20:37:39 +0000
Received: by mail-wm1-x336.google.com with SMTP id
 n17-20020a7bc5d10000b0290169edfadac9so272996wmk.1; 
 Mon, 17 May 2021 13:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JdlOUWCFrqhk74UvYiMcqHdWI1N1+oYHII4ZRq2kZ3Q=;
 b=iGYBbJ7VV+sih5JcSVBhAw+WygMf8lzLPqsrC86lDfO6oZdOx7a8AdYoopCJYyhvOQ
 7VM0R4hkIWexulCPuRs5G41v6DhcisDIhFvO5wY5mO4iy5ZFgM2wAHmzLbJIjlVFdMRs
 K8gas4JH270iFfnPW2id7L0eyizQl3gPfQ0R95gZc5aOKqPfziCTyJ6e4hhCWIFJ1iKP
 1cBuDoA6YvvMtU3s4N3IuPdOSXoFR7dAncB8QyfG7cFtYDQ8S12Mo7in+3ySv0fgOSad
 VOBaglZ5ViFafsKgH1SGAlSl9rkV/J/9Ln2shol0Wx6uxgghiDW7KItMlGX/CMfHvvKZ
 AfXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JdlOUWCFrqhk74UvYiMcqHdWI1N1+oYHII4ZRq2kZ3Q=;
 b=YNI9sNWH2xE7QGLIS9oU3HsbcV8UScX0xGV/i2OOcgdJ6AAREBQ2nzzXaAQLPYTgOr
 +Ee/VZd7xiyubLmai8evc6H7OIk4alyM/Cpe/T3YhroioW3vBkUi61OVObIktKUWNjJW
 RfaZTMrA6Se292U7TBZWxQBgzWKXJpYJO/lxWtMKGcRcjhWXzVQZBeTUP0w0U9x39Dwz
 1OFYQeuq+4xOornUT5ERGIK6O0FXe+IEa1Ts+aH36JYf3BPTu+eO8y4m8gb4YrMa/8MA
 xAyvPATgVMdwtjROa2IpMddxPE6Qr81lSR1eK8rI5FzkcvBOvd8bCjJhlpf1Wcwc1P6f
 xRnw==
X-Gm-Message-State: AOAM53384xYmFx+nskVRv8hKhg+wIN3Lk8i8C8qaEWAhv//aGCTZNGkd
 q4Tjv81st6PJ+7S6xtHJlgg=
X-Google-Smtp-Source: ABdhPJyUym/2wMl+zRWG2tm3iJbsKFKDbcljcr3Vp0/EZQwKDXOiJPSAJif7+TfZO0XWr0cKN3EUuw==
X-Received: by 2002:a7b:c346:: with SMTP id l6mr1351729wmj.109.1621283856162; 
 Mon, 17 May 2021 13:37:36 -0700 (PDT)
Received: from localhost.localdomain
 (p200300f1371adf00428d5cfffeb99db8.dip0.t-ipconnect.de.
 [2003:f1:371a:df00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id p6sm3840448wma.4.2021.05.17.13.37.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 13:37:35 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: mturquette@baylibre.com, sboyd@kernel.org, narmstrong@baylibre.com,
 jbrunet@baylibre.com, linux-clk@vger.kernel.org
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH RFC v1 3/3] clk: meson: pll: switch to determine_rate for the
 PLL ops
Date: Mon, 17 May 2021 22:37:24 +0200
Message-Id: <20210517203724.1006254-4-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517203724.1006254-1-martin.blumenstingl@googlemail.com>
References: <20210517203724.1006254-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210517_133737_684173_228A93FF 
X-CRM114-Status: GOOD (  15.57  )
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
 drivers/clk/meson/clk-pll.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
index 49f27fe53213..9e55617bc3b4 100644
--- a/drivers/clk/meson/clk-pll.c
+++ b/drivers/clk/meson/clk-pll.c
@@ -242,8 +242,8 @@ static int meson_clk_get_pll_settings(unsigned long rate,
 	return best ? 0 : -EINVAL;
 }
 
-static long meson_clk_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-				     unsigned long *parent_rate)
+static int meson_clk_pll_determine_rate(struct clk_hw *hw,
+					struct clk_rate_request *req)
 {
 	struct clk_regmap *clk = to_clk_regmap(hw);
 	struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
@@ -251,22 +251,26 @@ static long meson_clk_pll_round_rate(struct clk_hw *hw, unsigned long rate,
 	unsigned long round;
 	int ret;
 
-	ret = meson_clk_get_pll_settings(rate, *parent_rate, &m, &n, pll);
+	ret = meson_clk_get_pll_settings(req->rate, req->best_parent_rate,
+					 &m, &n, pll);
 	if (ret)
-		return meson_clk_pll_recalc_rate(hw, *parent_rate);
+		return ret;
 
-	round = __pll_params_to_rate(*parent_rate, m, n, 0, pll);
+	round = __pll_params_to_rate(req->best_parent_rate, m, n, 0, pll);
 
-	if (!MESON_PARM_APPLICABLE(&pll->frac) || rate == round)
-		return round;
+	if (!MESON_PARM_APPLICABLE(&pll->frac) || req->rate == round) {
+		req->rate = round;
+		return 0;
+	}
 
 	/*
 	 * The rate provided by the setting is not an exact match, let's
 	 * try to improve the result using the fractional parameter
 	 */
-	frac = __pll_params_with_frac(rate, *parent_rate, m, n, pll);
+	frac = __pll_params_with_frac(req->rate, req->best_parent_rate, m, n, pll);
+	req->rate = __pll_params_to_rate(req->best_parent_rate, m, n, frac, pll);
 
-	return __pll_params_to_rate(*parent_rate, m, n, frac, pll);
+	return 0;
 }
 
 static int meson_clk_pll_wait_lock(struct clk_hw *hw)
@@ -419,7 +423,7 @@ static int meson_clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
  */
 const struct clk_ops meson_clk_pcie_pll_ops = {
 	.recalc_rate	= meson_clk_pll_recalc_rate,
-	.round_rate	= meson_clk_pll_round_rate,
+	.determine_rate	= meson_clk_pll_determine_rate,
 	.is_enabled	= meson_clk_pll_is_enabled,
 	.enable		= meson_clk_pcie_pll_enable,
 	.disable	= meson_clk_pll_disable
@@ -429,7 +433,7 @@ EXPORT_SYMBOL_GPL(meson_clk_pcie_pll_ops);
 const struct clk_ops meson_clk_pll_ops = {
 	.init		= meson_clk_pll_init,
 	.recalc_rate	= meson_clk_pll_recalc_rate,
-	.round_rate	= meson_clk_pll_round_rate,
+	.determine_rate	= meson_clk_pll_determine_rate,
 	.set_rate	= meson_clk_pll_set_rate,
 	.is_enabled	= meson_clk_pll_is_enabled,
 	.enable		= meson_clk_pll_enable,
-- 
2.31.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
