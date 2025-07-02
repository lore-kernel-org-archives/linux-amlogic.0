Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F7BC83F07
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Jul 2025 16:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VX1JehYpjTAqYPcynzcV84KAYDcQ/lezw8d2NC3k3gU=; b=XmVhEB2xPeO/cd
	w4JUe8S5ZiNpjaN3taKxBlkG+obQjc65H/kwY5uULGKsSgr+KjcEZdE0ly0GaEoCB4O5g6ShzbfbH
	tXYws2oILMVJkbiTilRJ0X3eba6JVeiAKA4KeK8KOmam2GFnzi0NVT+f1zJ4+DnYE+PvwFXylFIdn
	pvS9rDlNzJ6DMt62TmokYldjBt0B+rqlglnA9bcNNWc/1pPyTGOOHljtWXsIHWIht1Ij7wQoI2mSL
	30Du+2gs2sWtxh45xHRKyrv0w2nol7U+tSFTPMLQwZERpqPYeh7kvhXuz8ohcFLUlgkzuI20pbPgm
	7Z6dqnZ6SuqmTsQC1OgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX0Sq-00000008yW0-3nqc;
	Wed, 02 Jul 2025 16:37:40 +0000
Received: from mail-wm1-f52.google.com ([209.85.128.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWzMn-00000008msO-34We
	for linux-amlogic@lists.infradead.org;
	Wed, 02 Jul 2025 15:27:23 +0000
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-450ccda1a6eso37064165e9.2
        for <linux-amlogic@lists.infradead.org>; Wed, 02 Jul 2025 08:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751470040; x=1752074840; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u2vfHycaQ2aNX5ou5BTAjuhhA7Heobv0edIIPsMPx08=;
        b=LFkx4bd1e3P7ROHzDu1BRy8Ld0yPLT5/dkxAbY1lBNnj5PC0J7/M/CRPec85R2C5Dt
         Cz5O90nwntpsn42/Vc7mNXzBnyGFoqH622CisiAOIrml9M3RCvGcqpHDC9SRQ5l6QTQ2
         WnOQTxzlqEd88KtHIsL0PxhZrWMQDhB4N+BRsjkB1e3iLxIovCJBf09usXr1UtvcNLeC
         d+yw5zF5aC8j5MtCE3EkrYRFJx/15/bcRIQcCRLB+5G030kZzKBcNry8wIQ+nU/CMwXT
         jv5Z7G8t9BklClG+B8w9oyrC68VCU9uqdysRS7PslxDDKj3sp5nOwkcRpIZtvnm5OdtV
         zmEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751470040; x=1752074840;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u2vfHycaQ2aNX5ou5BTAjuhhA7Heobv0edIIPsMPx08=;
        b=wvWvy0vojJB2CseSBe09a3qu5JWqdDuaLHNXni74OywsaRxe+OJ3z5UsCbJk+65lCQ
         cZb+9JX2Z/s9tA8AkvAFrzsutUSp1lSJG+w6eGT4u159n779bj4SjQJSeQKTbE5K6X6R
         ofQm/Fu7+75XlIv7+TZ17WyKxUpdyF3M8mXBoSqRBEGviNTwFgtN8Due6IfW/ehT07XV
         XMdNWcypHRNKQKRQfL5kbDfb46qYuwrXSRgldEgmARO8vX+JlwxUlPBwlp6jSrooQvRc
         Hv9V4i7bAgA8lkygEjK3eAt2ZWI9uywKhpUSRO87t0gyMvJTDb3HYIKLJGAWq4tmaJd6
         2foQ==
X-Gm-Message-State: AOJu0YzNalL3FZAJnm0OWkFm1OIz9/8bhcYlkqkFLFAA5U6njz8UwSOr
	Qtwtad3UhlX85U91EWg3QXIENH80BD6WstPa0yioLVwAWt0cCI2suK6QT24ZNu99eXs=
X-Gm-Gg: ASbGncuoBdSog2I32V89Vti31/dWuuyxiivlYko9FJIFgC42kktpYcD1+ko4huY/BPU
	tijYIc7cXVhVn2KPdqgqXP+CoCQJ1y8UEyZWj7J5vPHIjDKJ7rgXon1aQr8uQYZTvPOGgdJ9UjD
	uiIwnTgusYO7cuJ3MwGPMqeRqhDAcJZlwm7K7u3bj/rUd57GCEAir2xZxnjBb082X6A/JHZ3U7P
	J3I/HMjlL0jlxbSO9jKrx/Mr63pjSXgR6lLWmGyBEFjl5u4dS1N00IONla8FEhlvWVeTs4iiY++
	SaDQcEYafD2i6D7rGe7mx+Kg3zIo2/YTNewXVf1CXCNQpuqocD8eLjrAlXVqyr9YkhiVCO0qOWY
	UQWnmZ8E9rl4=
X-Google-Smtp-Source: AGHT+IHrchYGzHcs365qgBIDfY4hWYgsXuOd+9UXpsgNmD//bFzA+LvPvKmwJzVDPkDG+oas69aMJg==
X-Received: by 2002:a05:6000:21c3:b0:3a0:b940:d479 with SMTP id ffacd0b85a97d-3b2012f8716mr1840043f8f.53.1751470039784;
        Wed, 02 Jul 2025 08:27:19 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:5542:4bad:e07b:9489])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-454a9bcf35csm869205e9.20.2025.07.02.08.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 08:27:19 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 02 Jul 2025 17:26:05 +0200
