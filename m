Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D442CCF9F8
	for <linux-amlogic@archiver.kernel.org>; Fri, 31 Oct 2025 20:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=diJbOy43dAGG9f5lxgr3gOb0wzJbjE/BzPWLcVqm6xQ=; b=cwg24t04GHTbBZ
	S0O7LRrI0FRxIvgcryJiEh2BrtaRZUH3LVGrpIQAgK1wADOrdcam1Yqq4pSBt7BmdxipBFKhy8Xlh
	PUqbko3UwfXuRrlpftifrqsyNXoXJI6OcawryyDjHsFsYNM5XBiEAFnlwc6TtpFylrGeMcdJjc+5Z
	R1B8KQSMEoM5hxLGVfa/1qeT42KN6/VDNKXJT4IpF3bQdadHoIzi0MiGsfLynNgNPUKoNtCLHsHks
	57ECP9oNxZmPc/FOfU0pzEj4fRK/teWB6B4CDqtiOw+L1kU5M2CD1LJrAriEJASN93bgSmqEEHIK+
	fBvRW5UpIijmmSH2blwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEw2A-00000006nN7-1XmZ;
	Fri, 31 Oct 2025 20:47:42 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEw26-00000006nM6-1sfp
	for linux-amlogic@lists.infradead.org;
	Fri, 31 Oct 2025 20:47:40 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 12E50C0E95F
	for <linux-amlogic@lists.infradead.org>; Fri, 31 Oct 2025 20:47:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 70B4160704;
	Fri, 31 Oct 2025 20:47:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3433E1181AAE4;
	Fri, 31 Oct 2025 21:47:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761943652; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=LjtRAH85k2iJb2rrQWhadyvs+YYeXHg0Xt0TPJs4Sn8=;
	b=0MG0CbM+vcrAiR1F1ZaVy27SHJuT64ovWvLjVIyN/31bXZm0fs5IQHT81NWvhFqpsWetRI
	9voO6MzTZihn8pSBtFJ947lRPeTUO5vgHFVDQTAfm1RCjjCClkV+GvIJ0wJz+xjLwYFpem
	JKLxdX28vp3oYNdQ5Wu7MQi9wltMChyAmLECDsxPCrxAjagnYtk8rMrk1DrpqV6tdVOv02
	4ia9LPI23t6XsRZ2w7uGnXxQoIB4rcd+DI04+5TcMa/se/Yd+t6UBJ/3FUdTJ9tRjb+aK8
	Shcfl4XCzQKLRM3O5nR+4dAy8g4PUd5efT12xG2uj272pKipIuY2h1KcGUOkvg==
From: alexandre.belloni@bootlin.com
To: Yiting Deng <yiting.deng@amlogic.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-amlogic@lists.infradead.org,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: amlogic-a4: simplify probe
Date: Fri, 31 Oct 2025 21:47:23 +0100
Message-ID: <20251031204724.756857-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_134739_009646_1C0B25EC 
X-CRM114-Status: GOOD (  12.21  )
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

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

Use devm_device_init_wakeup to simplify probe and remove .remove as it is now
empty.

Also remove the unnecessary error string as there are no error path without an
error message in devm_rtc_register_device.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-amlogic-a4.c | 28 +++++-----------------------
 1 file changed, 5 insertions(+), 23 deletions(-)

diff --git a/drivers/rtc/rtc-amlogic-a4.c b/drivers/rtc/rtc-amlogic-a4.c
index a993d35e1d6b..123fb372fc9f 100644
--- a/drivers/rtc/rtc-amlogic-a4.c
+++ b/drivers/rtc/rtc-amlogic-a4.c
@@ -361,38 +361,26 @@ static int aml_rtc_probe(struct platform_device *pdev)
 				     "failed to get_enable rtc sys clk\n");
 	aml_rtc_init(rtc);
 
-	device_init_wakeup(dev, true);
+	devm_device_init_wakeup(dev);
 	platform_set_drvdata(pdev, rtc);
 
 	rtc->rtc_dev = devm_rtc_allocate_device(dev);
-	if (IS_ERR(rtc->rtc_dev)) {
-		ret = PTR_ERR(rtc->rtc_dev);
-		goto err_clk;
-	}
+	if (IS_ERR(rtc->rtc_dev))
+		return PTR_ERR(rtc->rtc_dev);
 
 	ret = devm_request_irq(dev, rtc->irq, aml_rtc_handler,
 			       IRQF_ONESHOT, "aml-rtc alarm", rtc);
 	if (ret) {
 		dev_err_probe(dev, ret, "IRQ%d request failed, ret = %d\n",
 			      rtc->irq, ret);
-		goto err_clk;
+		return ret;
 	}
 
 	rtc->rtc_dev->ops = &aml_rtc_ops;
 	rtc->rtc_dev->range_min = 0;
 	rtc->rtc_dev->range_max = U32_MAX;
 
-	ret = devm_rtc_register_device(rtc->rtc_dev);
-	if (ret) {
-		dev_err_probe(&pdev->dev, ret, "Failed to register RTC device: %d\n", ret);
-		goto err_clk;
-	}
-
-	return 0;
-err_clk:
-	device_init_wakeup(dev, false);
-
-	return ret;
+	return devm_rtc_register_device(rtc->rtc_dev);
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -420,11 +408,6 @@ static int aml_rtc_resume(struct device *dev)
 static SIMPLE_DEV_PM_OPS(aml_rtc_pm_ops,
 			 aml_rtc_suspend, aml_rtc_resume);
 
-static void aml_rtc_remove(struct platform_device *pdev)
-{
-	device_init_wakeup(&pdev->dev, false);
-}
-
 static const struct aml_rtc_config a5_rtc_config = {
 };
 
@@ -447,7 +430,6 @@ MODULE_DEVICE_TABLE(of, aml_rtc_device_id);
 
 static struct platform_driver aml_rtc_driver = {
 	.probe = aml_rtc_probe,
-	.remove = aml_rtc_remove,
 	.driver = {
 		.name = "aml-rtc",
 		.pm = &aml_rtc_pm_ops,
-- 
2.51.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
