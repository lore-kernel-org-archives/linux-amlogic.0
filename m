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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 396E2C433DB
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Jan 2021 13:29:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E93A9207AE
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Jan 2021 13:29:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E93A9207AE
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YA/9kJKaQm/8ZDPNPumuIDUWN/ffNiY/K+3c/bydgx0=; b=xUZRfMhHEOgdHUB6e5LwiZBGh
	w84kRfRcPY3sMOPRQN1K2F97YfALc/SznHtg223ICkgPFXHG4fV8vYCOn/ppNtOgyTqigWlFtG1vj
	frKsZ7MkMP1XFDzPRL7UsfgEzcBxifF5Z+fpBI+jIEXY7vMwB2Or1p4g7mg2lI1V0F1btLdSaKx1P
	xVOftg3sCroU+7SGkN622XauHwPqg4DcMoyll7eGS4W1ESbGWkHSIATbOJOIDDMnUd9Cs0sXSNe0w
	VjXY7kimxHO88eemL31yDgwtFg3Fe5Z95JiDjH/l+JIF32frmWOYG+ISL700Wpfo8w5M7VnulAG2A
	jhjjkgnFg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwPvS-0007BL-V6; Mon, 04 Jan 2021 13:29:34 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwPvA-000731-9P; Mon, 04 Jan 2021 13:29:20 +0000
Received: by mail-wm1-x329.google.com with SMTP id v14so18435949wml.1;
 Mon, 04 Jan 2021 05:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yU3i8q3LKfNlAY9hUH3bx+fqfznLSPg6/fe82VNqq7E=;
 b=AMtwZS2an8TZOKdgEL4gqeYjLriuWPqWRgYbrgrbbN40Xtqp44B8JLfh21SaF1Lvo0
 4Mhpet6kOwKrWQy/Qg7Eo6+hfr9ySEzMcWNp4IXPI3oiuWxKEtqYqxlbs+PpEdaZkxPR
 7e2f9JwBINuQ7UHZKKsDcMN9NNi/UPfm2aYqcut1mwGu79RYC013VAPScPi9Z+h7iDhF
 /5YW/WsJtc4efxS6mVyxN+IWNJvc5xl3fGsda90wiG9IG9n/xDfNd+ZB/WPtrNCtywxT
 EE3njDXCQuXdY9X2Y2Xi/iWy3q0iPT0e734llu2PhPOrG7M1cm2mPFVnwORl7gkD+0+3
 kiAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yU3i8q3LKfNlAY9hUH3bx+fqfznLSPg6/fe82VNqq7E=;
 b=lGNywkPe4uHvnhZVIZgTXFD4vrbuSXVinJbBuDL55+Z6/Tbck6OPvTLJnfcoZ+DQrS
 ncVMeG06+WIXSzEC4GIhRwzMn/tnvXe7JZ9gof0bu5+IreRql+tQC5GgLNA7hYETvygt
 +HCdEh+BSYf5Y/AJskRWIrWzOxHTFD92aU7xsb9gFyeEV5PKsqsnbBKz6k00xw6IXwz5
 OcI34fRptNVN/ec+82kTbr8579+3YGg9PIy3471d3fVGxrOypmbiPhawLCnGRz9yb0M5
 XOQ1mUQIaLdCygahbpsV5d0rFjG+9Y/yadN+KrQJcn0SFZalgfiOIto74V9jgwBpbiWt
 oTXA==
X-Gm-Message-State: AOAM532VfJupRTRKE5ufHeuFruKMbAfddG81PJchoSn1W3H2DRdynKnb
 mzKAHo1IUmjMhjajmi8dgZc=
X-Google-Smtp-Source: ABdhPJyVpXksZHxu5YZkIIRBN6VRNV0RdPiMJnbeiaBdMGsMHagAhSvke15twbTrOcTpAUNR0RhXfg==
X-Received: by 2002:a1c:741a:: with SMTP id p26mr27847111wmc.47.1609766954825; 
 Mon, 04 Jan 2021 05:29:14 -0800 (PST)
Received: from localhost.localdomain
 (p200300f13724fd00428d5cfffeb99db8.dip0.t-ipconnect.de.
 [2003:f1:3724:fd00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id c4sm99916521wrw.72.2021.01.04.05.29.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jan 2021 05:29:14 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: jbrunet@baylibre.com,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 3/5] clk: meson: meson8b: add the video clock divider tables
Date: Mon,  4 Jan 2021 14:28:04 +0100
Message-Id: <20210104132806.720558-4-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210104132806.720558-1-martin.blumenstingl@googlemail.com>
References: <20210104132806.720558-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_082916_422461_C0A68EA5 
X-CRM114-Status: GOOD (  14.66  )
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

Add all known clock dividers from Amlogic's 3.10 vendor kernel. If not
stated otherwise the values given in the tables are the only ones used
by the 3.10 vendor kernel even if the hardware is capable of other
dividers as well:
- vid_pll_pre_div can divide by 5 or 6 and if u-boot did not initialize
  this clock then it divides by 1 by default (only 5 and 6 are used at
  runtime by the vendor kernel though)
- vid_pll_post_div is either 1 or 2
- vid_pll_final_div is either 1, 2 or 4

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/meson/meson8b.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index 16ab595ab1a4..1ae771bac4a5 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -1084,11 +1084,19 @@ static struct clk_regmap meson8b_vid_pll_in_en = {
 	},
 };
 
+static const struct clk_div_table vid_pll_pre_div_table[] = {
+	{ .val = 0, .div = 1 },
+	{ .val = 4, .div = 5 },
+	{ .val = 5, .div = 6 },
+	{ /* sentinel */ }
+};
+
 static struct clk_regmap meson8b_vid_pll_pre_div = {
 	.data = &(struct clk_regmap_div_data){
 		.offset =  HHI_VID_DIVIDER_CNTL,
 		.shift = 4,
 		.width = 3,
+		.table = vid_pll_pre_div_table,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "vid_pll_pre_div",
@@ -1101,11 +1109,18 @@ static struct clk_regmap meson8b_vid_pll_pre_div = {
 	},
 };
 
+static const struct clk_div_table vid_pll_post_div_table[] = {
+	{ .val = 0, .div = 1 },
+	{ .val = 1, .div = 2 },
+	{ /* sentinel */ }
+};
+
 static struct clk_regmap meson8b_vid_pll_post_div = {
 	.data = &(struct clk_regmap_div_data){
 		.offset =  HHI_VID_DIVIDER_CNTL,
 		.shift = 12,
 		.width = 3,
+		.table = vid_pll_post_div_table,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "vid_pll_post_div",
@@ -1137,11 +1152,19 @@ static struct clk_regmap meson8b_vid_pll = {
 	},
 };
 
+static const struct clk_div_table meson8b_vid_pll_final_div_table[] = {
+	{ .val = 0, .div = 1 },
+	{ .val = 1, .div = 2 },
+	{ .val = 3, .div = 4 },
+	{ /* sentinel */ }
+};
+
 static struct clk_regmap meson8b_vid_pll_final_div = {
 	.data = &(struct clk_regmap_div_data){
 		.offset =  HHI_VID_CLK_DIV,
 		.shift = 0,
 		.width = 8,
+		.table = meson8b_vid_pll_final_div_table,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "vid_pll_final_div",
-- 
2.30.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
