Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26DC4ECE57A
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Sep 2024 10:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t3WW04uv1Q9R29+jwBA7A4DV6eCPtYGN5wS8nma8A3Q=; b=VrIypUycj5Klfm
	VSdMLLLZVF1M0wvKoILAZQvrJyurzsarqx4LT1GZ0m/slo27bY3GaTOCIeWJ04HS1rI+oG70rbcoO
	doowHhUB3z3C1aM7N+Mw5Y+0/LgY+fsHHG1wYPjLcpht9R7/Pz8ASGpYSPWOO6gF7QilXSXT+30IH
	2+kdWhRvxSTCaG/YwIBxw9iA5Mt/M+WMOU/YJ79SL6SP6jZCYGiNb2vp/aKiiIALjZ21J2+84t3AS
	cd387yHapAvMiQjHEbnjMg+NIrsTUFMBqDQM4dgwo4jdYffv0eizW8QpHL0JIy4+GgLiZImeoe3C8
	bzMiUlWKpk6j6uokTqnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snbKj-00000001RuJ-2hYr;
	Mon, 09 Sep 2024 10:09:21 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snbKg-00000001Rt6-3hVs;
	Mon, 09 Sep 2024 10:09:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 45D44A4325D;
	Mon,  9 Sep 2024 10:09:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 61337C4CEC8;
	Mon,  9 Sep 2024 10:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725876557;
	bh=RkUWT/0arfso8PoZuHXKVk1Cw40RK964zYOKCHpr3nE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=EHnOH4k4ZdZj7SxH1Niavu5KXKFCh02h94MH3UcaYiXKHUSywi84ReEY4czfIYVQh
	 47f0B75OGH6xPtcZg6LZUAXE6XCpDPxhk9r2VuCsLLrDYhkz3zo5ifi7v5/2el0mjr
	 SLA8fzJPRQPc+c89YHZMLI+3TF5MyxkHARsIW5YeHw3aTef8j1X5nxeBhct5cwZFUZ
	 /iS1HgcxR4n0+GDYvx1evlvud5OnTjghoJC1iHQ+SiLNZ0swsTIOZOOglk83JefK2T
	 WiMkwoUiinSFlF4DHZybJevCq/PwZj9yng7rzp5QS9AVmyaFB4jHWTjfabAZklkdUB
	 CZNCIcaKZzVQA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EB12ECE579;
	Mon,  9 Sep 2024 10:09:17 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Mon, 09 Sep 2024 18:08:56 +0800
Subject: [PATCH v3 1/3] clk: meson: Support PLL with fixed fractional
 denominators
MIME-Version: 1.0
Message-Id: <20240909-fix_clk-v3-1-a6d8f6333c04@amlogic.com>
References: <20240909-fix_clk-v3-0-a6d8f6333c04@amlogic.com>
In-Reply-To: <20240909-fix_clk-v3-0-a6d8f6333c04@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725876555; l=1833;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=tm+eqZ6z2/fu+O9mUT6fjnN7chLjmdHoODAhOfI/R44=;
 b=U11cPwwTOmhBwh26n/Uf/6HYS90n2Yjr6nBrNusbctnjBVmkncO4x1YgCC6W4bb8CpHU6PAXJ
 FDIVkNCLdYHAyfiGCt9F3/9ZnyZv7DL6hWUl2tTSf0Oti+fqY3IWf+I
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_030919_079369_400AA3F5 
X-CRM114-Status: GOOD (  11.59  )
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
index bc570a2ff3a3..89f0f04a16ab 100644
--- a/drivers/clk/meson/clk-pll.c
+++ b/drivers/clk/meson/clk-pll.c
@@ -57,12 +57,13 @@ static unsigned long __pll_params_to_rate(unsigned long parent_rate,
 					  struct meson_clk_pll_data *pll)
 {
 	u64 rate = (u64)parent_rate * m;
+	unsigned int frac_max = pll->frac_max ? pll->frac_max :
+						(1 << pll->frac.width);
 
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
+	unsigned int frac_max = pll->frac_max ? pll->frac_max :
+						(1 << pll->frac.width);
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
