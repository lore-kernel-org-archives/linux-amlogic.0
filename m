Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0734FCD5BA4
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Sep 2024 05:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6hVqtIXQnwSU1PnZz1KW+OiulLVgWg3VoUtOELpS0sU=; b=hhJFnxB/VxZQwM
	P4DXrV4BW4MVznXTcLflWwWi192v/djSqHDYnSC8S2ITOh5WGU421eq67PIISlR/R8Smd/xIUz0b3
	AVjgKIWS/+4No0vYQVD/d0HMYDMT03kud3fRomNeY9Ix0i8sQkfgPgVHcCbGhBLLdWWRZVeaoHf4i
	z+5KxNmWIwCQuocVhbqKLaeCwqBHrS+DNnH0kVNNShfc4nebP+GKEf/5/ovpF4Y7GNLvFDr3eFQcy
	VK4dBIcEhwKWGntBKUhmAdVFPM/0XE7aOlIDLjp1c5amSuo4zZtIhmlG3HHCvMJf4AGiWmRs3kkV6
	iNQnbptSaOJL/DOO9lkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smRud-0000000AmLS-44Nq;
	Fri, 06 Sep 2024 05:53:39 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smRte-0000000Am1H-1ZUV;
	Fri, 06 Sep 2024 05:52:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CBD37A44679;
	Fri,  6 Sep 2024 05:52:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C1FAFC4CEC8;
	Fri,  6 Sep 2024 05:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725601956;
	bh=I9JprPGgr2Q1JvjMeHkxOvLVu+H/5UNCtWt/M48Ns14=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Li+xwak6lwSBbAuxqsHiQ70CrZ4YDmU8reJOfqLZE2sDhVY22EzngQQ76gWGEYPwy
	 FR1cP+SB+1+HZWggmz9cIG3X78F4ZPjTIayCiJBPhtNVpw71m/5Ub2/zdw+hucl412
	 K3v12+KuOYxjdhDPYTXuFr017hkMQUSIqUlR5L4xQKMGV/yxaGisM2QKyQH1LLpQDy
	 nlIcPvGmrQcDgKHp+rNJq+X9ZPEPXqqbyQmoCQR45RbKxSLmJxqEX9x2e5r7iHukpX
	 N9l5t7DGkSlDZy/w1GEGVp7rBQWvm33/Uz7Qri9f7zk5cyNTsVsRX/tf3qSWw6c2X0
	 X8FCl7YgsFrTg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFD64CD5BDD;
	Fri,  6 Sep 2024 05:52:36 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Fri, 06 Sep 2024 13:52:33 +0800
Subject: [PATCH 1/4] clk: meson: Support PLL with fixed fractional
 denominators
MIME-Version: 1.0
Message-Id: <20240906-fix_clk-v1-1-2977ef0d72e7@amlogic.com>
References: <20240906-fix_clk-v1-0-2977ef0d72e7@amlogic.com>
In-Reply-To: <20240906-fix_clk-v1-0-2977ef0d72e7@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725601955; l=2567;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=SoIKZiELa8FSJI7fmIZsiz6qIoB6+tJ8z3x3hDJR/OM=;
 b=HYGdsd4TDjl5DW9tu+regMVhcuVnmoqEWuyRRdEK8IXmAPDX+KAM5EnWN+mXPd6AJqh1qj1XV
 DlfZzdykYAXDTgKqia5Qg17K3yaT8fizM93sTUuRayorsD/5VsvJQC+
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_225238_585250_4A6D3BE0 
X-CRM114-Status: GOOD (  13.81  )
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

Some PLLs with fractional multipliers have fractional denominators that
are fixed to "100000" instead of the previous "(1 << pll->frac.width)".

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 drivers/clk/meson/clk-pll.c | 22 +++++++++++++++++++---
 drivers/clk/meson/clk-pll.h |  1 +
 2 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
index bc570a2ff3a3..f0009c174564 100644
--- a/drivers/clk/meson/clk-pll.c
+++ b/drivers/clk/meson/clk-pll.c
@@ -36,6 +36,12 @@
 #include "clk-regmap.h"
 #include "clk-pll.h"
 
+/*
+ * Some PLLs with fractional multipliers have fractional denominators that
+ * are fixed to "100000" instead of the previous "(1 << pll->frac.width)".
+ */
+#define FIXED_FRAC_MAX			100000
+
 static inline struct meson_clk_pll_data *
 meson_clk_pll_data(struct clk_regmap *clk)
 {
@@ -57,12 +63,17 @@ static unsigned long __pll_params_to_rate(unsigned long parent_rate,
 					  struct meson_clk_pll_data *pll)
 {
 	u64 rate = (u64)parent_rate * m;
+	unsigned int frac_max;
 
 	if (frac && MESON_PARM_APPLICABLE(&pll->frac)) {
 		u64 frac_rate = (u64)parent_rate * frac;
 
-		rate += DIV_ROUND_UP_ULL(frac_rate,
-					 (1 << pll->frac.width));
+		if (pll->flags & CLK_MESON_PLL_FIXED_FRAC_MAX)
+			frac_max = FIXED_FRAC_MAX;
+		else
+			frac_max = (1 << pll->frac.width);
+
+		rate += DIV_ROUND_UP_ULL(frac_rate, frac_max);
 	}
 
 	return DIV_ROUND_UP_ULL(rate, n);
@@ -100,13 +111,18 @@ static unsigned int __pll_params_with_frac(unsigned long rate,
 					   unsigned int n,
 					   struct meson_clk_pll_data *pll)
 {
-	unsigned int frac_max = (1 << pll->frac.width);
+	unsigned int frac_max;
 	u64 val = (u64)rate * n;
 
 	/* Bail out if we are already over the requested rate */
 	if (rate < parent_rate * m / n)
 		return 0;
 
+	if (pll->flags & CLK_MESON_PLL_FIXED_FRAC_MAX)
+		frac_max = FIXED_FRAC_MAX;
+	else
+		frac_max = (1 << pll->frac.width);
+
 	if (pll->flags & CLK_MESON_PLL_ROUND_CLOSEST)
 		val = DIV_ROUND_CLOSEST_ULL(val * frac_max, parent_rate);
 	else
diff --git a/drivers/clk/meson/clk-pll.h b/drivers/clk/meson/clk-pll.h
index 7b6b87274073..e996d3727eb1 100644
--- a/drivers/clk/meson/clk-pll.h
+++ b/drivers/clk/meson/clk-pll.h
@@ -29,6 +29,7 @@ struct pll_mult_range {
 
 #define CLK_MESON_PLL_ROUND_CLOSEST	BIT(0)
 #define CLK_MESON_PLL_NOINIT_ENABLED	BIT(1)
+#define CLK_MESON_PLL_FIXED_FRAC_MAX	BIT(2)
 
 struct meson_clk_pll_data {
 	struct parm en;

-- 
2.42.0



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
