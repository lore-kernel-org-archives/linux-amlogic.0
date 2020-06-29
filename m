Return-Path: <SRS0=ciOP=AK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BFFFC433E2
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Jun 2020 20:39:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 283F6206C0
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Jun 2020 20:39:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ndjPIteR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="WstEQ0ZC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 283F6206C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uFQABb37u1L7RTOLpVfpX3SQY1lFuObZDKew8KzPLag=; b=ndjPIteRs0B+elat+LDqxXUKN
	nBtsz/8ME5d6PYnn8ytcZMXHpXSNWh2nkgo2Mv62DGv/T+wJSLRAarH7zeTLigw5VLqqoCtGPZGt9
	o4f1pbfdDJEnpw8ePac60gW302pKpy0kIsaNKBrY/v5q1NhQjUgqXVSEzcdYlFGroHbPEkSIMlt+D
	WPkctrv2sIF7UAkVN/7/qLgDAVhWqUmmLUa+rhYDVrpOLdKphajXWjcBuBKLH6dJlPBMNaRJ6/Q3r
	UKqsIORtK4sdDOLJFcj9xmyIfGdWXh1IL0RsE1AqvtE2dLr8B5m6IjzvVFpeo4zLkFT5CaV3v/xcn
	CmBZovIhQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jq0Yj-0008Uq-Ac; Mon, 29 Jun 2020 20:39:21 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jq0Yd-0008T3-GI; Mon, 29 Jun 2020 20:39:16 +0000
Received: by mail-ed1-x543.google.com with SMTP id dm19so7901651edb.13;
 Mon, 29 Jun 2020 13:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=poNQke3TqFavrhIR2KmYnQgYp3/Q4PYYAnL3w2U1Fyc=;
 b=WstEQ0ZCFTe6AVwEY4lQ0ceOrnu4tWq6DDHc9L5hR/w3HA2u8AXMX8aZ+7Cba7Oh2F
 bbCJ5E9AoEAkyaYuRzcInUk6vH/qW/PpdGmIxKvd3iaMRkhGiVdajbDCI2kmej4+YdFl
 3+ts5h5zy/z3kuNWbUtgsp2xXgEwcdXpkYxCMJgXikO3XXcLpjGl0H5bcsN9w3uF96+N
 WfyNJyVsssHdPkeZb75igiOsQKOZv+GP5XtBIxclZcMXqtDl09hF0pd2PFiIR659cFnD
 UMR7/ZfKqxszh+XORN6c7v7EMe+4M80XN0CTATQYpbGrajIZNj4FvUCkBjIaN9RExDi7
 4agA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=poNQke3TqFavrhIR2KmYnQgYp3/Q4PYYAnL3w2U1Fyc=;
 b=APUVz5665I9bKtfmgkzpz8pBqV8w/B4nXVbizdEbhdArDYmx3Cw6RwjBH7qZK32get
 d83bo62tv1m9UROv1O0Utju4TyTmj4qvNw2EjXjXwMCrJkUmrYetbno75sIrjrH0UDZ7
 7N90sW07aZYJIEIoDAQSnzpPtQySHQPeY6eYDmXCqv61N5OxtDQyJKK+ZsXQc7UfIsjj
 syR/WVFWgscR9B4BL49FbElKl9yofJEi7o2VKUTJsulamdS9ft59DhALA+qIaepcEJlw
 ku+X5ya8OwvUseUWFWx05+xtOXHW0SUeb8IPOXsnWOoh9wKsIIrex4Dps7H1PDrspZDj
 SKjQ==
X-Gm-Message-State: AOAM5311wMdoc2uzIMpVAL7R+NDTEpNF0KhQeRvi/bGzFUddv3hDV6ce
 wVyGzukrJpcOwBkJ1XeAtEKfZJ4V
X-Google-Smtp-Source: ABdhPJylC3E/Pdilit7Sb6j+7EWBbHVVpvb5Q/h2olQFs6bdxsOLf//7n2Nm0rT4KI1L1Mv8lw4Iyg==
X-Received: by 2002:aa7:c407:: with SMTP id j7mr19427153edq.96.1593463152277; 
 Mon, 29 Jun 2020 13:39:12 -0700 (PDT)
Received: from localhost.localdomain
 (p200300f137396800428d5cfffeb99db8.dip0.t-ipconnect.de.
 [2003:f1:3739:6800:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id j24sm706741edp.22.2020.06.29.13.39.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 13:39:11 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: jbrunet@baylibre.com,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 1/2] clk: meson: meson8b: add the vclk_en gate clock
Date: Mon, 29 Jun 2020 22:39:03 +0200
Message-Id: <20200629203904.2989007-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200629203904.2989007-1-martin.blumenstingl@googlemail.com>
References: <20200629203904.2989007-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, narmstrong@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

HHI_VID_CLK_CNTL[19] is documented as CLK_EN0. This description is the
same in the public S912 datasheet and the GXBB driver calls this gate
"vclk". Add this gate clock to the Meson8/Meson8b/Meson8m2 clock
controller because it's needed to make the video output work.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/meson/meson8b.c | 30 +++++++++++++++++++++++++-----
 drivers/clk/meson/meson8b.h |  3 ++-
 2 files changed, 27 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index 3d826711c820..d5b90d61a530 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -1204,6 +1204,22 @@ static struct clk_regmap meson8b_vclk_in_en = {
 	},
 };
 
