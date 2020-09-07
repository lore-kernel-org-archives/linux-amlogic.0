Return-Path: <SRS0=IdmP=CQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3704CC2BB84
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Sep 2020 09:38:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C93E120C09
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Sep 2020 09:38:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eGdWQ7bR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="tJ7hwM+r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C93E120C09
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VY+9Y+5MdndznqW3oKlJ12q1caYTplElE0sZTs3gw7o=; b=eGdWQ7bRF6bnlamCYD+OCa/0D
	VZu8S/U9NeM5NOTUC9iR926OD5AbYUFTN+QzTslgEba04YCcNaNycIF0FgKt2GtJ27sk8xViExsts
	1rGyhPfWp/HUdfZ5K0nkhBrVEYere4Bcf5gNpTRT43A5/u7KhbG+neZZwqhRWCAPr4adzT8giqyIX
	Obyxgacc2Y4aqHuz/LfP0qEaabXnNs74uRYnI0GT41w6gjfzh84Rq7VhQmeskxpP96ppKlwRckjZZ
	t4qC9LH7Xmbn/GOaKRaNeBUGfMA20rFGDYjYBdZrfFqUImpcCkU7SoiU4oGy3k0YcLbSSMkjjw5Ce
	6yGVd2hFw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFDbe-0004B4-18; Mon, 07 Sep 2020 09:38:34 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFDbP-00045O-Dy
 for linux-amlogic@lists.infradead.org; Mon, 07 Sep 2020 09:38:23 +0000
Received: by mail-wm1-x342.google.com with SMTP id a65so13695464wme.5
 for <linux-amlogic@lists.infradead.org>; Mon, 07 Sep 2020 02:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nBV0men0IMZpRiqBKLtnCV9mNkYnnO/DHVwOEb/Sya4=;
 b=tJ7hwM+r8oTYIL0b/1OKNKAP/qc06qs7dl45QlK26AbZMYGGSu7/kFQfb1uH9Haptu
 T8TgBifRdzO2glzMxXD9fYdnNHubdiW8SWwWxwYnH5I0FyR/9FgnOpES0AC5DA/6HYXk
 /MZBrcwLx0ad0gkuLD+06XeB+CO0m2XNukChP/D+ugJYyp5zGL/mG5Dkg5ngEezCUA+p
 rl6K6mSFX+JNZGsKVGKll917PS5D8lVYk2UFi5Oexr9XBn25KSkUYtSaklz2sZsqsYdK
 JCAuWchuTBSE0CHetumQcnGrJfh1oAoKh6eu+CuCxvKa2hOuovJCIfwWSg+qCtTQvPGI
 QKAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nBV0men0IMZpRiqBKLtnCV9mNkYnnO/DHVwOEb/Sya4=;
 b=KdOk83uo9oxds8AEwjKmUQYqKy7MtZl7DxF3Yn3I6S+acvmMonB8vdAGgZxTRbhNlP
 2rXtaNBqs0XX2he+v4by2IL1CS5vg9vyaxKeBNjy+2GqW/6UG28c6pJPOheXHFWMf1Jg
 kAI6GRJP3LsEtJq8cCG/2Cik5adGNrXtpJuB5GpINppubAfBpzZiwFOJ+yy+x4RhuW9Z
 H9TbmhbVRbTk38gmEfEJudYyPhcJERMu4Yq3SoBcZOjb+ahRJ/EDStsbBvpsk6H7quBG
 EQiqOHJb3yU1OyTeE7ZJznHjqJ495spoOKEEN/nB4/0bHclLXtiXKmvc1xoQEe6WMUZ7
 a+uQ==
X-Gm-Message-State: AOAM531fe38Q39q+H+ASgQqaWs8I4/nMYR6PC/0vxeWWullwI78uDzX/
 QHWvzVqRgcKgufdVqUyKZg2cpA==
X-Google-Smtp-Source: ABdhPJzvC7EVJHlbkm0tqlKaOhCrCWZA9XZBmZNp2G02XdK2UlI0sf3eG56cBqeKrMZj9Tg7yzNdxQ==
X-Received: by 2002:a05:600c:2317:: with SMTP id
 23mr20900846wmo.183.1599471498317; 
 Mon, 07 Sep 2020 02:38:18 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
 by smtp.gmail.com with ESMTPSA id n17sm25170687wrw.0.2020.09.07.02.38.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 02:38:17 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com
