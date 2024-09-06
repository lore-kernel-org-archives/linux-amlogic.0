Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 567BBCE7AFB
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Sep 2024 10:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F7NPpDHpH53qi2wwANcEADCmtEm3lW4ZTvnbjKCcm2Y=; b=h75W+Say35kWLL
	LKky3HV7/XgnbmbA9/QVFKvty7Cm+lGWOTv1Wam1McxEh6vt/TTDsHf8NMn108kOurG+GoH8zjFPg
	fY35wKVlwBkuYkE7GyBT32R93lM9EBed9rWGxFaQWrYtz67ke4MrRUVQ4BzSsDKMT53wF3qA02CTA
	QyoKSHRPJG/Q4xZOv6ViPRG9JSQDqwf7zQKRn2RYKzbJp7yXLonMZCXCPfWDrSQh/fjbnAegkhVHF
	Y5VomYoYCR+0HxUJcBYph2G++/hyon0BqQeSTPY/XzNRPceKvwSDfQpofbHnJBLDhVD+FYgCoMcOT
	V7iWSClbp5/BwzrdaLlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smWIw-0000000BmVA-2dZO;
	Fri, 06 Sep 2024 10:35:02 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smWIt-0000000BmTW-0tlb;
	Fri, 06 Sep 2024 10:35:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 19307A44E50;
	Fri,  6 Sep 2024 10:34:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 11535C4CEC8;
	Fri,  6 Sep 2024 10:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725618898;
	bh=wNROTOGwTrtcI0H20f0EmINCmCNdwFiZLjQMJFcLHU0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Z6FSWxuRSTKe/x3nQ8Q3ngcRLUR2Bmr427Sp2jclLnw+S7ttvc0dj5WuTu6vdwyZZ
	 Vc08i8ggquZSgUuH45nHbIbuW6ywtNjzKx/kbyNWyHFbJP9vS+sTyddN8DL1h3GxZ3
	 OI8uwI4W9LwaNVTpCm8262abAHdj/iUUzBmSEKbY2I5qqKbtUQ/PGxrHtXK8YK9ELk
	 LN7CisCV1g4lZnzHnCQ5z9DBVS741Qd6hjQZU7TRwrGUHkZQHMZWg7xUTCHE6ffDoj
	 0ELoME1wn29+lHK6llxnq1x7u/5iNbfby9Fb2Aag5Ffa6WWqAlwWHIGB7n4/oLDN8i
	 S4G71bwzPMJXg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 024A6CE7AFE;
	Fri,  6 Sep 2024 10:34:58 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Fri, 06 Sep 2024 18:34:41 +0800
Subject: [PATCH v2 2/3] clk: meson: c3: pll: fix frac maximum value for
 hifi_pll
MIME-Version: 1.0
Message-Id: <20240906-fix_clk-v2-2-7a3941eb2cdf@amlogic.com>
References: <20240906-fix_clk-v2-0-7a3941eb2cdf@amlogic.com>
In-Reply-To: <20240906-fix_clk-v2-0-7a3941eb2cdf@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725618896; l=770;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=I33Vhd+oqJKtNl4x++Y8xPKvaKodnZowE3DBu//z/PA=;
 b=SADKBH0Q0M4WKvE3kt3/P9oBlUQyRQdTGwUXOIBOYeC1DM1J+oIsLeZanYu9JVZEUNfkwxyeO
 LKUG7LOZoIMBf9/qE6ZBzEJkfCtwZ+SCdrrj54fGqYCVjdoC0hTkw2F
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_033459_359125_ACEC8F0A 
X-CRM114-Status: UNSURE (   9.37  )
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

The fractional denominator of C3's hifi_pll fractional multiplier is
fixed to 100000.

Fixes: 8a9a129dc565 ("clk: meson: c3: add support for the C3 SoC PLL clock")
Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 drivers/clk/meson/c3-pll.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/meson/c3-pll.c b/drivers/clk/meson/c3-pll.c
index 32bd2ed9d304..35fda31a19e2 100644
--- a/drivers/clk/meson/c3-pll.c
+++ b/drivers/clk/meson/c3-pll.c
@@ -361,6 +361,7 @@ static struct clk_regmap hifi_pll_dco = {
 		.range = &c3_gp0_pll_mult_range,
 		.init_regs = c3_hifi_init_regs,
 		.init_count = ARRAY_SIZE(c3_hifi_init_regs),
+		.frac_max = 100000,
 	},
 	.hw.init = &(struct clk_init_data) {
 		.name = "hifi_pll_dco",

-- 
2.42.0



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
