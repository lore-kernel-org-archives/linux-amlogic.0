Return-Path: <SRS0=Jj0Y=VW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 614D4C7618B
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Jul 2019 16:44:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3795221951
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Jul 2019 16:44:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cGZhVM/3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="nvW5oTHj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3795221951
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=AB3TiQEv/Wabf47h8mZwXCg6UAXV1ax2DuQjPhAx9rM=; b=cGZhVM/3e3q2OiNVnvWAjMzeRf
	fcR3yF6Lfau/pgiIe3XLacncRsrrXyKtIAKhcdCl8UhcP5Z1EbGyL8VFwAuNCGvzuzdNTlXyp4iym
	rkXEfJmla5I/KWOOn96pr+T4bPR4ttBSSH0x+h4q2Qirfxi8TtwFeV/7qUjlQ5+rIYHh7gqbjp9rU
	B6OADaNT0ci0xWjr3jArzfLw3quHRvu/WsonosU8InHcGydIghAB/0Qk1shdH5LXPJpwK/+yWg91W
	kiBgjPdFo+GrEr8FTK54S6i4PENR5DXrZYtX//y3t27xKo1vSF4dh7ft/WcWvSUDdXsmktiIpFhrY
	Lig0GXIg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hqgr1-0005Gx-LY; Thu, 25 Jul 2019 16:44:31 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hqgpT-0004Bw-37
 for linux-amlogic@lists.infradead.org; Thu, 25 Jul 2019 16:42:57 +0000
Received: by mail-wr1-x444.google.com with SMTP id n9so26415348wrr.4
 for <linux-amlogic@lists.infradead.org>; Thu, 25 Jul 2019 09:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=cIceYeZmXLnDB8KmyjeQxrFIl+tdDqzy/AgzjLz1uyc=;
 b=nvW5oTHj4gQvGHo7lcJTswmWZ60wi/xYBHu7DlVCK3SgRT9tDHv3cwNDKYa1vMRMJ2
 wjRTerLSX8BtgER/mmzHTwkN99x+hXleNLtcmj5lahZqo+eJPKQ/JUXizGP8keAVr55f
 IkhsJjfKA85qwvXy8beI/7YsfkpurbaHSJBglWN3ykH4v4khuYs897QILrSOJVkugP3x
 oObQA3uwYz+KXwjghszb9SuyMOJJGoIDqiXjPOdv4KLMS55aA0LiZfughhBuEdRzB1lc
 1V9TfEMwzVsamOPwSovxsw3dfs2wS6If5Nwj0IdhlDe2O/u9+FJZsMHAjVSWdv1kR+hk
 waiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=cIceYeZmXLnDB8KmyjeQxrFIl+tdDqzy/AgzjLz1uyc=;
 b=rtUa+I7+Rh6//O4cOqu8Llax0a108iXOh5YfEmw7ewkxsAjQ1aA44pCQUbvIp/l91Q
 3Y5PSxjp53nmEkQlsYHIwk7I0NhGDmFZo88E5MGXP64bxTP6lyW4MrCeDYBEz40jqpsq
 NXfGIPx/Kxz7U3sOHofis1HAn3Rv0WWJfUdU0n4sEbHgA04cTH2b03ShH95rdic6CZ/c
 Pvj7fCq3M/BPLxe+ryQteBmMY1yDKN/XVXbrqX36WNZDYbZmX3dzlyXPs7ep4/SOVnnE
 PfV0d7oTzl9YuTuEL2B6ciDtyzJBfRqIZnz8dmC5Ss+p1OjC28+KII8hiv0crzZYJfZz
 HCcw==
X-Gm-Message-State: APjAAAWMf2g0bNWxdVkHL1zeyQJ3zLBag9z+D6D96koohKZ3Nif/EZ3j
 W5cT7JNhlezG3W0KDN87LtA4mQ==
