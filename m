Return-Path: <SRS0=A3X0=MF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCF32C07E95
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Jul 2021 23:26:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8486A61363
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Jul 2021 23:26:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8486A61363
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6A3sk4Rd1tEUrVXPfMcfhvtOsk2NAwKG1vB4baOSovo=; b=2bXq+eeQtfTMPl
	YsqTt1dnGInVE5mOYjPvVzuFi0C5Aq0txJuKE0niNFxvGJAdbGe8+LhBxY7C+ye7QkHCO6wqBy21+
	T9MaLPUioO+FP6MlijPb4vtU9AWvHeidMKdaSVgZwHn4085KcsW+mLj8NrSAx1vXfxmnU7OvrweFE
	jug9u+vI/Pk2dUolhwD9YC4lx1h5Tr3mKGUF4EQ+TbROK6tthQ5HMxZ3in2GvJLiksF8TDqCmk5OO
	XQCIfP6sF0KFesXl46jodotPJxqCg6Ln0eH19qKk1zZOryzPTGZJS4a8g0/eeBa9gfgJAJt906B4e
	Kb3iAYU4zFb4EpM6YhGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3Rmv-00BbrU-2f; Tue, 13 Jul 2021 23:26:05 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3RmC-00BbXn-UI; Tue, 13 Jul 2021 23:25:22 +0000
Received: by mail-wm1-x32b.google.com with SMTP id
 o30-20020a05600c511eb029022e0571d1a0so224262wms.5; 
 Tue, 13 Jul 2021 16:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nrJy8AHK/eMoKNEana9935MG2OFHXBd4iLiXE078rqM=;
 b=MqMNlGZvFCWJoDGiOyBWk8cuaLbaS9ZVVzThxAMnItmnNYXYKWoDzHLG6CeD5dnTDN
 wtIt6z6CPUOgVsYo2hHPzFq3nqBCWEBdi0U/ijUKqsJX2lEI1NUYb7cpxfM6Ea4w/qbJ
 yIu2ERoxxJTvLQYT0vWFmX/ro4895EJPeoW/QC1aHFoo61SHhvjHlJ48e2COb6Z1ZaeO
 oRfkY8diLLbdp2gCD5q1RdpaYYJPCTwdMdA+dkQxzrEIuZLYB1Yck9iCuv84n8R1A5df
 V5j1t/NcEFX25uxjmzoUpGbm6NAY+Rlz1I1u7TddCzI5ARKLK5Ln7NiHUJkQjdd5MGv9
 vcyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nrJy8AHK/eMoKNEana9935MG2OFHXBd4iLiXE078rqM=;
 b=Ytg17LPZv2GRfymJk/yw255ebMyxSwF5eDJ230qjfQfFyTAdJj8C56VwQmQj/rODGp
 iRuQ16iLPPHzkFwIK7YjVpwPkgUBjsvFSnDLEwMNmdzjP4EGjq/esceABPQn36pJkaY7
 fRD7bryQF/1h9Gv/YFttnhC99tFJRKvhMqrQGm3P0OqC9RVLQp2hB7UCdKQlkQWl2NPC
 6Ae+xbqdKfTbd58MwO02Yiv2pdNWU/iLnT+YK7DYKUeZIL3XISsZJhQebMvDMlLv56Id
 6ydL/LQ1/qI8u6JQnc3eyMPYD/Y58rp8g3fTgNUStHOehuGmDNB9KA2NO4/GH1nYSAfm
 N1fg==
X-Gm-Message-State: AOAM530mF7emNefgiw7kaukbZHxIZeyXoUACFRbTNnWav3EontTqOnKq
 9IDUrv7uJeo+6yz+U9PYFzpCsEF6jQc=
X-Google-Smtp-Source: ABdhPJy0vtt/jzN8eYmaXvrmdL/LH5RbSaen7X/593wZJsexT5Y7x73sJJQ2LQvexSearVkr/4xcmw==
X-Received: by 2002:a05:600c:4e8f:: with SMTP id
 f15mr7912526wmq.174.1626218719597; 
 Tue, 13 Jul 2021 16:25:19 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-2a01-0c23-c041-6f00-f22f-74ff-fe21-0725.c23.pool.telefonica.de.
 [2a01:c23:c041:6f00:f22f:74ff:fe21:725])
 by smtp.googlemail.com with ESMTPSA id o11sm3857390wmc.2.2021.07.13.16.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 16:25:19 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, jbrunet@baylibre.com, narmstrong@baylibre.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 3/6] clk: meson: meson8b: Add the HDMI PLL M/N parameters
Date: Wed, 14 Jul 2021 01:25:07 +0200
Message-Id: <20210713232510.3057750-4-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210713232510.3057750-1-martin.blumenstingl@googlemail.com>
References: <20210713232510.3057750-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210713_162521_079985_E0FDD746 
X-CRM114-Status: GOOD (  13.90  )
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

The 3.10 vendor kernel uses only specific HDMI PLL M/N parameter
combinations. The PLL won't lock for values smaller than 50 if the
internal doubling (which is yet unknown how to use it) is disabled.
However, when this doubling is enabled then the values smaller than 50
will lock just fine. The only restriction for values greater than 50 is
that the resulting frequency must not exceed the 3.0GHz limit.

These values are taken from the endlessm 3.10 kernel which includes
additional M/N combinations for some VESA and 75Hz display modes.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/meson/meson8b.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index 9ccffbfe44e5..8f29d26ed726 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -118,6 +118,27 @@ static struct clk_regmap meson8b_fixed_pll = {
 	},
 };
 
+static const struct pll_params_table hdmi_pll_params_table[] = {
+	PLL_PARAMS(40, 1),
+	PLL_PARAMS(42, 1),
+	PLL_PARAMS(44, 1),
+	PLL_PARAMS(45, 1),
+	PLL_PARAMS(49, 1),
+	PLL_PARAMS(52, 1),
+	PLL_PARAMS(54, 1),
+	PLL_PARAMS(56, 1),
+	PLL_PARAMS(59, 1),
+	PLL_PARAMS(60, 1),
+	PLL_PARAMS(61, 1),
+	PLL_PARAMS(62, 1),
+	PLL_PARAMS(64, 1),
+	PLL_PARAMS(66, 1),
+	PLL_PARAMS(68, 1),
+	PLL_PARAMS(71, 1),
+	PLL_PARAMS(82, 1),
+	{ /* sentinel */ }
+};
+
 static struct clk_regmap meson8b_hdmi_pll_dco = {
 	.data = &(struct meson_clk_pll_data){
 		.en = {
@@ -150,6 +171,7 @@ static struct clk_regmap meson8b_hdmi_pll_dco = {
 			.shift   = 29,
 			.width   = 1,
 		},
+		.table = hdmi_pll_params_table,
 	},
 	.hw.init = &(struct clk_init_data){
 		/* sometimes also called "HPLL" or "HPLL PLL" */
-- 
2.32.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
