Return-Path: <SRS0=8AZD=GH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64DC3C433E6
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Jan 2021 13:29:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECA79207AE
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Jan 2021 13:29:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECA79207AE
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rAXs5EYrP1Wx/sV90dA/PoER+8yKtGinZ0Fycle368g=; b=PDjhcBNvITkXokLRx4bkOCWP6
	75n4iT4MCJexou0reVONFQOchx+Jbg9DOl4bLxcrO1J5WKZbCgeRy2TTUPvKX+5s2IoCE5xTXSwCx
	x4kctF5k9u6yOFVW6aU4upvJXScktLYADxEcgtikhsaezCDdFQkabG1JbLeHjVQaYSInyS+mWIh0R
	PbrK2CgHBSLvjy2flD4bwiwQtzl8lX0pg/fjdALrkPxGg94FvckaMEHeSt7aak/1UlBQm3G4npQZM
	G0hI2AmyvpJxVFui/r5OYT+eW97y4wKxb7zTdPdQ8fA5LMifSh0L6cDxK2LRYB9A0IWKt/B2A1zvF
	MneUCyOQQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwPvU-0007CM-4I; Mon, 04 Jan 2021 13:29:36 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwPvB-00073n-7J; Mon, 04 Jan 2021 13:29:22 +0000
Received: by mail-wm1-x333.google.com with SMTP id r4so19288154wmh.5;
 Mon, 04 Jan 2021 05:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eG1xGDdg+wVn6kBQHz9xXAfAxIcsHz4S2Cf7VpGA6MY=;
 b=JwU/JaI2mt7vyQnZwF1uRoiSIij1S0clOARve6g/26V0ruwEIIWim3n0HKxM6zL5Hq
 5yg1T3X0RxdZpIdAnegcX9Wkywc64fJEo0oa8aVxPGIwNNywPfi+9ANJE5EL0mXG7tZ+
 jLS83lpdEGGstdDWN6VwMMCPpUORmahsP4SQThK7MrcVMVC0tKQ7xIx//Kn1Gatr26X5
 qMOcEIEH/bRhyOZqiWdXOaNcOhrJ24Ewq+elnXai0XbONk8gdlWNdhzDzveAyApQJIdM
 IObhsKQE4yeGMHOFJlLVLZ2nqo5bz82hjYXeRbUUfZrppCvF6f5XYs9jNC/HDzjvP3x1
 NFgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eG1xGDdg+wVn6kBQHz9xXAfAxIcsHz4S2Cf7VpGA6MY=;
 b=fghujWTDYNXv8kHgK7m01sIz7GfESK6rCTZtDNDushpWUpxgLpHdl9mKl86BPyrxeO
 74OfbEZRPrcPrhM9/tcTMrQ9XtExXvRv9AM6/1UhYyHjNpkDhEuf1eQGCth7ctvRoE7k
 kHs+tEytrFK7QkP5/WwUlt41SXCkelzfg31QsLDCgLUmnczqStx/GxSg/1X1yrmvgbxW
 7yEPZLjVn1iZgegB2FyC9fPgY1cUPSUaJv6v7gPyUyklzwnPvik4RXVjNmFPy3g5a/dl
 +1/mBs/lX398rYjwgDobBeJ/W0Bce5HeWrrp2WTJDJAetLvkLE7gNw0ltUzJB4KPC7WR
 F0PA==
X-Gm-Message-State: AOAM531njdIJLnR20ciw7J7VSgCgz4EOiY31dMFQQUCPq0VtNJNEdN22
 SL5LgrVPV0bUuQEh32CvoOw=
X-Google-Smtp-Source: ABdhPJz10OScIcWsisjFbhe0vAj1ffZY2RyCYyFfttGsKIoZ4R3v0ipEAKM637NRGBtoluBUf0650g==
X-Received: by 2002:a1c:f70c:: with SMTP id v12mr25365543wmh.77.1609766955742; 
 Mon, 04 Jan 2021 05:29:15 -0800 (PST)
Received: from localhost.localdomain
 (p200300f13724fd00428d5cfffeb99db8.dip0.t-ipconnect.de.
 [2003:f1:3724:fd00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id c4sm99916521wrw.72.2021.01.04.05.29.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jan 2021 05:29:15 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: jbrunet@baylibre.com,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 4/5] clk: meson: meson8b: add the HDMI PLL M/N parameters
Date: Mon,  4 Jan 2021 14:28:05 +0100
Message-Id: <20210104132806.720558-5-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210104132806.720558-1-martin.blumenstingl@googlemail.com>
References: <20210104132806.720558-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_082917_345478_3FBF2CCA 
X-CRM114-Status: GOOD (  14.20  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: sboyd@kernel.org, mturquette@baylibre.com, linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

These values are taken from the endlessm 3.10 kernel which includes some
additional M/N combinations for some VESA and 75Hz display modes.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/meson/meson8b.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index 1ae771bac4a5..8061c11389a9 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -118,6 +118,28 @@ static struct clk_regmap meson8b_fixed_pll = {
 	},
 };
 
+static const struct pll_params_table hdmi_pll_params_table[] = {
+	PLL_PARAMS(34, 1),
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
@@ -150,6 +172,7 @@ static struct clk_regmap meson8b_hdmi_pll_dco = {
 			.shift   = 29,
 			.width   = 1,
 		},
+		.table = hdmi_pll_params_table,
 	},
 	.hw.init = &(struct clk_init_data){
 		/* sometimes also called "HPLL" or "HPLL PLL" */
-- 
2.30.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
