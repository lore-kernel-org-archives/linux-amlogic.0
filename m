Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F22AED3569A
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Jan 2026 09:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g3D+RzjnUiRNRGZpIjfg25gncvkbC8Xxkf1Q1/dQMYY=; b=Vx0EEyq/32bLx2
	vCvN5Rkc8K0HgoJe+4z5aV2g2YLazIQ5+WdlHWwAii7flIGm48NSVarC85eIvQryPupZVuCc2ei4d
	8EVfLmH96ztEwjTJm3ujTHlFUhPQAN2CbgaAIG4RDgqiJ6wrpGHw4+R+lMJoUAgY+hjqOiEp/G9P5
	f/SXUQ5fyVzYp3YfWBKfz2NQTyu0ouolIIHVpzEW2g5+kQLnQ69wLdOS6NUGI5OdzGwIp/mKCYfDy
	37u6xRcBF17baDLNNMLUx5vRMERzXKNeKrcTS+InFUk5rb8i9p1GeT+qtjmEe14W58aC5haiqDdc5
	MalB4sTGL0iRYA2u13Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl2HP-0000000Fn9p-2Wot;
	Wed, 28 Jan 2026 09:56:07 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl2HN-0000000Fn7F-27cE
	for linux-amlogic@lists.infradead.org;
	Wed, 28 Jan 2026 09:56:06 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1769594161;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SoKuQzz4G4oLOsx25HsiRvaTcp8ursPrum/xBovvjB0=;
	b=j4+T0TQ8lW523WIn7s+fI9XJqr/CcU5uvc8oB7c9QV9aqJQXp6va3K3zVDFks9mO8q1nrD
	IPneTxbqU3gGdZBGh4eA91PQTRILNFoPuUIE4hnfVn3IUcmyuuWejlMBKHLVsvn9KgKJTY
	YatitFONlGl82CrOOLK7sM2N9WlzwPJ6wBSRBLj7kt5ISwspaX7YH3/zvI/fqEmgZoExpo
	xsIYBxM+aV17p1OYBLOVryKrdaDvay4F+XOYBemcZoliLVUXnoFkfCkCnGVVEB9dk//pRc
	meC90TO67we4DAuIq4OCz/XBDJT/34tKuwFUCgUJVaUt+TtrU/kxQG6Ia3hCKA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1769594161;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SoKuQzz4G4oLOsx25HsiRvaTcp8ursPrum/xBovvjB0=;
	b=viqeemaInEUhQsuSncms6muvPmMDkjbulMK6W+g97Kd+7UqvoRvS/cvq+wzZ7ZUITxFPeO
	taBAp1KyQMorzTDQ==
To: linux-kernel@vger.kernel.org
Cc: "Thomas Gleixner" <tglx@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Yiting Deng <yiting.deng@amlogic.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-amlogic@lists.infradead.org,
	linux-rtc@vger.kernel.org
Subject: [PATCH v2 12/20] rtc: amlogic-a4: Remove IRQF_ONESHOT
Date: Wed, 28 Jan 2026 10:55:32 +0100
Message-ID: <20260128095540.863589-13-bigeasy@linutronix.de>
In-Reply-To: <20260128095540.863589-1-bigeasy@linutronix.de>
References: <20260128095540.863589-1-bigeasy@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_015605_685726_F3E29452 
X-CRM114-Status: GOOD (  10.18  )
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

Passing IRQF_ONESHOT ensures that the interrupt source is masked until
the secondary (threaded) handler is done. If only a primary handler is
used then the flag makes no sense because the interrupt can not fire
(again) while its handler is running.
The flag also disallows force-threading of the primary handler and the
irq-core will warn about this.

Remove IRQF_ONESHOT from irqflags.

Fixes: c89ac9182ee29 ("rtc: support for the Amlogic on-chip RTC")
Reviewed-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
Cc: Yiting Deng <yiting.deng@amlogic.com>
Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-amlogic@lists.infradead.org
Cc: linux-rtc@vger.kernel.org
---
 drivers/rtc/rtc-amlogic-a4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-amlogic-a4.c b/drivers/rtc/rtc-amlogic-a4.c
index 123fb372fc9fe..50938c35af36a 100644
--- a/drivers/rtc/rtc-amlogic-a4.c
+++ b/drivers/rtc/rtc-amlogic-a4.c
@@ -369,7 +369,7 @@ static int aml_rtc_probe(struct platform_device *pdev)
 		return PTR_ERR(rtc->rtc_dev);
 
 	ret = devm_request_irq(dev, rtc->irq, aml_rtc_handler,
-			       IRQF_ONESHOT, "aml-rtc alarm", rtc);
+			       0, "aml-rtc alarm", rtc);
 	if (ret) {
 		dev_err_probe(dev, ret, "IRQ%d request failed, ret = %d\n",
 			      rtc->irq, ret);
-- 
2.51.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
