Return-Path: <SRS0=IdmP=CQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7EDBC433E2
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Sep 2020 09:38:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 526272075A
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Sep 2020 09:38:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RVmTt76z";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="sbm/2Ru6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 526272075A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6RQsJXpsw386huVQVPcFygyNH5kjBDqI5pv6nrXlFVM=; b=RVmTt76zgOpCjzcjk6YCTBc9L
	6C9t+S8axb646GT03NjxTY40qF2geCv99t3QJRe99SrFAQoT0OGg4CfqOt7Zlu8sHPguWkcH8rfFN
	y+T68f9pFGycc+x7bg4ZoMT1uUTFP7TukVfKkE45YXiFpgUytLO3XPlomO8qCjl2LsRdvrN6CKUvF
	890YENzvp4a/jRiJHs4gd3+0wYZ1/02EIiVhmLnWZULd7ouKULfGJCXid4B3lsFpfCOYWKfWzHOFO
	hEbntHmgDCdNcW20J+Kz0uWQS3yGF9kQp8sBdKLRakQGAx94VgBVuL3n61TxS98hGRjrdTfqCLXyq
	B3IhlUBPA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFDbi-0004Dq-MM; Mon, 07 Sep 2020 09:38:38 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFDbR-00046M-3f
 for linux-amlogic@lists.infradead.org; Mon, 07 Sep 2020 09:38:26 +0000
Received: by mail-wr1-x442.google.com with SMTP id t10so15114751wrv.1
 for <linux-amlogic@lists.infradead.org>; Mon, 07 Sep 2020 02:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jGO9jVZrhEmOJuA/klWeCEUWDNhPqBa3VGuy7F9/Vdw=;
 b=sbm/2Ru6SVsfEWGzwKaKy7VXjGX3mGxOom64+kE0Oszzdi7Ww+d9Zfm4erX8eRLmbV
 DbYZoQRanHmw4w1LIHpa1H5NNjYm97RnjgHPArakCjXLwNKnVFeV5jcqwW7nNW5M+KVV
 u4cogdWysSrA7LWl1nqBOXudYBrn3esQkNh8+mrl3Ltz76wei1Ct3hbv8hSQ8KUOAkf5
 aD4KZcSjC/YNOUTB4xcG57Dz0v8rn25BaY8pVKq6eYB/3zU7au/5TKTzM7mduvQPYKoc
 Cs9qxVACKdI1/Hey37SFYEszgSqJeIbRDVUX3/YAsp7EkDp22f9ea89Ic1KjYeLExjfS
 Qm3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jGO9jVZrhEmOJuA/klWeCEUWDNhPqBa3VGuy7F9/Vdw=;
 b=LJzDduPTWuRNKV5jWr2deC7ninObRKhd4YF8H41BbP2jgkbMWUE04g+wKUu4a8XTob
 eBjT+eSaEkAQykVMPZtNDhRPUgwZj1B9egPHX7V1rPO/jbOI/Tle7EQgMrlU8+egH3hs
 wyjXWuQdl0m5WAd5nzQxZGLLUTgKtU6Y78DRclBR57A71Vl3ttR9LwkL7lusWxBaenD2
 5RbMne89tOLh6DPstte46ECk1bZk4O67Pv15scUiMf37ndxNuaEe2axzmrLp7rd4bc1z
 tzZo2ftcA4H0qwxsL2fqzlSz+EB6MqSN3Tu5eMmjhoOae62Nfvoy2E7JGSP/UCrXgJUv
 YF8g==
X-Gm-Message-State: AOAM532rtqDybRkBzNBXgc3eS7V+pO/B/L3BXnGZ7oHMHZU3OtEXh9Y/
 d1iThI0vS/BmjFTkSlVouMK/9A==
X-Google-Smtp-Source: ABdhPJzpiy0FuxnE4oNUYWhX9oVXHDCTTUEAZMbPg+kXurUn2O94g22N86JXgNPPVEe9ldwQIEvwbA==
X-Received: by 2002:adf:9591:: with SMTP id p17mr21462232wrp.237.1599471499897; 
 Mon, 07 Sep 2020 02:38:19 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
 by smtp.gmail.com with ESMTPSA id n17sm25170687wrw.0.2020.09.07.02.38.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 02:38:18 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com
