Return-Path: <SRS0=PGU9=CY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6493C43461
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Sep 2020 12:47:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CD64206A5
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Sep 2020 12:47:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QumXFPO3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="LSMKV9E1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CD64206A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4cpKhi4i6EalxUV9CzW3MqwSWdrQkVttJPSG7/8TwD4=; b=QumXFPO3tb37be9Z9lqgxIAgB
	vBwzqQbaCrwrI+xjkEXathJAy4nzYx019NzcN0zJm91aNPMI2b/Ide+1y+Cq7f5jNyvuQUcdN3Qnc
	EyidUhcm6KCD4VI36Ej1y07yQXk/kHQNExVHLn8M5xXCwk8WoiGtHyO+cHZTKkbil+0ES3JfuYnp1
	AZaXFqQq6nTNHULbT6pgg+VmR9J3uj3VyLeFLEWdDUyWLgCvRx8sEL3sxGWmPbC8BQbjC59vkoNbi
	znkMhJ5uOpoE6MYb2MWHRgyohKF0LBX0YPIxjJHyfCBaSeV3SvhPMaeeJaF92m62bY+5f6fVLHAtH
	aeqnkx2yA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIAMO-0003Gr-IV; Tue, 15 Sep 2020 12:47:00 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIALW-0002ts-8j
 for linux-amlogic@lists.infradead.org; Tue, 15 Sep 2020 12:46:09 +0000
Received: by mail-wm1-x32b.google.com with SMTP id a9so3337650wmm.2
 for <linux-amlogic@lists.infradead.org>; Tue, 15 Sep 2020 05:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LHSM2iu4K745x/v3ZOpzSJ39ii9pvOm29QBeCUqbXig=;
 b=LSMKV9E1RHvzyFXuIfZParKjQcDPzMHd+HNuG37MfAhMeuciO6NZQUeZ7RvfnR2o8I
 tBolL7KrYEQOphZRKiQTAIcWGU4SgWclzi6VE7bbcnu/R9jxwRfgBwjqtJwnUumgTHFB
 DzX7NkyCfMmzrlumnfUV/7em/7/vUQi15L5SLJ912p2vxY9u4bR6d/SmNfejlb3WiT57
 08CoSBUacR84AMPDP52ukk/2zHu/QX+tuRRl7zX2GrlnykDRz/bPHNfyRJmSIfVRhxXT
 ieHIfJvOhB5Lxo7UNxPzhNBKIXYLHD4HSkSjHxEpzFN6WGmGUPDh+wwykTSSPz401PPw
 x3xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LHSM2iu4K745x/v3ZOpzSJ39ii9pvOm29QBeCUqbXig=;
 b=f6H09rKJKW0A+VAbN9ZxnOrMOBzaoJ93ieikBacTS/zBwoa3KRVXQGh9g+vDzgoLhw
 tGZ1/HixI3onHzYpJO/4T34yVeSYQwGXcToyX1yWiVcP8Y5H/4N/6BEMM30lbn6XetN3
 xtHTDnXz4APH0G/uNSKkeOtcyoWJP/7EQMRhkwxp2uoumLL4OPlwQwHITJAza2BK4stx
 0gnxWNFt4uIk3EjGjudQBv1eJmR+BN892/dRqyP4IVYimWlnvocQw6DZ1HjHAcVOL9wB
 FyyJQKLLZiRLIFO+iIpT8Zxp9PJmQDDNlisv/VNIWW1LtveihhMEDOw0WJf4ISE2ytjV
 eadA==
X-Gm-Message-State: AOAM533RMBN9gpcKXiZFTsp722j5kyMFrEg/4HRuAKF6ue4F+IiD+tfm
 xrWnCbLX2Ev4xyN6lPwXnGmMEQ==
X-Google-Smtp-Source: ABdhPJx7awCJQT1ZbKP8GwvwkIGpiaGrgV9tODdJfba635Qj3aWUUkYLeL9InIbQo6ZmEyQ3rtobOA==
X-Received: by 2002:a7b:c090:: with SMTP id r16mr4677613wmh.56.1600173962213; 
 Tue, 15 Sep 2020 05:46:02 -0700 (PDT)
Received: from bender.baylibre.local (home.beaume.starnux.net. [82.236.8.43])
 by smtp.gmail.com with ESMTPSA id
 q8sm26548589wrx.79.2020.09.15.05.46.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 05:46:01 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com
Subject: [PATCH v2 4/4] clk: meson: axg: add MIPI DSI Host clock
Date: Tue, 15 Sep 2020 14:45:53 +0200
Message-Id: <20200915124553.8056-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200915124553.8056-1-narmstrong@baylibre.com>
References: <20200915124553.8056-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_084607_067448_69B7C1AD 
X-CRM114-Status: GOOD (  16.08  )
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
index a4e8949297cf..089a81ce2385 100644
--- a/drivers/clk/meson/axg.c
+++ b/drivers/clk/meson/axg.c
@@ -1703,6 +1703,66 @@ static struct clk_regmap axg_cts_encl = {
 	},
 };
 
+/* MIPI DSI Host Clock */
+
+static u32 mux_table_axg_vdin_meas[]    = { 0, 1, 2, 3, 6, 7 };
+static const struct clk_parent_data axg_vdin_meas_parent_data[] = {
+	{ .fw_name = "xtal", },
+	{ .hw = &axg_fclk_div4.hw },
+	{ .hw = &axg_fclk_div3.hw },
+	{ .hw = &axg_fclk_div5.hw },
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
+		.table = mux_table_axg_vdin_meas,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "vdin_meas_sel",
+		.ops = &clk_regmap_mux_ops,
+		.parent_data = axg_vdin_meas_parent_data,
+		.num_parents = ARRAY_SIZE(axg_vdin_meas_parent_data),
+		.flags = CLK_SET_RATE_PARENT,
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
@@ -1966,6 +2026,9 @@ static struct clk_hw_onecell_data axg_hw_onecell_data = {
 		[CLKID_VCLK2_DIV12]		= &axg_vclk2_div12.hw,
 		[CLKID_CTS_ENCL_SEL]		= &axg_cts_encl_sel.hw,
 		[CLKID_CTS_ENCL]		= &axg_cts_encl.hw,
+		[CLKID_VDIN_MEAS_SEL]		= &axg_vdin_meas_sel.hw,
+		[CLKID_VDIN_MEAS_DIV]		= &axg_vdin_meas_div.hw,
+		[CLKID_VDIN_MEAS]		= &axg_vdin_meas.hw,
 		[NR_CLKS]			= NULL,
 	},
 	.num = NR_CLKS,
@@ -2094,6 +2157,9 @@ static struct clk_regmap *const axg_clk_regmaps[] = {
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