Subject: [PATCH 07/26] clk: amlogic: g12a-ao: naming consistency alignment
MIME-Version: 1.0
Message-Id: <20250702-meson-clk-cleanup-24-v1-7-e163c9a1fc21@baylibre.com>
References: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
In-Reply-To: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=16330; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=BsDu7/Vg0WHtN39FndrGjMoc90Hoc0+X58Lv9FeO4RQ=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBoZU+9h7P8ICiND7ba6ymWgC5onAbiTMEm5yt08
 W8HqknbJ3uJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaGVPvQAKCRDm/A8cN/La
 hbWAD/4u8dcP+a8IX5wX6ILqSuVAa0mOoWUAyajDMCogZbg5BQ8vJh0RcDFLFcaQ/4/L4RBcLjc
 /4wxgQz2I8DAOITsQI99XrT3+0FjvLqlkcdByP5aJ6u4Oz8zgolME1MCDrzGuYNtI35ttsNIhZO
 GEk8JepNd6lXVA0hdcbdYRkeSVsCTl8Cq0UWHh019Kem7ficqF9uh7YFtqcyKnGpN/XHFE+a9KY
 fuhj1Wi9/QX9zU74qZrARsba4zPI6tEcpVAxYwbVSxNfRRlMmJ7IENlUsPd02e67mJLFG4iZIUY
 l/rmUOgbzcyFsedg0iSorX6Nxopw7QoBr9QClYJL+htuFY8ePYpRLtdcie0OfyT+WFAH/P5ZHJL
 xLCzABb4cd06XydCUFLdZ7gGlV/k1YuU99Jc3+CC9R/9h94yy/wIFeRGzoEh2wqY2L+ytIlwlad
 AafFzRWfYBjWr0L7TqV9LGhAlxRE7Kw2GoG/nBn6Qi0FJInArD2kGsg5p1PicX4W+yOy9JISrYk
 EU+l8qkoP/ejzFyWxl0XQ38gjKFM3GCDEoKg8YDzNe40fLQNpjl+TzRWXk5LmE8b/Ky/caPv1JD
 DQZrBik6lfi1viXT+AwrK1V/DZwjYoWN8r1brxlec6vfif0Xmd7u3aJMyyOqsJumUf5Qm6jx63G
 ll1srfS0NEnBHPA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_082721_785997_CDE73EB8 
