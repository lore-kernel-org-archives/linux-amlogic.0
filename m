Return-Path: <SRS0=A3X0=MF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 612C5C07E95
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Jul 2021 23:26:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A81761363
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Jul 2021 23:26:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A81761363
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bKzYDZpmWixld0wmTwyOJC7AwyQgtiV5AZ+Rkd1l+i4=; b=gJ1aUjPs0crs5v
	uzq4ZmUxhCB9Q9cDKna1WpdqCxIhNjbXc/y87mCCpO9+coq5xbZZarn0AD/KrG2Rlr6a+DfhCA3eq
	pGYZQzT3pV1882aKjiXpTKi7R32h3PiChOZNm4QZpeSIx6FzNtuxvtFgihyIAPFFKcccY7DiquEWk
	JjozZaf/9Cgs6qBlnlus1Vo87vaaowjPjUqtcTvKo12UZfVFpiIzF9rL1kQhTnMNO5K8mXyqiXZsg
	hhFhQ5newonbCtEivsYMUQwoA/OCgbHwy6ViHk6riAJuPDGtoZ2xUAsX8CoxoDYM0NnQqLVmi0rOT
	L2NCXdjxbi5dosyXvQsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3Rna-00BcD8-BC; Tue, 13 Jul 2021 23:26:46 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3RmE-00BbYk-Hx; Tue, 13 Jul 2021 23:25:24 +0000
Received: by mail-wm1-x331.google.com with SMTP id
 q18-20020a1ce9120000b02901f259f3a250so241547wmc.2; 
 Tue, 13 Jul 2021 16:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GKBmLxZ/MZx7CczP7FFF2PJqNgRA/+uJ7jpUaxIibgg=;
 b=alXl50zMviQMFDIloQ0a/1ZCw7r0DFafRoauJg+Vu6ekY+mM1c0mbIBq1t35C61f7Y
 D07RylNZQpT3U9hFfhLRoNpOmFfPnTFfxA1XlhQCCmxBd1VhrCc0DMhfVenPwtQ7228P
 cO22gRHZzX2T6laObBY12AxrluscttOTOiYD85ccII1tR4u8ylbfMWmvV1QQdZ2pWRLN
 C8kR6Fmf+zhDxPpCF/FUkxMWqpxdqOc+EA6rO7XpqdeFDKWhYhD7Fqa4arcenukuk8bj
 liLpWRVhoRMHWoAcRGQDPMsUb5pWNQYVgVMqtQj1N/tk9eM9gUrdqLUCPoETxmEMzQf/
 xywA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GKBmLxZ/MZx7CczP7FFF2PJqNgRA/+uJ7jpUaxIibgg=;
 b=EEfI6GgSUjCXkAMawxKAMdMRb7S9rgUlD+S1FVNq0x8zRUVr8Hg4W7C/3Olng1Q+Zm
 0M3InLo+QjaoogZfXShmFC998AyROkjI5lC8xapBDoucmskTdBPuushehaNKHgVJJKgC
 W333mKeHNUjpl+BzDqtOngWNRFQdd6JowzHcOBQcAXtohfKOd0YFXbr1HouBl3/xzE5N
 n9+ggKtaSi0xhDW0uKYtYYHTmz0ZlL7bgDxZUTKfBQ1BRup97vNEzNAPj+ZZhaKU3lvh
 Rk5XuDaHBozxn2OxskJSv0NeK0mR+xy7zRY7NzeraslCsEQgRuom53ES2pNBjALK2Ekv
 Itpw==
X-Gm-Message-State: AOAM531YU0u45zH0q1/pjTPMmS0eFu/NnkrEZWzZ5AwAC4hV0x0Ic5aQ
 Te2Yi+DEj4u+/oJZaOOg8VwAyVK/Oho=
X-Google-Smtp-Source: ABdhPJzBag0KPk291EGfMDuaYOlTY06f0GZGtQM4YS2IVnro5tNWZuptm/z9rPtc0F49jHydCA88DA==
X-Received: by 2002:a05:600c:4ec8:: with SMTP id
 g8mr679508wmq.150.1626218720901; 
 Tue, 13 Jul 2021 16:25:20 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-2a01-0c23-c041-6f00-f22f-74ff-fe21-0725.c23.pool.telefonica.de.
 [2a01:c23:c041:6f00:f22f:74ff:fe21:725])
 by smtp.googlemail.com with ESMTPSA id o11sm3857390wmc.2.2021.07.13.16.25.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 16:25:20 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, jbrunet@baylibre.com, narmstrong@baylibre.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 5/6] clk: meson: meson8b: Make the video clock trees mutable
