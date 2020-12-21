Return-Path: <SRS0=3nIP=FZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5B23C4332D
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Dec 2020 18:36:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EC8122D49
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Dec 2020 18:36:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4EC8122D49
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dR33MHZHZQ6/GwfDJVWiIrG5rQH2FbxtNzeHLUVNikE=; b=pJRu8uV5Z4KQVy+BaQhgVofbR
	UV5SpN8cqoodvvJIsvHcPoG7srSo+v8iLfcmNNBFeJxBP1jySytGxw1S/9Lu3xBwcZGphPyxvSzq8
	dFlDaAbzPf1Y5rq8/izZps3eBLxcl0KsQA24mTMJvpAkIoc5vPVTyhuGCQ/82D0ksKzioDh+XJghU
	FTHZit7WPnlRqw97QfnFHjVlsnK/x19cPV2G9+bq1w7euKcDkNrZYlyLMn+UsiwY4Gf+KEtXllbkg
	4mXaqpLw/271igh/cDS+iZrT3aLJ6t5Q1L68TmRYtBBpbQKdx+LHBiWKFeDzEh9X2KhY1HfD8n/F7
	gcBpwJicA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krQ2v-0005Cz-Ic; Mon, 21 Dec 2020 18:36:37 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krQ2r-0005BK-Lr; Mon, 21 Dec 2020 18:36:34 +0000
Received: by mail-ej1-x636.google.com with SMTP id 6so14808643ejz.5;
 Mon, 21 Dec 2020 10:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TdgDI/McFhUeexbzSYTEtY9heEpnkFcddZvRw8i20ns=;
 b=MQz6bQ8GADRYR90oyzlMuiTZ1uUlYVAv73wP6+N+0RlsFEzChKBh0Bmzm4JJeTqkN8
 xsSowKsYskPo7cIj98tbs3tK/xqolnxYCj9ha5dIbHyw0Zf1gGK6MSyrnWI1Sjvy/ems
 5LOjXEZnM/GToC/wfT/eEZtNK37Rp4Kn9G+6GWqCI3FW3gmGlQ1oesosZtbA8G1nW0zg
 nUrakCJ0ExfgDWy07LjjPByIbgfsDfkh16T8U3FWnJlBTOjz+4D5HLfXDGRsiX+Mu1PJ
 VUjxTRNJgf7730pzrs/clNjpAjLeyjB0tJXT94Ljx/sYBzAsF/0N/nTY0L6MPbpruPgz
 Sk1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TdgDI/McFhUeexbzSYTEtY9heEpnkFcddZvRw8i20ns=;
 b=pgXa5+FnAmUQhoI7fwfRNeOSwn9WTf6b+Y/uv7Df71pEIzqgKCgcGIfIjEAcNll4G0
 V/C87WAp1R1uEDi/EDqCaA515IUChq+9XqI5wiVCxHl72399lzD2ytQ8qwBk1wwyYyxu
 ggbA9eA4FyDwnIDJuJhJeWJUWo88MOZ1lEr4zebGamLisfCYylgn1dJurjQ+UzH/0pz7
 UBtjSxISJfosjaXyUSa3FVkmkkuxt/Meld+eZ0Uyyk2CBgGxbqc4YtjIhDJh5Tk1Pu7/
 jK8urdynmzFXk1NhkEejY6/zr5JNtZGb2DrsHmK+TU/9Am3kyekkh9dM3h5jwRt5CpuX
 XdQw==
X-Gm-Message-State: AOAM531VJ1HStnpzBtq4m11sL8ACCMTOlMx2yo0tg20BDOd6t3KtCzC5
 JO6yG9iOSRpQUe96G60/Uxn0HUQnQKU=
X-Google-Smtp-Source: ABdhPJzXaIRSxn3VSSLu2oxo6c8Ae0X+hkHuFxgqD+iWgmBEQHVio08aIDmO8JHkXyN6HL9K537arg==
X-Received: by 2002:a17:906:a192:: with SMTP id
 s18mr15900027ejy.249.1608575792252; 
 Mon, 21 Dec 2020 10:36:32 -0800 (PST)