X-CRM114-Status: GOOD (  18.47  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Amlogic clock controller drivers are all doing the same thing, more or
less. Yet, over the years, tiny (and often pointless) differences have
emerged.

This makes reviews more difficult, allows some errors to slip through and
make it more difficult to exploit SoC commonalities, leading to code
duplication.

This change enforce, wherever possible, a consistent and predictable scheme
when it comes to code organisation and naming, The scheme chosen is what
was used the most already, to try and minimise the size of the ugly
resulting diff. Here are some of the rules applied:
- Aligning clock names, variable names and IDs.
  - ID cannot change (used in DT)
  - Variable names w/ SoC name prefixes
  - Clock names w/o SoC name prefixes, except pclks for historic reasons
- Composite clock systematic naming : mux: X_sel, div:X_div, gate:X
- Parent table systematically named with the same name as the clock and
  a '_parents' suffix
- Group various tables next to the related clock
- etc ...

Doing so removes what would otherwise show up as unrelated diff in
following changes. It will allow to introduce common definitions for
peripheral clocks, probe helpers, composite clocks, etc ... making further
review and maintenance easier.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/g12a-aoclk.c | 207 +++++++++++++++++++++--------------------
 1 file changed, 107 insertions(+), 100 deletions(-)

diff --git a/drivers/clk/meson/g12a-aoclk.c b/drivers/clk/meson/g12a-aoclk.c
index 4095a1b2bb80ee430f8aeb56cbcf5ed549188781..3eaf1db16f45a0adf0acd901ed7ae1f51a9c8dc1 100644
--- a/drivers/clk/meson/g12a-aoclk.c
+++ b/drivers/clk/meson/g12a-aoclk.c
@@ -43,8 +43,8 @@
  * bootloader. The goal is to remove this flag at some point.
  * Actually removing it will require some extensive test to be done safely.
  */
-#define AXG_AO_GATE(_name, _reg, _bit)					\
-static struct clk_regmap g12a_aoclk_##_name = {				\
+#define G12A_AO_PCLK(_name, _reg, _bit)					\
+static struct clk_regmap g12a_ao_##_name = {				\
 	.data = &(struct clk_regmap_gate_data) {			\
 		.offset = (_reg),					\
 		.bit_idx = (_bit),					\
@@ -60,23 +60,24 @@ static struct clk_regmap g12a_aoclk_##_name = {				\
 	},								\
 }
 
-AXG_AO_GATE(ahb, AO_CLK_GATE0, 0);
-AXG_AO_GATE(ir_in, AO_CLK_GATE0, 1);
-AXG_AO_GATE(i2c_m0, AO_CLK_GATE0, 2);
-AXG_AO_GATE(i2c_s0, AO_CLK_GATE0, 3);
-AXG_AO_GATE(uart, AO_CLK_GATE0, 4);
-AXG_AO_GATE(prod_i2c, AO_CLK_GATE0, 5);
-AXG_AO_GATE(uart2, AO_CLK_GATE0, 6);
-AXG_AO_GATE(ir_out, AO_CLK_GATE0, 7);
-AXG_AO_GATE(saradc, AO_CLK_GATE0, 8);
-AXG_AO_GATE(mailbox, AO_CLK_GATE0_SP, 0);
-AXG_AO_GATE(m3, AO_CLK_GATE0_SP, 1);
-AXG_AO_GATE(ahb_sram, AO_CLK_GATE0_SP, 2);
-AXG_AO_GATE(rti, AO_CLK_GATE0_SP, 3);
-AXG_AO_GATE(m4_fclk, AO_CLK_GATE0_SP, 4);
-AXG_AO_GATE(m4_hclk, AO_CLK_GATE0_SP, 5);
+G12A_AO_PCLK(ahb,	AO_CLK_GATE0,    0);
+G12A_AO_PCLK(ir_in,	AO_CLK_GATE0,    1);
+G12A_AO_PCLK(i2c_m0,	AO_CLK_GATE0,    2);
+G12A_AO_PCLK(i2c_s0,	AO_CLK_GATE0,    3);
+G12A_AO_PCLK(uart,	AO_CLK_GATE0,    4);
+G12A_AO_PCLK(prod_i2c,	AO_CLK_GATE0,    5);
+G12A_AO_PCLK(uart2,	AO_CLK_GATE0,    6);
+G12A_AO_PCLK(ir_out,	AO_CLK_GATE0,    7);
+G12A_AO_PCLK(saradc,	AO_CLK_GATE0,    8);
 
-static struct clk_regmap g12a_aoclk_cts_oscin = {
+G12A_AO_PCLK(mailbox,	AO_CLK_GATE0_SP, 0);
+G12A_AO_PCLK(m3,	AO_CLK_GATE0_SP, 1);
+G12A_AO_PCLK(ahb_sram,	AO_CLK_GATE0_SP, 2);
+G12A_AO_PCLK(rti,	AO_CLK_GATE0_SP, 3);
+G12A_AO_PCLK(m4_fclk,	AO_CLK_GATE0_SP, 4);
+G12A_AO_PCLK(m4_hclk,	AO_CLK_GATE0_SP, 5);
+
+static struct clk_regmap g12a_ao_cts_oscin = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = AO_RTI_PWR_CNTL_REG0,
 		.bit_idx = 14,
@@ -103,22 +104,22 @@ static const struct meson_clk_dualdiv_param g12a_32k_div_table[] = {
 
 /* 32k_by_oscin clock */
 
-static struct clk_regmap g12a_aoclk_32k_by_oscin_pre = {
+static struct clk_regmap g12a_ao_32k_by_oscin_pre = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = AO_RTC_ALT_CLK_CNTL0,
 		.bit_idx = 31,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "g12a_ao_32k_by_oscin_pre",
+		.name = "ao_32k_by_oscin_pre",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&g12a_aoclk_cts_oscin.hw
+			&g12a_ao_cts_oscin.hw
 		},
 		.num_parents = 1,
 	},
 };
 
