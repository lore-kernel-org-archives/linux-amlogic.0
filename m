Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD9C5CE7AB4
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Sep 2024 05:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=15lQPvHxl1nHq3dIdeDctiP4M6gZ3/aYgLgNlagxnbU=; b=SjFygc6R3zsfbh
	s5lQj++nqGf3otPzdxKiu5+9sj+QrliOLjVJPnIi3eAAnBdX98NSQ/Zzk9ANHElSGXr7K7eKIFjh3
	cOXuzVn0DyTApq3UUcA+KVMhc6ytklf/xaN9x0L6gUjFGSnAepety3PZFqFB/HQOSjt+ezWb9nR92
	dcgy9pQXCULDBb8mt+pGcgsT1yCeVHUhwZVzOJmOsDmekY0keiiekGCNpG9yEoOXAzck7Pce79s0h
	NPTJERqIJ3Grid8/tZJsHfnSrmvADJ0XKYfCV1KbYdr77YFIU+GgoAZJPG+Ex/DxwkTlo303gsA7j
	PfeDeruLbao2Aq2L/4ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smRvc-0000000AmhE-0fIB;
	Fri, 06 Sep 2024 05:54:40 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smRte-0000000Am1L-3FHf;
	Fri, 06 Sep 2024 05:52:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 345ABA4467E;
	Fri,  6 Sep 2024 05:52:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F10CAC4CECD;
	Fri,  6 Sep 2024 05:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725601957;
	bh=NF51BZTpHooM2jXXouuv+vaFnFg1br4o/kba70yIL58=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=BFyRRY4NFXwkS4wHF0H/68dCuyWVIwSnIn0mPwTReAkVJRSePaPLXj5DQtiF83o5G
	 GH/lzZDuQbcIleoQ2bAYMx4i6j7//0biTUnE59KtzQaJQIhpNzCD2l/WU+VwgPnGNA
	 yoNUlLd9uGIoCwUGlkwv+rquLXNWHyILYMdjzLiXpiaDncRYAoWxzkhrursQ714/XK
	 X1ybSLWhNaVRkwHBlZMu/VAWJXvgAnyG7EmdQaydUVXhwGgiQPZEPA7METuLqxnmJv
	 VRQqzxo8/4iHxnESYxXh5FA3VEhFbsYbCqDPZbuip9AcXaYLMM9v996ebNUg/vuzRY
	 VE/eYK9RuUvdQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7D0DCE7AB4;
	Fri,  6 Sep 2024 05:52:36 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Fri, 06 Sep 2024 13:52:36 +0800
Subject: [PATCH 4/4] clk: meson: s4: pll: hifi_pll frequency is not
 accurate
MIME-Version: 1.0
Message-Id: <20240906-fix_clk-v1-4-2977ef0d72e7@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725601955; l=856;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=ro5ykdJDKk3Y3xDmm5Xm1OoCgPIR4AFyD2bYCkCFPEE=;
 b=IZ/yVuY2wLIpYN/mhZKmh78eSRhQWPOQXk6dCtA0gTmfYzo0NItf/y9PgHvE5d6fhK5WadFzv
 FjJPFyhAp4AAYn5pGpB2DtD/haOcypyrWQKn+SK+pRys+RXlfwNHg5p
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_225238_978724_951D5FCD 
X-CRM114-Status: UNSURE (   9.89  )
X-CRM114-Notice: Please train this message.
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

The fractional denominator of S4's hifi_pll fractional multiplier is
fixed to 100000, so flag CLK_MESON_PLL_FIXED_FRAC_MAX is added.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 drivers/clk/meson/s4-pll.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/meson/s4-pll.c b/drivers/clk/meson/s4-pll.c
index a97e19057b05..a793ac2e8cc7 100644
--- a/drivers/clk/meson/s4-pll.c
+++ b/drivers/clk/meson/s4-pll.c
@@ -371,7 +371,8 @@ static struct clk_regmap s4_hifi_pll_dco = {
 		.range = &s4_gp0_pll_mult_range,
 		.init_regs = s4_hifi_init_regs,
 		.init_count = ARRAY_SIZE(s4_hifi_init_regs),
-		.flags = CLK_MESON_PLL_ROUND_CLOSEST,
+		.flags = CLK_MESON_PLL_ROUND_CLOSEST |
+			 CLK_MESON_PLL_FIXED_FRAC_MAX,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "hifi_pll_dco",

-- 
2.42.0



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