X-Google-Smtp-Source: APXvYqyQZGlsKFWD/sDLe1hv4n9haHqDBHhVsDzbHoc0AZ36ZoPvsaEYl81aAQ8BA1KiwCsC3cR0RQ==
X-Received: by 2002:a5d:6a90:: with SMTP id s16mr41077814wru.288.1564072973815; 
 Thu, 25 Jul 2019 09:42:53 -0700 (PDT)
Received: from pop-os.baylibre.local ([2a01:e35:8ad2:2cb0:2dbb:fac9:5ec0:e3ef])
 by smtp.googlemail.com with ESMTPSA id 91sm103031727wrp.3.2019.07.25.09.42.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Jul 2019 09:42:53 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
To: jbrunet@baylibre.com
Subject: [PATCH v2 1/8] clk: meson: g12a: move clock declaration to dependency
 order
Date: Thu, 25 Jul 2019 18:42:31 +0200
Message-Id: <20190725164238.27991-2-amergnat@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190725164238.27991-1-amergnat@baylibre.com>
References: <20190725164238.27991-1-amergnat@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190725_094255_247422_46A2C187 
X-CRM114-Status: GOOD (  16.16  )
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
Cc: narmstrong@baylibre.com, sboyd@kernel.org, khilman@baylibre.com,
 Alexandre Mergnat <amergnat@baylibre.com>, linux-kernel@vger.kernel.org,
 baylibre-upstreaming@groups.io, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This clock controller use the string comparison method to describe parent
relation between the clocks.

In order to migrate to clk_hw pointers, it is easier if the parent is
declared before being used. This patch just move the declaration to
facilitate the review of migration to the parent description method.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/clk/meson/g12a.c | 270 +++++++++++++++++++--------------------
 1 file changed, 135 insertions(+), 135 deletions(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index 7bc5566b66f7..cbd56b2e05d0 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -257,6 +257,64 @@ static struct clk_fixed_factor g12b_sys1_pll_div16 = {
 	},
 };
 