Subject: [PATCH 3/4] clk: meson: axg: add Video Clocks
Date: Mon,  7 Sep 2020 11:38:09 +0200
Message-Id: <20200907093810.6585-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200907093810.6585-1-narmstrong@baylibre.com>
References: <20200907093810.6585-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_053819_744267_DEFEFE31 
X-CRM114-Status: GOOD (  15.05  )
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

Add the Video Clocks present on the Amlogic AXg SoCs.

The AXG only has a single ENCL CTS clock and even if VCLK exist along VCLK2,
only VCLK2 is used since it clocks the MIPI DSI IP directly.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/clk/meson/axg.c | 774 ++++++++++++++++++++++++++++++++++++++++
 drivers/clk/meson/axg.h |  21 +-
 2 files changed, 794 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/meson/axg.c b/drivers/clk/meson/axg.c
index 13fc0006f63d..2550616c14b0 100644
--- a/drivers/clk/meson/axg.c
+++ b/drivers/clk/meson/axg.c
@@ -1026,6 +1026,704 @@ static struct clk_regmap axg_sd_emmc_c_clk0 = {
 	},
 };
 
+/* VPU Clock */
+
+static const struct clk_hw *axg_vpu_parent_hws[] = {
+	&axg_fclk_div4.hw,
+	&axg_fclk_div3.hw,
+	&axg_fclk_div5.hw,
+	&axg_fclk_div7.hw,
+};
+
+static struct clk_regmap axg_vpu_0_sel = {
+	.data = &(struct clk_regmap_mux_data){
+		.offset = HHI_VPU_CLK_CNTL,
+		.mask = 0x3,
+		.shift = 9,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "vpu_0_sel",
+		.ops = &clk_regmap_mux_ops,
+		/*
+		 * bits 9:10 selects from 4 possible parents:
+		 * fclk_div4, fclk_div3, fclk_div5, fclk_div7,
+		 */
+		.parent_hws = axg_vpu_parent_hws,
+		.num_parents = ARRAY_SIZE(axg_vpu_parent_hws),
+		.flags = CLK_SET_RATE_NO_REPARENT,
+	},
+};
+
+static struct clk_regmap axg_vpu_0_div = {
+	.data = &(struct clk_regmap_div_data){
+		.offset = HHI_VPU_CLK_CNTL,
+		.shift = 0,
+		.width = 7,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "vpu_0_div",
+		.ops = &clk_regmap_divider_ops,
+		.parent_hws = (const struct clk_hw *[]) { &axg_vpu_0_sel.hw },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap axg_vpu_0 = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = HHI_VPU_CLK_CNTL,
+		.bit_idx = 8,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "vpu_0",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) { &axg_vpu_0_div.hw },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+	},
+};
+
+static struct clk_regmap axg_vpu_1_sel = {
+	.data = &(struct clk_regmap_mux_data){
+		.offset = HHI_VPU_CLK_CNTL,
+		.mask = 0x3,
+		.shift = 25,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "vpu_1_sel",
+		.ops = &clk_regmap_mux_ops,
+		/*
+		 * bits 25:26 selects from 4 possible parents:
+		 * fclk_div4, fclk_div3, fclk_div5, fclk_div7,
+		 */
+		.parent_hws = axg_vpu_parent_hws,
+		.num_parents = ARRAY_SIZE(axg_vpu_parent_hws),
+		.flags = CLK_SET_RATE_NO_REPARENT,
+	},
+};
+
+static struct clk_regmap axg_vpu_1_div = {
+	.data = &(struct clk_regmap_div_data){
+		.offset = HHI_VPU_CLK_CNTL,
+		.shift = 16,
+		.width = 7,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "vpu_1_div",
+		.ops = &clk_regmap_divider_ops,
+		.parent_hws = (const struct clk_hw *[]) { &axg_vpu_1_sel.hw },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap axg_vpu_1 = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = HHI_VPU_CLK_CNTL,
+		.bit_idx = 24,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "vpu_1",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) { &axg_vpu_1_div.hw },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+	},
+};
+
+static struct clk_regmap axg_vpu = {
+	.data = &(struct clk_regmap_mux_data){
+		.offset = HHI_VPU_CLK_CNTL,
+		.mask = 1,
+		.shift = 31,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "vpu",
+		.ops = &clk_regmap_mux_ops,
+		/*
+		 * bit 31 selects from 2 possible parents:
+		 * vpu_0 or vpu_1
+		 */
+		.parent_hws = (const struct clk_hw *[]) {
+			&axg_vpu_0.hw,
+			&axg_vpu_1.hw
+		},
+		.num_parents = 2,
+		.flags = CLK_SET_RATE_NO_REPARENT,
+	},
+};
+
+/* VAPB Clock */
+
+static const struct clk_hw *axg_vapb_parent_hws[] = {
+	&axg_fclk_div4.hw,
+	&axg_fclk_div3.hw,
+	&axg_fclk_div5.hw,
+	&axg_fclk_div7.hw,
+};
+
+static struct clk_regmap axg_vapb_0_sel = {
+	.data = &(struct clk_regmap_mux_data){
+		.offset = HHI_VAPBCLK_CNTL,
+		.mask = 0x3,
+		.shift = 9,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "vapb_0_sel",
+		.ops = &clk_regmap_mux_ops,
+		/*
+		 * bits 9:10 selects from 4 possible parents:
+		 * fclk_div4, fclk_div3, fclk_div5, fclk_div7,
+		 */
+		.parent_hws = axg_vapb_parent_hws,
+		.num_parents = ARRAY_SIZE(axg_vapb_parent_hws),
+		.flags = CLK_SET_RATE_NO_REPARENT,
+	},
+};
+
+static struct clk_regmap axg_vapb_0_div = {
+	.data = &(struct clk_regmap_div_data){
+		.offset = HHI_VAPBCLK_CNTL,
+		.shift = 0,
+		.width = 7,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "vapb_0_div",
+		.ops = &clk_regmap_divider_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&axg_vapb_0_sel.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap axg_vapb_0 = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = HHI_VAPBCLK_CNTL,
+		.bit_idx = 8,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "vapb_0",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&axg_vapb_0_div.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+	},
+};
+
+static struct clk_regmap axg_vapb_1_sel = {
+	.data = &(struct clk_regmap_mux_data){
+		.offset = HHI_VAPBCLK_CNTL,
+		.mask = 0x3,
+		.shift = 25,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "vapb_1_sel",
+		.ops = &clk_regmap_mux_ops,
+		/*
+		 * bits 25:26 selects from 4 possible parents:
+		 * fclk_div4, fclk_div3, fclk_div5, fclk_div7,
+		 */
+		.parent_hws = axg_vapb_parent_hws,
+		.num_parents = ARRAY_SIZE(axg_vapb_parent_hws),
+		.flags = CLK_SET_RATE_NO_REPARENT,
+	},
+};
+
+static struct clk_regmap axg_vapb_1_div = {
+	.data = &(struct clk_regmap_div_data){
+		.offset = HHI_VAPBCLK_CNTL,
+		.shift = 16,
+		.width = 7,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "vapb_1_div",
+		.ops = &clk_regmap_divider_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&axg_vapb_1_sel.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap axg_vapb_1 = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = HHI_VAPBCLK_CNTL,
+		.bit_idx = 24,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "vapb_1",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&axg_vapb_1_div.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+	},
+};
+
+static struct clk_regmap axg_vapb_sel = {
+	.data = &(struct clk_regmap_mux_data){
+		.offset = HHI_VAPBCLK_CNTL,
+		.mask = 1,
+		.shift = 31,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "vapb_sel",
+		.ops = &clk_regmap_mux_ops,
+		/*
+		 * bit 31 selects from 2 possible parents:
+		 * vapb_0 or vapb_1
+		 */
+		.parent_hws = (const struct clk_hw *[]) {
+			&axg_vapb_0.hw,
+			&axg_vapb_1.hw
+		},
+		.num_parents = 2,
+		.flags = CLK_SET_RATE_NO_REPARENT,
+	},
+};
+
+static struct clk_regmap axg_vapb = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = HHI_VAPBCLK_CNTL,
+		.bit_idx = 30,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "vapb",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) { &axg_vapb_sel.hw },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+	},
+};
+
+/* Video Clocks */
+
+static const struct clk_hw *axg_vclk_parent_hws[] = {
+	&axg_gp0_pll.hw,
+	&axg_fclk_div4.hw,
+	&axg_fclk_div3.hw,
+	&axg_fclk_div5.hw,
+	&axg_fclk_div2.hw,
+	&axg_fclk_div7.hw,
+	&axg_mpll1.hw,
+};
+
+static struct clk_regmap axg_vclk_sel = {
+	.data = &(struct clk_regmap_mux_data){
+		.offset = HHI_VID_CLK_CNTL,
+		.mask = 0x7,
+		.shift = 16,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "vclk_sel",
+		.ops = &clk_regmap_mux_ops,
+		.parent_hws = axg_vclk_parent_hws,
+		.num_parents = ARRAY_SIZE(axg_vclk_parent_hws),
+		.flags = CLK_SET_RATE_NO_REPARENT | CLK_GET_RATE_NOCACHE,
+	},
+};
+
+static struct clk_regmap axg_vclk2_sel = {
+	.data = &(struct clk_regmap_mux_data){
+		.offset = HHI_VIID_CLK_CNTL,
+		.mask = 0x7,
+		.shift = 16,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "vclk2_sel",
+		.ops = &clk_regmap_mux_ops,
+		.parent_hws = axg_vclk_parent_hws,
+		.num_parents = ARRAY_SIZE(axg_vclk_parent_hws),
+		.flags = CLK_SET_RATE_NO_REPARENT | CLK_GET_RATE_NOCACHE,
+	},
+};
+
+static struct clk_regmap axg_vclk_input = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = HHI_VID_CLK_DIV,
+		.bit_idx = 16,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "vclk_input",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) { &axg_vclk_sel.hw },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+	},
+};
+
+static struct clk_regmap axg_vclk2_input = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = HHI_VIID_CLK_DIV,
+		.bit_idx = 16,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "vclk2_input",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) { &axg_vclk2_sel.hw },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+	},
+};
+
+static struct clk_regmap axg_vclk_div = {
+	.data = &(struct clk_regmap_div_data){
+		.offset = HHI_VID_CLK_DIV,
+		.shift = 0,
+		.width = 8,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "vclk_div",
+		.ops = &clk_regmap_divider_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&axg_vclk_input.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_GET_RATE_NOCACHE,
+	},
+};
+
+static struct clk_regmap axg_vclk2_div = {
+	.data = &(struct clk_regmap_div_data){
+		.offset = HHI_VIID_CLK_DIV,
+		.shift = 0,
+		.width = 8,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "vclk2_div",
+		.ops = &clk_regmap_divider_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&axg_vclk2_input.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_GET_RATE_NOCACHE,
+	},
+};
+
+static struct clk_regmap axg_vclk = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = HHI_VID_CLK_CNTL,
+		.bit_idx = 19,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "vclk",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) { &axg_vclk_div.hw },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+	},
+};
+
+static struct clk_regmap axg_vclk2 = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = HHI_VIID_CLK_CNTL,
+		.bit_idx = 19,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "vclk2",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) { &axg_vclk2_div.hw },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+	},
+};
+
+static struct clk_regmap axg_vclk_div1 = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = HHI_VID_CLK_CNTL,
+		.bit_idx = 0,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "vclk_div1",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) { &axg_vclk.hw },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+	},
+};
+
+static struct clk_regmap axg_vclk_div2_en = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = HHI_VID_CLK_CNTL,
+		.bit_idx = 1,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "vclk_div2_en",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) { &axg_vclk.hw },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+	},
+};
+
+static struct clk_regmap axg_vclk_div4_en = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = HHI_VID_CLK_CNTL,
+		.bit_idx = 2,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "vclk_div4_en",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) { &axg_vclk.hw },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+	},
+};
+
+static struct clk_regmap axg_vclk_div6_en = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = HHI_VID_CLK_CNTL,
+		.bit_idx = 3,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "vclk_div6_en",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) { &axg_vclk.hw },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+	},
+};
+
+static struct clk_regmap axg_vclk_div12_en = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = HHI_VID_CLK_CNTL,
+		.bit_idx = 4,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "vclk_div12_en",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) { &axg_vclk.hw },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+	},
+};
+
+static struct clk_regmap axg_vclk2_div1 = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = HHI_VIID_CLK_CNTL,
+		.bit_idx = 0,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "vclk2_div1",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) { &axg_vclk2.hw },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+	},
+};
+
+static struct clk_regmap axg_vclk2_div2_en = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = HHI_VIID_CLK_CNTL,
+		.bit_idx = 1,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "vclk2_div2_en",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) { &axg_vclk2.hw },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+	},
+};
+
+static struct clk_regmap axg_vclk2_div4_en = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = HHI_VIID_CLK_CNTL,
+		.bit_idx = 2,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "vclk2_div4_en",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) { &axg_vclk2.hw },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+	},
+};
+
+static struct clk_regmap axg_vclk2_div6_en = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = HHI_VIID_CLK_CNTL,
+		.bit_idx = 3,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "vclk2_div6_en",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) { &axg_vclk2.hw },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+	},
+};
+
+static struct clk_regmap axg_vclk2_div12_en = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = HHI_VIID_CLK_CNTL,
+		.bit_idx = 4,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "vclk2_div12_en",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) { &axg_vclk2.hw },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+	},
+};
+
+static struct clk_fixed_factor axg_vclk_div2 = {
+	.mult = 1,
+	.div = 2,
+	.hw.init = &(struct clk_init_data){
+		.name = "vclk_div2",
+		.ops = &clk_fixed_factor_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&axg_vclk_div2_en.hw
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_fixed_factor axg_vclk_div4 = {
+	.mult = 1,
+	.div = 4,
+	.hw.init = &(struct clk_init_data){
+		.name = "vclk_div4",
+		.ops = &clk_fixed_factor_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&axg_vclk_div4_en.hw
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_fixed_factor axg_vclk_div6 = {
+	.mult = 1,
+	.div = 6,
+	.hw.init = &(struct clk_init_data){
+		.name = "vclk_div6",
+		.ops = &clk_fixed_factor_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&axg_vclk_div6_en.hw
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_fixed_factor axg_vclk_div12 = {
+	.mult = 1,
+	.div = 12,
+	.hw.init = &(struct clk_init_data){
+		.name = "vclk_div12",
+		.ops = &clk_fixed_factor_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&axg_vclk_div12_en.hw
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_fixed_factor axg_vclk2_div2 = {
+	.mult = 1,
+	.div = 2,
+	.hw.init = &(struct clk_init_data){
+		.name = "vclk2_div2",
+		.ops = &clk_fixed_factor_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&axg_vclk2_div2_en.hw
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_fixed_factor axg_vclk2_div4 = {
+	.mult = 1,
+	.div = 4,
+	.hw.init = &(struct clk_init_data){
+		.name = "vclk2_div4",
+		.ops = &clk_fixed_factor_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&axg_vclk2_div4_en.hw
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_fixed_factor axg_vclk2_div6 = {
+	.mult = 1,
+	.div = 6,
+	.hw.init = &(struct clk_init_data){
+		.name = "vclk2_div6",
+		.ops = &clk_fixed_factor_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&axg_vclk2_div6_en.hw
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_fixed_factor axg_vclk2_div12 = {
+	.mult = 1,
+	.div = 12,
+	.hw.init = &(struct clk_init_data){
+		.name = "vclk2_div12",
+		.ops = &clk_fixed_factor_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&axg_vclk2_div12_en.hw
+		},
+		.num_parents = 1,
+	},
+};
+
+static u32 mux_table_cts_sel[] = { 0, 1, 2, 3, 4, 8, 9, 10, 11, 12 };
+static const struct clk_hw *axg_cts_parent_hws[] = {
+	&axg_vclk_div1.hw,
+	&axg_vclk_div2.hw,
+	&axg_vclk_div4.hw,
+	&axg_vclk_div6.hw,
+	&axg_vclk_div12.hw,
+	&axg_vclk2_div1.hw,
+	&axg_vclk2_div2.hw,
+	&axg_vclk2_div4.hw,
+	&axg_vclk2_div6.hw,
+	&axg_vclk2_div12.hw,
+};
+
+static struct clk_regmap axg_cts_encl_sel = {
+	.data = &(struct clk_regmap_mux_data){
+		.offset = HHI_VIID_CLK_DIV,
+		.mask = 0xf,
+		.shift = 12,
+		.table = mux_table_cts_sel,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "cts_encl_sel",
+		.ops = &clk_regmap_mux_ops,
+		.parent_hws = axg_cts_parent_hws,
+		.num_parents = ARRAY_SIZE(axg_cts_parent_hws),
+		.flags = CLK_SET_RATE_NO_REPARENT | CLK_GET_RATE_NOCACHE,
+	},
+};
+
+static struct clk_regmap axg_cts_encl = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = HHI_VID_CLK_CNTL2,
+		.bit_idx = 3,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "cts_encl",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&axg_cts_encl_sel.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+	},
+};
+
 static u32 mux_table_gen_clk[]	= { 0, 4, 5, 6, 7, 8,
 				    9, 10, 11, 13, 14, };
 static const struct clk_parent_data gen_clk_parent_data[] = {
@@ -1246,6 +1944,49 @@ static struct clk_hw_onecell_data axg_hw_onecell_data = {
 		[CLKID_HIFI_PLL_DCO]		= &axg_hifi_pll_dco.hw,
 		[CLKID_PCIE_PLL_DCO]		= &axg_pcie_pll_dco.hw,
 		[CLKID_PCIE_PLL_OD]		= &axg_pcie_pll_od.hw,
+		[CLKID_VPU_0_DIV]		= &axg_vpu_0_div.hw,
+		[CLKID_VPU_0_SEL]		= &axg_vpu_0_sel.hw,
+		[CLKID_VPU_0]			= &axg_vpu_0.hw,
+		[CLKID_VPU_1_DIV]		= &axg_vpu_1_div.hw,
+		[CLKID_VPU_1_SEL]		= &axg_vpu_1_sel.hw,
+		[CLKID_VPU_1]			= &axg_vpu_1.hw,
+		[CLKID_VPU]			= &axg_vpu.hw,
+		[CLKID_VAPB_0_DIV]		= &axg_vapb_0_div.hw,
+		[CLKID_VAPB_0_SEL]		= &axg_vapb_0_sel.hw,
+		[CLKID_VAPB_0]			= &axg_vapb_0.hw,
+		[CLKID_VAPB_1_DIV]		= &axg_vapb_1_div.hw,
+		[CLKID_VAPB_1_SEL]		= &axg_vapb_1_sel.hw,
+		[CLKID_VAPB_1]			= &axg_vapb_1.hw,
+		[CLKID_VAPB_SEL]		= &axg_vapb_sel.hw,
+		[CLKID_VAPB]			= &axg_vapb.hw,
+		[CLKID_VCLK]			= &axg_vclk.hw,
+		[CLKID_VCLK2]			= &axg_vclk2.hw,
+		[CLKID_VCLK_SEL]		= &axg_vclk_sel.hw,
+		[CLKID_VCLK2_SEL]		= &axg_vclk2_sel.hw,
+		[CLKID_VCLK_INPUT]		= &axg_vclk_input.hw,
+		[CLKID_VCLK2_INPUT]		= &axg_vclk2_input.hw,
+		[CLKID_VCLK_DIV]		= &axg_vclk_div.hw,
+		[CLKID_VCLK2_DIV]		= &axg_vclk2_div.hw,
+		[CLKID_VCLK_DIV2_EN]		= &axg_vclk_div2_en.hw,
+		[CLKID_VCLK_DIV4_EN]		= &axg_vclk_div4_en.hw,
+		[CLKID_VCLK_DIV6_EN]		= &axg_vclk_div6_en.hw,
+		[CLKID_VCLK_DIV12_EN]		= &axg_vclk_div12_en.hw,
+		[CLKID_VCLK2_DIV2_EN]		= &axg_vclk2_div2_en.hw,
+		[CLKID_VCLK2_DIV4_EN]		= &axg_vclk2_div4_en.hw,
+		[CLKID_VCLK2_DIV6_EN]		= &axg_vclk2_div6_en.hw,
+		[CLKID_VCLK2_DIV12_EN]		= &axg_vclk2_div12_en.hw,
+		[CLKID_VCLK_DIV1]		= &axg_vclk_div1.hw,
+		[CLKID_VCLK_DIV2]		= &axg_vclk_div2.hw,
+		[CLKID_VCLK_DIV4]		= &axg_vclk_div4.hw,
+		[CLKID_VCLK_DIV6]		= &axg_vclk_div6.hw,
+		[CLKID_VCLK_DIV12]		= &axg_vclk_div12.hw,
+		[CLKID_VCLK2_DIV1]		= &axg_vclk2_div1.hw,
+		[CLKID_VCLK2_DIV2]		= &axg_vclk2_div2.hw,
+		[CLKID_VCLK2_DIV4]		= &axg_vclk2_div4.hw,
+		[CLKID_VCLK2_DIV6]		= &axg_vclk2_div6.hw,
+		[CLKID_VCLK2_DIV12]		= &axg_vclk2_div12.hw,
+		[CLKID_CTS_ENCL_SEL]		= &axg_cts_encl_sel.hw,
+		[CLKID_CTS_ENCL]		= &axg_cts_encl.hw,
 		[NR_CLKS]			= NULL,
 	},
 	.num = NR_CLKS,
@@ -1341,6 +2082,39 @@ static struct clk_regmap *const axg_clk_regmaps[] = {
 	&axg_hifi_pll_dco,
 	&axg_pcie_pll_dco,
 	&axg_pcie_pll_od,
+	&axg_vpu_0_div,
+	&axg_vpu_0_sel,
+	&axg_vpu_0,
+	&axg_vpu_1_div,
+	&axg_vpu_1_sel,
+	&axg_vpu_1,
+	&axg_vpu,
+	&axg_vapb_0_div,
+	&axg_vapb_0_sel,
+	&axg_vapb_0,
+	&axg_vapb_1_div,
+	&axg_vapb_1_sel,
+	&axg_vapb_1,
+	&axg_vapb_sel,
+	&axg_vapb,
+	&axg_vclk,
+	&axg_vclk2,
+	&axg_vclk_sel,
+	&axg_vclk2_sel,
+	&axg_vclk_input,
+	&axg_vclk2_input,
+	&axg_vclk_div,
+	&axg_vclk2_div,
+	&axg_vclk_div2_en,
+	&axg_vclk_div4_en,
+	&axg_vclk_div6_en,
+	&axg_vclk_div12_en,
+	&axg_vclk2_div2_en,
+	&axg_vclk2_div4_en,
+	&axg_vclk2_div6_en,
+	&axg_vclk2_div12_en,
+	&axg_cts_encl_sel,
+	&axg_cts_encl,
 };
 
 static const struct meson_eeclkc_data axg_clkc_data = {
diff --git a/drivers/clk/meson/axg.h b/drivers/clk/meson/axg.h
index 0431dabac629..a8787b394a47 100644
--- a/drivers/clk/meson/axg.h
+++ b/drivers/clk/meson/axg.h
@@ -139,8 +139,27 @@
 #define CLKID_HIFI_PLL_DCO			88
 #define CLKID_PCIE_PLL_DCO			89
 #define CLKID_PCIE_PLL_OD			90
+#define CLKID_VPU_0_DIV				91
+#define CLKID_VPU_1_DIV				94
+#define CLKID_VAPB_0_DIV			98
+#define CLKID_VAPB_1_DIV			101
+#define CLKID_VCLK_SEL				108
+#define CLKID_VCLK2_SEL				109
+#define CLKID_VCLK_INPUT			110
+#define CLKID_VCLK2_INPUT			111
+#define CLKID_VCLK_DIV				112
+#define CLKID_VCLK2_DIV				113
+#define CLKID_VCLK_DIV2_EN			114
+#define CLKID_VCLK_DIV4_EN			115
+#define CLKID_VCLK_DIV6_EN			116
+#define CLKID_VCLK_DIV12_EN			117
+#define CLKID_VCLK2_DIV2_EN			118
+#define CLKID_VCLK2_DIV4_EN			119
+#define CLKID_VCLK2_DIV6_EN			120
+#define CLKID_VCLK2_DIV12_EN			121
+#define CLKID_CTS_ENCL_SEL			132
 
-#define NR_CLKS					91
+#define NR_CLKS					134
 
 /* include the CLKIDs that have been made part of the DT binding */
 #include <dt-bindings/clock/axg-clkc.h>
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
