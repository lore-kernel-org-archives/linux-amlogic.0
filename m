Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BB31CF58E9
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Sep 2024 08:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IHN4yW7jBoTb59fEvTJ9MsYgk8rsUE4XIMdC1Q0L0F4=; b=L3Vnv3XJDH4hkJ
	KuEU7GxdlnZ4y3LVz8zps1BOFNVaqz58ZaNeF4c6POqpZIsrenC190CEVCNqgdlwL9SLHBB+K2G96
	JYUpdGe7HGL3f5mNP1DEop4rn032qxYt/OWySxfiJApl8LIgnEDOg7m9JZxYXK/lbCVa51TQ1x6Nu
	7yby+UxtDTN35fpD/7eZ5myJzGlt5c+AiY/jO/bk6tNytm8Ohdf5rMyjV4lH+DBYQqqv+ftvmQFws
	klimA9JomO5pF1hhqQkobXWVWwk0m7/vPZQhIdiogGtaLb5VwuFFk3V2fpChIPURqxD0JfAH4AsgJ
	pE5pZKiZPh9w61TG9oIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srYsr-0000000BjdL-1c7e;
	Fri, 20 Sep 2024 08:20:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srYoL-0000000BiQS-1WJb;
	Fri, 20 Sep 2024 08:16:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6A1A75C5D1D;
	Fri, 20 Sep 2024 08:16:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B5AA0C4CECE;
	Fri, 20 Sep 2024 08:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726820175;
	bh=uDJ/JfCAZYzKjfsCM7SEEMTMXp/hsTtivqJC8/88TmQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=sR3R6MguRXUzRqDWyPt9p6vqAPTNrX+We6G0fTU+DbxS2ndvmqYJZr08N9wlyBMg0
	 uglZrVlhz5TwGDqhk3DHcG6VkAuEQsCZZkwNYHMKkxKAegI6cce0u6HLi47Fq9brOH
	 r91gRteRO1b/qMlMxcaru0Psecmup3LhNlxJSMis+9d/Qm3sS8grp+8EcJwdu5AK1+
	 rPZTZdjgBLjzoaGf1jhkWIl9K72h1Ga90WO+PQKYd56GgmFJEdlFeCrIBie5DcYgCj
	 R12jpj/SVR7iB/CDKBVnrCMM/ewzB30qSaGH0GFHs+REhERxdE4cwOmOtKNNZr0Dxg
	 Zs9jI1cZexriw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7BD3CF58E9;
	Fri, 20 Sep 2024 08:16:15 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Fri, 20 Sep 2024 16:16:12 +0800
Subject: [PATCH 2/6] clk: meson: axg: Delete the spinlock from the MPLL
MIME-Version: 1.0
Message-Id: <20240920-mpll_spinlock-v1-2-5249a9a7e2b7@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726820173; l=1500;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=A66AwGhQ5KfvBGuX3+8YPfqlQmWjyAOHLmEF/9YfExU=;
 b=bC07qWlOnIwGnXk6bbO3cqsQy+tRulPBMDppiO6cLZkxQu92f1niJme+f0EGewC2yIcRM9eSX
 uoKBnEkizCdDJKW8+cYsx8Ay+NjiznMnc324fuKn0XBL08ySyMbrG3s
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240920_011617_696915_EC177861 
X-CRM114-Status: UNSURE (   8.62  )
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
 drivers/clk/meson/axg.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/clk/meson/axg.c b/drivers/clk/meson/axg.c
index 757c7a28c53d..1b08daf579b2 100644
--- a/drivers/clk/meson/axg.c
+++ b/drivers/clk/meson/axg.c
@@ -23,8 +23,6 @@
 
 #include <dt-bindings/clock/axg-clkc.h>
 
-static DEFINE_SPINLOCK(meson_clk_lock);
-
 static struct clk_regmap axg_fixed_pll_dco = {
 	.data = &(struct meson_clk_pll_data){
 		.en = {
@@ -506,7 +504,6 @@ static struct clk_regmap axg_mpll0_div = {
 			.shift   = 0,
 			.width	 = 1,
 		},
-		.lock = &meson_clk_lock,
 		.flags = CLK_MESON_MPLL_ROUND_CLOSEST,
 	},
 	.hw.init = &(struct clk_init_data){
@@ -557,7 +554,6 @@ static struct clk_regmap axg_mpll1_div = {
 			.shift   = 1,
 			.width	 = 1,
 		},
-		.lock = &meson_clk_lock,
 		.flags = CLK_MESON_MPLL_ROUND_CLOSEST,
 	},
 	.hw.init = &(struct clk_init_data){
@@ -613,7 +609,6 @@ static struct clk_regmap axg_mpll2_div = {
 			.shift   = 2,
 			.width	 = 1,
 		},
-		.lock = &meson_clk_lock,
 		.flags = CLK_MESON_MPLL_ROUND_CLOSEST,
 	},
 	.hw.init = &(struct clk_init_data){
@@ -664,7 +659,6 @@ static struct clk_regmap axg_mpll3_div = {
 			.shift   = 3,
 			.width	 = 1,
 		},
-		.lock = &meson_clk_lock,
 		.flags = CLK_MESON_MPLL_ROUND_CLOSEST,
 	},
 	.hw.init = &(struct clk_init_data){

-- 
2.42.0



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