+static struct clk_fixed_factor g12a_fclk_div2_div = {
+	.mult = 1,
+	.div = 2,
+	.hw.init = &(struct clk_init_data){
+		.name = "fclk_div2_div",
+		.ops = &clk_fixed_factor_ops,
+		.parent_names = (const char *[]){ "fixed_pll" },
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap g12a_fclk_div2 = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = HHI_FIX_PLL_CNTL1,
+		.bit_idx = 24,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "fclk_div2",
+		.ops = &clk_regmap_gate_ops,
+		.parent_names = (const char *[]){ "fclk_div2_div" },
+		.num_parents = 1,
+	},
+};
+
+static struct clk_fixed_factor g12a_fclk_div3_div = {
+	.mult = 1,
+	.div = 3,
+	.hw.init = &(struct clk_init_data){
+		.name = "fclk_div3_div",
+		.ops = &clk_fixed_factor_ops,
+		.parent_names = (const char *[]){ "fixed_pll" },
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap g12a_fclk_div3 = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = HHI_FIX_PLL_CNTL1,
+		.bit_idx = 20,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "fclk_div3",
+		.ops = &clk_regmap_gate_ops,
+		.parent_names = (const char *[]){ "fclk_div3_div" },
+		.num_parents = 1,
+		/*
+		 * This clock is used by the resident firmware and is required
+		 * by the platform to operate correctly.
+		 * Until the following condition are met, we need this clock to
+		 * be marked as critical:
+		 * a) Mark the clock used by a firmware resource, if possible
+		 * b) CCF has a clock hand-off mechanism to make the sure the
+		 *    clock stays on until the proper driver comes along
+		 */
+		.flags = CLK_IS_CRITICAL,
+	},
+};
+
 /* Datasheet names this field as "premux0" */
 static struct clk_regmap g12a_cpu_clk_premux0 = {
 	.data = &(struct clk_regmap_mux_data){
@@ -274,6 +332,23 @@ static struct clk_regmap g12a_cpu_clk_premux0 = {
 	},
 };
 
+/* Datasheet names this field as "premux1" */
+static struct clk_regmap g12a_cpu_clk_premux1 = {
+	.data = &(struct clk_regmap_mux_data){
+		.offset = HHI_SYS_CPU_CLK_CNTL0,
+		.mask = 0x3,
+		.shift = 16,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "cpu_clk_dyn1_sel",
+		.ops = &clk_regmap_mux_ro_ops,
+		.parent_names = (const char *[]){ IN_PREFIX "xtal",
+						  "fclk_div2",
+						  "fclk_div3" },
+		.num_parents = 3,
+	},
+};
+
 /* Datasheet names this field as "mux0_divn_tcnt" */
 static struct clk_regmap g12a_cpu_clk_mux0_div = {
 	.data = &(struct clk_regmap_div_data){
@@ -305,23 +380,6 @@ static struct clk_regmap g12a_cpu_clk_postmux0 = {
 	},
 };
 
-/* Datasheet names this field as "premux1" */
-static struct clk_regmap g12a_cpu_clk_premux1 = {
-	.data = &(struct clk_regmap_mux_data){
-		.offset = HHI_SYS_CPU_CLK_CNTL0,
-		.mask = 0x3,
-		.shift = 16,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "cpu_clk_dyn1_sel",
-		.ops = &clk_regmap_mux_ro_ops,
-		.parent_names = (const char *[]){ IN_PREFIX "xtal",
-						  "fclk_div2",
-						  "fclk_div3" },
-		.num_parents = 3,
-	},
-};
-
 /* Datasheet names this field as "Mux1_divn_tcnt" */
 static struct clk_regmap g12a_cpu_clk_mux1_div = {
 	.data = &(struct clk_regmap_div_data){
@@ -1305,64 +1363,6 @@ static struct clk_regmap g12a_hdmi_pll = {
 	},
 };
 
-static struct clk_fixed_factor g12a_fclk_div2_div = {
-	.mult = 1,
-	.div = 2,
-	.hw.init = &(struct clk_init_data){
-		.name = "fclk_div2_div",
-		.ops = &clk_fixed_factor_ops,
-		.parent_names = (const char *[]){ "fixed_pll" },
-		.num_parents = 1,
-	},
-};
-
-static struct clk_regmap g12a_fclk_div2 = {
-	.data = &(struct clk_regmap_gate_data){
-		.offset = HHI_FIX_PLL_CNTL1,
-		.bit_idx = 24,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "fclk_div2",
-		.ops = &clk_regmap_gate_ops,
-		.parent_names = (const char *[]){ "fclk_div2_div" },
-		.num_parents = 1,
-	},
-};
-
-static struct clk_fixed_factor g12a_fclk_div3_div = {
-	.mult = 1,
-	.div = 3,
-	.hw.init = &(struct clk_init_data){
-		.name = "fclk_div3_div",
-		.ops = &clk_fixed_factor_ops,
-		.parent_names = (const char *[]){ "fixed_pll" },
-		.num_parents = 1,
-	},
-};
-
-static struct clk_regmap g12a_fclk_div3 = {
-	.data = &(struct clk_regmap_gate_data){
-		.offset = HHI_FIX_PLL_CNTL1,
-		.bit_idx = 20,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "fclk_div3",
-		.ops = &clk_regmap_gate_ops,
-		.parent_names = (const char *[]){ "fclk_div3_div" },
-		.num_parents = 1,
-		/*
-		 * This clock is used by the resident firmware and is required
-		 * by the platform to operate correctly.
-		 * Until the following condition are met, we need this clock to
-		 * be marked as critical:
-		 * a) Mark the clock used by a firmware resource, if possible
-		 * b) CCF has a clock hand-off mechanism to make the sure the
-		 *    clock stays on until the proper driver comes along
-		 */
-		.flags = CLK_IS_CRITICAL,
-	},
-};
-
 static struct clk_fixed_factor g12a_fclk_div4_div = {
 	.mult = 1,
 	.div = 4,
@@ -1900,6 +1900,66 @@ static struct clk_regmap g12a_sd_emmc_c_clk0 = {
 	},
 };
 
+/* Video Clocks */
+
+static struct clk_regmap g12a_vid_pll_div = {
+	.data = &(struct meson_vid_pll_div_data){
+		.val = {
+			.reg_off = HHI_VID_PLL_CLK_DIV,
+			.shift   = 0,
+			.width   = 15,
+		},
+		.sel = {
+			.reg_off = HHI_VID_PLL_CLK_DIV,
+			.shift   = 16,
+			.width   = 2,
+		},
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "vid_pll_div",
+		.ops = &meson_vid_pll_div_ro_ops,
+		.parent_names = (const char *[]){ "hdmi_pll" },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,
+	},
+};
+
+static const char * const g12a_vid_pll_parent_names[] = { "vid_pll_div",
+							  "hdmi_pll" };
+
+static struct clk_regmap g12a_vid_pll_sel = {
+	.data = &(struct clk_regmap_mux_data){
+		.offset = HHI_VID_PLL_CLK_DIV,
+		.mask = 0x1,
+		.shift = 18,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "vid_pll_sel",
+		.ops = &clk_regmap_mux_ops,
+		/*
+		 * bit 18 selects from 2 possible parents:
+		 * vid_pll_div or hdmi_pll
+		 */
+		.parent_names = g12a_vid_pll_parent_names,
+		.num_parents = ARRAY_SIZE(g12a_vid_pll_parent_names),
+		.flags = CLK_SET_RATE_NO_REPARENT | CLK_GET_RATE_NOCACHE,
+	},
+};
+
+static struct clk_regmap g12a_vid_pll = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = HHI_VID_PLL_CLK_DIV,
+		.bit_idx = 19,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "vid_pll",
+		.ops = &clk_regmap_gate_ops,
+		.parent_names = (const char *[]){ "vid_pll_sel" },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+	},
+};
+
 /* VPU Clock */
 
 static const char * const g12a_vpu_parent_names[] = {
@@ -2287,66 +2347,6 @@ static struct clk_regmap g12a_vapb = {
 	},
 };
 
-/* Video Clocks */
-
-static struct clk_regmap g12a_vid_pll_div = {
-	.data = &(struct meson_vid_pll_div_data){
-		.val = {
-			.reg_off = HHI_VID_PLL_CLK_DIV,
-			.shift   = 0,
-			.width   = 15,
-		},
-		.sel = {
-			.reg_off = HHI_VID_PLL_CLK_DIV,
-			.shift   = 16,
-			.width   = 2,
-		},
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "vid_pll_div",
-		.ops = &meson_vid_pll_div_ro_ops,
-		.parent_names = (const char *[]){ "hdmi_pll" },
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,
-	},
-};
-
-static const char * const g12a_vid_pll_parent_names[] = { "vid_pll_div",
-							  "hdmi_pll" };
-
-static struct clk_regmap g12a_vid_pll_sel = {
-	.data = &(struct clk_regmap_mux_data){
-		.offset = HHI_VID_PLL_CLK_DIV,
-		.mask = 0x1,
-		.shift = 18,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "vid_pll_sel",
-		.ops = &clk_regmap_mux_ops,
-		/*
-		 * bit 18 selects from 2 possible parents:
-		 * vid_pll_div or hdmi_pll
-		 */
-		.parent_names = g12a_vid_pll_parent_names,
-		.num_parents = ARRAY_SIZE(g12a_vid_pll_parent_names),
-		.flags = CLK_SET_RATE_NO_REPARENT | CLK_GET_RATE_NOCACHE,
-	},
-};
-
-static struct clk_regmap g12a_vid_pll = {
-	.data = &(struct clk_regmap_gate_data){
-		.offset = HHI_VID_PLL_CLK_DIV,
-		.bit_idx = 19,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "vid_pll",
-		.ops = &clk_regmap_gate_ops,
-		.parent_names = (const char *[]){ "vid_pll_sel" },
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
-	},
-};
-
 static const char * const g12a_vclk_parent_names[] = {
 	"vid_pll", "gp0_pll", "hifi_pll", "mpll1", "fclk_div3", "fclk_div4",
 	"fclk_div5", "fclk_div7"
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
