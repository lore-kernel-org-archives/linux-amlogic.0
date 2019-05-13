Return-Path: <SRS0=LN9z=TN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5167BC04AB1
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 May 2019 12:31:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24A9B2146F
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 May 2019 12:31:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Pt1KqTeK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="uWHt3xtL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24A9B2146F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vIZS96gpszRQypTehSQvPdNyCysgZ067BEuP3ku04c4=; b=Pt1KqTeKirA2zy
	wmwmmdCP5S25q2GT6AD6NSugBrW61oYw/1pImhh4HTlIuGEBu6p6uZcHbOmmhEXvmPYLMu20xcDdv
	/BVzfrYkihtr1DcD7fxPnwVE0nmJG8rLL0Tu4kh2HKeL35XqGYlxwC1hdQ/A7P/9lLANJWrWMlAxx
	07WuzdU2vRCxkmHhEEwdYXkB3ArNA6GrPq2OD1m04RNcBSEmQAis6rny3ythfXIasBKh/lb+/wzjh
	zMh/5zGvNyzPrqsUJjxoz2nHJ28zY3CL7MpE8b7PtxRHtU5L+y+MgEd07HKdk7TVME3BVJ3ZubelT
	SRVeBtiBg/964/30KVYA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQA7F-0007ZO-Qd; Mon, 13 May 2019 12:31:37 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQA78-0007Na-4F
 for linux-amlogic@lists.infradead.org; Mon, 13 May 2019 12:31:32 +0000
Received: by mail-wm1-x341.google.com with SMTP id o189so13709673wmb.1
 for <linux-amlogic@lists.infradead.org>; Mon, 13 May 2019 05:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pdGNE3efspU2W+dukA5SOqgLjvxWYgLtfHeCCZw+vxg=;
 b=uWHt3xtLWXxZD51SfbvUje5CiKhbokXP41QIxuUjYAjnWDlsEw04aeT04nuOYHjM0Z
 FG2IT9PSXrbBDOlYe9yJ1qiTA2h3hA1Hl75/pEXNCnrxohtH41sh2eXvhUgWwTGNWiyJ
 V8alRsggbL8HsVxjO6HLvJkTIbtkSbMkuPrzLHCDA7NYWbBX5H+rrCRt8/GyNrNpZGdl
 mOznOMZaa/wDZk+YevG8ngfEQcQ8hwHF9teT63WxbnbLncpVGl3Ghkx47iP0JY6tvHjS
 JbLcxHy/1rsxL3nmCjgq78hdzzLjqfehgnjs5MauetJ2vaR129ZC7HBMXrdgwIrLqlln
 IGmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pdGNE3efspU2W+dukA5SOqgLjvxWYgLtfHeCCZw+vxg=;
 b=Luq/yT6FrEuGhYhR4uxj/uYwl1vLkfQ0kMuCTlcg1erD2skR2Y5/pHFgPKYWGq6YJg
 yBL2261sm7W0uFzsYGB9HsjLjTLca7TNNud8seZMSf6swl/Vn+Acmjd72FOEKmWmZ4ba
 o4XFzeMWwSQBJ8plHe5ALQ6FLjZz1EEWvNNKlkUYjK+HRwtNPU1bE/tT6JnJsZQTvdo3
 EVrKVNml4OhPDCsNWJZrkSEsXgL7FcRQdtqFqrGufOhm+7d6wXt2shYDWm5mFURzR2EA
 W2j+wF9Jlf9iDvbD+B0zDy5ONmIBF/8bY4w/9Ldv8wQe1Rtuh6UCHyZJdSgrMvFErGsX
 t7oA==
X-Gm-Message-State: APjAAAWpVXdyKq0cRPbcc4ElXJCx5BFrJEXhlfqzGvV+T60EBSQUR4Lk
 E+yjHxHNvjVoSGd9dWnBrlj3+g==
