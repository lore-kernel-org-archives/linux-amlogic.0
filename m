Return-Path: <SRS0=ciOP=AK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51033C433E1
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Jun 2020 20:39:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20B4420672
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Jun 2020 20:39:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P1cut44o";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="NLY5fPYX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20B4420672
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vxEbD7X5L2hz6YzBhpf6FEakXxU5VDlOvF5nuJn/8l4=; b=P1cut44oUZp7O1Uz3PRdp5DSp
	l69RTdBFFc30NivGsIAUC3emhjgZZ4ckT/1OIVcGrmvvxGclt9W7C2FR30yCi/twhcsqPiTE8IBBe
	tyUDF37VzwE3/d4QccRm2dgcMYOX4jqh4CYW/SV/v27NvKmzle5OSZXP0klQqCe2atL8Z5o2o4fc0
	6W/m3kHGaNWmOQibe99QGeDTFDQl/xohB0u3eSAzglb98LAQcN1TS6NpLMDFvZFTTAF/p1J8whmCp
	j61eDQ+8yLviF+5Y95haQOa4g4fKs4YWY3Kth8BgxJyl5oQ55mrPj/PX0wJ/IYPhD3/nR0hTw4k1P
	Mv9hGrNPw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jq0Yh-0008UL-Im; Mon, 29 Jun 2020 20:39:19 +0000
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jq0Yc-0008TD-UG; Mon, 29 Jun 2020 20:39:16 +0000
Received: by mail-ed1-x544.google.com with SMTP id e22so14145058edq.8;
 Mon, 29 Jun 2020 13:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vTs3Rq4IbWVMmMHH93Lm2y/PA0bfnEGRKSYzqgnP6SQ=;
 b=NLY5fPYXn0I6gh/w7i0Eu1FUwGf/7pbkboNqwMIbaxSFfSC05DW6oxnNXpxZLxYnnm
 Zd5ZooI54w3kxw4ntankssNg0P5hjHsKKLgg7U8nq9HKC64J81/bamncV+rW5ikGnbg8
 mIq6EiK0b/TY2ZFKDQodVkHBYcrOIbOWT1jNBw+yBGM6jJPXCYDf2G6c9f2nnNNoc90b
 SuZFvwROQnYILK97Op6YsDOGt/EETEWH0l9fNnYOY+v3qBvdJfaPa+3j4/QfsApcYkCy
 rbG59mjOu/DrxK2kI6pQFmQHNwSOyGify7rW9+pu8VIEe18CJA8MHTTb+SBfJ3eFNK5F
 iMgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vTs3Rq4IbWVMmMHH93Lm2y/PA0bfnEGRKSYzqgnP6SQ=;
 b=di0+lvhlD7Z8v2ZhJ+6ZZymbLme6xEeTHCY7oAW8mmM674Lnxz0aP2y1nkbG5SOGhc
 Mtf1Yg8qNAWWdGy+qcv59Rf5qHmQYXaaZjiGFyOjohsfcN3dE3UKh1Qey335W4jM2y9A
 p2M8wy15sYBb1cPFLWJF1PeWndLbkXeofyMkNloc2sv9b9OBD15dcvUUb3nJMUW/E8Ne
 KlCHC6/JdPttSFYcPLl3e8/xcRhsfFxCXHhiSPxM6jevU+xCbe3OpiH0oNeN/58ozJUS
 nII/AX2qPNBT9T5SJi4SQ958xRlcHaZodtnuitPO7is0kc2FlbTwb6JY/xG06Ngo0PPJ
 EiMA==
X-Gm-Message-State: AOAM531pHkLJvh00lqN7sINNevQgUikkyiQhQpDqHtEKJUAsAYDYRmqI
 WmlllSBqO08IzxJBCt1sRKWsQNYp
X-Google-Smtp-Source: ABdhPJwstmBLv3LnE1mWJtfxcf7VEywqVy8MpB9W+MHF6U4ffXHxmKAeBOGqVRMDM6hbpvf6PbtjWQ==
X-Received: by 2002:a05:6402:1346:: with SMTP id
 y6mr19708710edw.192.1593463154011; 
 Mon, 29 Jun 2020 13:39:14 -0700 (PDT)
Received: from localhost.localdomain
 (p200300f137396800428d5cfffeb99db8.dip0.t-ipconnect.de.
 [2003:f1:3739:6800:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id j24sm706741edp.22.2020.06.29.13.39.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 13:39:13 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: jbrunet@baylibre.com,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 2/2] clk: meson: meson8b: add the vclk2_en gate clock
Date: Mon, 29 Jun 2020 22:39:04 +0200
Message-Id: <20200629203904.2989007-3-martin.blumenstingl@googlemail.com>
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

HHI_VIID_CLK_CNTL[19] is not part of the public S805 datasheet. However,
the GXBB driver defines this bit as a gate called "vclk2" and in the
3.10 kernel GPL code dump the following line can found:
  WRITE_LCD_CBUS_REG_BITS(HHI_VIID_CLK_CNTL, 0, 19, 1); //disable vclk2_en

Add this gate clock to the Meson8/Meson8b/Meson8m2 clock controller to
complete the VCLK2 clock tree.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/meson/meson8b.c | 30 +++++++++++++++++++++++++-----
 drivers/clk/meson/meson8b.h |  3 ++-
 2 files changed, 27 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index d5b90d61a530..862f0756b50f 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -1387,6 +1387,22 @@ static struct clk_regmap meson8b_vclk2_clk_in_en = {
 	},
 };
 
