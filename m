Return-Path: <SRS0=N67E=WS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAA15C3A5A1
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Aug 2019 14:26:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BE3821726
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Aug 2019 14:26:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="J3GHSOR7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ZNGhBY1r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BE3821726
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MFjDEjHj5r4lwAstAxON5niQg8DK4OSAnyYYE+74Jj8=; b=J3GHSOR76wTpX/
	kr0tt9jMmObaJGLThRQtOt/pApRlgxDRN5ySCuw99/CEi+rRDVdBDbVTqinY4pkdfoB/eVIH+w1jp
	egrpy58V1YzRRmm81ST4ZoAHhv9HHfEGi15C8YRujzUlmlTvr2INFiiVpfCx9afAb8ZpVmo1Mfi2E
	UCsxL+6Pt/UTFpuIpWzFdjIpLIkkY6jkD+0tSoqBx74BY01MfRrmElZGActWc/4+aA3nhjWjG20gC
	wcKByOv3L/3flKnsv4aAvAbTbUgGnhbk8QjCn1hREU4q3yHP2jyEb14thIna1BpujiH0fvw3DKciv
	9Y99Wwd4nYe2/PkZF9XQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0o2O-0003KK-7e; Thu, 22 Aug 2019 14:26:04 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0o1Q-0001T7-CH
 for linux-amlogic@lists.infradead.org; Thu, 22 Aug 2019 14:25:08 +0000
Received: by mail-wm1-x343.google.com with SMTP id v15so5858299wml.0
 for <linux-amlogic@lists.infradead.org>; Thu, 22 Aug 2019 07:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=efdSeNH/QBBOZqlQs2XNIRUHwxZMtVjjyApRGkdJu3w=;
 b=ZNGhBY1rfPIoyScoivo8/iASLhNmdke4+25bbKaQ5Obqoz6haM5GsTFFq/FmEOtgCG
 n7Dmm6LledG9iB3szrITx1SKpoQ61ZMDXJclOtrl5iTYHiTvodZ3zoncC1Zk1G/6rraN
 H+WAKUOdCpz9yVQBkoktXVGVhgCw3kSN8j9SKHsjX505yXSG9Wdqp5dq275aoXM0ppoV
 PzyMgI8c94EK1n18VllL64JYQgLMQyJZ8C5Yqb6o7BqQpU9winiLZZaZPo2fHQcXl6Wo
 S4TrmI5ts96Ha5y3ZHyHgyICULmDOqyzgcFESL/dgSNBV0m45Grl7OLIA8UAY+OaR+Oi
 IUMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=efdSeNH/QBBOZqlQs2XNIRUHwxZMtVjjyApRGkdJu3w=;
 b=WxpB35yUqH8oe1zsbHapUbMGmE8+etM8tEHb+VmMn7PA0i5+4OfZHZt2FEO83xQBLa
 FB0YKeJ3vcEuh9BA5gCTU/ijKwvs3V9qiX/oM9vF92HT8prdeYGcs1KsCJDdbWmw72wA
 bTAdpiA/3tPgH5JFzW2k9Tgl514ErNMfP+4yKQPOX2lgi582jzg/QmyV6CJ4gqlxa2DU
 u15PKk3y4zvTGB3EnrmJqjFAhegVt84r2aaqR39StMMFanZUdU5WKsDnjg9mB2TYkcUJ
 gJpAjLbN3OZwym819cZGDaqogf4xMtENWEVGKzwzm8Tgos6aT+TmmkOQjkqwdna1eiw4
 XkJg==
X-Gm-Message-State: APjAAAWDE/1W+ZmIpWtH6+2sa5YYcnxUhPGo6AFty+lPjTxyAn7tikJM
 2HbbGdQdGWF4JnE92+Uxvbf2bjS+y30CzQ==
X-Google-Smtp-Source: APXvYqyFE9Pb25xtedaP9csULi66XXPT7a+xlIV3PDqNu3/EEMfHXywqrTrnUpXDD/8k72i2E/yz1A==
X-Received: by 2002:a7b:cb0f:: with SMTP id u15mr6299552wmj.173.1566483902198; 
 Thu, 22 Aug 2019 07:25:02 -0700 (PDT)
