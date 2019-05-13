Return-Path: <SRS0=LN9z=TN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E0F0C04AAA
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 May 2019 12:31:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00E2A2146F
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 May 2019 12:31:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="S4jBwM4x";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="b8POFUNt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00E2A2146F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=imgASQi9mufoklKIPsdM5O78S3t8Nj9B5Bwc9BQPEDE=; b=S4jBwM4xRN8arA
	TJLoXj8rUg4MgKbWbS3SnCK/qVCPeutDbCiko4xxapEad0BSBBwtvrOSfwyRS3nNOR4rIEzaAxHKT
	K9hP/kLj4BfWke+rKILbMRdcY+sUC9HNJFwD5HdAdLlj3o0irY93U7lWLfWiCjTFx3wuVNs2SBHdp
	2GGLHgp/4nnEXVfdHEa8OpqszjsD9DabDMz3U2X+lBxqofr1ywOMA7xenCN/EWU/787GDB6LTFroz
	+uWLTpg64zOxGCTLxCcrvCi7+eVwvfIGtJ0A6H36W2Vjzwnd0jU7IoPJwbJ+/TtwO0mC3BbHRuDRr
	Urri1gQ3g222yLDlIi+A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQA7C-0007UR-IX; Mon, 13 May 2019 12:31:34 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQA76-0007Mk-P4
 for linux-amlogic@lists.infradead.org; Mon, 13 May 2019 12:31:30 +0000
Received: by mail-wr1-x441.google.com with SMTP id d12so15023394wrm.8
 for <linux-amlogic@lists.infradead.org>; Mon, 13 May 2019 05:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4iwsD3U3np8IEFD+xTq9Et1jrPwGjexYK1TesQwMIZ0=;
 b=b8POFUNthuvdlpyMAvkz/XPAZYSPESkYHVHrRsGD/I32mzJ09+S9i3Ktn/Iqf0CN5e
 eXNw9ANuWYo8/i8SL0pEagFcNTCv93/n0ORqEmb5I2K2xaCNEU/d2yjQks/B/8wSDyAW
 /r18vTn6m5K+nQoLd5zViswByZF48gxxHIgU5HBH6NH1amFjBFP1R9vqLwMaM/oIVYyg
 10xxLLdLF0O/ejD3lGhw/7YDhCE9sKJviaNDyJaxML+EgtQH5MJwIOkMAv1JljUI9q2b
 LzuvBa77ygJMnX/ZnUmOeXkHAU9bXme+N9/WDu9099QCMnn6M9DzKZnT4kR5OWheER7j
 WfPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4iwsD3U3np8IEFD+xTq9Et1jrPwGjexYK1TesQwMIZ0=;
 b=XsxOQKREcxiSdCLFdOQN8wC7hCX730HD9Ij4NqyWA1PJCsNtF747x62Dl8Z7HJFpli
 sDD4ubUF/XloKwIzRMfIJaC+iFmPCpGxA/aLe1rnGn2VTaT/0Tg+hWiWlZKVG4x5a/6E
 3A/bO3AylSq0z7LnmHyxiTVU4tPQFrmHDVDh77RQLqbNuO6QfwLuOj5VP8L+h5F9j+Vi
 t1sL4Znuvr8vEfQ1QqmGdbkVgciIKnd52RvhiTVPmtQuVG8eopYVPoeWZlsrlnY2dd0/
 leoMvb6u7ukrdtQtKRYliqhGp3X+bu8KofBOayd3Zp4VZK+BOm5xhiPfXVGYQHb/bOcz
 WMkQ==
X-Gm-Message-State: APjAAAWlvSkgiIZ+hg3Ybwvr3pSOiiwmTUx8UYSD5jnj+HqZyRKnH8Ac
 3hH2EUDocIijSnbzo7Xy6YTSUlxjO2k=
