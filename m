Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB044CCD184
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Oct 2025 10:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NG8d43ggYYGhPF2S9DBcsrKfW2IPtuWtYVTI7i1CpQ0=; b=gsKShKPTti8tQd
	WK0QY9wzd9umxpMsIA2/+SPw8OqnjaxQnG5QUwJ7tiMB3TgIUlxMarBm0G8Ry1NDVltO2MH5uvlij
	o/XaeKvFgGqfsPOOoc/8THga4lc89450Y9XjAZmqNEW+bWy0H1Kegs2YX5Ft7mC7w0MJoDoUW9jVI
	ztq+XislxtNAFyhXBbaHJBeodlzxnCVLvURC1f3Z3Ffz/YdZmsTWZCJyBrlj3xwRT9NUFA4VRwI1p
	E8yCTOnqCO7N4IwO3D30izgeSfO41GdO3ocogai/M306smml82LoxDALQKLs1ngN1VwqqzLqiyZMa
	3DQrR/2n41wVtplrM7xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB9iu-0000000Gdy3-2AoW;
	Tue, 21 Oct 2025 10:36:12 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB9io-0000000GdvA-2vly
	for linux-amlogic@lists.infradead.org;
	Tue, 21 Oct 2025 10:36:11 +0000
Received: from DESKTOP-L0HPE2S (unknown [124.16.141.245])
	by APP-05 (Coremail) with SMTP id zQCowAAnyhMRYvdo3tXeEg--.23830S2;
	Tue, 21 Oct 2025 18:36:02 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: alexandre.belloni@bootlin.com,
	yiting.deng@amlogic.com,
	xianwei.zhao@amlogic.com
Cc: linux-amlogic@lists.infradead.org,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haotian Zhang <vulab@iscas.ac.cn>
Subject: [PATCH v2] rtc: amlogic-a4: fix double free caused by devm
Date: Tue, 21 Oct 2025 18:35:59 +0800
Message-ID: <20251021103559.1903-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <20251020150956.491-1-vulab@iscas.ac.cn>
References: <20251020150956.491-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: zQCowAAnyhMRYvdo3tXeEg--.23830S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kr18AFWfAr4DKrWUZr48Xrb_yoW8GF1DpF
	WxGFyj9FsIgFW8Kan8Xr1UXF15t3y8ta4IgrWUW3sa93WrJFy8AFWxtF18Xan5CFWkGa13
	Wr4Utr1rGF1DuFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvv14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCY02Avz4vE14v_Gw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
	IFyTuYvjfUrF4iDUUUU
X-Originating-IP: [124.16.141.245]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwkCA2j3I1HxSAAAsb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_033607_105936_46B1018D 
X-CRM114-Status: GOOD (  10.24  )
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

The clock obtained via devm_clk_get_enabled() is automatically managed
by devres and will be disabled and freed on driver detach. Manually
calling clk_disable_unprepare() in error path and remove function
causes double free.

Remove the redundant clk_disable_unprepare() calls from the probe
error path and aml_rtc_remove(), allowing the devm framework to
automatically manage the clock lifecycle.

Fixes: c89ac9182ee2 ("rtc: support for the Amlogic on-chip RTC")
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
v2: Also remove the now-unused local variable 'rtc' in aml_rtc_remove()
---
 drivers/rtc/rtc-amlogic-a4.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/rtc/rtc-amlogic-a4.c b/drivers/rtc/rtc-amlogic-a4.c
index 1928b29c1045..a993d35e1d6b 100644
--- a/drivers/rtc/rtc-amlogic-a4.c
+++ b/drivers/rtc/rtc-amlogic-a4.c
@@ -390,7 +390,6 @@ static int aml_rtc_probe(struct platform_device *pdev)
 
 	return 0;
 err_clk:
-	clk_disable_unprepare(rtc->sys_clk);
 	device_init_wakeup(dev, false);
 
 	return ret;
@@ -423,9 +422,6 @@ static SIMPLE_DEV_PM_OPS(aml_rtc_pm_ops,
 
 static void aml_rtc_remove(struct platform_device *pdev)
 {
-	struct aml_rtc_data *rtc = dev_get_drvdata(&pdev->dev);
-
-	clk_disable_unprepare(rtc->sys_clk);
 	device_init_wakeup(&pdev->dev, false);
 }
 
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
