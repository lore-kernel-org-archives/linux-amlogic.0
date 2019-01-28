Return-Path: <SRS0=PsYD=QE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B37BEC282C8
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Jan 2019 15:46:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 856EA21741
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Jan 2019 15:46:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XU26t8ag";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="CFPSIw9F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 856EA21741
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3EBHEjYzPHgd/nyTn0W1UieKa+0fQ0Zd8fQseuTKBgc=; b=XU26t8agPS+2LG
	HQ/JWuEgKERzDwCj7OMH2SVZLnwOp3EgpQ+OkESPgpCa9hZUZJeMBB80Y5R+rZVpytgCma3PTNGwB
	qdp6N9DG8K0icxJtU1Xkw/E9Fd6+BDm7y+7TG9bnJXMIxLMFLZhyyyoGd4qj5YSKGCG9NkH0/s4g7
	r1tWvGERVKJwrXhQ32qlxhtIrmNWbeQcW0MiqtVFgWZNTceINvSdrWHn4+7+XiejEgO3I/IfGjBPI
	+VT1Up73+2sGND8Iu9f1CVFT1Dkh+qy/BM/iHojTMjgCJxrtGon82C5UOu1Dnhgx8xwOLQ7G5GpjC
	C2u/Kma79b0R0paYbgSA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1go97Y-0000Jz-6k; Mon, 28 Jan 2019 15:46:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1go97V-0000If-2J
 for linux-amlogic@lists.infradead.org; Mon, 28 Jan 2019 15:46:46 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8868E20880;
 Mon, 28 Jan 2019 15:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548690404;
 bh=h/8E9Te9IzF9OE4JWBOsNsRFIzBuwefo23Zv7qScLnM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CFPSIw9F9BmVh9uppWgdl+ewlBoRRu1RZJ2gBI9tmk3xvSZbqLutUHUN/x4FGCd3b
 +g2U0y7LPF+QLfADmIrju2mL2TZQvYW7I5xcoEcwXempYWjLyaGxysQ3wQML8mM/4F
 b+5yPVUnGKfERtY25ZUOy12LzQd5xLaR2gYL1PGM=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.20 074/304] clk: meson: meson8b: fix the width of
 the cpu_scale_div clock
Date: Mon, 28 Jan 2019 10:39:51 -0500
Message-Id: <20190128154341.47195-74-sashal@kernel.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190128154341.47195-1-sashal@kernel.org>
References: <20190128154341.47195-1-sashal@kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190128_074645_121705_FABBC61E 
X-CRM114-Status: GOOD (  14.71  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Sasha Levin <sashal@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

[ Upstream commit a8662eadd1032018f31e37deda811790b2326662 ]

According to the public S805 datasheet HHI_SYS_CPU_CLK_CNTL1[29:20] is
the register for the CPU scale_div clock. This matches the code in
Amlogic's 3.10 GPL kernel sources:
N = (aml_read_reg32(P_HHI_SYS_CPU_CLK_CNTL1) >> 20) & 0x3FF;

This means that the divider register is 10 bit wide instead of 9 bits.
So far this is not a problem since all u-boot versions I have seen are
not using the cpu_scale_div clock at all (instead they are configuring
the CPU clock to run off cpu_in_sel directly).

The fixes tag points to the latest rework of the CPU clocks. However,
even before the rework it was wrong. Commit 7a29a869434e8b ("clk: meson:
Add support for Meson clock controller") defines MESON_N_WIDTH as 9 (in
drivers/clk/meson/clk-cpu.c). But since the old clk-cpu implementation
this only carries the fixes tag for the CPU clock rewordk.

Fixes: 251b6fd38bcb9c ("clk: meson: rework meson8b cpu clock")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Link: https://lkml.kernel.org/r/20180927085921.24627-3-martin.blumenstingl@googlemail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/clk/meson/meson8b.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index 328fcf50d9e8..9160a3b2e668 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -599,7 +599,7 @@ static struct clk_regmap meson8b_cpu_scale_div = {
 	.data = &(struct clk_regmap_div_data){
 		.offset =  HHI_SYS_CPU_CLK_CNTL1,
 		.shift = 20,
-		.width = 9,
+		.width = 10,
 		.table = cpu_scale_table,
 		.flags = CLK_DIVIDER_ALLOW_ZERO,
 	},
-- 
2.19.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