Received: from bender.baylibre.local (176-150-251-154.abo.bbox.fr.
 [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id d17sm25806547wrm.52.2019.08.22.07.25.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2019 07:25:01 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com,
	jbrunet@baylibre.com
Subject: [PATCH 3/6] clk: meson: g12a: add support for SM1 DynamIQ Shared Unit
 clock
Date: Thu, 22 Aug 2019 16:24:52 +0200
Message-Id: <20190822142455.12506-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190822142455.12506-1-narmstrong@baylibre.com>
References: <20190822142455.12506-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190822_072504_466034_A7C644B0 
X-CRM114-Status: GOOD (  11.19  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Amlogic SM1 DynamIQ Shared Unit has a dedicated clock tree similar to the
CPU clock tree with a supplementaty mux to select the CPU0 clock instead.

Leave this as read-only since it's set up by the early boot stages.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/clk/meson/g12a.c | 184 +++++++++++++++++++++++++++++++++++++++
 drivers/clk/meson/g12a.h |  16 +++-
 2 files changed, 199 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index 34dfac4b4dc6..e00df17f800a 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -676,6 +676,172 @@ static struct clk_regmap g12b_cpub_clk = {
 	},
 };
 
+static struct clk_regmap sm1_gp1_pll;
+
+/* Datasheet names this field as "premux0" */
+static struct clk_regmap sm1_dsu_clk_premux0 = {
+	.data = &(struct clk_regmap_mux_data){
+		.offset = HHI_SYS_CPU_CLK_CNTL5,
+		.mask = 0x3,
+		.shift = 0,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "dsu_clk_dyn0_sel",
+		.ops = &clk_regmap_mux_ro_ops,
+		.parent_data = (const struct clk_parent_data []) {
+			{ .fw_name = "xtal", },
+			{ .hw = &g12a_fclk_div2.hw },
+			{ .hw = &g12a_fclk_div3.hw },
+			{ .hw = &sm1_gp1_pll.hw },
+		},
+		.num_parents = 4,
+	},
+};
+
+/* Datasheet names this field as "premux1" */
+static struct clk_regmap sm1_dsu_clk_premux1 = {
+	.data = &(struct clk_regmap_mux_data){
+		.offset = HHI_SYS_CPU_CLK_CNTL5,
+		.mask = 0x3,
+		.shift = 16,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "dsu_clk_dyn1_sel",
+		.ops = &clk_regmap_mux_ro_ops,
+		.parent_data = (const struct clk_parent_data []) {
+			{ .fw_name = "xtal", },
+			{ .hw = &g12a_fclk_div2.hw },
+			{ .hw = &g12a_fclk_div3.hw },
+			{ .hw = &sm1_gp1_pll.hw },
+		},
+		.num_parents = 4,
+	},
+};
+
+/* Datasheet names this field as "Mux0_divn_tcnt" */
+static struct clk_regmap sm1_dsu_clk_mux0_div = {
+	.data = &(struct clk_regmap_div_data){
+		.offset = HHI_SYS_CPU_CLK_CNTL5,
+		.shift = 4,
+		.width = 6,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "dsu_clk_dyn0_div",
+		.ops = &clk_regmap_divider_ro_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&sm1_dsu_clk_premux0.hw
+		},
+		.num_parents = 1,
+	},
+};
+
+/* Datasheet names this field as "postmux0" */
+static struct clk_regmap sm1_dsu_clk_postmux0 = {
+	.data = &(struct clk_regmap_mux_data){
+		.offset = HHI_SYS_CPU_CLK_CNTL5,
+		.mask = 0x1,
+		.shift = 2,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "dsu_clk_dyn0",
+		.ops = &clk_regmap_mux_ro_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&sm1_dsu_clk_premux0.hw,
+			&sm1_dsu_clk_mux0_div.hw,
+		},
+		.num_parents = 2,
+	},
+};
+
+/* Datasheet names this field as "Mux1_divn_tcnt" */
+static struct clk_regmap sm1_dsu_clk_mux1_div = {
+	.data = &(struct clk_regmap_div_data){
+		.offset = HHI_SYS_CPU_CLK_CNTL5,
+		.shift = 20,
+		.width = 6,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "dsu_clk_dyn1_div",
+		.ops = &clk_regmap_divider_ro_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&sm1_dsu_clk_premux1.hw
+		},
+		.num_parents = 1,
+	},
+};
+
+/* Datasheet names this field as "postmux1" */
+static struct clk_regmap sm1_dsu_clk_postmux1 = {
+	.data = &(struct clk_regmap_mux_data){
+		.offset = HHI_SYS_CPU_CLK_CNTL5,
+		.mask = 0x1,
+		.shift = 18,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "dsu_clk_dyn1",
+		.ops = &clk_regmap_mux_ro_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&sm1_dsu_clk_premux1.hw,
+			&sm1_dsu_clk_mux1_div.hw,
+		},
+		.num_parents = 2,
+	},
+};
+
+/* Datasheet names this field as "Final_dyn_mux_sel" */
+static struct clk_regmap sm1_dsu_clk_dyn = {
+	.data = &(struct clk_regmap_mux_data){
+		.offset = HHI_SYS_CPU_CLK_CNTL5,
+		.mask = 0x1,
+		.shift = 10,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "dsu_clk_dyn",
+		.ops = &clk_regmap_mux_ro_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&sm1_dsu_clk_postmux0.hw,
+			&sm1_dsu_clk_postmux1.hw,
+		},
+		.num_parents = 2,
+	},
+};
+
+/* Datasheet names this field as "Final_mux_sel" */
+static struct clk_regmap sm1_dsu_final_clk = {
+	.data = &(struct clk_regmap_mux_data){
+		.offset = HHI_SYS_CPU_CLK_CNTL5,
+		.mask = 0x1,
+		.shift = 11,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "dsu_clk_final",
+		.ops = &clk_regmap_mux_ro_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&sm1_dsu_clk_dyn.hw,
+			&g12a_sys_pll.hw,
+		},
+		.num_parents = 2,
+	},
+};
+
+/* Datasheet names this field as "Cpu_clk_sync_mux_sel" bit 4 */
+static struct clk_regmap sm1_dsu_clk = {
+	.data = &(struct clk_regmap_mux_data){
+		.offset = HHI_SYS_CPU_CLK_CNTL6,
+		.mask = 0x1,
+		.shift = 27,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "dsu_clk",
+		.ops = &clk_regmap_mux_ro_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&g12a_cpu_clk.hw,
+			&sm1_dsu_final_clk.hw,
+		},
+		.num_parents = 2,
+	},
+};
+
 static int g12a_cpu_clk_mux_notifier_cb(struct notifier_block *nb,
 					unsigned long event, void *data)
 {
@@ -4401,6 +4567,15 @@ static struct clk_hw_onecell_data sm1_hw_onecell_data = {
 		[CLKID_TS]			= &g12a_ts.hw,
 		[CLKID_GP1_PLL_DCO]		= &sm1_gp1_pll_dco.hw,
 		[CLKID_GP1_PLL]			= &sm1_gp1_pll.hw,
+		[CLKID_DSU_CLK_DYN0_SEL]	= &sm1_dsu_clk_premux0.hw,
+		[CLKID_DSU_CLK_DYN0_DIV]	= &sm1_dsu_clk_premux1.hw,
+		[CLKID_DSU_CLK_DYN0]		= &sm1_dsu_clk_mux0_div.hw,
+		[CLKID_DSU_CLK_DYN1_SEL]	= &sm1_dsu_clk_postmux0.hw,
+		[CLKID_DSU_CLK_DYN1_DIV]	= &sm1_dsu_clk_mux1_div.hw,
+		[CLKID_DSU_CLK_DYN1]		= &sm1_dsu_clk_postmux1.hw,
+		[CLKID_DSU_CLK_DYN]		= &sm1_dsu_clk_dyn.hw,
+		[CLKID_DSU_CLK_FINAL]		= &sm1_dsu_final_clk.hw,
+		[CLKID_DSU_CLK]			= &sm1_dsu_clk.hw,
 		[NR_CLKS]			= NULL,
 	},
 	.num = NR_CLKS,
@@ -4623,6 +4798,15 @@ static struct clk_regmap *const g12a_clk_regmaps[] = {
 	&g12b_cpub_clk_trace,
 	&sm1_gp1_pll_dco,
 	&sm1_gp1_pll,
+	&sm1_dsu_clk_premux0,
+	&sm1_dsu_clk_premux1,
+	&sm1_dsu_clk_mux0_div,
+	&sm1_dsu_clk_postmux0,
+	&sm1_dsu_clk_mux1_div,
+	&sm1_dsu_clk_postmux1,
+	&sm1_dsu_clk_dyn,
+	&sm1_dsu_final_clk,
+	&sm1_dsu_clk,
 };
 
 static const struct reg_sequence g12a_init_regs[] = {
diff --git a/drivers/clk/meson/g12a.h b/drivers/clk/meson/g12a.h
index 4b3d22245609..66fd46940f91 100644
--- a/drivers/clk/meson/g12a.h
+++ b/drivers/clk/meson/g12a.h
@@ -80,6 +80,11 @@
 #define HHI_SYS_CPUB_CLK_CNTL1		0x200
 #define HHI_SYS_CPUB_CLK_CNTL		0x208
 #define HHI_VPU_CLKB_CNTL		0x20C
+#define HHI_SYS_CPU_CLK_CNTL2		0x210
+#define HHI_SYS_CPU_CLK_CNTL3		0x214
+#define HHI_SYS_CPU_CLK_CNTL4		0x218
+#define HHI_SYS_CPU_CLK_CNTL5		0x21c
+#define HHI_SYS_CPU_CLK_CNTL6		0x220
 #define HHI_GEN_CLK_CNTL		0x228
 #define HHI_VDIN_MEAS_CLK_CNTL		0x250
 #define HHI_MIPIDSI_PHY_CLK_CNTL	0x254
@@ -243,8 +248,17 @@
 #define CLKID_CPUB_CLK_TRACE			241
 #define CLKID_GP1_PLL_DCO			242
 #define CLKID_GP1_PLL				243
+#define CLKID_DSU_CLK_DYN0_SEL			244
+#define CLKID_DSU_CLK_DYN0_DIV			245
+#define CLKID_DSU_CLK_DYN0			246
+#define CLKID_DSU_CLK_DYN1_SEL			247
+#define CLKID_DSU_CLK_DYN1_DIV			248
+#define CLKID_DSU_CLK_DYN1			249
+#define CLKID_DSU_CLK_DYN			250
+#define CLKID_DSU_CLK_FINAL			251
+#define CLKID_DSU_CLK				252
 
-#define NR_CLKS					242
+#define NR_CLKS					253
 
 /* include the CLKIDs that have been made part of the DT binding */
 #include <dt-bindings/clock/g12a-clkc.h>
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