Received: from localhost.localdomain
 (p200300f137019000428d5cfffeb99db8.dip0.t-ipconnect.de.
 [2003:f1:3701:9000:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id ld2sm9390408ejb.73.2020.12.21.10.36.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 10:36:31 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	jbrunet@baylibre.com
Subject: [PATCH 1/2] clk: meson: meson8b: remove compatibility code for old
 .dtbs
Date: Mon, 21 Dec 2020 19:36:23 +0100
Message-Id: <20201221183624.932649-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201221183624.932649-1-martin.blumenstingl@googlemail.com>
References: <20201221183624.932649-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201221_133633_770533_EED268C8 
X-CRM114-Status: GOOD (  18.29  )
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
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The XTAL clock is provided via .dts since Linux 5.6. Remove
compatibility code for .dtbs which are older than that.

The switch to the HHI syscon has been done with Linux 5.1. Also remove
any code needed to support .dtbs that have not switched to the HHI
syscon yet.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/meson/meson8b.c | 45 +++++--------------------------------
 1 file changed, 5 insertions(+), 40 deletions(-)

diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index 862f0756b50f..a844d35b553a 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -52,15 +52,6 @@ static const struct pll_params_table sys_pll_params_table[] = {
 	{ /* sentinel */ },
 };
 
-static struct clk_fixed_rate meson8b_xtal = {
-	.fixed_rate = 24000000,
-	.hw.init = &(struct clk_init_data){
-		.name = "xtal",
-		.num_parents = 0,
-		.ops = &clk_fixed_rate_ops,
-	},
-};
-
 static struct clk_regmap meson8b_fixed_pll_dco = {
 	.data = &(struct meson_clk_pll_data){
 		.en = {
@@ -2715,7 +2706,6 @@ static MESON_GATE(meson8b_ao_iface, HHI_GCLK_AO, 3);
 
 static struct clk_hw_onecell_data meson8_hw_onecell_data = {
 	.hws = {
-		[CLKID_XTAL] = &meson8b_xtal.hw,
 		[CLKID_PLL_FIXED] = &meson8b_fixed_pll.hw,
 		[CLKID_PLL_VID] = &meson8b_vid_pll.hw,
 		[CLKID_PLL_SYS] = &meson8b_sys_pll.hw,
@@ -2922,7 +2912,6 @@ static struct clk_hw_onecell_data meson8_hw_onecell_data = {
 
 static struct clk_hw_onecell_data meson8b_hw_onecell_data = {
 	.hws = {
-		[CLKID_XTAL] = &meson8b_xtal.hw,
 		[CLKID_PLL_FIXED] = &meson8b_fixed_pll.hw,
 		[CLKID_PLL_VID] = &meson8b_vid_pll.hw,
 		[CLKID_PLL_SYS] = &meson8b_sys_pll.hw,
@@ -3140,7 +3129,6 @@ static struct clk_hw_onecell_data meson8b_hw_onecell_data = {
 
 static struct clk_hw_onecell_data meson8m2_hw_onecell_data = {
 	.hws = {
-		[CLKID_XTAL] = &meson8b_xtal.hw,
 		[CLKID_PLL_FIXED] = &meson8b_fixed_pll.hw,
 		[CLKID_PLL_VID] = &meson8b_vid_pll.hw,
 		[CLKID_PLL_SYS] = &meson8b_sys_pll.hw,
@@ -3725,36 +3713,19 @@ static struct meson8b_nb_data meson8b_cpu_nb_data = {
 	.nb.notifier_call = meson8b_cpu_clk_notifier_cb,
 };
 
-static const struct regmap_config clkc_regmap_config = {
-	.reg_bits       = 32,
-	.val_bits       = 32,
-	.reg_stride     = 4,
-};
-
 static void __init meson8b_clkc_init_common(struct device_node *np,
 			struct clk_hw_onecell_data *clk_hw_onecell_data)
 {
 	struct meson8b_clk_reset *rstc;
 	const char *notifier_clk_name;
 	struct clk *notifier_clk;
-	void __iomem *clk_base;
 	struct regmap *map;
 	int i, ret;
 
 	map = syscon_node_to_regmap(of_get_parent(np));
 	if (IS_ERR(map)) {
-		pr_info("failed to get HHI regmap - Trying obsolete regs\n");
-
-		/* Generic clocks, PLLs and some of the reset-bits */
-		clk_base = of_iomap(np, 1);
-		if (!clk_base) {
-			pr_err("%s: Unable to map clk base\n", __func__);
-			return;
-		}
-
-		map = regmap_init_mmio(NULL, clk_base, &clkc_regmap_config);
-		if (IS_ERR(map))
-			return;
+		pr_err("failed to get HHI regmap - Trying obsolete regs\n");
+		return;
 	}
 
 	rstc = kzalloc(sizeof(*rstc), GFP_KERNEL);
@@ -3778,16 +3749,10 @@ static void __init meson8b_clkc_init_common(struct device_node *np,
 		meson8b_clk_regmaps[i]->map = map;
 
 	/*
-	 * always skip CLKID_UNUSED and also skip XTAL if the .dtb provides the
-	 * XTAL clock as input.
+	 * register all clks and start with the first used ID (which is
+	 * CLKID_PLL_FIXED)
 	 */
-	if (!IS_ERR(of_clk_get_by_name(np, "xtal")))
-		i = CLKID_PLL_FIXED;
-	else
-		i = CLKID_XTAL;
-
-	/* register all clks */
-	for (; i < CLK_NR_CLKS; i++) {
+	for (i = CLKID_PLL_FIXED; i < CLK_NR_CLKS; i++) {
 		/* array might be sparse */
 		if (!clk_hw_onecell_data->hws[i])
 			continue;
-- 
2.29.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
