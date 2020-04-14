Return-Path: <SRS0=FMGI=56=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36F5AC352BE
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Apr 2020 19:51:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 947772074D
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Apr 2020 19:51:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lXbmEXql";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="bS3/ROK/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 947772074D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UhfE4baqO96wQnLYgKJs9VzxwweWfS1zxg6q19nskQ8=; b=lXbmEXql0LpX42
	guogys6x2OPvLl1Nk6vjwller4JEps32Z5nWCwTIEX/yeCOq7t+GktUtUA9wXDSN/yHlPo0NJ6e8Z
	GxkocJb7b55Wpc88Y1lP476xeqNnzLOIMI2ewytM5Y3J/jUwEEAhM+Bz+QSkWSUlyULh2g8c6d53L
	8v/49kpPqq2G3QwVmmuaIQgBtK/wvn2Ecpd6xEVOcVDcZjS+AA5SjIGOrcY1+zNaGL8Q3AtbpaWP1
	Lt6noGsqW61KydqLNLBEq1BsgWghdbiKxoIjt7D2sksEvnQC3/1qLEqhDyHeGG9IyMKHe3Kw5I69m
	aGfpEhlxDOvYa0BIQaVA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jORaf-0006YT-5L; Tue, 14 Apr 2020 19:51:25 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jORaa-0006WO-4K; Tue, 14 Apr 2020 19:51:22 +0000
Received: by mail-wm1-x341.google.com with SMTP id g12so7842899wmh.3;
 Tue, 14 Apr 2020 12:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=buqvW+rh8aGkpkt6IACKm4M4fmbaWcmA3j17X8abtHA=;
 b=bS3/ROK/sffJXwV2Rj/G7kYPdJZgF8fmwMTwrUtrs4+TIJR2cD/R+dEM9aVovzLVRM
 pzi6C1aISUmH8ksCMqc3gm92h6/1Uq8KKn0Ypay5lSIl6V0owSap/QGLjCyAEDMtl9o6
 SvQfNryeGB2JDGc2JKmDQnnlG9ddJz20U/gsG38nHZiN4+dklzXWfw6u103Bhu/aYtaf
 fCQxZFaTuYaQkzteOC0UIk22jXkpuYCJ6YawiGWnZMX2ABBTggi9qPxxFLTGK17AQK6H
 IDjnwSBJg3aGm5n9ZaxVo+Ni4nS3685k7fXE8zp2to0b41sTjZWj6gWmZv4f6Y1CAxKC
 KI9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=buqvW+rh8aGkpkt6IACKm4M4fmbaWcmA3j17X8abtHA=;
 b=D7X5C5ocoSOhZ4sQbh/fJyAajDz/UPXNe1j6jBTqnbfu5is+RKNO49asnrW6osJPGo
 Zhn0Tu4lKnPSs3phMS8ASsHvOCEJQVN6HsAspxa62mr33cDi6fbxRJriknet8HQDQ/t3
 v/UmWm2cNyfyCfgP2t2LaitMr4WDPZWcX/maKCHQYkIs7vt9Sz263YqOnVxdJ/PPgua4
 h/fttKEdm46KbovLG3JlzUMgbT9yF/LWDuVIESMycsdgJph3ZcmqJj0Bl+5y83usT7Ij
 6kTfIdrOhXfO4hEeb7jFfYX8i7VL5blOMiHNFlKirFYbAFioc+jQWtXSsPYOx663aGdt
 5aBg==
X-Gm-Message-State: AGi0PuZQaRzS0EjF4PASOcnbpFXZa/wL4p+uMLeXDFAoFEsxXQchE4MZ
 Nuh02nwbzQzSY6vscRsPxaE=
X-Google-Smtp-Source: APiQypK10yXfw/ApupMZEh8RomMmpTZfJoDiWwllfVAKE0XMN2fASSf+G5DjYOUuv0o/FowDJZafKQ==
X-Received: by 2002:a1c:f20c:: with SMTP id s12mr1544202wmc.83.1586893877796; 
 Tue, 14 Apr 2020 12:51:17 -0700 (PDT)
