Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 186DBCF58EA
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Sep 2024 08:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f3Nv4VZcykwPpIdDp8/TKcBpKMs+lJEb3AzlnVQHsls=; b=uOnyJR8Jnw+QOC
	AN7ghBrJMmRNE5MUGkBb8cJiSkJA5aq8yd7AMGDL9ga33gFpmRV2IfgNlOAafQuFz6B9lLvZA/sCE
	ykMEMyEPIYbPybvIckxbXU2LZZxtWPHMcVctne/w1w8SSqZSunJ1zuN8vL3/R7IFq8WI+3j7DZbVB
	oLdxSZM9LNxUFcrj/op5BhJALPyftJupNf0XNF2kIImzGzm+z4uWd3ciLPYI8G6DWDZguHAlfLFEX
	QOmcVIH0eX2oBzQrF0E4PErV2NjEhJGTaKJadHQyWZWT62W2wC6l3YYWjgVLQbhPvB5X8VnpvB32F
	sPkWUeVQe9icR6x5gyMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srYu1-0000000Bk2f-1cAN;
	Fri, 20 Sep 2024 08:22:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srYoN-0000000BiSI-0FDw;
	Fri, 20 Sep 2024 08:16:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9EB215C5D1C;
	Fri, 20 Sep 2024 08:16:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F233DC4CED8;
	Fri, 20 Sep 2024 08:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726820176;
	bh=KFoyhl3w36LgJKQF6XlNX6jdkTChd706ofq02msKEhg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=NocuYjicviiHW9dkiMF1PZAPN+bOKTEV8Q/8GI/dVG4rWnrBzWMf3t/lahZSH2iy7
	 VS/32v06yE9EdLx9H+qpjXgD3j98icutMRSmYJxWIk85Pt8iQAthT+CWUIjI7/oeBQ
	 HmOHaCYWHWq5g9tESqP6uXE178bzI2/SQ64wVwrp3DZpR8aSO00L/oe7MZLmBOnetu
	 70buGgFLqBcdp4uaKx936hjQ4eCFNBEh/TGCfpaz2K7mPh9sl+eTtJ4DlYazqihHCb
	 byhDbV1jXYdfjjNeDFKzW719lTG0gIK5EwsC7C5QAl2xRROoWpeZDr1VbXUFc0ja6N
	 CzHJQS+MNsn1g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E90D9CF58E5;
	Fri, 20 Sep 2024 08:16:15 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Fri, 20 Sep 2024 16:16:16 +0800
Subject: [PATCH 6/6] clk: meson: s4: Delete the spinlock from the MPLL
MIME-Version: 1.0
Message-Id: <20240920-mpll_spinlock-v1-6-5249a9a7e2b7@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726820174; l=1660;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=kO2S9WluZnKsZu8WbD08FCxRfFkq+Y8JsWEudLTTuJE=;
 b=XoCk+GChXy9oiDtXd6sz8adYDgdcRqK51hXoqH8GCDNNc/qoUkYn7Gv9MKWO5M+QWeYQuOBUM
 L6QxNxGTq4kCsmICSgdLYk2oDQPdZiwAsiVXPVaK4uYGyhXIAE4IDFG
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240920_011619_459855_EBAA7DA3 
X-CRM114-Status: UNSURE (   8.50  )
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
 drivers/clk/meson/s4-pll.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/clk/meson/s4-pll.c b/drivers/clk/meson/s4-pll.c
index 9697f6577e06..d8e621e79428 100644
--- a/drivers/clk/meson/s4-pll.c
+++ b/drivers/clk/meson/s4-pll.c
@@ -17,8 +17,6 @@
 #include "meson-clkc-utils.h"
 #include <dt-bindings/clock/amlogic,s4-pll-clkc.h>
 
-static DEFINE_SPINLOCK(meson_clk_lock);
-
 /*
  * These clock are a fixed value (fixed_pll is 2GHz) that is initialized by ROMcode.
  * The chip was changed fixed pll for security reasons. Fixed PLL registers are not writable
@@ -547,7 +545,6 @@ static struct clk_regmap s4_mpll0_div = {
 			.shift   = 29,
 			.width	 = 1,
 		},
-		.lock = &meson_clk_lock,
 		.init_regs = s4_mpll0_init_regs,
 		.init_count = ARRAY_SIZE(s4_mpll0_init_regs),
 	},
@@ -601,7 +598,6 @@ static struct clk_regmap s4_mpll1_div = {
 			.shift   = 29,
 			.width	 = 1,
 		},
-		.lock = &meson_clk_lock,
 		.init_regs = s4_mpll1_init_regs,
 		.init_count = ARRAY_SIZE(s4_mpll1_init_regs),
 	},
@@ -655,7 +651,6 @@ static struct clk_regmap s4_mpll2_div = {
 			.shift   = 29,
 			.width	 = 1,
 		},
-		.lock = &meson_clk_lock,
 		.init_regs = s4_mpll2_init_regs,
 		.init_count = ARRAY_SIZE(s4_mpll2_init_regs),
 	},
@@ -709,7 +704,6 @@ static struct clk_regmap s4_mpll3_div = {
 			.shift   = 29,
 			.width	 = 1,
 		},
-		.lock = &meson_clk_lock,
 		.init_regs = s4_mpll3_init_regs,
 		.init_count = ARRAY_SIZE(s4_mpll3_init_regs),
 	},

-- 
2.42.0



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
