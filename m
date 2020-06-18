Return-Path: <SRS0=F2gE=77=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 838A5C433E0
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Jun 2020 01:44:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5173C2222D
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Jun 2020 01:44:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lZE4KoR7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="m54HLpST"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5173C2222D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ABhT4q2g58Km14nAEccueBBHF/ogdfU2NtBCDrRgaYM=; b=lZE4KoR7nDrSMe
	QYQh2abkOOlPuJzJYgwtEAdlLXPG6XRJs+1zHbL/jAHyLlpiWhitqPwzItadxuoGfswlSvOROMRyh
	hVhVgM8LfA0WsQTqKlGUJkAHEs2Vi1k94SqFdB1K+UlWnLfqhNbFH6/pgYr6K1v5FEMXWFYOKlQ9M
	OqBa0j+nQKGUHmFXrHTkoSsuLABHA8HOevigww3fcvbvTF9vboeXKUz7sga8vdaoT0K8NLYBZ0IMA
	yBLrkNq1uY4N6AEwQxkE0boF+0P2vwsy2T7J7t78FjBxB92z1Eb0b5frEScT3wHyIWsnAT+UHIxag
	5B0EXvDr1BHXa43Hlg+w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jljav-00087k-Hb; Thu, 18 Jun 2020 01:43:57 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jljCk-0000ql-CT; Thu, 18 Jun 2020 01:19:00 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 88F0C21D80;
 Thu, 18 Jun 2020 01:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592443137;
 bh=XxGlDRotiiRAzgFAJ+3G9S76XZdUjrH/KH36vDL+ZJM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=m54HLpST6SZLwnoXSpzNow/5N/bJjuFZpHrnIDSQr18F/TitbFVd0nIcmgOiAcgVu
 xmXFxvRkirMZHgZxTUxFpduxks39HgM2fGfpxMBEsjgxM/8tDPfOqvmIL4X2UZnAd+
 9kLJGIstDiRDpMhWRrg99F6o2SFB1E627NDLtSUY=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 108/266] clk: meson: meson8b: Fix the polarity of
 the RESET_N lines
Date: Wed, 17 Jun 2020 21:13:53 -0400
Message-Id: <20200618011631.604574-108-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618011631.604574-1-sashal@kernel.org>
References: <20200618011631.604574-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200617_181858_480595_626366C8 
X-CRM114-Status: GOOD (  10.54  )
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
Cc: Sasha Levin <sashal@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

[ Upstream commit 0d3051c790ed2ef6bd91b92b07220313f06b95b3 ]

CLKC_RESET_VID_DIVIDER_CNTL_RESET_N_POST and
CLKC_RESET_VID_DIVIDER_CNTL_RESET_N_PRE are active low. This means:
- asserting them requires setting the register value to 0
- de-asserting them requires setting the register value to 1

Set the register value accordingly for these two reset lines by setting
the inverted the register value compared to all other reset lines.

Fixes: 189621726bc2f6 ("clk: meson: meson8b: register the built-in reset controller")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Link: https://lore.kernel.org/r/20200417184127.1319871-3-martin.blumenstingl@googlemail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/clk/meson/meson8b.c | 79 ++++++++++++++++++++++++++-----------
 1 file changed, 56 insertions(+), 23 deletions(-)

diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index ab0b56daec54..52337a100a90 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -3491,54 +3491,87 @@ static struct clk_regmap *const meson8b_clk_regmaps[] = {
 static const struct meson8b_clk_reset_line {
 	u32 reg;
 	u8 bit_idx;
+	bool active_low;
 } meson8b_clk_reset_bits[] = {
 	[CLKC_RESET_L2_CACHE_SOFT_RESET] = {
-		.reg = HHI_SYS_CPU_CLK_CNTL0, .bit_idx = 30
+		.reg = HHI_SYS_CPU_CLK_CNTL0,
+		.bit_idx = 30,
+		.active_low = false,
 	},
 	[CLKC_RESET_AXI_64_TO_128_BRIDGE_A5_SOFT_RESET] = {
-		.reg = HHI_SYS_CPU_CLK_CNTL0, .bit_idx = 29
+		.reg = HHI_SYS_CPU_CLK_CNTL0,
+		.bit_idx = 29,
+		.active_low = false,
 	},
 	[CLKC_RESET_SCU_SOFT_RESET] = {
-		.reg = HHI_SYS_CPU_CLK_CNTL0, .bit_idx = 28
+		.reg = HHI_SYS_CPU_CLK_CNTL0,
+		.bit_idx = 28,
+		.active_low = false,
 	},
 	[CLKC_RESET_CPU3_SOFT_RESET] = {
-		.reg = HHI_SYS_CPU_CLK_CNTL0, .bit_idx = 27
+		.reg = HHI_SYS_CPU_CLK_CNTL0,
+		.bit_idx = 27,
+		.active_low = false,
 	},
 	[CLKC_RESET_CPU2_SOFT_RESET] = {
-		.reg = HHI_SYS_CPU_CLK_CNTL0, .bit_idx = 26
+		.reg = HHI_SYS_CPU_CLK_CNTL0,
+		.bit_idx = 26,
+		.active_low = false,
 	},
 	[CLKC_RESET_CPU1_SOFT_RESET] = {
-		.reg = HHI_SYS_CPU_CLK_CNTL0, .bit_idx = 25
+		.reg = HHI_SYS_CPU_CLK_CNTL0,
+		.bit_idx = 25,
+		.active_low = false,
 	},
 	[CLKC_RESET_CPU0_SOFT_RESET] = {
-		.reg = HHI_SYS_CPU_CLK_CNTL0, .bit_idx = 24
+		.reg = HHI_SYS_CPU_CLK_CNTL0,
+		.bit_idx = 24,
+		.active_low = false,
 	},
 	[CLKC_RESET_A5_GLOBAL_RESET] = {
-		.reg = HHI_SYS_CPU_CLK_CNTL0, .bit_idx = 18
+		.reg = HHI_SYS_CPU_CLK_CNTL0,
+		.bit_idx = 18,
+		.active_low = false,
 	},
 	[CLKC_RESET_A5_AXI_SOFT_RESET] = {
-		.reg = HHI_SYS_CPU_CLK_CNTL0, .bit_idx = 17
+		.reg = HHI_SYS_CPU_CLK_CNTL0,
+		.bit_idx = 17,
+		.active_low = false,
 	},
 	[CLKC_RESET_A5_ABP_SOFT_RESET] = {
-		.reg = HHI_SYS_CPU_CLK_CNTL0, .bit_idx = 16
+		.reg = HHI_SYS_CPU_CLK_CNTL0,
+		.bit_idx = 16,
+		.active_low = false,
 	},
 	[CLKC_RESET_AXI_64_TO_128_BRIDGE_MMC_SOFT_RESET] = {
-		.reg = HHI_SYS_CPU_CLK_CNTL1, .bit_idx = 30
+		.reg = HHI_SYS_CPU_CLK_CNTL1,
+		.bit_idx = 30,
+		.active_low = false,
 	},
 	[CLKC_RESET_VID_CLK_CNTL_SOFT_RESET] = {
-		.reg = HHI_VID_CLK_CNTL, .bit_idx = 15
+		.reg = HHI_VID_CLK_CNTL,
+		.bit_idx = 15,
+		.active_low = false,
 	},
 	[CLKC_RESET_VID_DIVIDER_CNTL_SOFT_RESET_POST] = {
-		.reg = HHI_VID_DIVIDER_CNTL, .bit_idx = 7
+		.reg = HHI_VID_DIVIDER_CNTL,
+		.bit_idx = 7,
+		.active_low = false,
 	},
 	[CLKC_RESET_VID_DIVIDER_CNTL_SOFT_RESET_PRE] = {
-		.reg = HHI_VID_DIVIDER_CNTL, .bit_idx = 3
+		.reg = HHI_VID_DIVIDER_CNTL,
+		.bit_idx = 3,
+		.active_low = false,
 	},
 	[CLKC_RESET_VID_DIVIDER_CNTL_RESET_N_POST] = {
-		.reg = HHI_VID_DIVIDER_CNTL, .bit_idx = 1
+		.reg = HHI_VID_DIVIDER_CNTL,
+		.bit_idx = 1,
+		.active_low = true,
 	},
 	[CLKC_RESET_VID_DIVIDER_CNTL_RESET_N_PRE] = {
-		.reg = HHI_VID_DIVIDER_CNTL, .bit_idx = 0
+		.reg = HHI_VID_DIVIDER_CNTL,
+		.bit_idx = 0,
+		.active_low = true,
 	},
 };
 
@@ -3547,22 +3580,22 @@ static int meson8b_clk_reset_update(struct reset_controller_dev *rcdev,
 {
 	struct meson8b_clk_reset *meson8b_clk_reset =
 		container_of(rcdev, struct meson8b_clk_reset, reset);
-	unsigned long flags;
 	const struct meson8b_clk_reset_line *reset;
+	unsigned int value = 0;
+	unsigned long flags;
 
 	if (id >= ARRAY_SIZE(meson8b_clk_reset_bits))
 		return -EINVAL;
 
 	reset = &meson8b_clk_reset_bits[id];
 
+	if (assert != reset->active_low)
+		value = BIT(reset->bit_idx);
+
 	spin_lock_irqsave(&meson_clk_lock, flags);
 
-	if (assert)
-		regmap_update_bits(meson8b_clk_reset->regmap, reset->reg,
-				   BIT(reset->bit_idx), BIT(reset->bit_idx));
-	else
-		regmap_update_bits(meson8b_clk_reset->regmap, reset->reg,
-				   BIT(reset->bit_idx), 0);
+	regmap_update_bits(meson8b_clk_reset->regmap, reset->reg,
+			   BIT(reset->bit_idx), value);
 
 	spin_unlock_irqrestore(&meson_clk_lock, flags);
 
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