+static struct clk_regmap meson8b_vclk2_clk_en = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = HHI_VIID_CLK_DIV,
+		.bit_idx = 19,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "vclk2_en",
+		.ops = &clk_regmap_gate_ro_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8b_vclk2_clk_in_en.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
 static struct clk_regmap meson8b_vclk2_div1_gate = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = HHI_VIID_CLK_DIV,
@@ -1396,7 +1412,7 @@ static struct clk_regmap meson8b_vclk2_div1_gate = {
 		.name = "vclk2_div1_en",
 		.ops = &clk_regmap_gate_ro_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&meson8b_vclk2_clk_in_en.hw
+			&meson8b_vclk2_clk_en.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
@@ -1410,7 +1426,7 @@ static struct clk_fixed_factor meson8b_vclk2_div2_div = {
 		.name = "vclk2_div2",
 		.ops = &clk_fixed_factor_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&meson8b_vclk2_clk_in_en.hw
+			&meson8b_vclk2_clk_en.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
@@ -1440,7 +1456,7 @@ static struct clk_fixed_factor meson8b_vclk2_div4_div = {
 		.name = "vclk2_div4",
 		.ops = &clk_fixed_factor_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&meson8b_vclk2_clk_in_en.hw
+			&meson8b_vclk2_clk_en.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
@@ -1470,7 +1486,7 @@ static struct clk_fixed_factor meson8b_vclk2_div6_div = {
 		.name = "vclk2_div6",
 		.ops = &clk_fixed_factor_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&meson8b_vclk2_clk_in_en.hw
+			&meson8b_vclk2_clk_en.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
@@ -1500,7 +1516,7 @@ static struct clk_fixed_factor meson8b_vclk2_div12_div = {
 		.name = "vclk2_div12",
 		.ops = &clk_fixed_factor_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&meson8b_vclk2_clk_in_en.hw
+			&meson8b_vclk2_clk_en.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
@@ -2848,6 +2864,7 @@ static struct clk_hw_onecell_data meson8_hw_onecell_data = {
 		[CLKID_VCLK_DIV12]	    = &meson8b_vclk_div12_div_gate.hw,
 		[CLKID_VCLK2_IN_SEL]	    = &meson8b_vclk2_in_sel.hw,
 		[CLKID_VCLK2_IN_EN]	    = &meson8b_vclk2_clk_in_en.hw,
+		[CLKID_VCLK2_EN]	    = &meson8b_vclk2_clk_en.hw,
 		[CLKID_VCLK2_DIV1]	    = &meson8b_vclk2_div1_gate.hw,
 		[CLKID_VCLK2_DIV2_DIV]	    = &meson8b_vclk2_div2_div.hw,
 		[CLKID_VCLK2_DIV2]	    = &meson8b_vclk2_div2_div_gate.hw,
@@ -3054,6 +3071,7 @@ static struct clk_hw_onecell_data meson8b_hw_onecell_data = {
 		[CLKID_VCLK_DIV12]	    = &meson8b_vclk_div12_div_gate.hw,
 		[CLKID_VCLK2_IN_SEL]	    = &meson8b_vclk2_in_sel.hw,
 		[CLKID_VCLK2_IN_EN]	    = &meson8b_vclk2_clk_in_en.hw,
+		[CLKID_VCLK2_EN]	    = &meson8b_vclk2_clk_en.hw,
 		[CLKID_VCLK2_DIV1]	    = &meson8b_vclk2_div1_gate.hw,
 		[CLKID_VCLK2_DIV2_DIV]	    = &meson8b_vclk2_div2_div.hw,
 		[CLKID_VCLK2_DIV2]	    = &meson8b_vclk2_div2_div_gate.hw,
@@ -3271,6 +3289,7 @@ static struct clk_hw_onecell_data meson8m2_hw_onecell_data = {
 		[CLKID_VCLK_DIV12]	    = &meson8b_vclk_div12_div_gate.hw,
 		[CLKID_VCLK2_IN_SEL]	    = &meson8b_vclk2_in_sel.hw,
 		[CLKID_VCLK2_IN_EN]	    = &meson8b_vclk2_clk_in_en.hw,
+		[CLKID_VCLK2_EN]	    = &meson8b_vclk2_clk_en.hw,
 		[CLKID_VCLK2_DIV1]	    = &meson8b_vclk2_div1_gate.hw,
 		[CLKID_VCLK2_DIV2_DIV]	    = &meson8b_vclk2_div2_div.hw,
 		[CLKID_VCLK2_DIV2]	    = &meson8b_vclk2_div2_div_gate.hw,
@@ -3470,6 +3489,7 @@ static struct clk_regmap *const meson8b_clk_regmaps[] = {
 	&meson8b_vclk_div12_div_gate,
 	&meson8b_vclk2_in_sel,
 	&meson8b_vclk2_clk_in_en,
+	&meson8b_vclk2_clk_en,
 	&meson8b_vclk2_div1_gate,
 	&meson8b_vclk2_div2_div_gate,
 	&meson8b_vclk2_div4_div_gate,
diff --git a/drivers/clk/meson/meson8b.h b/drivers/clk/meson/meson8b.h
index c8ab2a632295..699c5bc7c817 100644
--- a/drivers/clk/meson/meson8b.h
+++ b/drivers/clk/meson/meson8b.h
@@ -181,8 +181,9 @@
 #define CLKID_CTS_MCLK_I958_SEL	210
 #define CLKID_CTS_MCLK_I958_DIV	211
 #define CLKID_VCLK_EN		214
+#define CLKID_VCLK2_EN		215
 
-#define CLK_NR_CLKS		215
+#define CLK_NR_CLKS		216
 
 /*
  * include the CLKID and RESETID that have
-- 
2.27.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