Received: from localhost.localdomain
 (p200300F13717DF00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:3717:df00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id s14sm20886844wme.33.2020.04.14.12.51.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 12:51:17 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: jbrunet@baylibre.com, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org
Subject: [PATCH v2 1/2] clk: meson: gxbb: Prepare the GPU clock tree to change
 at runtime
Date: Tue, 14 Apr 2020 21:50:30 +0200
Message-Id: <20200414195031.224021-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200414195031.224021-1-martin.blumenstingl@googlemail.com>
References: <20200414195031.224021-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200414_125120_169738_A8758DDB 
X-CRM114-Status: GOOD (  14.84  )
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
Cc: narmstrong@baylibre.com, sboyd@kernel.org, mturquette@baylibre.com,
 linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The "mali_0" or "mali_1" clock trees should not be updated while the
clock is running. Enforce this by setting CLK_SET_RATE_GATE on the
"mali_0" and "mali_1" gates. This makes the CCF switch to the "mali_1"
tree when "mali_0" is currently active and vice versa, which is exactly
what the vendor driver does when updating the frequency of the mali
clock.
Also propagate set_rate requests from the gate to the divider and from
the divider to the the mux so the GPU clock frequency can be updated at
runtime (which will be required for GPU DVFS). Don't propagate rate
changes to the mux parents because we don't want to change the MPLL
clocks (these are reserved for audio).

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/meson/gxbb.c | 40 ++++++++++++++++++++++------------------
 1 file changed, 22 insertions(+), 18 deletions(-)

diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index 5fd6a574f8c3..0a68af6eec3d 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -957,7 +957,9 @@ static struct clk_regmap gxbb_sar_adc_clk = {
 
 /*
  * The MALI IP is clocked by two identical clocks (mali_0 and mali_1)
- * muxed by a glitch-free switch.
+ * muxed by a glitch-free switch. The CCF can manage this glitch-free
+ * mux because it does top-to-bottom updates the each clock tree and
+ * switches to the "inactive" one when CLK_SET_RATE_GATE is set.
  */
 
 static const struct clk_parent_data gxbb_mali_0_1_parent_data[] = {
@@ -980,14 +982,15 @@ static struct clk_regmap gxbb_mali_0_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "mali_0_sel",
 		.ops = &clk_regmap_mux_ops,
-		/*
-		 * bits 10:9 selects from 8 possible parents:
-		 * xtal, gp0_pll, mpll2, mpll1, fclk_div7,
-		 * fclk_div4, fclk_div3, fclk_div5
-		 */
 		.parent_data = gxbb_mali_0_1_parent_data,
 		.num_parents = 8,
-		.flags = CLK_SET_RATE_NO_REPARENT,
+		/*
+		 * Don't request the parent to change the rate because
+		 * all GPU frequencies can be derived from the fclk_*
+		 * clocks and one special GP0_PLL setting. This is
+		 * important because we need the MPLL clocks for audio.
+		 */
+		.flags = 0,
 	},
 };
 
@@ -1004,7 +1007,7 @@ static struct clk_regmap gxbb_mali_0_div = {
 			&gxbb_mali_0_sel.hw
 		},
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_NO_REPARENT,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
@@ -1020,7 +1023,7 @@ static struct clk_regmap gxbb_mali_0 = {
 			&gxbb_mali_0_div.hw
 		},
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
+		.flags = CLK_SET_RATE_GATE | CLK_SET_RATE_PARENT,
 	},
 };
 
@@ -1033,14 +1036,15 @@ static struct clk_regmap gxbb_mali_1_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "mali_1_sel",
 		.ops = &clk_regmap_mux_ops,
-		/*
-		 * bits 10:9 selects from 8 possible parents:
-		 * xtal, gp0_pll, mpll2, mpll1, fclk_div7,
-		 * fclk_div4, fclk_div3, fclk_div5
-		 */
 		.parent_data = gxbb_mali_0_1_parent_data,
 		.num_parents = 8,
-		.flags = CLK_SET_RATE_NO_REPARENT,
+		/*
+		 * Don't request the parent to change the rate because
+		 * all GPU frequencies can be derived from the fclk_*
+		 * clocks and one special GP0_PLL setting. This is
+		 * important because we need the MPLL clocks for audio.
+		 */
+		.flags = 0,
 	},
 };
 
@@ -1057,7 +1061,7 @@ static struct clk_regmap gxbb_mali_1_div = {
 			&gxbb_mali_1_sel.hw
 		},
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_NO_REPARENT,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
@@ -1073,7 +1077,7 @@ static struct clk_regmap gxbb_mali_1 = {
 			&gxbb_mali_1_div.hw
 		},
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
+		.flags = CLK_SET_RATE_GATE | CLK_SET_RATE_PARENT,
 	},
 };
 
@@ -1093,7 +1097,7 @@ static struct clk_regmap gxbb_mali = {
 		.ops = &clk_regmap_mux_ops,
 		.parent_hws = gxbb_mali_parent_hws,
 		.num_parents = 2,
-		.flags = CLK_SET_RATE_NO_REPARENT,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-- 
2.26.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
