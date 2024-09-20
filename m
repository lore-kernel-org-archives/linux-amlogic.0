Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37484CF58DD
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Sep 2024 08:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XLtiGuAyPaDjRospvegB6Vsp9mpgyOOb7FXidFq4QRs=; b=Q+8Phf+KZwHDoA
	i3uLbRmVGdtgAT5bsuq14EUESywX7DzwTk4P0UBPv/fiWCl7nT5PU6h/WiLHB5wKqk3HgNypuRYcJ
	P1c+Y9YyITqQ+yWub9Y63e96sgRj9+wmMRuK1MluWPuF2e5fukrxD77JRGwFyA7MAr5LtcWeCNgmO
	2W1LLh/bXsW1tviwkR31j8SyzS9aHqQfzuiGXslsIx5gW/OTvkDZMTYGfEu8MyGLrEv0SoMUOLa+L
	sUrLsekTjBuFe9Bs53z/tBNN0VM12VeXntnFv3vcwUi+b6/1PnJ5r8fUn4QWNrLxE4enM6atuvTbD
	2UqfCW6QkHYXtteY3apA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srYsr-0000000Bjdq-45Hr;
	Fri, 20 Sep 2024 08:20:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srYoL-0000000BiQX-1VX8;
	Fri, 20 Sep 2024 08:16:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8747D5C5D24;
	Fri, 20 Sep 2024 08:16:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E3F68C4CED5;
	Fri, 20 Sep 2024 08:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726820175;
	bh=+Mcq8HQCyVmQFXDqiSObnUSgLIkezOO5EMsHAPIWPUM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=dqnpXtnAJw9jHfRlMwR11g5ByIKieefRsy79eFQAmp8uKnSkxq7qTnwPryf58bfX0
	 k1pUm4ISmGjMwlG8C3/YuqQltMgbfnTmB4zb4MRrUu8rUBrgnkNh+OfeFkh9qT84zs
	 LHZM6zJUnYGehKWHvxr0MFW1pjRZ7VXBWSqU1eeQgcXPSa+wzQ8U1V8mtHi0G2ktNr
	 FWree7PlZ5rhlIaZanb86eOXF7NC3HNOn+mMnXCc8G6ti97yLapnM60biIJ1Xzjynd
	 BDMrf4aQHkcvjeaknfA2/1EgsYoE2PoxoY4bYetCr9i98/8wjhz8/cVkBOtzmNG/20
	 X2QwnYPOB5trQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA191CF58EA;
	Fri, 20 Sep 2024 08:16:15 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Fri, 20 Sep 2024 16:16:15 +0800
Subject: [PATCH 5/6] clk: meson: g12a: Delete the spinlock from the MPLL
MIME-Version: 1.0
Message-Id: <20240920-mpll_spinlock-v1-5-5249a9a7e2b7@amlogic.com>
References: <20240920-mpll_spinlock-v1-0-5249a9a7e2b7@amlogic.com>
In-Reply-To: <20240920-mpll_spinlock-v1-0-5249a9a7e2b7@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726820173; l=1559;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=MZl3oPXVbFrreOWsDGIWEgWOlrCQLcqRIhkDzjt3Cc8=;
 b=rP/mr0KX0CYpSvUBB4/ILbi/5tZMB85fblKCbF0E0b2repGNwdGARAflq4jCqraXN5U5FXntI
 GPjaJ4vFjmqC1ljnYvzbDMZT3fLMLx8vU1fFX/HMF92Onx3NjkXe6O1
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240920_011617_659888_9DE23831 
X-CRM114-Status: UNSURE (   8.34  )
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

It is meaningless to define a spinlock in the struct meson_clk_mpll_data.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 drivers/clk/meson/g12a.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index 02dda57105b1..d3539fe9f7af 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -28,8 +28,6 @@
 
 #include <dt-bindings/clock/g12a-clkc.h>
 
-static DEFINE_SPINLOCK(meson_clk_lock);
-
 static struct clk_regmap g12a_fixed_pll_dco = {
 	.data = &(struct meson_clk_pll_data){
 		.en = {
@@ -2225,7 +2223,6 @@ static struct clk_regmap g12a_mpll0_div = {
 			.shift   = 29,
 			.width	 = 1,
 		},
-		.lock = &meson_clk_lock,
 		.init_regs = g12a_mpll0_init_regs,
 		.init_count = ARRAY_SIZE(g12a_mpll0_init_regs),
 	},
@@ -2279,7 +2276,6 @@ static struct clk_regmap g12a_mpll1_div = {
 			.shift   = 29,
 			.width	 = 1,
 		},
-		.lock = &meson_clk_lock,
 		.init_regs = g12a_mpll1_init_regs,
 		.init_count = ARRAY_SIZE(g12a_mpll1_init_regs),
 	},
@@ -2333,7 +2329,6 @@ static struct clk_regmap g12a_mpll2_div = {
 			.shift   = 29,
 			.width	 = 1,
 		},
-		.lock = &meson_clk_lock,
 		.init_regs = g12a_mpll2_init_regs,
 		.init_count = ARRAY_SIZE(g12a_mpll2_init_regs),
 	},
@@ -2387,7 +2382,6 @@ static struct clk_regmap g12a_mpll3_div = {
 			.shift   = 29,
 			.width	 = 1,
 		},
-		.lock = &meson_clk_lock,
 		.init_regs = g12a_mpll3_init_regs,
 		.init_count = ARRAY_SIZE(g12a_mpll3_init_regs),
 	},

-- 
2.42.0



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
