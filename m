Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EFD1C25B7C
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 May 2024 18:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=deESH7DKAI8J2mnB2/2XMPL3S87fni1ml7OknwpHZts=; b=Kh0TUbkOmh9KBf
	i9STrLK5mdRo5CxVK1qshe1eJ3pMwj8fVSpDrE5i2/tbM9w+i5R++x7dV/mZjB8O+CxTGKcGkDeTG
	tyP7LjRpkLek28MMxk45nbNRrdOMN0ofDI7gmKJ6Ni+axwYOtvcTrRQDN71kUmoKaZcg2869ExDQd
	mNJtPQQ4GFDdse9FVK6bh35N1R6ZpqvWLBJoHSmlAYEJ6VrofcuR4sMQEX2QamvMlT6AWBSD484XF
	jbmIAYbLrQQjgk/T2aXbmrJmbpFpwqu5epWE2sQhrtN8POwvMXmFk7cV4LfHzMML68bNEz8sBbjJa
	pnKxaHSKwSrl8Xg1fIGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7Jiv-00000002bcq-3Mcl;
	Wed, 15 May 2024 18:51:34 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7Jin-00000002bWy-2Eo2;
	Wed, 15 May 2024 18:51:29 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 4383710002F;
	Wed, 15 May 2024 21:51:13 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 4383710002F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1715799073;
	bh=R/Rk7IMA2QAbG9QFamVg+DaNOx10zL198u6wx8WO48M=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=CHRrHs1l2+RBf7ujaiAfGVa7EQ248ugO5dmJzULBtWkYFxQBBVj4p8StmndROxBA2
	 OxAiQsNpsdKgiRYKR9KLLkZquYw5qQZ8VK8u44wENzqx1kFuHyWPFFLoLo5a/cRlrF
	 daNuUbaeFVos15jH4AmiyP95ZdgHt49e7D936MWJ+VPiIoaODTKm3fQ8iJP8+B5u5v
	 KtkWsmahks3WD+7HhfCJC1fczXUeqT5XwLI5Un+2aAJroTQ4vVN40/zOq2wzoO/Opu
	 DJ9rEFB+JpyYpIO6ks8jTeyfCdOczPMrJy5kLVvFuCi6OxuevrbLZyNG/H4OM8VUyl
	 3ElrEekLKu19A==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed, 15 May 2024 21:51:13 +0300 (MSK)
Received: from CAB-WSD-L081021.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 15 May 2024 21:51:12 +0300
From: Dmitry Rokosov <ddrokosov@salutedevices.com>
To: <neil.armstrong@linaro.org>, <jbrunet@baylibre.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <khilman@baylibre.com>,
	<martin.blumenstingl@googlemail.com>
CC: <jian.hu@amlogic.com>, <kernel@sberdevices.ru>, <rockosov@gmail.com>,
	<linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Dmitry Rokosov
	<ddrokosov@salutedevices.com>
Subject: [PATCH v3 1/7] clk: meson: add 'NOINIT_ENABLED' flag to eliminate init for enabled PLL
Date: Wed, 15 May 2024 21:47:24 +0300
Message-ID: <20240515185103.20256-2-ddrokosov@salutedevices.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240515185103.20256-1-ddrokosov@salutedevices.com>
References: <20240515185103.20256-1-ddrokosov@salutedevices.com>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 185260 [May 15 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: ddrokosov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 20 0.3.20 743589a8af6ec90b529f2124c2bbfc3ce1d2f20f, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;smtp.sberdevices.ru:7.1.1,5.0.1;100.64.160.123:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;salutedevices.com:7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/05/15 13:12:00 #25231738
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_115126_111952_26574A79 
X-CRM114-Status: GOOD (  18.15  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

When dealing with certain PLLs, it is necessary to avoid modifying them
if they have already been initialized by lower levels. For instance, in
the A1 SoC Family, the sys_pll is enabled as the parent for the cpuclk,
and it cannot be disabled during the initialization sequence. Therefore,
initialization phase must be skipped.

Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
---
 drivers/clk/meson/clk-pll.c | 40 ++++++++++++++++++++++---------------
 drivers/clk/meson/clk-pll.h |  1 +
 2 files changed, 25 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
index 78d17b2415af..e1132a110aab 100644
--- a/drivers/clk/meson/clk-pll.c
+++ b/drivers/clk/meson/clk-pll.c
@@ -289,11 +289,35 @@ static int meson_clk_pll_wait_lock(struct clk_hw *hw)
 	return -ETIMEDOUT;
 }
 
+static int meson_clk_pll_is_enabled(struct clk_hw *hw)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
+
+	if (MESON_PARM_APPLICABLE(&pll->rst) &&
+	    meson_parm_read(clk->map, &pll->rst))
+		return 0;
+
+	if (!meson_parm_read(clk->map, &pll->en) ||
+	    !meson_parm_read(clk->map, &pll->l))
+		return 0;
+
+	return 1;
+}
+
 static int meson_clk_pll_init(struct clk_hw *hw)
 {
 	struct clk_regmap *clk = to_clk_regmap(hw);
 	struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
 
+	/*
+	 * Keep the clock running, which was already initialized and enabled
+	 * from the bootloader stage, to avoid any glitches.
+	 */
+	if ((pll->flags & CLK_MESON_PLL_NOINIT_ENABLED) &&
+	    meson_clk_pll_is_enabled(hw))
+		return 0;
+
 	if (pll->init_count) {
 		if (MESON_PARM_APPLICABLE(&pll->rst))
 			meson_parm_write(clk->map, &pll->rst, 1);
@@ -308,22 +332,6 @@ static int meson_clk_pll_init(struct clk_hw *hw)
 	return 0;
 }
 
-static int meson_clk_pll_is_enabled(struct clk_hw *hw)
-{
-	struct clk_regmap *clk = to_clk_regmap(hw);
-	struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
-
-	if (MESON_PARM_APPLICABLE(&pll->rst) &&
-	    meson_parm_read(clk->map, &pll->rst))
-		return 0;
-
-	if (!meson_parm_read(clk->map, &pll->en) ||
-	    !meson_parm_read(clk->map, &pll->l))
-		return 0;
-
-	return 1;
-}
-
 static int meson_clk_pcie_pll_enable(struct clk_hw *hw)
 {
 	int retries = 10;
diff --git a/drivers/clk/meson/clk-pll.h b/drivers/clk/meson/clk-pll.h
index a2228c0fdce5..7b6b87274073 100644
--- a/drivers/clk/meson/clk-pll.h
+++ b/drivers/clk/meson/clk-pll.h
@@ -28,6 +28,7 @@ struct pll_mult_range {
 	}
 
 #define CLK_MESON_PLL_ROUND_CLOSEST	BIT(0)
+#define CLK_MESON_PLL_NOINIT_ENABLED	BIT(1)
 
 struct meson_clk_pll_data {
 	struct parm en;
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