Subject: [PATCH 4/4] clk: meson: axg: add MIPI DSI Host clock
Date: Mon,  7 Sep 2020 11:38:10 +0200
Message-Id: <20200907093810.6585-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200907093810.6585-1-narmstrong@baylibre.com>
References: <20200907093810.6585-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_053821_200073_C6A7180C 
X-CRM114-Status: GOOD (  15.71  )
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
Cc: linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This adds the MIPI DSI Host clock, used to measure the signal timings (ENC VSYNC or
DW-MIPI-DSI eDPI timings).

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/clk/meson/axg.c | 66 +++++++++++++++++++++++++++++++++++++++++
 drivers/clk/meson/axg.h |  4 ++-
 2 files changed, 69 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/meson/axg.c b/drivers/clk/meson/axg.c
index 2550616c14b0..0094ca6388d8 100644
--- a/drivers/clk/meson/axg.c
+++ b/drivers/clk/meson/axg.c
@@ -1724,6 +1724,66 @@ static struct clk_regmap axg_cts_encl = {
 	},
 };
 
+/* MIPI DSI Host Clock */
+
+static const struct clk_parent_data axg_vdin_meas_parent_data[] = {
+	{ .fw_name = "xtal", },
+	{ .hw = &axg_fclk_div4.hw },
+	{ .hw = &axg_fclk_div3.hw },
+	{ .hw = &axg_fclk_div5.hw },
+	{ },
+	{ },
+	{ .hw = &axg_fclk_div2.hw },
+	{ .hw = &axg_fclk_div7.hw },
+};
+
+static struct clk_regmap axg_vdin_meas_sel = {
+	.data = &(struct clk_regmap_mux_data){
+		.offset = HHI_VDIN_MEAS_CLK_CNTL,
+		.mask = 0x7,
+		.shift = 21,
+		.flags = CLK_MUX_ROUND_CLOSEST,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "vdin_meas_sel",
+		.ops = &clk_regmap_mux_ops,
+		.parent_data = axg_vdin_meas_parent_data,
+		.num_parents = ARRAY_SIZE(axg_vdin_meas_parent_data),
+		.flags = CLK_SET_RATE_NO_REPARENT,
+	},
+};
+
+static struct clk_regmap axg_vdin_meas_div = {
+	.data = &(struct clk_regmap_div_data){
+		.offset = HHI_VDIN_MEAS_CLK_CNTL,
+		.shift = 12,
+		.width = 7,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "vdin_meas_div",
+		.ops = &clk_regmap_divider_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&axg_vdin_meas_sel.hw },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap axg_vdin_meas = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = HHI_VDIN_MEAS_CLK_CNTL,
+		.bit_idx = 20,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "vdin_meas",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&axg_vdin_meas_div.hw },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
 static u32 mux_table_gen_clk[]	= { 0, 4, 5, 6, 7, 8,
 				    9, 10, 11, 13, 14, };
 static const struct clk_parent_data gen_clk_parent_data[] = {
@@ -1987,6 +2047,9 @@ static struct clk_hw_onecell_data axg_hw_onecell_data = {
 		[CLKID_VCLK2_DIV12]		= &axg_vclk2_div12.hw,
 		[CLKID_CTS_ENCL_SEL]		= &axg_cts_encl_sel.hw,
 		[CLKID_CTS_ENCL]		= &axg_cts_encl.hw,
+		[CLKID_VDIN_MEAS_SEL]		= &axg_vdin_meas_sel.hw,
+		[CLKID_VDIN_MEAS_DIV]		= &axg_vdin_meas_div.hw,
+		[CLKID_VDIN_MEAS]		= &axg_vdin_meas.hw,
 		[NR_CLKS]			= NULL,
 	},
 	.num = NR_CLKS,
@@ -2115,6 +2178,9 @@ static struct clk_regmap *const axg_clk_regmaps[] = {
 	&axg_vclk2_div12_en,
 	&axg_cts_encl_sel,
 	&axg_cts_encl,
+	&axg_vdin_meas_sel,
+	&axg_vdin_meas_div,
+	&axg_vdin_meas,
 };
 
 static const struct meson_eeclkc_data axg_clkc_data = {
diff --git a/drivers/clk/meson/axg.h b/drivers/clk/meson/axg.h
index a8787b394a47..481b307ea3cb 100644
--- a/drivers/clk/meson/axg.h
+++ b/drivers/clk/meson/axg.h
@@ -158,8 +158,10 @@
 #define CLKID_VCLK2_DIV6_EN			120
 #define CLKID_VCLK2_DIV12_EN			121
 #define CLKID_CTS_ENCL_SEL			132
+#define CLKID_VDIN_MEAS_SEL			134
+#define CLKID_VDIN_MEAS_DIV			135
 
-#define NR_CLKS					134
+#define NR_CLKS					137
 
 /* include the CLKIDs that have been made part of the DT binding */
 #include <dt-bindings/clock/axg-clkc.h>
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
