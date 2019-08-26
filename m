Return-Path: <SRS0=Ixac=WW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54945C3A5A5
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Aug 2019 07:27:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B920206BA
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Aug 2019 07:27:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fwYOUgpR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="eNTsqQO+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B920206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S30fQy/nTeSZ22xe91IW0ghj+25h5FHhKdEwFrqzp2w=; b=fwYOUgpR7xWLp5
	BKd0wCSCsODrYzkd+WzwMrA5tUPUC55y5f8cROOq0PURnXlWGMbXvOqzvSkPt+J2O33b3xP8BvlNe
	/+3moqWqn4MSvWC4bkpSDWwxIWjZQoKDdJTn5HyqA+7Jed9chZXDIZdU6iVTcfFt3d/HWedE+LsU8
	gSIK1e4kUz4SziW8t4TgYrs9Qhd1LE+T1cW7b1tJwR6sA+fQ5PMU3KeF5ZvI0pUyuSTuZV3XReJBh
	zCsJp4H6m51orrJW55Q/zdSEKnfxPti7HzbzhDCr4WiNL9GU30tNKQ3j52/zJskH4O4KqWLZ5MKjv
	w/K7+z5XA3EJn4QWKh7Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i29PL-000206-FU; Mon, 26 Aug 2019 07:27:19 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i29Ns-0000zr-2a
 for linux-amlogic@lists.infradead.org; Mon, 26 Aug 2019 07:25:51 +0000
Received: by mail-wr1-x443.google.com with SMTP id r3so14248466wrt.3
 for <linux-amlogic@lists.infradead.org>; Mon, 26 Aug 2019 00:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Zdrob6jLCWmAD4MIg2cSWU4L47HdPY2t/Oo0wCYY7Hk=;
 b=eNTsqQO+0IRILvTHpP4U1fThTnEQSQzUrubj1bYbnOVATm6sd6W5aOqxUUWAv7BYEL
 ysIjinLA/yDz9vcpiVmz67jr/wTtqIPTQ4IsAJ2mRUDPXZU0VXvBL26m3Z/l1bGc4cwT
 JBSXRBy4jup0VmK8HKTEfS3tgNsDebGX0YjQEg1eUM4fNtxiWmNVClaj8v859lLRFmue
 6aT2HFHzOZP+cbBPh9a25BNyjVHSjHhpPD6S5wwR8OmKxFEj9o+Xf0EE/FhF9R2i9kJ8
 szWomQyyFGc2IZuCz8ObyAoys8HZvToCMDi1FJkb5upkOd09yKVJ5HaTThausIJCaVvJ
 mfGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Zdrob6jLCWmAD4MIg2cSWU4L47HdPY2t/Oo0wCYY7Hk=;
 b=MeUoTJ30B4dHBPZich0W1mr65S+h1WVQJexHGNzd3WHIvQpAAbVqEDNxyQKCkySG7d
 MglmvY/SAJbBtCypnPk1n70gbBLLeVM9IMkne6LbCIfgHkYUzTAwit/7mcJWxpU3hzK7
 8l3WZ2Q5+zOz2H7ewXtIj6qJwODiLJ7LYXUs8q9nYsn3N1Y6opThw2Mws0VG/tMezgic
 ilHEt+lwFhEtaSAuUc4cn9VKEMwCR1ffq+kn83f1Ntt9Vi2A3PUWsOe2C/DphW2oaqA9
 JNm9WB6o+sPS4iZ7AsnwUS76BbswHg4bZz0C3uKLcgMTwvI3eyIuYTbKhBYbS2PPi8m3
 a4WQ==
X-Gm-Message-State: APjAAAWc2y+bCs//GM+F01HE4vZ3RkrRjOYukldHGabJ57wHxFbixQ7r
 RQI1wNp8d4MJiM/J/Yo8vjghpw==
X-Google-Smtp-Source: APXvYqxqinN+7WHsvAsFVT1CvNtxu5r6NgRiJ3mCW/RlIKEuf/08fVDXcyLiD4oRQqzLSplFV7uOcA==
X-Received: by 2002:a5d:4490:: with SMTP id j16mr20093838wrq.335.1566804346731; 
 Mon, 26 Aug 2019 00:25:46 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id a26sm10821324wmg.45.2019.08.26.00.25.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2019 00:25:46 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com,
	jbrunet@baylibre.com
Subject: [PATCH v2 4/5] clk: meson: g12a: add support for SM1 CPU 1,
 2 & 3 clocks
Date: Mon, 26 Aug 2019 09:25:38 +0200
Message-Id: <20190826072539.27725-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190826072539.27725-1-narmstrong@baylibre.com>
References: <20190826072539.27725-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190826_002548_302150_40801DEA 
X-CRM114-Status: GOOD (  13.35  )
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

