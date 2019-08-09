Return-Path: <SRS0=7uPT=WF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D35F8C31E40
	for <linux-amlogic@archiver.kernel.org>; Fri,  9 Aug 2019 23:09:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8628E2086D
	for <linux-amlogic@archiver.kernel.org>; Fri,  9 Aug 2019 23:09:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="saDVVdtl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8628E2086D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oXWFUCmwhS4gynem6tFEa7FbGWFjlSvAQtGpY/hmFRI=; b=saDVVdtlW/jht8
	gCMxBiFq4Fl1ly8x90v/y4cQH1BxE6w5gunaaIhKATfmNe35td64eq2sQV78+7nmoZKjkdDPRmJpV
	kgFlUDDoDKzF11GZX84LpX3I7j4KgFJ9jU2E4dp26b/XTX7bGZW5VNYxkC18XSVcIXW50rUwSrQn2
	un9XK1q/5CFYJ8zaG7XeDjDkpB7TOAx16snCecIQbEHiqSvvr1WYGYCuyh086cMyN59yV+m5YbNlM
	SQsH6BfhfEDLr+iSIo7h+Vyu0r0bZwHkuDEi4W671hm4hYc7ZZE1kYgWZ95CiQVWm7OzcTu60QUe3
	2ljSxeG40ktCZuUBvMfg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hwE0T-0005qH-Ij; Fri, 09 Aug 2019 23:09:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hwE0Q-0005pw-AA
 for linux-amlogic@lists.infradead.org; Fri, 09 Aug 2019 23:09:08 +0000
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net
 [71.197.186.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C2EBC2086D;
 Fri,  9 Aug 2019 23:09:04 +0000 (UTC)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH/RFT] soc: amlogic: meson-gx-pwrc-vpu: switch to clk_bulk
Date: Fri,  9 Aug 2019 16:09:04 -0700
Message-Id: <20190809230904.28747-1-khilman@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190809_160906_375969_69E877C8 
X-CRM114-Status: GOOD (  12.48  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Instead of expecting a specific number of clocks with specific clock
names, switch to using the bulk clock API.

This is a first step towards generalizing this driver to work with
other domains.

Cc: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Kevin Hilman <khilman@baylibre.com>
---
Boot tested on meson-g12a-sei510 and verified that framebuffer console
comes up and still works.

 drivers/soc/amlogic/meson-gx-pwrc-vpu.c | 41 ++++++-------------------
 1 file changed, 10 insertions(+), 31 deletions(-)

diff --git a/drivers/soc/amlogic/meson-gx-pwrc-vpu.c b/drivers/soc/amlogic/meson-gx-pwrc-vpu.c
index 511b6856225d..5f6519f43a31 100644
--- a/drivers/soc/amlogic/meson-gx-pwrc-vpu.c
+++ b/drivers/soc/amlogic/meson-gx-pwrc-vpu.c
@@ -34,8 +34,8 @@ struct meson_gx_pwrc_vpu {
 	struct regmap *regmap_ao;
 	struct regmap *regmap_hhi;
 	struct reset_control *rstc;
-	struct clk *vpu_clk;
-	struct clk *vapb_clk;
+	struct clk_bulk_data *clks;
+	int num_clks;
 };
 
 static inline
@@ -76,8 +76,7 @@ static int meson_gx_pwrc_vpu_power_off(struct generic_pm_domain *genpd)
 
 	msleep(20);
 
-	clk_disable_unprepare(pd->vpu_clk);
-	clk_disable_unprepare(pd->vapb_clk);
+	clk_bulk_disable_unprepare(pd->num_clks, pd->clks);
 
 	return 0;
 }
@@ -119,25 +118,14 @@ static int meson_g12a_pwrc_vpu_power_off(struct generic_pm_domain *genpd)
 
 	msleep(20);
 
-	clk_disable_unprepare(pd->vpu_clk);
-	clk_disable_unprepare(pd->vapb_clk);
+	clk_bulk_disable_unprepare(pd->num_clks, pd->clks);
 
 	return 0;
 }
 
 static int meson_gx_pwrc_vpu_setup_clk(struct meson_gx_pwrc_vpu *pd)
 {
-	int ret;
-
-	ret = clk_prepare_enable(pd->vpu_clk);
-	if (ret)
-		return ret;
-
-	ret = clk_prepare_enable(pd->vapb_clk);
-	if (ret)
-		clk_disable_unprepare(pd->vpu_clk);
-
-	return ret;
+	return clk_bulk_prepare_enable(pd->num_clks, pd->clks);
 }
 
 static int meson_gx_pwrc_vpu_power_on(struct generic_pm_domain *genpd)
@@ -273,8 +261,6 @@ static int meson_gx_pwrc_vpu_probe(struct platform_device *pdev)
 	struct regmap *regmap_ao, *regmap_hhi;
 	struct meson_gx_pwrc_vpu *vpu_pd;
 	struct reset_control *rstc;
-	struct clk *vpu_clk;
-	struct clk *vapb_clk;
 	bool powered_off;
 	int ret;
 
@@ -310,23 +296,16 @@ static int meson_gx_pwrc_vpu_probe(struct platform_device *pdev)
 		return PTR_ERR(rstc);
 	}
 
-	vpu_clk = devm_clk_get(&pdev->dev, "vpu");
-	if (IS_ERR(vpu_clk)) {
-		dev_err(&pdev->dev, "vpu clock request failed\n");
-		return PTR_ERR(vpu_clk);
-	}
-
-	vapb_clk = devm_clk_get(&pdev->dev, "vapb");
-	if (IS_ERR(vapb_clk)) {
-		dev_err(&pdev->dev, "vapb clock request failed\n");
-		return PTR_ERR(vapb_clk);
+	ret = devm_clk_bulk_get_all(&pdev->dev, &vpu_pd->clks);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "bulk clock request failed\n");
+		return ret;
 	}
+	vpu_pd->num_clks = ret;
 
 	vpu_pd->regmap_ao = regmap_ao;
 	vpu_pd->regmap_hhi = regmap_hhi;
 	vpu_pd->rstc = rstc;
-	vpu_pd->vpu_clk = vpu_clk;
-	vpu_pd->vapb_clk = vapb_clk;
 
 	platform_set_drvdata(pdev, vpu_pd);
 
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
