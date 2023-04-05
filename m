Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95C3DC761AF
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Apr 2023 20:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3woxTpJWHCZMKRfjSM7Sw7mD3QT5dVFFgnB2PUNViZ8=; b=gDwiAy1LeuqvPF
	ZKbsiNIYadLbSph475cC11uEB3bYD16EqAOTJQMugqYvD1KQti6RCOrlxeE12ejR0+0UdfCKhN3Iv
	Eq9cE+Mx2m3X7vW3Npc9y++jqKAHOgYK5xnRSB2G5TPJfhfaGQuWfOHW9yp7dH+45CRiqOqImyMwE
	95+jwbPMPcoGXi/JnQB08E437NqlLvurFOLi/LJU6uHYR/yJfhvGs82GRPzID5ETD7BcW7fc8zIr4
	nNppDfLxQgIOWzWD/wDPZJASB5jPcxCVWSg0RK+CJa+yxhr6YyNLML76NTONuPfCPq65dVh6foQtt
	9zUcE5TJN1oAuuDraM2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pk9IT-005YiB-0K;
	Wed, 05 Apr 2023 19:59:57 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pk9IO-005Ye0-2A;
	Wed, 05 Apr 2023 19:59:55 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 62B9F5FD4C;
	Wed,  5 Apr 2023 22:59:41 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1680724781;
	bh=QACcL2z5H0WiVPZBqWtG1qVoEZA/+FwC6rxiZKbXGhQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=ROhs6LPrYWZRUFhJiPkXV0pLZz6J35v/ZlCsfJZU50DVj/0AGk4NkgKynAQ4c1X6x
	 DBgP0TJe9JKl4m4E3k/lWLzAEmQ7+BSVgoWbrTwF+mlTMQ7rnh80WdRtencGMBzGXJ
	 NvOAe7QYJF6nYRdndCyT65hJvCL0BNw4SeOuHlN4ERdOFyWaIs/eA5eNNJLPHoI7Wv
	 MsbSazoNUOyr9w4T+hxQnAbXA9frwGbVGmkjfaAS5Zf1nBJX3qr6/G28kjNIyu+fjm
	 sL1+jZuk/3jc2UjF0ZoQScIFM9li7mGJzRe7B5l2h4oOU6K4ZcMaZtb0/xJQjw2JFY
	 N7ci5n/C9CQ1A==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Wed,  5 Apr 2023 22:59:41 +0300 (MSK)
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
Subject: [PATCH v13 2/6] clk: meson: introduce new pll power-on sequence for A1 SoC family
Date: Wed, 5 Apr 2023 22:59:23 +0300
Message-ID: <20230405195927.13487-3-ddrokosov@sberdevices.ru>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20230405195927.13487-1-ddrokosov@sberdevices.ru>
References: <20230405195927.13487-1-ddrokosov@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/04/05 16:44:00 #21035356
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_125953_549215_3E256611 
X-CRM114-Status: GOOD (  14.43  )
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

Modern meson PLL IPs are a little bit different from early known PLLs.
The main difference is located in the init/enable/disable sequences; the
rate logic is the same.

In A1 PLL, the PLL enable sequence is different, so add new optional pll
reg bits and use the new power-on sequence to enable the PLL:
    1. enable the pll, delay for 10us
    2. enable the pll self-adaption current module, delay for 40us
    3. enable the lock detect module

Signed-off-by: Jian Hu <jian.hu@amlogic.com>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
---
 drivers/clk/meson/clk-pll.c | 23 +++++++++++++++++++++++
 drivers/clk/meson/clk-pll.h |  2 ++
 2 files changed, 25 insertions(+)

diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
index 314ca945a4d0..56ec2210f1ad 100644
--- a/drivers/clk/meson/clk-pll.c
+++ b/drivers/clk/meson/clk-pll.c
@@ -358,6 +358,25 @@ static int meson_clk_pll_enable(struct clk_hw *hw)
 	if (MESON_PARM_APPLICABLE(&pll->rst))
 		meson_parm_write(clk->map, &pll->rst, 0);
 
+	/*
+	 * Compared with the previous SoCs, self-adaption current module
+	 * is newly added for A1, keep the new power-on sequence to enable the
+	 * PLL. The sequence is:
+	 * 1. enable the pll, delay for 10us
+	 * 2. enable the pll self-adaption current module, delay for 40us
+	 * 3. enable the lock detect module
+	 */
+	if (MESON_PARM_APPLICABLE(&pll->current_en)) {
+		usleep_range(10, 20);
+		meson_parm_write(clk->map, &pll->current_en, 1);
+		usleep_range(40, 50);
+	};
+
+	if (MESON_PARM_APPLICABLE(&pll->l_detect)) {
+		meson_parm_write(clk->map, &pll->l_detect, 1);
+		meson_parm_write(clk->map, &pll->l_detect, 0);
+	}
+
 	if (meson_clk_pll_wait_lock(hw))
 		return -EIO;
 
@@ -375,6 +394,10 @@ static void meson_clk_pll_disable(struct clk_hw *hw)
 
 	/* Disable the pll */
 	meson_parm_write(clk->map, &pll->en, 0);
+
+	/* Disable PLL internal self-adaption current module */
+	if (MESON_PARM_APPLICABLE(&pll->current_en))
+		meson_parm_write(clk->map, &pll->current_en, 0);
 }
 
 static int meson_clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
diff --git a/drivers/clk/meson/clk-pll.h b/drivers/clk/meson/clk-pll.h
index 367efd0f6410..a2228c0fdce5 100644
--- a/drivers/clk/meson/clk-pll.h
+++ b/drivers/clk/meson/clk-pll.h
@@ -36,6 +36,8 @@ struct meson_clk_pll_data {
 	struct parm frac;
 	struct parm l;
 	struct parm rst;
+	struct parm current_en;
+	struct parm l_detect;
 	const struct reg_sequence *init_regs;
 	unsigned int init_count;
 	const struct pll_params_table *table;
-- 
2.36.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
