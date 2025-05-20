Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABA90C54799
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 May 2025 11:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=os6Vl2rDRYWkTbbuzfR5s4ZXE25dvBsSsO6doNUiMV0=; b=BOk5PQaOI5nICP
	THq3NQIdwZ9vBdBUTHVnEqTg3in0tlxWpVdslifUBjHT+RkRJP5WlobJRA6L+VEyPLdBS1b1FMqbF
	2ahMs6rgn2pKXkJra33NKPoRfEXHDUnlzuH4PCt1wio1dHwebvY5UDXlgTjr9deVqF5xgABK1VDJA
	9o8glpAeTX7AbcqjqL9/ThnNN9Qi6IG861J0DXfXw/TvJ7Ph/Qne23o9wvrZA+piNCgOk/oL59OO/
	++G2/6nNeY5Jc2/3JTNLtodRWYrUxbsfVfSzeMVSkAyEol8ST694v5EzDZ3qFbYhyhxIbN8WsLBPE
	JON2vQE/5+i1Sj3iT6AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHLWZ-0000000Cj4A-3pDr;
	Tue, 20 May 2025 11:52:47 +0000
Received: from mail.loongson.cn ([114.242.206.163])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHLRS-0000000CiEC-3MK5
	for linux-amlogic@lists.infradead.org;
	Tue, 20 May 2025 11:47:32 +0000
Received: from loongson.cn (unknown [223.64.69.3])
	by gateway (Coremail) with SMTP id _____8BxIK_RayxoaF7zAA--.63775S3;
	Tue, 20 May 2025 19:47:29 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.69.3])
	by front1 (Coremail) with SMTP id qMiowMBxLsfLayxo+jvjAA--.62543S4;
	Tue, 20 May 2025 19:47:28 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	linux-mmc@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 36/36] mmc: meson-mx-sdio: Use devm_mmc_alloc_host() helper
Date: Tue, 20 May 2025 19:47:14 +0800
Message-ID: <abf952393b2089dea103c1976a7af878b1c9852a.1747739323.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1747739323.git.zhoubinbin@loongson.cn>
References: <cover.1747739323.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
X-CM-TRANSID: qMiowMBxLsfLayxo+jvjAA--.62543S4
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxXw4fGrW3ZFyDJw1kWF1fZrc_yoW5Zr4xpF
	n7WFnxKr48ur4Yg3yrJa1Ut3WYg3yjqayUWrWfWw1fWw4akrWDtF929Fy0qF48ArykZ3Wf
	GF4Yg3y8A34DXFcCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUm0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AK
	xVW0oVCq3wAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0c
	Ia020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Gryq
	6s0DMcIj6I8E87Iv67AKxVW8Jr0_Cr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x
	0EwIxGrwACjcxG6xCI17CEII8vrVW3JVW8Jr1lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IY
	c2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxV
	Aqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q
	6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_tr0E3s1lIxAIcVC0I7IYx2IY6x
	kF7I0E14v26r4UJVWxJr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE
	14v26r4UJVWxJr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0x
	ZFpf9x07b-3ktUUUUU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_044731_137064_16127747 
X-CRM114-Status: GOOD (  10.23  )
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

Use new function devm_mmc_alloc_host() to simplify the code.

Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org
Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 drivers/mmc/host/meson-mx-sdio.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/mmc/host/meson-mx-sdio.c b/drivers/mmc/host/meson-mx-sdio.c
index e0ae5a0c9670..b6cb475f1a5f 100644
--- a/drivers/mmc/host/meson-mx-sdio.c
+++ b/drivers/mmc/host/meson-mx-sdio.c
@@ -640,7 +640,7 @@ static int meson_mx_mmc_probe(struct platform_device *pdev)
 	else if (IS_ERR(slot_pdev))
 		return PTR_ERR(slot_pdev);
 
-	mmc = mmc_alloc_host(sizeof(*host), &slot_pdev->dev);
+	mmc = devm_mmc_alloc_host(&slot_pdev->dev, sizeof(*host));
 	if (!mmc) {
 		ret = -ENOMEM;
 		goto error_unregister_slot_pdev;
@@ -658,13 +658,13 @@ static int meson_mx_mmc_probe(struct platform_device *pdev)
 	host->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(host->base)) {
 		ret = PTR_ERR(host->base);
-		goto error_free_mmc;
+		goto error_unregister_slot_pdev;
 	}
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0) {
 		ret = irq;
-		goto error_free_mmc;
+		goto error_unregister_slot_pdev;
 	}
 
 	ret = devm_request_threaded_irq(host->controller_dev, irq,
@@ -672,28 +672,28 @@ static int meson_mx_mmc_probe(struct platform_device *pdev)
 					meson_mx_mmc_irq_thread, IRQF_ONESHOT,
 					NULL, host);
 	if (ret)
-		goto error_free_mmc;
+		goto error_unregister_slot_pdev;
 
 	host->core_clk = devm_clk_get(host->controller_dev, "core");
 	if (IS_ERR(host->core_clk)) {
 		ret = PTR_ERR(host->core_clk);
-		goto error_free_mmc;
+		goto error_unregister_slot_pdev;
 	}
 
 	host->parent_clk = devm_clk_get(host->controller_dev, "clkin");
 	if (IS_ERR(host->parent_clk)) {
 		ret = PTR_ERR(host->parent_clk);
-		goto error_free_mmc;
+		goto error_unregister_slot_pdev;
 	}
 
 	ret = meson_mx_mmc_register_clks(host);
 	if (ret)
-		goto error_free_mmc;
+		goto error_unregister_slot_pdev;
 
 	ret = clk_prepare_enable(host->core_clk);
 	if (ret) {
 		dev_err(host->controller_dev, "Failed to enable core clock\n");
-		goto error_free_mmc;
+		goto error_unregister_slot_pdev;
 	}
 
 	ret = clk_prepare_enable(host->cfg_div_clk);
@@ -721,8 +721,6 @@ static int meson_mx_mmc_probe(struct platform_device *pdev)
 	clk_disable_unprepare(host->cfg_div_clk);
 error_disable_core_clk:
 	clk_disable_unprepare(host->core_clk);
-error_free_mmc:
-	mmc_free_host(mmc);
 error_unregister_slot_pdev:
 	of_platform_device_destroy(&slot_pdev->dev, NULL);
 	return ret;
@@ -741,8 +739,6 @@ static void meson_mx_mmc_remove(struct platform_device *pdev)
 
 	clk_disable_unprepare(host->cfg_div_clk);
 	clk_disable_unprepare(host->core_clk);
-
-	mmc_free_host(host->mmc);
 }
 
 static const struct of_device_id meson_mx_mmc_of_match[] = {
-- 
2.47.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
