Return-Path: <SRS0=FfFd=D4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49155C61DD8
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Oct 2020 16:22:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BC672237B
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Oct 2020 16:22:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DUbdAAED";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="BSaO1y3B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BC672237B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EmMrnS/KA3/gCHVs7O3xZ9Qfem78hF2Q1Eg1a6lHd1o=; b=DUbdAAEDTR6/KdUP76HyyV7Yy
	JQNE9baZM2QxoBtP6ZCFLLnaDyqtEe0D3cW8LBHk5M/c+4k3hnfUxOdzxh4rhUHDVCdp2taKTKeey
	ZrAvrG9xiteXxyW0YfTj1NRe9FUOm5/NxxzCVy5QXe19qAYRjxnmGfvVpNbuD1k76xERulRYoOvBw
	aBFsSH/x8IthP9+1G9wiscCSMbaYd8ruZTCuQQnOC5Wb3x+pJxmI+TYKVcOOAZ3jgEhzN/lXnUozj
	3BX26dS2NqcRQ9oj+VTaG/PDFv8f+4KGLfLOd/35BCWXZiLRUYRS3d5Ejqz6pEqb2ngJBfDkhj+3x
	ISy8K0jYg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVGsF-0003qe-OW; Wed, 21 Oct 2020 16:22:03 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVGsB-0003oW-Ix
 for linux-amlogic@lists.infradead.org; Wed, 21 Oct 2020 16:22:01 +0000
Received: by mail-ed1-x541.google.com with SMTP id w23so2527653edl.0
 for <linux-amlogic@lists.infradead.org>; Wed, 21 Oct 2020 09:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ctEEpwCu2m+UGEAQqLgzNXgXDvvkBbjRVfAgqCEvH10=;
 b=BSaO1y3B/QG1IHhLPf2ECgY23OLMdpsc5MJlpyTNsmpSByjKefPgk+5uS1NlZ5eiJx
 PLz4ji/K99ZCc6hmJWlCumLjBC44Yp4kqUsACqziNydzwLp6CtI4borrrwL7XCYAyXXI
 VK+wsQ57JTIAS8KthOSHB3MPDyY1jkFBB+/QwJj/1esXgo0yAxHnn+uRy6+el3eJ/VA7
 WlxIIZSPSOSMETDdlWYAttacfNvOYxY8HYMgQ/6FKevzalobdk7KyDSzW+TyY0UIPJBY
 3RUSYsvA9HjWsRth0ERDulY9EcwdE1JYZardYOnMaU9FKCYwpO4APEKl5rF7DEit5ziN
 RGaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ctEEpwCu2m+UGEAQqLgzNXgXDvvkBbjRVfAgqCEvH10=;
 b=m/XFtdis8JMUaaYEojbsgXKzW8LEgrF1G4nkDcyc15R+UJbXT/N7bAvk8+lXqnz7LE
 uTx9sa65IzutYqqO75PueE+5A6CVUGhsUxJWr3H9BYlj99LoJHRI/+ZC2UBVpYvE5+p8
 CV84+UlONmiB7s2q0CpQ8Lh0axqoGdylVy0o0EqrqR9t3ZWkYuKKVDkCmilpyfOLp3fw
 iky/pedZxr+KMWqNvjZRSuOjkpAjzBzeEPiPDV+cNnbfc5I2EUIB9uN+z/j/+eg+ijRF
 vqLSFAUJlVVa31ORSqpL85c9QQw2AXEE/W9ujtDYSjoBpMOACTAmVawoZeoM37TUo5bb
 /wNA==
X-Gm-Message-State: AOAM532swFOdh8tc2we7O00clG3pPdHVKc3DYjAN1h/TypJ1r+6par8w
 CW2mb3k14AzIyTCEl7d9J/2HUg==
X-Google-Smtp-Source: ABdhPJwc7T5NdEnRaXOwk0sP0IToOEippbCC/7KmSW9llV170+TKEo32IKW1qVilAaMAIS/Om3EhTg==
X-Received: by 2002:aa7:c915:: with SMTP id b21mr3868779edt.25.1603297318129; 
 Wed, 21 Oct 2020 09:21:58 -0700 (PDT)
Received: from starbuck.lan (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.googlemail.com with ESMTPSA id 11sm2566667ejy.19.2020.10.21.09.21.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2020 09:21:57 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 3/3] clk: meson: g12: drop use of __clk_lookup()
Date: Wed, 21 Oct 2020 18:21:47 +0200
Message-Id: <20201021162147.563655-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201021162147.563655-1-jbrunet@baylibre.com>
References: <20201021162147.563655-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201021_122159_668711_701A1C7C 
X-CRM114-Status: GOOD (  15.18  )
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
Cc: linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

