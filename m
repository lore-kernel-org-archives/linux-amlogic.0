Return-Path: <SRS0=5vFS=PY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38C96C43612
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Jan 2019 17:56:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BE0920859
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Jan 2019 17:56:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nuKlVVtO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="mj2BBHIe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0BE0920859
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GSYVJStTQXok58kNUTENEq13cuLS4pRxLV41XOQmliA=; b=nuKlVVtONOqVO+
	YUYD15jzpPnE5Wg2y1PP3LL5PJCoj/oVPv1p9H01iArKxdS9meHnZclS8gAaz+WtB5wh844k2AJdZ
	L5UNgAoLyrPGhjDeblYxb6qj4EAFGk5AUcczvSl7Z36q8EZ2OQYkkBBssC6llQe1T429RD3Rkb3tT
	lN8elWiqMNoMpQjWq/X2koleS6V7z02nCofRSqi1Eltg0k/pDe4fuL61WGD5dJL8LwyZfvtsqxpoI
	26ehDrgceJpKy0o0Co2Sn749+2NpJs3GcWYY7erHVpkmIvRDz5ihrJviGrdTSauZq4P1YlZxZ967a
	81M012BsLUkvlB7Pzkpg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjpPw-0003i3-6m; Wed, 16 Jan 2019 17:55:56 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjpOy-0001Zs-NR
 for linux-amlogic@lists.infradead.org; Wed, 16 Jan 2019 17:55:02 +0000
Received: by mail-wr1-x444.google.com with SMTP id u4so7989067wrp.3
 for <linux-amlogic@lists.infradead.org>; Wed, 16 Jan 2019 09:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PO1Q8Fk8a+GCvLUwshwuMPTHTCeZhTO+WtQpOuaokSk=;
 b=mj2BBHIevH3MnA+YYJaxLgYvfjLiEs7xwvpS8eBy4Q+KIhW9K0kzZvgHmPlhB9kYql
 LIEN852pKEAwbqXkayZDdiv3SV172DJxOpCr+AQ879pDB92TbpdEm4DLSmOysjeQO5mV
 Et1QgmGkSKY1FA6sk6t7z6jvCNMxZz+bi4bavw8IwkLjqhtqaBnt6tMWX8ZGVRFQs6+b
 hHL16AGYTlM0jsb8g5YpxuFTYOyUEht9EyiWyY1kXhhgDFrD5d75dYteTpdNkFhYBIF2
 SdQGEeBZeBrZlZUrWYRFnAm9OunxOKtuEJRSaadTKivnF34mgMq2fnmQK92Z7OUks+HF
 D8gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PO1Q8Fk8a+GCvLUwshwuMPTHTCeZhTO+WtQpOuaokSk=;
 b=XQqJRKAJdTrrnUDkMGxvKtHEuNudotn1rpuZ0KM504ukPOZgAQOZjRef8Ahh9+/WO0
 AnIEYP01YioO2B5CufBhTTiIyDyGeP+4R0IFbQXFksasAfMFLWE23RsFXaOcVADDMzEv
 fVD2NW2GIb5x4YhzoItUeV3FS74HyF9HE4ZWFKvfoGpn/NTIgKQuGrwoKP9se6s+hwNn
 Q77r0vHN1m7LIkJff8FOK5p4j1HxFoTS7Ec979su71Bi4Iby8jrjoXsdBFGwbiNheNIU
 XAjae5aFVYpdNTeGZ/hMkvZs6PyGPqtXCtSJNvQvTMTDO540EynuDZhgdpb/W4F8Zu2F
 Dn7w==
X-Gm-Message-State: AJcUukfbxPQK7oy2I+h/qiBZqWOq28y0jgsTDkifDMEfgrucV30njpPe
 fh5dsoH08aw/6LBmEX7bmz+RzQ==
X-Google-Smtp-Source: ALg8bN4pSLxcAop3TLQnfJdwy8u6vXjFUxYUUwrvCvjCyTUjgqPxclTiE6oQvWK+dqgW+hT2jf3VJA==
X-Received: by 2002:adf:ec83:: with SMTP id z3mr8888908wrn.264.1547661291733; 
 Wed, 16 Jan 2019 09:54:51 -0800 (PST)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id z9sm68703861wrs.63.2019.01.16.09.54.50
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 16 Jan 2019 09:54:51 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 2/3] clk: meson: axg: claim clock controller input clock from
 DT
Date: Wed, 16 Jan 2019 18:54:34 +0100
Message-Id: <20190116175435.4990-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190116175435.4990-1-jbrunet@baylibre.com>
References: <20190116175435.4990-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190116_095456_933595_01E9D043 
X-CRM114-Status: GOOD (  13.61  )
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
Cc: Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 patchwork-bot+notify@kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Instead of relying on a fixed name for the xtal clock, claim the
controller input clock trough DT.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/axg.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/meson/axg.c b/drivers/clk/meson/axg.c
index 792735d7e46e..1c6539eeee7c 100644
--- a/drivers/clk/meson/axg.c
+++ b/drivers/clk/meson/axg.c
@@ -20,6 +20,8 @@
 #include "clkc.h"
 #include "axg.h"
 
