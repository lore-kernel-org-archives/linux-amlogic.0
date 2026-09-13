Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 733E9C88E40
	for <linux-amlogic@archiver.kernel.org>; Sun, 13 Sep 2026 04:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xkBUg6LwqWJXDKiNclEn//r0fVpzQe2EQF75tAIq5iY=; b=kuuaR23FY/OaD+
	+EWyt23Gy30xE5dfGWpUwy4SiQGBnkqRnYK8ojLtZenTCta3w4gop0rcu3DMJqNGBaogomlzJunxB
	WH9ues9BDzzoNd4ux3nqUlQLo88i0dpx1ELtifVBdZc5s9zCYKjRp2gkHVFw1TBzzwuUBjYdjmqX4
	DrwyYEkTqbkMCwBg15Os7nICG23Whzws9cSmWFZyxtpn0VqtwYVENreRg5KB6xa986E0d01Xe/xdU
	S30gBQko+WAZQBA0TxHc0Jnl+NLcHhJeU4EmOsJ2SMN4ZBuERYg7ysLBfr+9j/GXSCwVFI1BF6+PO
	dI8Sdrk1Xat12BL5HP/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5bya-00000001PGj-1HIh;
	Sun, 13 Sep 2026 04:38:00 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5byX-00000001PGI-0ysn
	for linux-amlogic@lists.infradead.org;
	Sun, 13 Sep 2026 04:37:58 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-93a00298c53so78904385a.1
        for <linux-amlogic@lists.infradead.org>; Sat, 12 Sep 2026 21:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789274276; x=1789879076; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q4iuYCB32yS1Z/2slBks3HKiKreEZHdfSx0e1Pi4YNY=;
        b=dD39bFFp02tM8WEVVn5xRaSBQ3FpcDK6sb5yzlV0vr1L4IuXDNgEJRG2sOrwDB7ATD
         /KHkZNp7JaXfzxWU5awYZymHBBtHcUhrc6qLSsTp71O2vDfQ1zNfmpNAC2p6cmidindk
         oa3LGX5xMD43CzFpdKzEMn6LuIJBN7TF01LO7xl3ZA+3o5E0VWZc+rKFrCpUwVpBIYdf
         DbO/lY2N5abLvGKOGigG81w8fsxqTSmoBMg6JC1bne/oRfi34b06flC0IbVeh7n8Aqn+
         5E9JeeANRhdNWRvcebut2xg8/M5/bY/wPnFQWQ4kXvLZjl7Vh5jD87WsVCcCJhF+EhNA
         ztHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789274276; x=1789879076;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q4iuYCB32yS1Z/2slBks3HKiKreEZHdfSx0e1Pi4YNY=;
        b=O2pFFJEjgrTebrtz6IP8REwPY8UC4SqHBaJUXPucHHiZtPsfyP+XWs2EAtwGJbJPLm
         J3AzsAwMiZfKlkYrGonwAhCrZrKI59SVSySUSyP7OqY7v/1jxwhQYB95AI8LRaN0ejDm
         jt8CKKZQ0AWvCFP8emAvUp6C837AFJ5Vng3UMmAxTPb8NAx1M0D0A/AYn9mwj6Er+uiZ
         jiJ1oFVTD9cUonDT2jlWz8qZ76hPEs8MtaPIUj4FyFWeIlxAdV8E6WojzN6cP+W7O6N6
         UB2cci+huizgzT7WOtHcZZBbwEqGMq/mxwBb+Mz0doEdSPajMW7FzHTYur7Ta6R9sWi0
         qrqw==
X-Forwarded-Encrypted: i=1; AKwUvBwNWqZRMlQvtsWwcV2MWj723NpyTPwUUQ4jBM7dGCK8EMlNTn4RtyxutQd6K3MCNkP5ZSd16r8iG7MFiSKQ@lists.infradead.org
X-Gm-Message-State: AFuF++m9Kr2peVrLQ8b2LU5kCmZuliak6Wo6zZGgNhVLPNg70yPlM0tU
	LVythGClA9QUwWMrnbwqLyrxIFutO/xZ5brP3bX7QFg2gzpEjjeWty4=