g12 clock controller used __clk_lookup() to get struct clk from a
struct clk_hw. This type of hack is no longer required as CCF now provides
the necessary functions to get this.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/g12a.c | 68 +++++++++++++++++++---------------------
 1 file changed, 32 insertions(+), 36 deletions(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index 28f976dbdd24..bbb75541dad9 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -5156,10 +5156,11 @@ static const struct reg_sequence g12a_init_regs[] = {
 	{ .reg = HHI_MPLL_CNTL0,	.def = 0x00000543 },
 };
 
-static int meson_g12a_dvfs_setup_common(struct platform_device *pdev,
+#define DVFS_CON_ID "dvfs"
+
+static int meson_g12a_dvfs_setup_common(struct device *dev,
 					struct clk_hw **hws)
 {
-	const char *notifier_clk_name;
 	struct clk *notifier_clk;
 	struct clk_hw *xtal;
 	int ret;
@@ -5168,21 +5169,21 @@ static int meson_g12a_dvfs_setup_common(struct platform_device *pdev,
 
 	/* Setup clock notifier for cpu_clk_postmux0 */
 	g12a_cpu_clk_postmux0_nb_data.xtal = xtal;
-	notifier_clk_name = clk_hw_get_name(&g12a_cpu_clk_postmux0.hw);
-	notifier_clk = __clk_lookup(notifier_clk_name);
+	notifier_clk = devm_clk_hw_get_clk(dev, &g12a_cpu_clk_postmux0.hw,
+					   DVFS_CON_ID);
 	ret = clk_notifier_register(notifier_clk,
 				    &g12a_cpu_clk_postmux0_nb_data.nb);
 	if (ret) {
-		dev_err(&pdev->dev, "failed to register the cpu_clk_postmux0 notifier\n");
+		dev_err(dev, "failed to register the cpu_clk_postmux0 notifier\n");
 		return ret;
 	}
 
 	/* Setup clock notifier for cpu_clk_dyn mux */
-	notifier_clk_name = clk_hw_get_name(&g12a_cpu_clk_dyn.hw);
-	notifier_clk = __clk_lookup(notifier_clk_name);
+	notifier_clk = devm_clk_hw_get_clk(dev, &g12a_cpu_clk_dyn.hw,
+					   DVFS_CON_ID);
 	ret = clk_notifier_register(notifier_clk, &g12a_cpu_clk_mux_nb);
 	if (ret) {
-		dev_err(&pdev->dev, "failed to register the cpu_clk_dyn notifier\n");
+		dev_err(dev, "failed to register the cpu_clk_dyn notifier\n");
 		return ret;
 	}
 
@@ -5192,33 +5193,33 @@ static int meson_g12a_dvfs_setup_common(struct platform_device *pdev,
 static int meson_g12b_dvfs_setup(struct platform_device *pdev)
 {
 	struct clk_hw **hws = g12b_hw_onecell_data.hws;
-	const char *notifier_clk_name;
+	struct device *dev = &pdev->dev;
 	struct clk *notifier_clk;
 	struct clk_hw *xtal;
 	int ret;
 
-	ret = meson_g12a_dvfs_setup_common(pdev, hws);
+	ret = meson_g12a_dvfs_setup_common(dev, hws);
 	if (ret)
 		return ret;
 
 	xtal = clk_hw_get_parent_by_index(hws[CLKID_CPU_CLK_DYN1_SEL], 0);
 
 	/* Setup clock notifier for cpu_clk mux */
-	notifier_clk_name = clk_hw_get_name(&g12b_cpu_clk.hw);
-	notifier_clk = __clk_lookup(notifier_clk_name);
+	notifier_clk = devm_clk_hw_get_clk(dev, &g12b_cpu_clk.hw,
+					   DVFS_CON_ID);
 	ret = clk_notifier_register(notifier_clk, &g12a_cpu_clk_mux_nb);
 	if (ret) {
-		dev_err(&pdev->dev, "failed to register the cpu_clk notifier\n");
+		dev_err(dev, "failed to register the cpu_clk notifier\n");
 		return ret;
 	}
 
 	/* Setup clock notifier for sys1_pll */
-	notifier_clk_name = clk_hw_get_name(&g12b_sys1_pll.hw);
-	notifier_clk = __clk_lookup(notifier_clk_name);
+	notifier_clk = devm_clk_hw_get_clk(dev, &g12b_sys1_pll.hw,
+					   DVFS_CON_ID);
 	ret = clk_notifier_register(notifier_clk,
 				    &g12b_cpu_clk_sys1_pll_nb_data.nb);
 	if (ret) {
-		dev_err(&pdev->dev, "failed to register the sys1_pll notifier\n");
+		dev_err(dev, "failed to register the sys1_pll notifier\n");
 		return ret;
 	}
 
@@ -5226,40 +5227,37 @@ static int meson_g12b_dvfs_setup(struct platform_device *pdev)
 
 	/* Setup clock notifier for cpub_clk_postmux0 */
 	g12b_cpub_clk_postmux0_nb_data.xtal = xtal;
-	notifier_clk_name = clk_hw_get_name(&g12b_cpub_clk_postmux0.hw);
-	notifier_clk = __clk_lookup(notifier_clk_name);
+	notifier_clk = devm_clk_hw_get_clk(dev, &g12b_cpub_clk_postmux0.hw,
+					   DVFS_CON_ID);
 	ret = clk_notifier_register(notifier_clk,
 				    &g12b_cpub_clk_postmux0_nb_data.nb);
 	if (ret) {
-		dev_err(&pdev->dev, "failed to register the cpub_clk_postmux0 notifier\n");
+		dev_err(dev, "failed to register the cpub_clk_postmux0 notifier\n");
 		return ret;
 	}
 
 	/* Setup clock notifier for cpub_clk_dyn mux */
-	notifier_clk_name = clk_hw_get_name(&g12b_cpub_clk_dyn.hw);
-	notifier_clk = __clk_lookup(notifier_clk_name);
+	notifier_clk = devm_clk_hw_get_clk(dev, &g12b_cpub_clk_dyn.hw, "dvfs");
 	ret = clk_notifier_register(notifier_clk, &g12a_cpu_clk_mux_nb);
 	if (ret) {
-		dev_err(&pdev->dev, "failed to register the cpub_clk_dyn notifier\n");
+		dev_err(dev, "failed to register the cpub_clk_dyn notifier\n");
 		return ret;
 	}
 
 	/* Setup clock notifier for cpub_clk mux */
-	notifier_clk_name = clk_hw_get_name(&g12b_cpub_clk.hw);
-	notifier_clk = __clk_lookup(notifier_clk_name);
+	notifier_clk = devm_clk_hw_get_clk(dev, &g12b_cpub_clk.hw, DVFS_CON_ID);
 	ret = clk_notifier_register(notifier_clk, &g12a_cpu_clk_mux_nb);
 	if (ret) {
-		dev_err(&pdev->dev, "failed to register the cpub_clk notifier\n");
+		dev_err(dev, "failed to register the cpub_clk notifier\n");
 		return ret;
 	}
 
 	/* Setup clock notifier for sys_pll */
-	notifier_clk_name = clk_hw_get_name(&g12a_sys_pll.hw);
-	notifier_clk = __clk_lookup(notifier_clk_name);
+	notifier_clk = devm_clk_hw_get_clk(dev, &g12a_sys_pll.hw, DVFS_CON_ID);
 	ret = clk_notifier_register(notifier_clk,
 				    &g12b_cpub_clk_sys_pll_nb_data.nb);
 	if (ret) {
-		dev_err(&pdev->dev, "failed to register the sys_pll notifier\n");
+		dev_err(dev, "failed to register the sys_pll notifier\n");
 		return ret;
 	}
 
@@ -5269,29 +5267,27 @@ static int meson_g12b_dvfs_setup(struct platform_device *pdev)
 static int meson_g12a_dvfs_setup(struct platform_device *pdev)
 {
 	struct clk_hw **hws = g12a_hw_onecell_data.hws;
-	const char *notifier_clk_name;
+	struct device *dev = &pdev->dev;
 	struct clk *notifier_clk;
 	int ret;
 
-	ret = meson_g12a_dvfs_setup_common(pdev, hws);
+	ret = meson_g12a_dvfs_setup_common(dev, hws);
 	if (ret)
 		return ret;
 
 	/* Setup clock notifier for cpu_clk mux */
-	notifier_clk_name = clk_hw_get_name(&g12a_cpu_clk.hw);
-	notifier_clk = __clk_lookup(notifier_clk_name);
+	notifier_clk = devm_clk_hw_get_clk(dev, &g12a_cpu_clk.hw, DVFS_CON_ID);
 	ret = clk_notifier_register(notifier_clk, &g12a_cpu_clk_mux_nb);
 	if (ret) {
-		dev_err(&pdev->dev, "failed to register the cpu_clk notifier\n");
+		dev_err(dev, "failed to register the cpu_clk notifier\n");
 		return ret;
 	}
 
 	/* Setup clock notifier for sys_pll */
-	notifier_clk_name = clk_hw_get_name(&g12a_sys_pll.hw);
-	notifier_clk = __clk_lookup(notifier_clk_name);
+	notifier_clk = devm_clk_hw_get_clk(dev, &g12a_sys_pll.hw, DVFS_CON_ID);
 	ret = clk_notifier_register(notifier_clk, &g12a_sys_pll_nb_data.nb);
 	if (ret) {
-		dev_err(&pdev->dev, "failed to register the sys_pll notifier\n");
+		dev_err(dev, "failed to register the sys_pll notifier\n");
 		return ret;
 	}
 
-- 
2.25.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
