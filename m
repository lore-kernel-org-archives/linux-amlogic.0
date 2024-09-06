Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B711CE7AFB
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Sep 2024 10:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cml7SeufjgzY8QWpIRLzBCgl54uSInCl13E3N8zT0hU=; b=w286bBDmed5IIC
	T8etLRcfCIoejwPAhnDa5BGsNEohtsGaIsHE5yFEdks//uOv+C/1EZygW+9A/SrXQaUdgkEZlCncv
	yGmXmUh02/x9XfLwMd9lnu9KPHUsoyqTvUmCR0puExaQQUGI2AEZhvQAcu2/2kQI2rxzC6f4NFr/4
	3fRUEPWT7R2ZZ0Bqhz21Nm3EJY5LkE0G9tz2Om/nFAyYpDC4j8pPqfe1WtQFtGYxYMmXjGelk4JhK
	S/Hs5mSHYU1j/CP8WGJ2APdGkBMsfs3kzuqLhbU66V+ntCdgnOHFcLmmlVJRj5geh0LcnJ+7eQAnz
	c8XzAMhVlbq4f905CEqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smWKu-0000000Bn0R-28rM;
	Fri, 06 Sep 2024 10:37:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smWIt-0000000BmTV-0Pw6;
	Fri, 06 Sep 2024 10:35:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CF0725C5BB7;
	Fri,  6 Sep 2024 10:34:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 00445C4CEC5;
	Fri,  6 Sep 2024 10:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725618898;
	bh=Q5Nu6ki00BNEPUpMCqJOMGrigpdjNMijiEiU0fOJHMs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=feLd2oA2h1fpNCwu7OpYQg6Jto2lrd2wkK8rIboKdt5MEPbWf8DvzVpLyDlb2+JF1
	 xS81og+9ExOQU8Hiy7c4cpSGLIrljE3hzX6juND7ZQxvH2qX+R5JHsIocdeokZ8PjG
	 5KC83NKiI617ls/Ki73IxaFbL0byLlalpjCAqdaasuJh1CjMTtGYOUWTyIyE0PJyFy
	 Yz6KFOaNMOTNAOq9rWnTahxmQRquAGsADK7WmHG8y1XcKSXfIgtV2FvkIirhJggiwY
	 r8u+g4skA+DftSPhHlfORbz78/eGGezkuaOtfioeoBvW5ekwCYwG2E4oZ168wmgiSt
	 KE6zIpKX+G5iQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E02A6CE7AFD;
	Fri,  6 Sep 2024 10:34:57 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Fri, 06 Sep 2024 18:34:40 +0800
Subject: [PATCH v2 1/3] clk: meson: Support PLL with fixed fractional
 denominators
MIME-Version: 1.0
Message-Id: <20240906-fix_clk-v2-1-7a3941eb2cdf@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725618896; l=1859;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=sWmncD36tYvYasLV2agsUM1OmEI/Pbp0y7H5RQI6gyA=;
 b=4/xHBnoby8jx3W1+dFt1CO/FshqhvP3WwGUal1rMsRXHWSq+LWZPSvMSKC2/icWrRMR/HUXnO
 PsJNpbDCIRdClPh2zEqrnCf1n7wS7rEGGn5JB6cxFetc3LLQkMSdhul
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_033459_306138_9839BBC4 
X-CRM114-Status: GOOD (  11.44  )
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

Some PLLS with fractional multipliers have fractional denominators with
fixed values, instead of the previous "(1 << pll-> frc.width)".

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 drivers/clk/meson/clk-pll.c | 8 +++++---
 drivers/clk/meson/clk-pll.h | 1 +
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
index bc570a2ff3a3..a141ab450009 100644
--- a/drivers/clk/meson/clk-pll.c
+++ b/drivers/clk/meson/clk-pll.c
@@ -57,12 +57,13 @@ static unsigned long __pll_params_to_rate(unsigned long parent_rate,
 					  struct meson_clk_pll_data *pll)
 {
 	u64 rate = (u64)parent_rate * m;
+	unsigned int frac_max = unlikely(pll->frac_max) ? pll->frac_max :
+							  (1 << pll->frac.width);
 
 	if (frac && MESON_PARM_APPLICABLE(&pll->frac)) {
 		u64 frac_rate = (u64)parent_rate * frac;
 
-		rate += DIV_ROUND_UP_ULL(frac_rate,
-					 (1 << pll->frac.width));
+		rate += DIV_ROUND_UP_ULL(frac_rate, frac_max);
 	}
 
 	return DIV_ROUND_UP_ULL(rate, n);
@@ -100,7 +101,8 @@ static unsigned int __pll_params_with_frac(unsigned long rate,
 					   unsigned int n,
 					   struct meson_clk_pll_data *pll)
 {
-	unsigned int frac_max = (1 << pll->frac.width);
+	unsigned int frac_max = unlikely(pll->frac_max) ? pll->frac_max :
+							  (1 << pll->frac.width);
 	u64 val = (u64)rate * n;
 
 	/* Bail out if we are already over the requested rate */
diff --git a/drivers/clk/meson/clk-pll.h b/drivers/clk/meson/clk-pll.h
index 7b6b87274073..949157fb7bf5 100644
--- a/drivers/clk/meson/clk-pll.h
+++ b/drivers/clk/meson/clk-pll.h
@@ -43,6 +43,7 @@ struct meson_clk_pll_data {
 	unsigned int init_count;
 	const struct pll_params_table *table;
 	const struct pll_mult_range *range;
+	unsigned int frac_max;
 	u8 flags;
 };
 

-- 
2.42.0



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