X-Google-Smtp-Source: APXvYqzbRgH8TxkyaTtXi+U2BxwbBAXcKGSfcjnlnf1UOwMIO+s/0Olaj1fC2ez7G+vkB7d/5d63Ng==
X-Received: by 2002:adf:dece:: with SMTP id i14mr18177889wrn.138.1557750687429; 
 Mon, 13 May 2019 05:31:27 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id t13sm16175584wra.81.2019.05.13.05.31.26
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 13 May 2019 05:31:26 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v2 4/7] clk: meson: mpll: add init callback and regs
Date: Mon, 13 May 2019 14:31:12 +0200
Message-Id: <20190513123115.18145-5-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190513123115.18145-1-jbrunet@baylibre.com>
References: <20190513123115.18145-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190513_053128_812782_78625054 
X-CRM114-Status: GOOD (  15.83  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Until now (gx and axg), the mpll setting on boot (whatever the
bootloader) was good enough to generate a clean fractional division.

It is not the case on the g12a. While moving away from the vendor u-boot,
it was noticed the fractional part of the divider was no longer applied.
Like on the pll, some magic settings need to applied on the mpll
register.

This change adds the ability to do that on the mpll driver.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/clk-mpll.c | 35 ++++++++++++++++++++++++-----------
 drivers/clk/meson/clk-mpll.h |  2 ++
 2 files changed, 26 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/meson/clk-mpll.c b/drivers/clk/meson/clk-mpll.c
index d3f42e086431..2d39a8bc367c 100644
--- a/drivers/clk/meson/clk-mpll.c
+++ b/drivers/clk/meson/clk-mpll.c
@@ -115,8 +115,30 @@ static int mpll_set_rate(struct clk_hw *hw,
 	else
 		__acquire(mpll->lock);
 
-	/* Enable and set the fractional part */
+	/* Set the fractional part */
 	meson_parm_write(clk->map, &mpll->sdm, sdm);
+
+	/* Set the integer divider part */
+	meson_parm_write(clk->map, &mpll->n2, n2);
+
+	if (mpll->lock)
+		spin_unlock_irqrestore(mpll->lock, flags);
+	else
+		__release(mpll->lock);
+
+	return 0;
+}
+
+static void mpll_init(struct clk_hw *hw)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct meson_clk_mpll_data *mpll = meson_clk_mpll_data(clk);
+
+	if (mpll->init_count)
+		regmap_multi_reg_write(clk->map, mpll->init_regs,
+				       mpll->init_count);
+
+	/* Enable the fractional part */
 	meson_parm_write(clk->map, &mpll->sdm_en, 1);
 
 	/* Set spread spectrum if possible */
@@ -126,19 +148,9 @@ static int mpll_set_rate(struct clk_hw *hw,
 		meson_parm_write(clk->map, &mpll->ssen, ss);
 	}
 
-	/* Set the integer divider part */
-	meson_parm_write(clk->map, &mpll->n2, n2);
-
 	/* Set the magic misc bit if required */
 	if (MESON_PARM_APPLICABLE(&mpll->misc))
 		meson_parm_write(clk->map, &mpll->misc, 1);
-
-	if (mpll->lock)
-		spin_unlock_irqrestore(mpll->lock, flags);
-	else
-		__release(mpll->lock);
-
-	return 0;
 }
 
 const struct clk_ops meson_clk_mpll_ro_ops = {
@@ -151,6 +163,7 @@ const struct clk_ops meson_clk_mpll_ops = {
 	.recalc_rate	= mpll_recalc_rate,
 	.round_rate	= mpll_round_rate,
 	.set_rate	= mpll_set_rate,
+	.init		= mpll_init,
 };
 EXPORT_SYMBOL_GPL(meson_clk_mpll_ops);
 
diff --git a/drivers/clk/meson/clk-mpll.h b/drivers/clk/meson/clk-mpll.h
index 0f948430fed4..a991d568c43a 100644
--- a/drivers/clk/meson/clk-mpll.h
+++ b/drivers/clk/meson/clk-mpll.h
@@ -18,6 +18,8 @@ struct meson_clk_mpll_data {
 	struct parm n2;
 	struct parm ssen;
 	struct parm misc;
+	const struct reg_sequence *init_regs;
+	unsigned int init_count;
 	spinlock_t *lock;
 	u8 flags;
 };
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
