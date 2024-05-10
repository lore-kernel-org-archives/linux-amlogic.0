Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7674C25B10
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 May 2024 09:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CatIeE/Ogp6GxPdpvqy0Ku7TVCFZndvVSww7yCSOSXE=; b=NCQSSxNzlOyi4e
	DX5W23NgJ7PH6/dmyr0g4YGcSnAITqWbJhllbD0tfxulhtZto7X6aTmPvoZiK0cuUiCUq+vA5o7NK
	H0IQ5BQgZwTjUZTdPK2rJ6g9yjwPoXB9OK80PARX7DOAvLUgIwz62lluVfaXhrR0ZKxTlpIvoACTU
	HI9HRN1W567tpmpntBrx1DDLcOMvvWwDc72Q8feaOjnlg9di+0BSuWMvZEdJTmRCMWzFdEj90+3PO
	Mz4uwklFpidBh+xn8ui3064Js/oIjmDhMQCLrOwnp6OnCctBdR2sdE3NqKmMjUZOKbo6uVFbK/Ksk
	6cPi2MTBmUZHVWI4fsvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5MGx-00000004bg2-2pAi;
	Fri, 10 May 2024 09:10:35 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5MGK-00000004b2Z-30Ax;
	Fri, 10 May 2024 09:10:01 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id B1239120003;
	Fri, 10 May 2024 12:09:42 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru B1239120003
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1715332182;
	bh=kenYwxHSLcsF+T4CqCh8V0qfGGxx4+VErvJtu5XBCjo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=bUKOe5kHnlYBn5qL6M/OelehJqJLVZ4tQgLy8jYLcrLHRiczSFJE4EJxL+BSfTpNR
	 2DFuw8tHlm8t+ojO7nvIEf4IaqirBnJqanzh6/nT29qlvLlHBRaUtn1jpK/ErIkFtp
	 njLDnV3Y2/TD0qOc67BZ7Bs9Cn5zq7yoYkY9kPjQwkfXRRHSgbshxkwNKX2kytqqPX
	 5lgDwqOz45bmSMqcKSebO0ua7ZKdagIIz9F5kMMNK0QnQHYL6vQfX2fj9g6cvgqf9i
	 AC+cDyEVmpCqqnSEimlasQaNBDzhLh8CHBYNbU13pj3df+IihijWKYN7hKaWflyYwT
	 PMsLEiUHcEuxw==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Fri, 10 May 2024 12:09:42 +0300 (MSK)
Received: from CAB-WSD-L081021.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 10 May 2024 12:09:42 +0300
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
Subject: [PATCH v2 1/7] clk: meson: introduce 'INIT_ONCE' flag to eliminate init for enabled PLL
Date: Fri, 10 May 2024 12:08:53 +0300
Message-ID: <20240510090933.19464-2-ddrokosov@salutedevices.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240510090933.19464-1-ddrokosov@salutedevices.com>
References: <20240510090933.19464-1-ddrokosov@salutedevices.com>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 185158 [May 10 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: ddrokosov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 19 0.3.19 07c7fa124d1a1dc9662cdc5aace418c06ae99d2b, {Tracking_from_domain_doesnt_match_to}, 100.64.160.123:7.1.2;salutedevices.com:7.1.1;smtp.sberdevices.ru:5.0.1,7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/05/10 07:36:00 #25144647
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_020957_238172_F36DC2DE 
X-CRM114-Status: GOOD (  17.66  )
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
 drivers/clk/meson/clk-pll.c | 37 +++++++++++++++++++++----------------
 drivers/clk/meson/clk-pll.h |  1 +
 2 files changed, 22 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
index 78d17b2415af..47b22a6be2e4 100644
--- a/drivers/clk/meson/clk-pll.c
+++ b/drivers/clk/meson/clk-pll.c
@@ -289,11 +289,32 @@ static int meson_clk_pll_wait_lock(struct clk_hw *hw)
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
 
+	/* Do not init already enabled PLL which marked with 'init_once' */
+	if ((pll->flags & CLK_MESON_PLL_INIT_ONCE) &&
+	    meson_clk_pll_is_enabled(hw))
+		return 0;
+
 	if (pll->init_count) {
 		if (MESON_PARM_APPLICABLE(&pll->rst))
 			meson_parm_write(clk->map, &pll->rst, 1);
@@ -308,22 +329,6 @@ static int meson_clk_pll_init(struct clk_hw *hw)
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
index a2228c0fdce5..23195ea4eae1 100644
--- a/drivers/clk/meson/clk-pll.h
+++ b/drivers/clk/meson/clk-pll.h
@@ -28,6 +28,7 @@ struct pll_mult_range {
 	}
 
 #define CLK_MESON_PLL_ROUND_CLOSEST	BIT(0)
+#define CLK_MESON_PLL_INIT_ONCE		BIT(1)
 
 struct meson_clk_pll_data {
 	struct parm en;
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