X-Gm-Gg: AYBFou1Q1dV/W2+Lf1dd9cT/ZnR971jjuX9gHdTu8edmZjycAAeBprm0N3Sx1/NFuVq
	r9TIzcE2db1M/XUVwGJl6vfOozKMqxE783Qa5fJYGlyGbF3PR9gVCo9fHjigM+EHDLCnIbFqnyt
	PTlNmiV0IIdXF4DSx6jJ3N73VJuogFkG5GBkykiBs2Lyj2HXoaKPfIXlCHnUSQ/SCAYMIhJ/Zc/
	ZSyrCo4/attdC9dnpzX6ncHyMrbUPvVLidFduzd9d1HVcEEi36y5xS/70vXpZlC7atRoO9UooJM
	CxsgH1MI+GkAM9T9xYmdx6vbBit74zB1DN2JeWZ4d1jzJDEgqRai5UrS2fzNTeQf+A2yz9o75CZ
	SHL//X8NzwtzaEfm0ckZ78srsYjsMejH8PwoPvoDCLU6a5vfxehS/8HAKh0QUh/ZhMMgqpooEkT
	BmAVOcFtqghZR9vwj0CaX6PGL4Fqn7J2Z1lBmogmrjIgkij2fcghmvs9xuqKG05j0MIyPPtMDcp
	Lb1Ja0eeO51B1K9MmuN8RXpiPTDDSEPTe3NNmx70PVkhNZpJo4G1xM3KCuGu3bepP47jA5pJRGD
	hEOH7nv3++szCXYQrsB7E2q+61CWYmHuXA==
X-Received: by 2002:a05:620a:2846:b0:937:19d3:3fda with SMTP id af79cd13be357-939ea229f08mr1629502085a.28.1789274275943;
        Sat, 12 Sep 2026 21:37:55 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939fc4a9455sm442083385a.31.2026.09.12.21.37.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 12 Sep 2026 21:37:54 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Sunny Luo <sunny.luo@amlogic.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Mark Brown <broonie@kernel.org>
Cc: Li Youhong <liyouhong@kylinos.cn>,
	linux-spi@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] spi: amlogic-spisg: Balance runtime PM and clock cleanup
Date: Sun, 13 Sep 2026 00:37:45 -0400
Message-ID: <20260913043745.35022-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_213757_295137_18BFA657 
X-CRM114-Status: GOOD (  17.24  )
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

The core and pclk clocks are acquired with devm_clk_get_enabled(), but
pclk is immediately disabled and core is also disabled by runtime PM and
teardown. The managed cleanup can disable them again. Meanwhile, probe
unwind and active removal disable pclk instead of the enabled child sclk,
leaving the divider's own clock references unbalanced.

Keep managed clock handles but explicitly manage the core and sclk enable
references. Let the clock framework account for pclk through its sclk
child, and unwind core if divider setup or sclk enable fails.

After clock setup, check pm_runtime_set_active() and hold a no-resume
reference before enabling runtime PM. Balance that reference on probe
failure, disable runtime PM during teardown and free the IRQ before the
explicit clock shutdown. On removal, only disable clocks that runtime
suspend has not already disabled.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: cef9991e04ae ("spi: Add Amlogic SPISG driver")
Cc: stable@vger.kernel.org
Assisted-by: OpenAI:GPT-5.6
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Based on SPI for-next at 98100d83adc8e17606605d131e685b1fbedfe092,
which includes Li Youhong's clock-enable error handling patch:
https://lore.kernel.org/r/20260831094553.2247003-1-dayou5941@163.com/

 drivers/spi/spi-amlogic-spisg.c | 55 +++++++++++++++++++++++++------------
 1 file changed, 38 insertions(+), 17 deletions(-)

