Return-Path: <SRS0=Y5gA=R4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B075BC43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 11:12:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8081220863
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 11:12:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hLlnbIwP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="r3pB7Xyg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8081220863
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pAZIspwSxd4VFqso0zSp1lLIDyaifidqvQEcV1gYmI8=; b=hLlnbIwP6ThOJO
	wK3nwN0d5owz/BVxg35MD3bmUYYIDj5awGYIVWvPGIpktAWFQIU12Xr3EmBEnvyr4HmL+VWurVTHS
	REMV/XBsPimtoW1Tk8xiK/76nbgZjBpTrCpfTWZh6faW3VQf2nNMKVUo3Xueso4hNNvp5eyI9GzUf
	giFFF+JPnTG8/4KD8Fs6DynmUdMj+pSK8jSuMpyF1P3Nms401Gn5FVaxK5SrFEkyuf91k3fFQc3A9
	Ecfgie5WJvma8V4DGDV9uZFQYJA2nVE9wOHx6PJepnvjS9onl9yb+DE3vq5oORLVyPbK54uQEkg4z
	2LLmtwifKoFpICl7cCtw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8NWi-00070O-Iw; Mon, 25 Mar 2019 11:12:24 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8NWZ-0006wo-W9
 for linux-amlogic@lists.infradead.org; Mon, 25 Mar 2019 11:12:22 +0000
Received: by mail-wm1-x343.google.com with SMTP id a188so8550962wmf.3
 for <linux-amlogic@lists.infradead.org>; Mon, 25 Mar 2019 04:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qSTs5pvYtXziAiN+RG5xFnEp9XYC2fpG75vZzF22hfs=;
 b=r3pB7Xygzu97DmUwohN4so1YlPfsLTJ88ye6r8Q2iVezfT/WFu9hwCEU1PXM1tjKII
 PxuYgGCi4bDjes2TRQ4hQQHItbg62/GmXe9EKrvRDG1PArBeWJaO7zjKj4AyUao8kS2o
 wkdmW4+IaPU1bd8yO74i685YPAtjkUqGMBwqDwNCHtKDFtvbKsmZ0OfmlWU8bNx025Md
 G0IFYc1IrmdqROt6L2exGp7vHh1pHrosX/x7TGxpWzh+AOWsCWXlN5n2Oz9b3HqKNLOm
 ltljs3l5jY4xRBTlvZiWcD+AVvy0QMgnAl1+aP34cu+46Qkn6UUH4H6lUw1yILBgWxCG
 OlUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qSTs5pvYtXziAiN+RG5xFnEp9XYC2fpG75vZzF22hfs=;
 b=sQ92dSppmuyRLvxILV/aDCihCdGUC9eqeCyH9LfugaZZV8KF6MkY+VzZQtKu6j+Na/
 KNgQuxzLpqNrcSinUGcOzR87bVXHuvRjNzH3MKb6hj4YDaUJR1h5Mr9I/RIUHA/DzPyd
 VeUEq6ONqpnUCCxKFEUYvHnTyiBuksSdUSB83fyY+RBTaVvgeZGJtbnkUBwd+1y8JddC
 bIc6Ld15MI/tDG6+3zvfCtzPe5z2Pv+lxCqzoKyo1H0wn2oqqbWt8FPZ7Vr67w4i+haK
 71SiUklwYSh04+OWpgJZMnw3CSM3IXQDJdglEXVKGx/rkaNNk/iKNxJY3lY9s0RtPiv4
 MZAg==
X-Gm-Message-State: APjAAAXbysYja7M8e4F4qFNUrmuqIZcSF6OOKcGHu3DC+fqWasPhSKje
 zw5urWFGLx+xd+805i758EP4QA==
X-Google-Smtp-Source: APXvYqwbT8APELDi6g2qSkQz94txZgo1z92evuBUYL68fQZejF9n6rSg43J6ivlL4CwiNuv+RYquIA==
X-Received: by 2002:a7b:cd9a:: with SMTP id y26mr5392149wmj.31.1553512330909; 
 Mon, 25 Mar 2019 04:12:10 -0700 (PDT)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id
 n188sm15134301wme.13.2019.03.25.04.12.09
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 25 Mar 2019 04:12:10 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 2/4] clk: meson: g12a: add mpll register init sequences
Date: Mon, 25 Mar 2019 12:11:58 +0100
Message-Id: <20190325111200.15940-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190325111200.15940-1-jbrunet@baylibre.com>
References: <20190325111200.15940-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_041216_034721_8331CD05 
X-CRM114-Status: UNSURE (   9.02  )
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
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
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
index d3f53a9b97dc..6a01f8fd8114 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -577,6 +577,10 @@ static struct clk_fixed_factor g12a_mpll_prediv = {
 	},
 };
 
+static const struct reg_sequence g12a_mpll0_init_regs[] = {
+	{ .reg = HHI_MPLL_CNTL2,	.def = 0x40000033 },
+};
+
 static struct clk_regmap g12a_mpll0_div = {
 	.data = &(struct meson_clk_mpll_data){
 		.sdm = {
@@ -600,6 +604,8 @@ static struct clk_regmap g12a_mpll0_div = {
 			.width	 = 1,
 		},
 		.lock = &meson_clk_lock,
+		.init_regs = g12a_mpll0_init_regs,
+		.init_count = ARRAY_SIZE(g12a_mpll0_init_regs),
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "mpll0_div",
@@ -623,6 +629,10 @@ static struct clk_regmap g12a_mpll0 = {
 	},
 };
 
+static const struct reg_sequence g12a_mpll1_init_regs[] = {
+	{ .reg = HHI_MPLL_CNTL4,	.def = 0x40000033 },
+};
+
 static struct clk_regmap g12a_mpll1_div = {
 	.data = &(struct meson_clk_mpll_data){
 		.sdm = {
@@ -646,6 +656,8 @@ static struct clk_regmap g12a_mpll1_div = {
 			.width	 = 1,
 		},
 		.lock = &meson_clk_lock,
+		.init_regs = g12a_mpll1_init_regs,
+		.init_count = ARRAY_SIZE(g12a_mpll1_init_regs),
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "mpll1_div",
@@ -669,6 +681,10 @@ static struct clk_regmap g12a_mpll1 = {
 	},
 };
 
+static const struct reg_sequence g12a_mpll2_init_regs[] = {
+	{ .reg = HHI_MPLL_CNTL6,	.def = 0x40000033 },
+};
+
 static struct clk_regmap g12a_mpll2_div = {
 	.data = &(struct meson_clk_mpll_data){
 		.sdm = {
@@ -692,6 +708,8 @@ static struct clk_regmap g12a_mpll2_div = {
 			.width	 = 1,
 		},
 		.lock = &meson_clk_lock,
+		.init_regs = g12a_mpll2_init_regs,
+		.init_count = ARRAY_SIZE(g12a_mpll2_init_regs),
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "mpll2_div",
@@ -715,6 +733,10 @@ static struct clk_regmap g12a_mpll2 = {
 	},
 };
 
+static const struct reg_sequence g12a_mpll3_init_regs[] = {
+	{ .reg = HHI_MPLL_CNTL8,	.def = 0x40000033 },
+};
+
 static struct clk_regmap g12a_mpll3_div = {
 	.data = &(struct meson_clk_mpll_data){
 		.sdm = {
@@ -738,6 +760,8 @@ static struct clk_regmap g12a_mpll3_div = {
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
