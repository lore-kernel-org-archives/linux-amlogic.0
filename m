Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C37B6CF58E5
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Sep 2024 08:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0TlObGzXRn9ETXUfQC2h5alxNEgUp02XeMDrEgtPFGA=; b=Nmw0pGjes/XNKH
	KTM8M/K49hhbs6C+wt/PcpqN+5/piuEZL/ZZBS8jJ1rfx4trAmQwalx8uKkk+uwK5TGRJnJcryGxE
	9TpjhH1A+vv7W2X2yZVD8Jy5uTSjo6FnVlF23d/BLZmNL90FvPxniH1RgYMBHwYsDOfwOYXUyjygf
	T2ZGx81ufwk+lunWxvv387XA+qw6gqD3Q+OQb72wIiZYuC67y5RD6FMR7yg9ORZS7+w3t8ulHceTg
	Y/QCNAdz+/L+hUl1HIWAXxPo+XBvsy2n21OBGaD85lbKF1CAZEyhy5Qim5UXQeE2r5zUNHQTTXeqi
	iZ0bmBQJt0IApqiL3zwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srYqh-0000000BjAf-3WCJ;
	Fri, 20 Sep 2024 08:18:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srYoL-0000000BiQV-1WDm;
	Fri, 20 Sep 2024 08:16:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7A3905C5D23;
	Fri, 20 Sep 2024 08:16:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D399AC4CED3;
	Fri, 20 Sep 2024 08:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726820175;
	bh=DradNtZLKYKI/pe922nGMOfjuaKzkzgQd7KVWBEvvso=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=aimu5PHdTxRSviYw9IsCYWW8ejEKajFIc+y5xuoRBSDZ9PGRi5K73TKVN3QHu2Szv
	 mMQjURBzxf901Kz4Zl2JNwmTh7yU/8SDCUQxAIEY0H8Hb/iYpBIt3Yu9c9a9ih1AQ3
	 Sdto4RJCrHUs68epLAPhIaCdYKGdxj84vrj5UrxCpEjUxUPRwLarV2Jv2sjIzliNt2
	 KIcDnmvY7f5TLgUvmlTe3kozbMIotNuDDrnP9lhJ/rAQOepWJgDCYQ5wAvmY97IsSD
	 bg7yRrz3zZdBK6ersKzt04Kq+V1c9XGPh9aiFQJbadF2eyT1XmaddU+TSUCind7iml
	 LC8vSj3PZkriw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C54D9CF58DD;
	Fri, 20 Sep 2024 08:16:15 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Fri, 20 Sep 2024 16:16:14 +0800
Subject: [PATCH 4/6] clk: meson: gxbb: Delete the spinlock from the MPLL
MIME-Version: 1.0
Message-Id: <20240920-mpll_spinlock-v1-4-5249a9a7e2b7@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726820173; l=1458;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=r/V4f8IDG1LGpMtumtpaJ0LFZXwZ5q/tzNNHh8H7+Ng=;
 b=NtifgucIpJ4Mvxn1mZSWmWBsWYiHyWJUsScY1EzaHpJAZqr8qLzhX8/r5U3bVyAU6Q7KgpmrE
 5Qi+Dq7JQwADH+ieFl7XPqEZ9egM5mtM6IaxvziEggqp0Z8Gfgv2thW
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240920_011617_688718_515A7F55 
X-CRM114-Status: UNSURE (   8.48  )
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
 drivers/clk/meson/gxbb.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index f071faad1ebb..262c318edbd5 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -19,8 +19,6 @@
 
 #include <dt-bindings/clock/gxbb-clkc.h>
 
-static DEFINE_SPINLOCK(meson_clk_lock);
-
 static const struct pll_params_table gxbb_gp0_pll_params_table[] = {
 	PLL_PARAMS(32, 1),
 	PLL_PARAMS(33, 1),
@@ -731,7 +729,6 @@ static struct clk_regmap gxbb_mpll0_div = {
 			.shift   = 16,
 			.width   = 9,
 		},
-		.lock = &meson_clk_lock,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "mpll0_div",
@@ -760,7 +757,6 @@ static struct clk_regmap gxl_mpll0_div = {
 			.shift   = 16,
 			.width   = 9,
 		},
-		.lock = &meson_clk_lock,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "mpll0_div",
@@ -812,7 +808,6 @@ static struct clk_regmap gxbb_mpll1_div = {
 			.shift   = 16,
 			.width   = 9,
 		},
-		.lock = &meson_clk_lock,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "mpll1_div",
@@ -855,7 +850,6 @@ static struct clk_regmap gxbb_mpll2_div = {
 			.shift   = 16,
 			.width   = 9,
 		},
-		.lock = &meson_clk_lock,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "mpll2_div",

-- 
2.42.0



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