diff --git a/drivers/spi/spi-amlogic-spisg.c b/drivers/spi/spi-amlogic-spisg.c
index 1b00f34..33c5cbf 100644
--- a/drivers/spi/spi-amlogic-spisg.c
+++ b/drivers/spi/spi-amlogic-spisg.c
@@ -165,6 +165,7 @@ struct spisg_device {
 	struct clk			*sclk;
 	struct clk_div_table		*tbl;
 	struct completion		completion;
+	int				irq;
 	const struct aml_spisg_data	*data;
 	u32				status;
 	u32				speed_hz;
@@ -692,13 +693,13 @@ static int aml_spisg_clk_init(struct spisg_device *spisg, void __iomem *base)
 	char name[32];
 	int ret, i;
 
-	spisg->core = devm_clk_get_enabled(dev, "core");
+	spisg->core = devm_clk_get(dev, "core");
 	if (IS_ERR(spisg->core)) {
 		dev_err(dev, "core clock request failed\n");
 		return PTR_ERR(spisg->core);
 	}
 
-	spisg->pclk = devm_clk_get_enabled(dev, "pclk");
+	spisg->pclk = devm_clk_get(dev, "pclk");
 	if (IS_ERR(spisg->pclk)) {
 		dev_err(dev, "pclk clock request failed\n");
 		return PTR_ERR(spisg->pclk);
@@ -706,8 +707,6 @@ static int aml_spisg_clk_init(struct spisg_device *spisg, void __iomem *base)
 
 	clk_set_min_rate(spisg->pclk, SPISG_PCLK_RATE_MIN);
 
-	clk_disable_unprepare(spisg->pclk);
-
 	tbl = devm_kcalloc(dev, (DIV_NUM + 1), sizeof(*tbl), GFP_KERNEL);
 	if (!tbl)
 		return -ENOMEM;
@@ -728,6 +727,10 @@ static int aml_spisg_clk_init(struct spisg_device *spisg, void __iomem *base)
 	div->width = CLK_DIV_WIDTH;
 	div->table = tbl;
 
+	ret = clk_prepare_enable(spisg->core);
+	if (ret)
+		return ret;
+
 	/* Register value should not be outside of the table */
 	regmap_update_bits(spisg->map, SPISG_REG_CFG_BUS, CFG_CLK_DIV,
 			   FIELD_PREP(CFG_CLK_DIV, SPISG_CLK_DIV_MIN - 1));
@@ -745,20 +748,25 @@ static int aml_spisg_clk_init(struct spisg_device *spisg, void __iomem *base)
 	ret = devm_clk_hw_register(dev, &div->hw);
 	if (ret) {
 		dev_err(dev, "clock registration failed\n");
-		return ret;
+		goto out_core;
 	}
 
 	spisg->sclk = devm_clk_hw_get_clk(dev, &div->hw, NULL);
 	if (IS_ERR(spisg->sclk)) {
 		dev_err(dev, "get clock failed\n");
-		return PTR_ERR(spisg->sclk);
+		ret = PTR_ERR(spisg->sclk);
+		goto out_core;
 	}
 
 	ret = clk_prepare_enable(spisg->sclk);
 	if (ret)
-		return ret;
+		goto out_core;
 
 	return 0;
+
+out_core:
+	clk_disable_unprepare(spisg->core);
+	return ret;
 }
 
 static int aml_spisg_probe(struct platform_device *pdev)
@@ -802,6 +810,7 @@ static int aml_spisg_probe(struct platform_device *pdev)
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
 		return irq;
+	spisg->irq = irq;
 
 	ret = device_reset_optional(dev);
 	if (ret)
@@ -832,9 +841,13 @@ static int aml_spisg_probe(struct platform_device *pdev)
 	/* default pending */
 	spisg->cfg_start = FIELD_PREP(CFG_PEND, 1);
 
-	pm_runtime_set_active(&spisg->pdev->dev);
-	pm_runtime_enable(&spisg->pdev->dev);
-	pm_runtime_resume_and_get(&spisg->pdev->dev);
+	ret = pm_runtime_set_active(dev);
+	if (ret)
+		goto out_clk;
+
+	/* Clock initialization has already powered up the controller. */
+	pm_runtime_get_noresume(dev);
+	pm_runtime_enable(dev);
 
 	ctlr->num_chipselect = 4;
 	ctlr->mode_bits = SPI_CPHA | SPI_CPOL | SPI_LSB_FIRST |
@@ -856,22 +869,26 @@ static int aml_spisg_probe(struct platform_device *pdev)
 	ret = devm_request_irq(&pdev->dev, irq, aml_spisg_irq, 0, NULL, spisg);
 	if (ret) {
 		dev_err(&pdev->dev, "irq request failed\n");
-		goto out_clk;
+		goto out_pm;
 	}
 
 	ret = spi_register_controller(ctlr);
 	if (ret) {
 		dev_err(&pdev->dev, "spi controller registration failed\n");
-		goto out_clk;
+		devm_free_irq(dev, irq, spisg);
+		goto out_pm;
 	}
 
 	pm_runtime_put(&spisg->pdev->dev);
 
 	return 0;
+out_pm:
+	pm_runtime_disable(dev);
+	pm_runtime_put_noidle(dev);
 out_clk:
-	if (spisg->core)
-		clk_disable_unprepare(spisg->core);
-	clk_disable_unprepare(spisg->pclk);
+	clk_disable_unprepare(spisg->sclk);
+	clk_disable_unprepare(spisg->core);
+	pm_runtime_set_suspended(dev);
 
 	return ret;
 }
@@ -882,11 +899,15 @@ static void aml_spisg_remove(struct platform_device *pdev)
 
 	spi_unregister_controller(spisg->controller);
 
-	if (!pm_runtime_suspended(&pdev->dev)) {
+	pm_runtime_disable(&pdev->dev);
+	devm_free_irq(&pdev->dev, spisg->irq, spisg);
+
+	if (!pm_runtime_status_suspended(&pdev->dev)) {
 		pinctrl_pm_select_sleep_state(&spisg->pdev->dev);
+		clk_disable_unprepare(spisg->sclk);
 		clk_disable_unprepare(spisg->core);
-		clk_disable_unprepare(spisg->pclk);
 	}
+	pm_runtime_set_suspended(&pdev->dev);
 }
 
 static int spisg_suspend_runtime(struct device *dev)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