Date: Wed, 14 Jul 2021 01:25:09 +0200
Message-Id: <20210713232510.3057750-6-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210713232510.3057750-1-martin.blumenstingl@googlemail.com>
References: <20210713232510.3057750-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210713_162522_699507_6789CE52 
X-CRM114-Status: GOOD (  14.40  )
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

Switch from the "_ro" clock op variants to the mutable ones for all
video clocks. This will allow the VPU driver to change the clocks as
needed for the different video output modes.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/meson/meson8b.c | 76 ++++++++++++++++++-------------------
 1 file changed, 38 insertions(+), 38 deletions(-)

diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index 21bc29455f0d..cd0f5bae24d4 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -207,7 +207,7 @@ static struct clk_regmap meson8b_hdmi_pll_dco = {
 	.hw.init = &(struct clk_init_data){
 		/* sometimes also called "HPLL" or "HPLL PLL" */
 		.name = "hdmi_pll_dco",
-		.ops = &meson_clk_pll_ro_ops,
+		.ops = &meson_clk_pll_ops,
 		.parent_hws = (const struct clk_hw *[]) {
 			&hdmi_pll_dco_in.hw
 		},
@@ -224,7 +224,7 @@ static struct clk_regmap meson8b_hdmi_pll_lvds_out = {
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "hdmi_pll_lvds_out",
-		.ops = &clk_regmap_divider_ro_ops,
+		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
 			&meson8b_hdmi_pll_dco.hw
 		},
@@ -242,7 +242,7 @@ static struct clk_regmap meson8b_hdmi_pll_hdmi_out = {
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "hdmi_pll_hdmi_out",
-		.ops = &clk_regmap_divider_ro_ops,
+		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
 			&meson8b_hdmi_pll_dco.hw
 		},
@@ -1104,7 +1104,7 @@ static struct clk_regmap meson8b_vid_pll_lvds_en = {
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "vid_pll_lvds_en",
-		.ops = &clk_regmap_gate_ro_ops,
+		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
 			&meson8b_hdmi_pll_lvds_out.hw
 		},
@@ -1121,7 +1121,7 @@ static struct clk_regmap meson8b_vid_pll_in_sel = {
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "vid_pll_in_sel",
-		.ops = &clk_regmap_mux_ro_ops,
+		.ops = &clk_regmap_mux_ops,
 		/*
 		 * TODO: depending on the SoC there is also a second parent:
 		 * Meson8: unknown
@@ -1143,7 +1143,7 @@ static struct clk_regmap meson8b_vid_pll_in_en = {
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "vid_pll_in_en",
-		.ops = &clk_regmap_gate_ro_ops,
+		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
 			&meson8b_vid_pll_in_sel.hw
 		},
@@ -1160,7 +1160,7 @@ static struct clk_regmap meson8b_vid_pll_pre_div = {
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "vid_pll_pre_div",
-		.ops = &clk_regmap_divider_ro_ops,
+		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
 			&meson8b_vid_pll_in_en.hw
 		},
@@ -1177,7 +1177,7 @@ static struct clk_regmap meson8b_vid_pll_post_div = {
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "vid_pll_post_div",
-		.ops = &clk_regmap_divider_ro_ops,
+		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
 			&meson8b_vid_pll_pre_div.hw
 		},
@@ -1194,7 +1194,7 @@ static struct clk_regmap meson8b_vid_pll = {
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "vid_pll",
-		.ops = &clk_regmap_mux_ro_ops,
+		.ops = &clk_regmap_mux_ops,
 		/* TODO: parent 0x2 is vid_pll_pre_div_mult7_div2 */
 		.parent_hws = (const struct clk_hw *[]) {
 			&meson8b_vid_pll_pre_div.hw,
@@ -1213,7 +1213,7 @@ static struct clk_regmap meson8b_vid_pll_final_div = {
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "vid_pll_final_div",
-		.ops = &clk_regmap_divider_ro_ops,
+		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
 			&meson8b_vid_pll.hw
 		},
@@ -1240,7 +1240,7 @@ static struct clk_regmap meson8b_vclk_in_sel = {
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "vclk_in_sel",
-		.ops = &clk_regmap_mux_ro_ops,
+		.ops = &clk_regmap_mux_ops,
 		.parent_hws = meson8b_vclk_mux_parent_hws,
 		.num_parents = ARRAY_SIZE(meson8b_vclk_mux_parent_hws),
 		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,
@@ -1254,7 +1254,7 @@ static struct clk_regmap meson8b_vclk_in_en = {
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "vclk_in_en",
-		.ops = &clk_regmap_gate_ro_ops,
+		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
 			&meson8b_vclk_in_sel.hw
 		},
@@ -1270,7 +1270,7 @@ static struct clk_regmap meson8b_vclk_en = {
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "vclk_en",
-		.ops = &clk_regmap_gate_ro_ops,
+		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
 			&meson8b_vclk_in_en.hw
 		},
@@ -1286,7 +1286,7 @@ static struct clk_regmap meson8b_vclk_div1_gate = {
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "vclk_div1_en",
-		.ops = &clk_regmap_gate_ro_ops,
+		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
 			&meson8b_vclk_en.hw
 		},
@@ -1316,7 +1316,7 @@ static struct clk_regmap meson8b_vclk_div2_div_gate = {
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "vclk_div2_en",
-		.ops = &clk_regmap_gate_ro_ops,
+		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
 			&meson8b_vclk_div2_div.hw
 		},
@@ -1346,7 +1346,7 @@ static struct clk_regmap meson8b_vclk_div4_div_gate = {
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "vclk_div4_en",
-		.ops = &clk_regmap_gate_ro_ops,
+		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
 			&meson8b_vclk_div4_div.hw
 		},
@@ -1376,7 +1376,7 @@ static struct clk_regmap meson8b_vclk_div6_div_gate = {
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "vclk_div6_en",
-		.ops = &clk_regmap_gate_ro_ops,
+		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
 			&meson8b_vclk_div6_div.hw
 		},
@@ -1406,7 +1406,7 @@ static struct clk_regmap meson8b_vclk_div12_div_gate = {
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "vclk_div12_en",
-		.ops = &clk_regmap_gate_ro_ops,
+		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
 			&meson8b_vclk_div12_div.hw
 		},
@@ -1423,7 +1423,7 @@ static struct clk_regmap meson8b_vclk2_in_sel = {
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "vclk2_in_sel",
-		.ops = &clk_regmap_mux_ro_ops,
+		.ops = &clk_regmap_mux_ops,
 		.parent_hws = meson8b_vclk_mux_parent_hws,
 		.num_parents = ARRAY_SIZE(meson8b_vclk_mux_parent_hws),
 		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,
@@ -1437,7 +1437,7 @@ static struct clk_regmap meson8b_vclk2_clk_in_en = {
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "vclk2_in_en",
-		.ops = &clk_regmap_gate_ro_ops,
+		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
 			&meson8b_vclk2_in_sel.hw
 		},
@@ -1453,7 +1453,7 @@ static struct clk_regmap meson8b_vclk2_clk_en = {
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "vclk2_en",
-		.ops = &clk_regmap_gate_ro_ops,
+		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
 			&meson8b_vclk2_clk_in_en.hw
 		},
@@ -1469,7 +1469,7 @@ static struct clk_regmap meson8b_vclk2_div1_gate = {
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "vclk2_div1_en",
-		.ops = &clk_regmap_gate_ro_ops,
+		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
 			&meson8b_vclk2_clk_en.hw
 		},
@@ -1499,7 +1499,7 @@ static struct clk_regmap meson8b_vclk2_div2_div_gate = {
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "vclk2_div2_en",
-		.ops = &clk_regmap_gate_ro_ops,
+		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
 			&meson8b_vclk2_div2_div.hw
 		},
@@ -1529,7 +1529,7 @@ static struct clk_regmap meson8b_vclk2_div4_div_gate = {
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "vclk2_div4_en",
-		.ops = &clk_regmap_gate_ro_ops,
+		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
 			&meson8b_vclk2_div4_div.hw
 		},
@@ -1559,7 +1559,7 @@ static struct clk_regmap meson8b_vclk2_div6_div_gate = {
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "vclk2_div6_en",
-		.ops = &clk_regmap_gate_ro_ops,
+		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
 			&meson8b_vclk2_div6_div.hw
 		},
@@ -1589,7 +1589,7 @@ static struct clk_regmap meson8b_vclk2_div12_div_gate = {
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "vclk2_div12_en",
-		.ops = &clk_regmap_gate_ro_ops,
+		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
 			&meson8b_vclk2_div12_div.hw
 		},
@@ -1614,7 +1614,7 @@ static struct clk_regmap meson8b_cts_enct_sel = {
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "cts_enct_sel",
-		.ops = &clk_regmap_mux_ro_ops,
+		.ops = &clk_regmap_mux_ops,
 		.parent_hws = meson8b_vclk_enc_mux_parent_hws,
 		.num_parents = ARRAY_SIZE(meson8b_vclk_enc_mux_parent_hws),
 		.flags = CLK_SET_RATE_PARENT,
@@ -1628,7 +1628,7 @@ static struct clk_regmap meson8b_cts_enct = {
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "cts_enct",
-		.ops = &clk_regmap_gate_ro_ops,
+		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
 			&meson8b_cts_enct_sel.hw
 		},
@@ -1645,7 +1645,7 @@ static struct clk_regmap meson8b_cts_encp_sel = {
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "cts_encp_sel",
-		.ops = &clk_regmap_mux_ro_ops,
+		.ops = &clk_regmap_mux_ops,
 		.parent_hws = meson8b_vclk_enc_mux_parent_hws,
 		.num_parents = ARRAY_SIZE(meson8b_vclk_enc_mux_parent_hws),
 		.flags = CLK_SET_RATE_PARENT,
@@ -1659,7 +1659,7 @@ static struct clk_regmap meson8b_cts_encp = {
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "cts_encp",
-		.ops = &clk_regmap_gate_ro_ops,
+		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
 			&meson8b_cts_encp_sel.hw
 		},
@@ -1676,7 +1676,7 @@ static struct clk_regmap meson8b_cts_enci_sel = {
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "cts_enci_sel",
-		.ops = &clk_regmap_mux_ro_ops,
+		.ops = &clk_regmap_mux_ops,
 		.parent_hws = meson8b_vclk_enc_mux_parent_hws,
 		.num_parents = ARRAY_SIZE(meson8b_vclk_enc_mux_parent_hws),
 		.flags = CLK_SET_RATE_PARENT,
@@ -1690,7 +1690,7 @@ static struct clk_regmap meson8b_cts_enci = {
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "cts_enci",
-		.ops = &clk_regmap_gate_ro_ops,
+		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
 			&meson8b_cts_enci_sel.hw
 		},
@@ -1707,7 +1707,7 @@ static struct clk_regmap meson8b_hdmi_tx_pixel_sel = {
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "hdmi_tx_pixel_sel",
-		.ops = &clk_regmap_mux_ro_ops,
+		.ops = &clk_regmap_mux_ops,
 		.parent_hws = meson8b_vclk_enc_mux_parent_hws,
 		.num_parents = ARRAY_SIZE(meson8b_vclk_enc_mux_parent_hws),
 		.flags = CLK_SET_RATE_PARENT,
@@ -1721,7 +1721,7 @@ static struct clk_regmap meson8b_hdmi_tx_pixel = {
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "hdmi_tx_pixel",
-		.ops = &clk_regmap_gate_ro_ops,
+		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
 			&meson8b_hdmi_tx_pixel_sel.hw
 		},
@@ -1746,7 +1746,7 @@ static struct clk_regmap meson8b_cts_encl_sel = {
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "cts_encl_sel",
-		.ops = &clk_regmap_mux_ro_ops,
+		.ops = &clk_regmap_mux_ops,
 		.parent_hws = meson8b_vclk2_enc_mux_parent_hws,
 		.num_parents = ARRAY_SIZE(meson8b_vclk2_enc_mux_parent_hws),
 		.flags = CLK_SET_RATE_PARENT,
@@ -1760,7 +1760,7 @@ static struct clk_regmap meson8b_cts_encl = {
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "cts_encl",
-		.ops = &clk_regmap_gate_ro_ops,
+		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
 			&meson8b_cts_encl_sel.hw
 		},
@@ -1777,7 +1777,7 @@ static struct clk_regmap meson8b_cts_vdac0_sel = {
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "cts_vdac0_sel",
-		.ops = &clk_regmap_mux_ro_ops,
+		.ops = &clk_regmap_mux_ops,
 		.parent_hws = meson8b_vclk2_enc_mux_parent_hws,
 		.num_parents = ARRAY_SIZE(meson8b_vclk2_enc_mux_parent_hws),
 		.flags = CLK_SET_RATE_PARENT,
@@ -1791,7 +1791,7 @@ static struct clk_regmap meson8b_cts_vdac0 = {
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "cts_vdac0",
-		.ops = &clk_regmap_gate_ro_ops,
+		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
 			&meson8b_cts_vdac0_sel.hw
 		},
-- 
2.32.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