X-Google-Smtp-Source: APXvYqxPFUsw4Pichrq3VBDvd5jo6Vj9rOkVj+suMGVecjhE9VYq2RaJAQ9yjDygOUMEWHNrqTmtHQ==
X-Received: by 2002:a1c:a695:: with SMTP id
 p143mr15862015wme.128.1557750688475; 
 Mon, 13 May 2019 05:31:28 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id t13sm16175584wra.81.2019.05.13.05.31.27
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 13 May 2019 05:31:27 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v2 5/7] clk: meson: g12a: add mpll register init sequences
Date: Mon, 13 May 2019 14:31:13 +0200
Message-Id: <20190513123115.18145-6-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190513123115.18145-1-jbrunet@baylibre.com>
References: <20190513123115.18145-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190513_053130_426680_55472E25 
X-CRM114-Status: UNSURE (   9.46  )
X-CRM114-Notice: Please train this message.
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

Add the required init of each MPLL of the g12a.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/g12a.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index d11606d5ddbd..ef1d2e4c8fd2 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -1001,6 +1001,10 @@ static struct clk_fixed_factor g12a_mpll_prediv = {
 	},
 };
 
+static const struct reg_sequence g12a_mpll0_init_regs[] = {
+	{ .reg = HHI_MPLL_CNTL2,	.def = 0x40000033 },
+};
+
 static struct clk_regmap g12a_mpll0_div = {
 	.data = &(struct meson_clk_mpll_data){
 		.sdm = {
@@ -1024,6 +1028,8 @@ static struct clk_regmap g12a_mpll0_div = {
 			.width	 = 1,
 		},
 		.lock = &meson_clk_lock,
+		.init_regs = g12a_mpll0_init_regs,
+		.init_count = ARRAY_SIZE(g12a_mpll0_init_regs),
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "mpll0_div",
@@ -1047,6 +1053,10 @@ static struct clk_regmap g12a_mpll0 = {
 	},
 };
 
+static const struct reg_sequence g12a_mpll1_init_regs[] = {
+	{ .reg = HHI_MPLL_CNTL4,	.def = 0x40000033 },
+};
+
 static struct clk_regmap g12a_mpll1_div = {
 	.data = &(struct meson_clk_mpll_data){
 		.sdm = {
@@ -1070,6 +1080,8 @@ static struct clk_regmap g12a_mpll1_div = {
 			.width	 = 1,
 		},
 		.lock = &meson_clk_lock,
+		.init_regs = g12a_mpll1_init_regs,
+		.init_count = ARRAY_SIZE(g12a_mpll1_init_regs),
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "mpll1_div",
@@ -1093,6 +1105,10 @@ static struct clk_regmap g12a_mpll1 = {
 	},
 };
 
+static const struct reg_sequence g12a_mpll2_init_regs[] = {
+	{ .reg = HHI_MPLL_CNTL6,	.def = 0x40000033 },
+};
+
 static struct clk_regmap g12a_mpll2_div = {
 	.data = &(struct meson_clk_mpll_data){
 		.sdm = {
@@ -1116,6 +1132,8 @@ static struct clk_regmap g12a_mpll2_div = {
 			.width	 = 1,
 		},
 		.lock = &meson_clk_lock,
+		.init_regs = g12a_mpll2_init_regs,
+		.init_count = ARRAY_SIZE(g12a_mpll2_init_regs),
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "mpll2_div",
@@ -1139,6 +1157,10 @@ static struct clk_regmap g12a_mpll2 = {
 	},
 };
 
+static const struct reg_sequence g12a_mpll3_init_regs[] = {
+	{ .reg = HHI_MPLL_CNTL8,	.def = 0x40000033 },
+};
+
 static struct clk_regmap g12a_mpll3_div = {
 	.data = &(struct meson_clk_mpll_data){
 		.sdm = {
@@ -1162,6 +1184,8 @@ static struct clk_regmap g12a_mpll3_div = {
 			.width	 = 1,
 		},
 		.lock = &meson_clk_lock,
+		.init_regs = g12a_mpll3_init_regs,
+		.init_count = ARRAY_SIZE(g12a_mpll3_init_regs),
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "mpll3_div",
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