-static struct clk_regmap g12a_aoclk_32k_by_oscin_div = {
+static struct clk_regmap g12a_ao_32k_by_oscin_div = {
 	.data = &(struct meson_clk_dualdiv_data){
 		.n1 = {
 			.reg_off = AO_RTC_ALT_CLK_CNTL0,
@@ -148,16 +149,16 @@ static struct clk_regmap g12a_aoclk_32k_by_oscin_div = {
 		.table = g12a_32k_div_table,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "g12a_ao_32k_by_oscin_div",
+		.name = "ao_32k_by_oscin_div",
 		.ops = &meson_clk_dualdiv_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&g12a_aoclk_32k_by_oscin_pre.hw
+			&g12a_ao_32k_by_oscin_pre.hw
 		},
 		.num_parents = 1,
 	},
 };
 
-static struct clk_regmap g12a_aoclk_32k_by_oscin_sel = {
+static struct clk_regmap g12a_ao_32k_by_oscin_sel = {
 	.data = &(struct clk_regmap_mux_data) {
 		.offset = AO_RTC_ALT_CLK_CNTL1,
 		.mask = 0x1,
@@ -165,27 +166,27 @@ static struct clk_regmap g12a_aoclk_32k_by_oscin_sel = {
 		.flags = CLK_MUX_ROUND_CLOSEST,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "g12a_ao_32k_by_oscin_sel",
+		.name = "ao_32k_by_oscin_sel",
 		.ops = &clk_regmap_mux_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&g12a_aoclk_32k_by_oscin_div.hw,
-			&g12a_aoclk_32k_by_oscin_pre.hw,
+			&g12a_ao_32k_by_oscin_div.hw,
+			&g12a_ao_32k_by_oscin_pre.hw,
 		},
 		.num_parents = 2,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap g12a_aoclk_32k_by_oscin = {
+static struct clk_regmap g12a_ao_32k_by_oscin = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = AO_RTC_ALT_CLK_CNTL0,
 		.bit_idx = 30,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "g12a_ao_32k_by_oscin",
+		.name = "ao_32k_by_oscin",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&g12a_aoclk_32k_by_oscin_sel.hw
+			&g12a_ao_32k_by_oscin_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
@@ -194,22 +195,22 @@ static struct clk_regmap g12a_aoclk_32k_by_oscin = {
 
 /* cec clock */
 
-static struct clk_regmap g12a_aoclk_cec_pre = {
+static struct clk_regmap g12a_ao_cec_pre = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = AO_CEC_CLK_CNTL_REG0,
 		.bit_idx = 31,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "g12a_ao_cec_pre",
+		.name = "ao_cec_pre",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&g12a_aoclk_cts_oscin.hw
+			&g12a_ao_cts_oscin.hw
 		},
 		.num_parents = 1,
 	},
 };
 
-static struct clk_regmap g12a_aoclk_cec_div = {
+static struct clk_regmap g12a_ao_cec_div = {
 	.data = &(struct meson_clk_dualdiv_data){
 		.n1 = {
 			.reg_off = AO_CEC_CLK_CNTL_REG0,
@@ -239,16 +240,16 @@ static struct clk_regmap g12a_aoclk_cec_div = {
 		.table = g12a_32k_div_table,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "g12a_ao_cec_div",
+		.name = "ao_cec_div",
 		.ops = &meson_clk_dualdiv_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&g12a_aoclk_cec_pre.hw
+			&g12a_ao_cec_pre.hw
 		},
 		.num_parents = 1,
 	},
 };
 
-static struct clk_regmap g12a_aoclk_cec_sel = {
+static struct clk_regmap g12a_ao_cec_sel = {
 	.data = &(struct clk_regmap_mux_data) {
 		.offset = AO_CEC_CLK_CNTL_REG1,
 		.mask = 0x1,
@@ -256,34 +257,34 @@ static struct clk_regmap g12a_aoclk_cec_sel = {
 		.flags = CLK_MUX_ROUND_CLOSEST,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "g12a_ao_cec_sel",
+		.name = "ao_cec_sel",
 		.ops = &clk_regmap_mux_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&g12a_aoclk_cec_div.hw,
-			&g12a_aoclk_cec_pre.hw,
+			&g12a_ao_cec_div.hw,
+			&g12a_ao_cec_pre.hw,
 		},
 		.num_parents = 2,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap g12a_aoclk_cec = {
+static struct clk_regmap g12a_ao_cec = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = AO_CEC_CLK_CNTL_REG0,
 		.bit_idx = 30,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "g12a_ao_cec",
+		.name = "ao_cec",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&g12a_aoclk_cec_sel.hw
+			&g12a_ao_cec_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap g12a_aoclk_cts_rtc_oscin = {
+static struct clk_regmap g12a_ao_cts_rtc_oscin = {
 	.data = &(struct clk_regmap_mux_data) {
 		.offset = AO_RTI_PWR_CNTL_REG0,
 		.mask = 0x1,
@@ -291,10 +292,10 @@ static struct clk_regmap g12a_aoclk_cts_rtc_oscin = {
 		.flags = CLK_MUX_ROUND_CLOSEST,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "g12a_ao_cts_rtc_oscin",
+		.name = "ao_cts_rtc_oscin",
 		.ops = &clk_regmap_mux_ops,
 		.parent_data = (const struct clk_parent_data []) {
-			{ .hw = &g12a_aoclk_32k_by_oscin.hw },
+			{ .hw = &g12a_ao_32k_by_oscin.hw },
 			{ .fw_name = "ext-32k-0", },
 		},
 		.num_parents = 2,
@@ -302,7 +303,7 @@ static struct clk_regmap g12a_aoclk_cts_rtc_oscin = {
 	},
 };
 
-static struct clk_regmap g12a_aoclk_clk81 = {
+static struct clk_regmap g12a_ao_clk81 = {
 	.data = &(struct clk_regmap_mux_data) {
 		.offset = AO_RTI_PWR_CNTL_REG0,
 		.mask = 0x1,
@@ -310,68 +311,74 @@ static struct clk_regmap g12a_aoclk_clk81 = {
 		.flags = CLK_MUX_ROUND_CLOSEST,
 	},
 	.hw.init = &(struct clk_init_data){
+		/*
+		 * NOTE: this is one of the infamous clock the pwm driver
+		 * can request directly by its global name. It's wrong but
+		 * there is not much we can do about it until the support
+		 * for the old pwm bindings is dropped
+		 */
 		.name = "g12a_ao_clk81",
 		.ops = &clk_regmap_mux_ro_ops,
 		.parent_data = (const struct clk_parent_data []) {
 			{ .fw_name = "mpeg-clk", },
-			{ .hw = &g12a_aoclk_cts_rtc_oscin.hw },
+			{ .hw = &g12a_ao_cts_rtc_oscin.hw },
 		},
 		.num_parents = 2,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap g12a_aoclk_saradc_mux = {
+static struct clk_regmap g12a_ao_saradc_mux = {
 	.data = &(struct clk_regmap_mux_data) {
 		.offset = AO_SAR_CLK,
 		.mask = 0x3,
 		.shift = 9,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "g12a_ao_saradc_mux",
+		.name = "ao_saradc_mux",
 		.ops = &clk_regmap_mux_ops,
 		.parent_data = (const struct clk_parent_data []) {
 			{ .fw_name = "xtal", },
-			{ .hw = &g12a_aoclk_clk81.hw },
+			{ .hw = &g12a_ao_clk81.hw },
 		},
 		.num_parents = 2,
 	},
 };
 
-static struct clk_regmap g12a_aoclk_saradc_div = {
+static struct clk_regmap g12a_ao_saradc_div = {
 	.data = &(struct clk_regmap_div_data) {
 		.offset = AO_SAR_CLK,
 		.shift = 0,
 		.width = 8,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "g12a_ao_saradc_div",
+		.name = "ao_saradc_div",
 		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&g12a_aoclk_saradc_mux.hw
+			&g12a_ao_saradc_mux.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap g12a_aoclk_saradc_gate = {
+static struct clk_regmap g12a_ao_saradc_gate = {
 	.data = &(struct clk_regmap_gate_data) {
 		.offset = AO_SAR_CLK,
 		.bit_idx = 8,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "g12a_ao_saradc_gate",
+		.name = "ao_saradc_gate",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&g12a_aoclk_saradc_div.hw
+			&g12a_ao_saradc_div.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static const unsigned int g12a_aoclk_reset[] = {
+static const unsigned int g12a_ao_reset[] = {
 	[RESET_AO_IR_IN]	= 16,
 	[RESET_AO_UART]		= 17,
 	[RESET_AO_I2C_M]	= 18,
@@ -381,65 +388,65 @@ static const unsigned int g12a_aoclk_reset[] = {
 	[RESET_AO_IR_OUT]	= 23,
 };
 
-static struct clk_hw *g12a_aoclk_hw_clks[] = {
-	[CLKID_AO_AHB]		= &g12a_aoclk_ahb.hw,
-	[CLKID_AO_IR_IN]	= &g12a_aoclk_ir_in.hw,
-	[CLKID_AO_I2C_M0]	= &g12a_aoclk_i2c_m0.hw,
-	[CLKID_AO_I2C_S0]	= &g12a_aoclk_i2c_s0.hw,
-	[CLKID_AO_UART]		= &g12a_aoclk_uart.hw,
-	[CLKID_AO_PROD_I2C]	= &g12a_aoclk_prod_i2c.hw,
-	[CLKID_AO_UART2]	= &g12a_aoclk_uart2.hw,
-	[CLKID_AO_IR_OUT]	= &g12a_aoclk_ir_out.hw,
-	[CLKID_AO_SAR_ADC]	= &g12a_aoclk_saradc.hw,
-	[CLKID_AO_MAILBOX]	= &g12a_aoclk_mailbox.hw,
-	[CLKID_AO_M3]		= &g12a_aoclk_m3.hw,
-	[CLKID_AO_AHB_SRAM]	= &g12a_aoclk_ahb_sram.hw,
-	[CLKID_AO_RTI]		= &g12a_aoclk_rti.hw,
-	[CLKID_AO_M4_FCLK]	= &g12a_aoclk_m4_fclk.hw,
-	[CLKID_AO_M4_HCLK]	= &g12a_aoclk_m4_hclk.hw,
-	[CLKID_AO_CLK81]	= &g12a_aoclk_clk81.hw,
-	[CLKID_AO_SAR_ADC_SEL]	= &g12a_aoclk_saradc_mux.hw,
-	[CLKID_AO_SAR_ADC_DIV]	= &g12a_aoclk_saradc_div.hw,
-	[CLKID_AO_SAR_ADC_CLK]	= &g12a_aoclk_saradc_gate.hw,
-	[CLKID_AO_CTS_OSCIN]	= &g12a_aoclk_cts_oscin.hw,
-	[CLKID_AO_32K_PRE]	= &g12a_aoclk_32k_by_oscin_pre.hw,
-	[CLKID_AO_32K_DIV]	= &g12a_aoclk_32k_by_oscin_div.hw,
-	[CLKID_AO_32K_SEL]	= &g12a_aoclk_32k_by_oscin_sel.hw,
-	[CLKID_AO_32K]		= &g12a_aoclk_32k_by_oscin.hw,
-	[CLKID_AO_CEC_PRE]	= &g12a_aoclk_cec_pre.hw,
-	[CLKID_AO_CEC_DIV]	= &g12a_aoclk_cec_div.hw,
-	[CLKID_AO_CEC_SEL]	= &g12a_aoclk_cec_sel.hw,
-	[CLKID_AO_CEC]		= &g12a_aoclk_cec.hw,
-	[CLKID_AO_CTS_RTC_OSCIN] = &g12a_aoclk_cts_rtc_oscin.hw,
+static struct clk_hw *g12a_ao_hw_clks[] = {
+	[CLKID_AO_AHB]		= &g12a_ao_ahb.hw,
+	[CLKID_AO_IR_IN]	= &g12a_ao_ir_in.hw,
+	[CLKID_AO_I2C_M0]	= &g12a_ao_i2c_m0.hw,
+	[CLKID_AO_I2C_S0]	= &g12a_ao_i2c_s0.hw,
+	[CLKID_AO_UART]		= &g12a_ao_uart.hw,
+	[CLKID_AO_PROD_I2C]	= &g12a_ao_prod_i2c.hw,
+	[CLKID_AO_UART2]	= &g12a_ao_uart2.hw,
+	[CLKID_AO_IR_OUT]	= &g12a_ao_ir_out.hw,
+	[CLKID_AO_SAR_ADC]	= &g12a_ao_saradc.hw,
+	[CLKID_AO_MAILBOX]	= &g12a_ao_mailbox.hw,
+	[CLKID_AO_M3]		= &g12a_ao_m3.hw,
+	[CLKID_AO_AHB_SRAM]	= &g12a_ao_ahb_sram.hw,
+	[CLKID_AO_RTI]		= &g12a_ao_rti.hw,
+	[CLKID_AO_M4_FCLK]	= &g12a_ao_m4_fclk.hw,
+	[CLKID_AO_M4_HCLK]	= &g12a_ao_m4_hclk.hw,
+	[CLKID_AO_CLK81]	= &g12a_ao_clk81.hw,
+	[CLKID_AO_SAR_ADC_SEL]	= &g12a_ao_saradc_mux.hw,
+	[CLKID_AO_SAR_ADC_DIV]	= &g12a_ao_saradc_div.hw,
+	[CLKID_AO_SAR_ADC_CLK]	= &g12a_ao_saradc_gate.hw,
+	[CLKID_AO_CTS_OSCIN]	= &g12a_ao_cts_oscin.hw,
+	[CLKID_AO_32K_PRE]	= &g12a_ao_32k_by_oscin_pre.hw,
+	[CLKID_AO_32K_DIV]	= &g12a_ao_32k_by_oscin_div.hw,
+	[CLKID_AO_32K_SEL]	= &g12a_ao_32k_by_oscin_sel.hw,
+	[CLKID_AO_32K]		= &g12a_ao_32k_by_oscin.hw,
+	[CLKID_AO_CEC_PRE]	= &g12a_ao_cec_pre.hw,
+	[CLKID_AO_CEC_DIV]	= &g12a_ao_cec_div.hw,
+	[CLKID_AO_CEC_SEL]	= &g12a_ao_cec_sel.hw,
+	[CLKID_AO_CEC]		= &g12a_ao_cec.hw,
+	[CLKID_AO_CTS_RTC_OSCIN] = &g12a_ao_cts_rtc_oscin.hw,
 };
 
-static const struct meson_aoclk_data g12a_aoclkc_data = {
+static const struct meson_aoclk_data g12a_ao_clkc_data = {
 	.reset_reg	= AO_RTI_GEN_CNTL_REG0,
-	.num_reset	= ARRAY_SIZE(g12a_aoclk_reset),
-	.reset		= g12a_aoclk_reset,
+	.num_reset	= ARRAY_SIZE(g12a_ao_reset),
+	.reset		= g12a_ao_reset,
 	.hw_clks	= {
-		.hws	= g12a_aoclk_hw_clks,
-		.num	= ARRAY_SIZE(g12a_aoclk_hw_clks),
+		.hws	= g12a_ao_hw_clks,
+		.num	= ARRAY_SIZE(g12a_ao_hw_clks),
 	},
 };
 
-static const struct of_device_id g12a_aoclkc_match_table[] = {
+static const struct of_device_id g12a_ao_clkc_match_table[] = {
 	{
 		.compatible	= "amlogic,meson-g12a-aoclkc",
-		.data		= &g12a_aoclkc_data,
+		.data		= &g12a_ao_clkc_data,
 	},
 	{ }
 };
-MODULE_DEVICE_TABLE(of, g12a_aoclkc_match_table);
+MODULE_DEVICE_TABLE(of, g12a_ao_clkc_match_table);
 
-static struct platform_driver g12a_aoclkc_driver = {
+static struct platform_driver g12a_ao_clkc_driver = {
 	.probe		= meson_aoclkc_probe,
 	.driver		= {
 		.name	= "g12a-aoclkc",
-		.of_match_table = g12a_aoclkc_match_table,
+		.of_match_table = g12a_ao_clkc_match_table,
 	},
 };
-module_platform_driver(g12a_aoclkc_driver);
+module_platform_driver(g12a_ao_clkc_driver);
 
 MODULE_DESCRIPTION("Amlogic G12A Always-ON Clock Controller driver");
 MODULE_LICENSE("GPL");

-- 
2.47.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
