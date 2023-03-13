Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 979CFC74A4B
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Mar 2023 20:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xxRv3+yScP9T4KeJ327yy02wwlvGXLf1AiHcKCJsPHg=; b=CcV9ZrVS2tP0vP
	/VWI0CtmNWKWKTVD/61CpIl+aSvc4SFpI+V5uy+nBuHAkjahWfqVRErVuyvx5+930CObTtd6omKss
	ytz8rdqpCASSkw1kz544QFjNvC/6h0DFkj0C8n+vqFbuelrihU2ydVZi9sUDtYJmOopoI/AqyV2Xe
	uoIgL7eUUzveUS66m3Zz30nCGNlReerm1uegfd63JLMXu56lWkIIGiS7XduqtxbMdGNu7xFmdotAU
	Acp30llQLImglz5d7JUgFyRmHzPXSWXJiH9qtRSj4tSN2hEC8iTCRxlumRd+p/oXKz/F+H6eaiEFy
	qLhxBdDcqbA3bQP4HSww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pboXp-007cBv-3Q; Mon, 13 Mar 2023 20:13:21 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pboXk-007c9B-9Z; Mon, 13 Mar 2023 20:13:18 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 196FE5FD14;
	Mon, 13 Mar 2023 23:13:12 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1678738392;
	bh=qcIGKcZIb5cUrNAdB7ZZAIiITgzMPRGFSQuzjV413Y4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=aDFbwqf4suEffITUw430m/mQvA2yrKtAOcnjLqfIOgG4dgR4u1WIT14QGp6n0Tqa2
	 3HIcw4VMFOxXUpGeJKv7knpm5JNRXR1uQNUmAf0wHtMu7jdKhDA7VSkNtHWK/RmAgK
	 sNjemi/8ANEm9vPFgYb6E1oorrPdxCFTEhBRjYXEtDNxOLVobDudcHOgJTpIwkLZtR
	 JubmIYBH2BONfdId1JIc/Zz9vxw0NHcXKgz3U95u2w4mm0hiirQwvHYipmZpW8ZEpe
	 V7rmppVzA20MGBdC3wJK0FWlTiIeZliC3SG+rtzbnspkugR91oeoQDE8b7Db9PQWVL
	 24mMf7WO1xIzg==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Mon, 13 Mar 2023 23:13:12 +0300 (MSK)
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: <neil.armstrong@linaro.org>, <jbrunet@baylibre.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <khilman@baylibre.com>,
	<martin.blumenstingl@googlemail.com>
CC: <jian.hu@amlogic.com>, <kernel@sberdevices.ru>, <rockosov@gmail.com>,
	<linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Dmitry Rokosov
	<ddrokosov@sberdevices.ru>
Subject: [PATCH v10 1/5] clk: meson: make pll rst bit as optional
Date: Mon, 13 Mar 2023 23:12:55 +0300
Message-ID: <20230313201259.19998-2-ddrokosov@sberdevices.ru>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20230313201259.19998-1-ddrokosov@sberdevices.ru>
References: <20230313201259.19998-1-ddrokosov@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/03/13 10:14:00 #20942017
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_131317_061312_BFA6A3B1 
X-CRM114-Status: GOOD (  12.97  )
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

Compared with the previous SoCs, self-adaption current module
is newly added for A1, and there is no reset parameter except the
fixed pll. Since we use clk-pll generic driver for A1 pll
implementation, rst bit should be optional to support new behavior.

Signed-off-by: Jian Hu <jian.hu@amlogic.com>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
---
 drivers/clk/meson/clk-pll.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
index afefeba6e458..314ca945a4d0 100644
--- a/drivers/clk/meson/clk-pll.c
+++ b/drivers/clk/meson/clk-pll.c
@@ -295,10 +295,14 @@ static int meson_clk_pll_init(struct clk_hw *hw)
 	struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
 
 	if (pll->init_count) {
-		meson_parm_write(clk->map, &pll->rst, 1);
+		if (MESON_PARM_APPLICABLE(&pll->rst))
+			meson_parm_write(clk->map, &pll->rst, 1);
+
 		regmap_multi_reg_write(clk->map, pll->init_regs,
 				       pll->init_count);
-		meson_parm_write(clk->map, &pll->rst, 0);
+
+		if (MESON_PARM_APPLICABLE(&pll->rst))
+			meson_parm_write(clk->map, &pll->rst, 0);
 	}
 
 	return 0;
@@ -309,8 +313,11 @@ static int meson_clk_pll_is_enabled(struct clk_hw *hw)
 	struct clk_regmap *clk = to_clk_regmap(hw);
 	struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
 
-	if (meson_parm_read(clk->map, &pll->rst) ||
-	    !meson_parm_read(clk->map, &pll->en) ||
+	if (MESON_PARM_APPLICABLE(&pll->rst) &&
+	    meson_parm_read(clk->map, &pll->rst))
+		return 0;
+
+	if (!meson_parm_read(clk->map, &pll->en) ||
 	    !meson_parm_read(clk->map, &pll->l))
 		return 0;
 
@@ -341,13 +348,15 @@ static int meson_clk_pll_enable(struct clk_hw *hw)
 		return 0;
 
 	/* Make sure the pll is in reset */
-	meson_parm_write(clk->map, &pll->rst, 1);
+	if (MESON_PARM_APPLICABLE(&pll->rst))
+		meson_parm_write(clk->map, &pll->rst, 1);
 
 	/* Enable the pll */
 	meson_parm_write(clk->map, &pll->en, 1);
 
 	/* Take the pll out reset */
-	meson_parm_write(clk->map, &pll->rst, 0);
+	if (MESON_PARM_APPLICABLE(&pll->rst))
+		meson_parm_write(clk->map, &pll->rst, 0);
 
 	if (meson_clk_pll_wait_lock(hw))
 		return -EIO;
@@ -361,7 +370,8 @@ static void meson_clk_pll_disable(struct clk_hw *hw)
 	struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
 
 	/* Put the pll is in reset */
-	meson_parm_write(clk->map, &pll->rst, 1);
+	if (MESON_PARM_APPLICABLE(&pll->rst))
+		meson_parm_write(clk->map, &pll->rst, 1);
 
 	/* Disable the pll */
 	meson_parm_write(clk->map, &pll->en, 0);
-- 
2.36.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