+#define IN_PREFIX "ee-in-"
+
 static DEFINE_SPINLOCK(meson_clk_lock);
 
 static struct clk_regmap axg_fixed_pll_dco = {
@@ -58,7 +60,7 @@ static struct clk_regmap axg_fixed_pll_dco = {
 	.hw.init = &(struct clk_init_data){
 		.name = "fixed_pll_dco",
 		.ops = &meson_clk_pll_ro_ops,
-		.parent_names = (const char *[]){ "xtal" },
+		.parent_names = (const char *[]){ IN_PREFIX "xtal" },
 		.num_parents = 1,
 	},
 };
@@ -113,7 +115,7 @@ static struct clk_regmap axg_sys_pll_dco = {
 	.hw.init = &(struct clk_init_data){
 		.name = "sys_pll_dco",
 		.ops = &meson_clk_pll_ro_ops,
-		.parent_names = (const char *[]){ "xtal" },
+		.parent_names = (const char *[]){ IN_PREFIX "xtal" },
 		.num_parents = 1,
 	},
 };
@@ -214,7 +216,7 @@ static struct clk_regmap axg_gp0_pll_dco = {
 	.hw.init = &(struct clk_init_data){
 		.name = "gp0_pll_dco",
 		.ops = &meson_clk_pll_ops,
-		.parent_names = (const char *[]){ "xtal" },
+		.parent_names = (const char *[]){ IN_PREFIX "xtal" },
 		.num_parents = 1,
 	},
 };
@@ -283,7 +285,7 @@ static struct clk_regmap axg_hifi_pll_dco = {
 	.hw.init = &(struct clk_init_data){
 		.name = "hifi_pll_dco",
 		.ops = &meson_clk_pll_ops,
-		.parent_names = (const char *[]){ "xtal" },
+		.parent_names = (const char *[]){ IN_PREFIX "xtal" },
 		.num_parents = 1,
 	},
 };
@@ -701,7 +703,7 @@ static struct clk_regmap axg_pcie_pll_dco = {
 	.hw.init = &(struct clk_init_data){
 		.name = "pcie_pll_dco",
 		.ops = &meson_clk_pll_ops,
-		.parent_names = (const char *[]){ "xtal" },
+		.parent_names = (const char *[]){ IN_PREFIX "xtal" },
 		.num_parents = 1,
 	},
 };
@@ -803,7 +805,7 @@ static struct clk_regmap axg_pcie_cml_en1 = {
 
 static u32 mux_table_clk81[]	= { 0, 2, 3, 4, 5, 6, 7 };
 static const char * const clk81_parent_names[] = {
-	"xtal", "fclk_div7", "mpll1", "mpll2", "fclk_div4",
+	IN_PREFIX "xtal", "fclk_div7", "mpll1", "mpll2", "fclk_div4",
 	"fclk_div3", "fclk_div5"
 };
 
@@ -852,7 +854,7 @@ static struct clk_regmap axg_clk81 = {
 };
 
 static const char * const axg_sd_emmc_clk0_parent_names[] = {
-	"xtal", "fclk_div2", "fclk_div3", "fclk_div5", "fclk_div7",
+	IN_PREFIX "xtal", "fclk_div2", "fclk_div3", "fclk_div5", "fclk_div7",
 
 	/*
 	 * Following these parent clocks, we should also have had mpll2, mpll3
@@ -957,7 +959,7 @@ static struct clk_regmap axg_sd_emmc_c_clk0 = {
 static u32 mux_table_gen_clk[]	= { 0, 4, 5, 6, 7, 8,
 				    9, 10, 11, 13, 14, };
 static const char * const gen_clk_parent_names[] = {
-	"xtal", "hifi_pll", "mpll0", "mpll1", "mpll2", "mpll3",
+	IN_PREFIX "xtal", "hifi_pll", "mpll0", "mpll1", "mpll2", "mpll3",
 	"fclk_div4", "fclk_div3", "fclk_div5", "fclk_div7", "gp0_pll",
 };
 
@@ -1263,6 +1265,7 @@ static const struct of_device_id clkc_match_table[] = {
 static int axg_clkc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	struct clk_hw *input;
 	struct regmap *map;
 	int ret, i;
 
@@ -1273,6 +1276,14 @@ static int axg_clkc_probe(struct platform_device *pdev)
 		return PTR_ERR(map);
 	}
 
+	input = meson_clk_hw_register_input(dev, "xtal", IN_PREFIX "xtal", 0);
+	if (IS_ERR(input)) {
+		ret = PTR_ERR(input);
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "failed to get input clock");
+		return ret;
+	}
+
 	/* Populate regmap for the regmap backed clocks */
 	for (i = 0; i < ARRAY_SIZE(axg_clk_regmaps); i++)
 		axg_clk_regmaps[i]->map = map;
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
