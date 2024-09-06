Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D3EC54FC6
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Sep 2024 05:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0SvpDq97g7+CTavZK69Fl7M7KEPBzwle3fHDah3/VSg=; b=l0KeYAko6+7bip
	d8MW4DGTUTtmUnIEbjmDwcHPeQBS/8AN09PpYFkxLAhJ4pC8sxXX0bxR8IM6Xw91ZKwEEkGes6eY2
	H5NANuKOPHVW91GjYLEP7t5XblbjfilueTPrlB8bDrqb1pNnw4tjPN+Q7ruh3s12DNPlrXWUTj2dV
	U7PGV6LPRPNPjHTYpJa6IUsRZN5tgUEeq4szTNzQ9y4NLXLWz5kqURPODJJtsKu03MTM9B1WYeHPi
	rscoNzLW66gWiHe3E2EkvLgnbm2Of2ExyJZQVYP3W9Y1K2noF+dKFMk1VQlQU7AQXPZt6/C3hCB/2
	XlVss4Zq1fR9edCBeu6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smRvb-0000000Amgf-1c1W;
	Fri, 06 Sep 2024 05:54:39 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smRte-0000000Am1O-1teX;
	Fri, 06 Sep 2024 05:52:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 343C7A4467C;
	Fri,  6 Sep 2024 05:52:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DF67AC4CECC;
	Fri,  6 Sep 2024 05:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725601956;
	bh=fZnb4eOdBuuUWog66uoDoe+ZN8bX/78YQ6P8dpOsCpw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qPqB5D00PLNLktkk6j0d+tG2sR8G64MDsJr5f4NK8gjwvX6sFtCEr5cL+fabhHS9+
	 Ym0V8JSSIqYsvxImVvHy62JdxbKrNOH6SZicXNt3P3JAwaaJrVnAnjNhBgGbTY7IxQ
	 Zq2gjICUFWB4AUfqv86yaoKRDRScqyLZu3PCPNjhl8tTbm3ufHkLdBN0wYBouFLs3k
	 Dt6L7hEyHgDN2QqcRozRL1a85o1vwOQyp1nNRTVQ1PI5PICp9Y9IJeG42BB8P+2I2X
	 Su1AHtaLZZtZGEj1INrzEUrfLAN8ezUYe3qnXD/BHBbNBy0S2FAAVjW/sANowTlJsz
	 YedEFGttKdjqQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D671ACE7AB2;
	Fri,  6 Sep 2024 05:52:36 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Fri, 06 Sep 2024 13:52:35 +0800
Subject: [PATCH 3/4] clk: meson: s4: pll: hifi_pll support fractional
 multiplier
MIME-Version: 1.0
Message-Id: <20240906-fix_clk-v1-3-2977ef0d72e7@amlogic.com>
References: <20240906-fix_clk-v1-0-2977ef0d72e7@amlogic.com>
In-Reply-To: <20240906-fix_clk-v1-0-2977ef0d72e7@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725601955; l=1150;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=9arg64z8UgGz40ls665ct4U5mW7FxNd6ZQXnRFwYvkw=;
 b=IogfYnGomgoFnpWnEW+aCeCWGoCRu5sjduQc9ITv14leLMU9GP9TTYlf8pekBb+LXLIr543YO
 OhNH1AkivSsAjqqOQYQGUTeWrKmzZRYalqnckEaeovZLnZ6Hg/9bc83
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_225238_597420_75791B20 
X-CRM114-Status: GOOD (  10.71  )
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
Reply-To: chuan.liu@amlogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Chuan Liu <chuan.liu@amlogic.com>

The s4's hifi_pll supports a fractional frequency multiplier, but frac
parameters are not configured in the driver.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 drivers/clk/meson/s4-pll.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/meson/s4-pll.c b/drivers/clk/meson/s4-pll.c
index b0258933fb9d..a97e19057b05 100644
--- a/drivers/clk/meson/s4-pll.c
+++ b/drivers/clk/meson/s4-pll.c
@@ -329,7 +329,6 @@ static struct clk_regmap s4_gp0_pll = {
  * Internal hifi pll emulation configuration parameters
  */
 static const struct reg_sequence s4_hifi_init_regs[] = {
-	{ .reg = ANACTRL_HIFIPLL_CTRL1,	.def = 0x00010e56 },
 	{ .reg = ANACTRL_HIFIPLL_CTRL2,	.def = 0x00000000 },
 	{ .reg = ANACTRL_HIFIPLL_CTRL3,	.def = 0x6a285c00 },
 	{ .reg = ANACTRL_HIFIPLL_CTRL4,	.def = 0x65771290 },
@@ -354,6 +353,11 @@ static struct clk_regmap s4_hifi_pll_dco = {
 			.shift   = 10,
 			.width   = 5,
 		},
+		.frac = {
+			.reg_off = ANACTRL_HIFIPLL_CTRL1,
+			.shift   = 0,
+			.width   = 17,
+		},
 		.l = {
 			.reg_off = ANACTRL_HIFIPLL_CTRL0,
 			.shift   = 31,

-- 
2.42.0



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