+static struct clk_regmap meson8b_vclk_en = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = HHI_VID_CLK_CNTL,
+		.bit_idx = 19,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "vclk_en",
+		.ops = &clk_regmap_gate_ro_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_vclk_in_en.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
 static struct clk_regmap meson8b_vclk_div1_gate = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = HHI_VID_CLK_CNTL,
@@ -1213,7 +1229,7 @@ static struct clk_regmap meson8b_vclk_div1_gate = {
 		.name = "vclk_div1_en",
 		.ops = &clk_regmap_gate_ro_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&meson8b_vclk_in_en.hw
+			&meson8b_vclk_en.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
@@ -1227,7 +1243,7 @@ static struct clk_fixed_factor meson8b_vclk_div2_div = {
 		.name = "vclk_div2",
 		.ops = &clk_fixed_factor_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&meson8b_vclk_in_en.hw
+			&meson8b_vclk_en.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
@@ -1257,7 +1273,7 @@ static struct clk_fixed_factor meson8b_vclk_div4_div = {
 		.name = "vclk_div4",
 		.ops = &clk_fixed_factor_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&meson8b_vclk_in_en.hw
+			&meson8b_vclk_en.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
@@ -1287,7 +1303,7 @@ static struct clk_fixed_factor meson8b_vclk_div6_div = {
 		.name = "vclk_div6",
 		.ops = &clk_fixed_factor_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&meson8b_vclk_in_en.hw
+			&meson8b_vclk_en.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
@@ -1317,7 +1333,7 @@ static struct clk_fixed_factor meson8b_vclk_div12_div = {
 		.name = "vclk_div12",
 		.ops = &clk_fixed_factor_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&meson8b_vclk_in_en.hw
+			&meson8b_vclk_en.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
@@ -2820,6 +2836,7 @@ static struct clk_hw_onecell_data meson8_hw_onecell_data = {
 		[CLKID_VID_PLL_FINAL_DIV]   = &meson8b_vid_pll_final_div.hw,
 		[CLKID_VCLK_IN_SEL]	    = &meson8b_vclk_in_sel.hw,
 		[CLKID_VCLK_IN_EN]	    = &meson8b_vclk_in_en.hw,
+		[CLKID_VCLK_EN]		    = &meson8b_vclk_en.hw,
 		[CLKID_VCLK_DIV1]	    = &meson8b_vclk_div1_gate.hw,
 		[CLKID_VCLK_DIV2_DIV]	    = &meson8b_vclk_div2_div.hw,
 		[CLKID_VCLK_DIV2]	    = &meson8b_vclk_div2_div_gate.hw,
@@ -3025,6 +3042,7 @@ static struct clk_hw_onecell_data meson8b_hw_onecell_data = {
 		[CLKID_VID_PLL_FINAL_DIV]   = &meson8b_vid_pll_final_div.hw,
 		[CLKID_VCLK_IN_SEL]	    = &meson8b_vclk_in_sel.hw,
 		[CLKID_VCLK_IN_EN]	    = &meson8b_vclk_in_en.hw,
+		[CLKID_VCLK_EN]		    = &meson8b_vclk_en.hw,
 		[CLKID_VCLK_DIV1]	    = &meson8b_vclk_div1_gate.hw,
 		[CLKID_VCLK_DIV2_DIV]	    = &meson8b_vclk_div2_div.hw,
 		[CLKID_VCLK_DIV2]	    = &meson8b_vclk_div2_div_gate.hw,
@@ -3241,6 +3259,7 @@ static struct clk_hw_onecell_data meson8m2_hw_onecell_data = {
 		[CLKID_VID_PLL_FINAL_DIV]   = &meson8b_vid_pll_final_div.hw,
 		[CLKID_VCLK_IN_SEL]	    = &meson8b_vclk_in_sel.hw,
 		[CLKID_VCLK_IN_EN]	    = &meson8b_vclk_in_en.hw,
+		[CLKID_VCLK_EN]		    = &meson8b_vclk_en.hw,
 		[CLKID_VCLK_DIV1]	    = &meson8b_vclk_div1_gate.hw,
 		[CLKID_VCLK_DIV2_DIV]	    = &meson8b_vclk_div2_div.hw,
 		[CLKID_VCLK_DIV2]	    = &meson8b_vclk_div2_div_gate.hw,
@@ -3443,6 +3462,7 @@ static struct clk_regmap *const meson8b_clk_regmaps[] = {
 	&meson8b_vid_pll_final_div,
 	&meson8b_vclk_in_sel,
 	&meson8b_vclk_in_en,
+	&meson8b_vclk_en,
 	&meson8b_vclk_div1_gate,
 	&meson8b_vclk_div2_div_gate,
 	&meson8b_vclk_div4_div_gate,
diff --git a/drivers/clk/meson/meson8b.h b/drivers/clk/meson/meson8b.h
index cd38ae2a9cb5..c8ab2a632295 100644
--- a/drivers/clk/meson/meson8b.h
+++ b/drivers/clk/meson/meson8b.h
@@ -180,8 +180,9 @@
 #define CLKID_CTS_AMCLK_DIV	208
 #define CLKID_CTS_MCLK_I958_SEL	210
 #define CLKID_CTS_MCLK_I958_DIV	211
+#define CLKID_VCLK_EN		214
 
-#define CLK_NR_CLKS		214
+#define CLK_NR_CLKS		215
 
 /*
  * include the CLKID and RESETID that have
-- 
2.27.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
