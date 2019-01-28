Return-Path: <SRS0=PsYD=QE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 856DBC282CD
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Jan 2019 16:02:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 420D121852
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Jan 2019 16:02:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RQpDAYvy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="K3kEXsfu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 420D121852
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ycjkyXdh231TS6WzR7RYmUyYpzfDwYTZqBwCB/GU7eY=; b=RQpDAYvy6CroH8
	U3K0QOaVgA5Y28YmJ7mVOEEiI4f4zhXM0vlZOdA9BZpUkn4ml0r6EKXR71lQ0gQqpTZ5MNhkxgp8X
	cX65ApUP6RVYwAn/kLOUGrcSqbdzfcnfqCBWIw21848/M2cHbGaPuFZk3aNeV4vyCrI3zwnqax00j
	IkviZ/aok2lkTpmGaQpnUm1YEThEEvjHiKv8xBQuhguYL4aDCyLg4HMXAuU0CFoWsbh/UECnF5Mke
	CPz0LyIewsNkTZRJBC6KS3C1egHLdJD3bhGWcdpmXNf9eBEZ0f5ZWSQY7WAPDmE8t4U9SXbApGXk6
	AWdvNGpqspUYcIFraLDw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1go9Ml-0002iL-Sk; Mon, 28 Jan 2019 16:02:31 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1go9MZ-0002WR-Jp
 for linux-amlogic@lists.infradead.org; Mon, 28 Jan 2019 16:02:29 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9D65F21852;
 Mon, 28 Jan 2019 16:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548691339;
 bh=uD398yIJy610mZG5k/2nL9jaQr1Qnxvq+5OhApJxnCs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=K3kEXsfu5f2oE28hMtm8AkRbi4xHZxMLprsZYIEsKlVssloF79cs9KxDCGQSdV6OX
 VmMITq3R6/DOFV+14LoxMsmMd3tY6GxoARWhSsbU06NyRnRKI0GVL68Na2oqQ+Y/HO
 SBYnx+IxQ5O/2AO4BV7TtfT1OouRz8wMnZ1d1RIg=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 060/258] clk: meson: meson8b: do not use cpu_div3
 for cpu_scale_out_sel
Date: Mon, 28 Jan 2019 10:56:06 -0500
Message-Id: <20190128155924.51521-60-sashal@kernel.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190128155924.51521-1-sashal@kernel.org>
References: <20190128155924.51521-1-sashal@kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190128_080220_282965_E7C3DFEE 
X-CRM114-Status: GOOD (  11.71  )
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

[ Upstream commit a5ac1ead32c9aac285f6436e09b4f6111996e9b8 ]

The cpu_div3 clock (cpu_in divided by 3) generates a signal with a duty
cycle of 33%. The CPU clock however requires a clock signal with a duty
cycle of 50% to run stable.
cpu_div3 was observed to be problematic when cycling through all
available CPU frequencies (with additional patches on top of this one)
while running "stress --cpu 4" in the background. This caused sporadic
hangs where the whole system would fully lock up.

Amlogic's 3.10 kernel code also does not use the cpu_div3 clock either
when changing the CPU clock.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Link: https://lkml.kernel.org/r/20181115224048.13511-3-martin.blumenstingl@googlemail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/clk/meson/meson8b.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index 50060e895e7a..580a86d120e8 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -596,20 +596,27 @@ static struct clk_regmap meson8b_cpu_scale_div = {
 	},
 };
 
+static u32 mux_table_cpu_scale_out_sel[] = { 0, 1, 3 };
 static struct clk_regmap meson8b_cpu_scale_out_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = HHI_SYS_CPU_CLK_CNTL0,
 		.mask = 0x3,
 		.shift = 2,
+		.table = mux_table_cpu_scale_out_sel,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "cpu_scale_out_sel",
 		.ops = &clk_regmap_mux_ro_ops,
+		/*
+		 * NOTE: We are skipping the parent with value 0x2 (which is
+		 * "cpu_div3") because it results in a duty cycle of 33% which
+		 * makes the system unstable and can result in a lockup of the
+		 * whole system.
+		 */
 		.parent_names = (const char *[]) { "cpu_in_sel",
 						   "cpu_div2",
-						   "cpu_div3",
 						   "cpu_scale_div" },
-		.num_parents = 4,
+		.num_parents = 3,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
-- 
2.19.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
