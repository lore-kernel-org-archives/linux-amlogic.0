Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ACD3C61DD3
	for <linux-amlogic@archiver.kernel.org>; Mon, 31 Aug 2026 09:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lpJxNlnzPsgZu6gvqVWs9ZjXRSpJSBxzmefe3T47HAY=; b=zvwAfkFdt9ngVN
	/e/mo3I0+F7hC1kqpuNnKnf67B0Aqj1nv9j7g9ajd53kbjq1fz7TB6VwnTOixflV9CnjpbH5NiduX
	+6yFz0aSqlaWxy8HSYNmNhyn6YeUQM8oUNUPzeW/clT2VUiZwLUmZLUJ3NjFWd92YzlIyVsGRo+uK
	zOrEjSSRqox+5TMf5n3tc3rPqWX4f74DNYUijbnJKaZ+FLl2tYxfUDbYLBmTMYKZx1ZhRZFUz20os
	M8h5Pa7l4jK8L1+qPvIBwELJptmFPkH4raNzuSdeBD/NGtlwyOqAq214ZpbicHkmf2Mq9dH4SHgTT
	uf57eRuc5tk0dtji9Ebg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0yan-0000000934g-3t8R;
	Mon, 31 Aug 2026 09:46:17 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0yaj-00000009308-2CEM
	for linux-amlogic@lists.infradead.org;
	Mon, 31 Aug 2026 09:46:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=1C
	m/Usak3YOBFXQuAb9Arilpp+CET9HlhbS6Uj00x3E=; b=LFfPrgg3bszUt3tpcg
	o/dYfGNP+kumZWTa6rrMSvuW40eUSdr0RTdY7bNifEy/CxQwubKXP2xEY3cYj7tg
	LHF+MUTwx3gtO2MpOTxxlCXh4UheYILvp4LRLS6vW0mjhHbEDpSh22293hBWrPiD
	6wFar2lNOvMB47XddYCn3GSgk=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgD33wlRTZVq07RNQA--.65178S2;
	Mon, 31 Aug 2026 17:45:54 +0800 (CST)
From: "Li Youhong" <dayou5941@163.com>
To: sunny.luo@amlogic.com,
	xianwei.zhao@amlogic.com,
	broonie@kernel.org
Cc: linux-amlogic@lists.infradead.org,
	linux-spi@vger.kernel.org,
	Li Youhong <liyouhong@kylinos.cn>
Subject: [PATCH] spi: amlogic-spisg: check clk_prepare_enable() return value
Date: Mon, 31 Aug 2026 17:45:53 +0800
Message-Id: <20260831094553.2247003-1-dayou5941@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: PigvCgD33wlRTZVq07RNQA--.65178S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJrWxAFy7Xw15uF4kCw4UArb_yoW8Wr1UpF
	40qFWFkrW8XFy0kr43Ar4DCF15t3y0kFWxG34UKas7uwn7AryvyFy8KF4qqFs0kF95tF17
	GF4UJFyDC3WjqFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Um-ewUUUUU=
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: 5gd103ivzuiqqrwthudrp/xtbC+RJnFmqVTVIndgAA3r
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_024613_998628_B690F9A1 
X-CRM114-Status: UNSURE (   9.19  )
X-CRM114-Notice: Please train this message.
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

From: Li Youhong <liyouhong@kylinos.cn>

The driver ignored clk_prepare_enable() failures for sclk during
probe and for core/sclk during runtime resume. Propagate the errors
and, on resume, disable core if enabling sclk fails, so probe/resume
do not continue with clocks disabled or report success falsely.

Fixes: cef9991e04ae ("spi: Add Amlogic SPISG driver")
Signed-off-by: Li Youhong <liyouhong@kylinos.cn>
---
 drivers/spi/spi-amlogic-spisg.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-amlogic-spisg.c b/drivers/spi/spi-amlogic-spisg.c
index afc8af04638d..71b73df1b5ca 100644
--- a/drivers/spi/spi-amlogic-spisg.c
+++ b/drivers/spi/spi-amlogic-spisg.c
@@ -704,7 +704,9 @@ static int aml_spisg_clk_init(struct spisg_device *spisg, void __iomem *base)
 		return PTR_ERR(spisg->sclk);
 	}
 
-	clk_prepare_enable(spisg->sclk);
+	ret = clk_prepare_enable(spisg->sclk);
+	if (ret)
+		return ret;
 
 	return 0;
 }
@@ -841,9 +843,18 @@ static int spisg_suspend_runtime(struct device *dev)
 static int spisg_resume_runtime(struct device *dev)
 {
 	struct spisg_device *spisg = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_prepare_enable(spisg->core);
+	if (ret)
+		return ret;
+
+	ret = clk_prepare_enable(spisg->sclk);
+	if (ret) {
+		clk_disable_unprepare(spisg->core);
+		return ret;
+	}
 
-	clk_prepare_enable(spisg->core);
-	clk_prepare_enable(spisg->sclk);
 	pinctrl_pm_select_default_state(&spisg->pdev->dev);
 
 	return 0;
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