The Amlogic SM1 can set a dedicated clock frequency for each CPU core by
having a dedicate tree for each core similar to the CPU0 tree.
Like the DSU tree, a supplementaty mux has been added to use the CPU0
frequency instead.

But since the cluster only has a single power rail and shares a single PLL,
it's not worth adding 3 unsused clock tree, so we add only the mux to
select the CPU0 clock frequency for each CPU1, CPU2 and CPU3 cores.

They are set read-only because the early boot stages sets them to select
the CPU0 input clock.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/clk/meson/g12a.c | 60 ++++++++++++++++++++++++++++++++++++++++
 drivers/clk/meson/g12a.h |  2 +-
 2 files changed, 61 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index e00df17f800a..ea4c791f106d 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -824,6 +824,60 @@ static struct clk_regmap sm1_dsu_final_clk = {
 	},
 };
 
+/* Datasheet names this field as "Cpu_clk_sync_mux_sel" bit 0 */
+static struct clk_regmap sm1_cpu1_clk = {
+	.data = &(struct clk_regmap_mux_data){
+		.offset = HHI_SYS_CPU_CLK_CNTL6,
+		.mask = 0x1,
+		.shift = 24,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "cpu1_clk",
+		.ops = &clk_regmap_mux_ro_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&g12a_cpu_clk.hw,
+			/* This CPU also have a dedicated clock tree */
+		},
+		.num_parents = 1,
+	},
+};
+
+/* Datasheet names this field as "Cpu_clk_sync_mux_sel" bit 1 */
+static struct clk_regmap sm1_cpu2_clk = {
+	.data = &(struct clk_regmap_mux_data){
+		.offset = HHI_SYS_CPU_CLK_CNTL6,
+		.mask = 0x1,
+		.shift = 25,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "cpu2_clk",
+		.ops = &clk_regmap_mux_ro_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&g12a_cpu_clk.hw,
+			/* This CPU also have a dedicated clock tree */
+		},
+		.num_parents = 1,
+	},
+};
+
+/* Datasheet names this field as "Cpu_clk_sync_mux_sel" bit 2 */
+static struct clk_regmap sm1_cpu3_clk = {
+	.data = &(struct clk_regmap_mux_data){
+		.offset = HHI_SYS_CPU_CLK_CNTL6,
+		.mask = 0x1,
+		.shift = 26,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "cpu3_clk",
+		.ops = &clk_regmap_mux_ro_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&g12a_cpu_clk.hw,
+			/* This CPU also have a dedicated clock tree */
+		},
+		.num_parents = 1,
+	},
+};
+
 /* Datasheet names this field as "Cpu_clk_sync_mux_sel" bit 4 */
 static struct clk_regmap sm1_dsu_clk = {
 	.data = &(struct clk_regmap_mux_data){
@@ -4576,6 +4630,9 @@ static struct clk_hw_onecell_data sm1_hw_onecell_data = {
 		[CLKID_DSU_CLK_DYN]		= &sm1_dsu_clk_dyn.hw,
 		[CLKID_DSU_CLK_FINAL]		= &sm1_dsu_final_clk.hw,
 		[CLKID_DSU_CLK]			= &sm1_dsu_clk.hw,
+		[CLKID_CPU1_CLK]		= &sm1_cpu1_clk.hw,
+		[CLKID_CPU2_CLK]		= &sm1_cpu2_clk.hw,
+		[CLKID_CPU3_CLK]		= &sm1_cpu3_clk.hw,
 		[NR_CLKS]			= NULL,
 	},
 	.num = NR_CLKS,
@@ -4807,6 +4864,9 @@ static struct clk_regmap *const g12a_clk_regmaps[] = {
 	&sm1_dsu_clk_dyn,
 	&sm1_dsu_final_clk,
 	&sm1_dsu_clk,
+	&sm1_cpu1_clk,
+	&sm1_cpu2_clk,
+	&sm1_cpu3_clk,
 };
 
 static const struct reg_sequence g12a_init_regs[] = {
diff --git a/drivers/clk/meson/g12a.h b/drivers/clk/meson/g12a.h
index 6804fcced6b5..9df4068aced1 100644
--- a/drivers/clk/meson/g12a.h
+++ b/drivers/clk/meson/g12a.h
@@ -256,7 +256,7 @@
 #define CLKID_DSU_CLK_DYN			250
 #define CLKID_DSU_CLK_FINAL			251
 
-#define NR_CLKS					253
+#define NR_CLKS					256
 
 /* include the CLKIDs that have been made part of the DT binding */
 #include <dt-bindings/clock/g12a-clkc.h>
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
