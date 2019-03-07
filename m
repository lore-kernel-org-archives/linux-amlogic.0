Return-Path: <SRS0=Nbbq=RK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0952C43381
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Mar 2019 14:15:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E5DF20835
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Mar 2019 14:15:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="V0gqd/t1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="gdtYuN9Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E5DF20835
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vvlKLdGM5no0MrEks02lekubSE43U2mLjE6Oc/4ZwZA=; b=V0gqd/t1jvKo13
	qLoZ4/MagBwXLLLRazTAuhyV8HdS7FXnPT6ybR9691cKzjGOa/HPVMihVpyCyJxOd8ay7Auesi8JX
	2dzAZyBbKFsRsAE4s5AHJksjxbQ44Mmsyfa2gDCIaziHO3vcskhr8QAvzas2ns6/uTPv/mvzSbq51
	ujqVhNjhSEdr5BP5zhbTEiYcOTSG+iRffH84moO8PdpqDt3PItgu+m626JL1qUXVIIW3RMzvPuM7a
	qgL7r1Q7NnHI03wPZMNOfFKjGg3olzXzirDSkci3nKvw6NCUsYBpXLOalOIkyiSGGg96voGc43+7t
	bBBm+IBoQjG0YBQ/mHqQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h1tnn-0002Si-Tc; Thu, 07 Mar 2019 14:15:15 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h1tnX-0000zw-Rj
 for linux-amlogic@lists.infradead.org; Thu, 07 Mar 2019 14:15:01 +0000
Received: by mail-wr1-x442.google.com with SMTP id l12so1153094wrp.6
 for <linux-amlogic@lists.infradead.org>; Thu, 07 Mar 2019 06:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6xv40rDikhpGj1gO+S5PFI70OqXKcih9FYV8He3Os+U=;
 b=gdtYuN9ZjvzhNAHkBVQiTohpzwLRLXb3p4HybLzFzTj9g69tpeYIYGLqlaR2nPKnXY
 JbaPCdZwaYN4VckyAgm9advhTTKTi4radONdytGWX6sf33nrw4HY5xMJKocjQJYThxY4
 awrdLTJg+HspXIPMg8K9DbsZWTuK4CW+KsgaghB05bbp0Z6CDcPUvao2pJE0tQ9etYTG
 06Qr1b28YtJCktq53t239Fl6QN0y1QdyOBdaQzEETKV2viTK3doLE5FG9WcQmGeMWx07
 lMLeaoUvr8tCGZ35u8YV4dAfYLjdeViyILVZNrSDKUB/F9a+9jE8J2ur1g8GS1t2K+bZ
 ea1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6xv40rDikhpGj1gO+S5PFI70OqXKcih9FYV8He3Os+U=;
 b=OHY8sNsSvwYL8/C10Z6Uopzb2LMOXTeq7/4MAro+ih9r18haaCoNi7McnK0xjrNNno
 5rCT2PgvlygIpIlJhHAZQRZ6QbbrDKkphLzhIPgQNF6M77vK54uXVpSOKlDSxgG6pScs
 qt7B+PETzSksLndmr4fiNFwf/S+6OsMuroTtxrks+7807GYEv4n28fx3Oqj/usOey7ql
 m92hY2viJylTWu/ZQDThGeIiNyQmhdGvTulkiDFIl1sSj5WnOxy1nFWnFGcf+M+Psv6X
 WT5SFQlbh89l2zUMW+RO181zik6q7yODqcl4DIn+QMJo/ezd0XM9gXY/m8z7nMfSwOn5
 WPwQ==
X-Gm-Message-State: APjAAAV/POcQrEqTe2pRzJD2Dd/0KGlEfmAowPPV3OT8bzjqcAkghh1o
 HREphMmFtvz3FYaD1zl2bId4Ig==
X-Google-Smtp-Source: APXvYqy+AuFiNJYSmMvWEPg7Pi/wMomf0boO0z0jA8J7VfuGSwtbXOlRqPiMtY+z0E3SxcqpOM8JeA==
X-Received: by 2002:a5d:6744:: with SMTP id l4mr2398130wrw.226.1551968098338; 
 Thu, 07 Mar 2019 06:14:58 -0800 (PST)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id h9sm9679304wrv.11.2019.03.07.06.14.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 07 Mar 2019 06:14:57 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com
Subject: [PATCH 1/3] clk: meson-pll: add reduced specific clk_ops for G12A
 PCIe PLL
Date: Thu,  7 Mar 2019 15:14:53 +0100
Message-Id: <20190307141455.23879-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190307141455.23879-1-narmstrong@baylibre.com>
References: <20190307141455.23879-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190307_061459_894481_7E71B552 
X-CRM114-Status: GOOD (  12.67  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Meson G12A PCIE PLL is fined tuned to deliver a very precise
100MHz reference clock for the PCIe Analog PHY, and thus requires
a strict register sequence to enable the PLL.
To simplify, use the _init() op to enable the PLL and keep
the other ops except set_rate since the rate is fixed.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/clk/meson/clk-pll.c | 26 ++++++++++++++++++++++++++
 drivers/clk/meson/clk-pll.h |  1 +
 2 files changed, 27 insertions(+)

diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
index 41e16dd7272a..6a88dd75ccf0 100644
--- a/drivers/clk/meson/clk-pll.c
+++ b/drivers/clk/meson/clk-pll.c
@@ -303,6 +303,16 @@ static int meson_clk_pll_is_enabled(struct clk_hw *hw)
 	return 1;
 }
 
+static int meson_clk_pcie_pll_enable(struct clk_hw *hw)
+{
+	meson_clk_pll_init(hw);
+
+	if (meson_clk_pll_wait_lock(hw))
+		return -EIO;
+
+	return 0;
+}
+
 static int meson_clk_pll_enable(struct clk_hw *hw)
 {
 	struct clk_regmap *clk = to_clk_regmap(hw);
@@ -387,6 +397,22 @@ static int meson_clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 	return 0;
 }
 
+/*
+ * The Meson G12A PCIE PLL is fined tuned to deliver a very precise
+ * 100MHz reference clock for the PCIe Analog PHY, and thus requires
+ * a strict register sequence to enable the PLL.
+ * To simplify, re-use the _init() op to enable the PLL and keep
+ * the other ops except set_rate since the rate is fixed.
+ */
+const struct clk_ops meson_clk_pcie_pll_ops = {
+	.recalc_rate	= meson_clk_pll_recalc_rate,
+	.round_rate	= meson_clk_pll_round_rate,
+	.is_enabled	= meson_clk_pll_is_enabled,
+	.enable		= meson_clk_pcie_pll_enable,
+	.disable	= meson_clk_pll_disable
+};
+EXPORT_SYMBOL_GPL(meson_clk_pcie_pll_ops);
+
 const struct clk_ops meson_clk_pll_ops = {
 	.init		= meson_clk_pll_init,
 	.recalc_rate	= meson_clk_pll_recalc_rate,
diff --git a/drivers/clk/meson/clk-pll.h b/drivers/clk/meson/clk-pll.h
index 55af2e285b1b..367efd0f6410 100644
--- a/drivers/clk/meson/clk-pll.h
+++ b/drivers/clk/meson/clk-pll.h
@@ -45,5 +45,6 @@ struct meson_clk_pll_data {
 
 extern const struct clk_ops meson_clk_pll_ro_ops;
 extern const struct clk_ops meson_clk_pll_ops;
+extern const struct clk_ops meson_clk_pcie_pll_ops;
 
 #endif /* __MESON_CLK_PLL_H */
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
