Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEE00D72379
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Jan 2026 11:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WV46hNnEGtMBbbdO47115Q8lRjMJ8A72ThyI7O6K1Cg=; b=C5vEb3N8GeySvY
	jcOWG7pU/iy9r9FPCrBLD/uq3KgK7VH+beSd1xm2f+pcbAgqJghR6UrWNuuuq6zLCDWlBHBryYuA5
	OX0DYWrJyQUPG9WVsWlIaoVXBSNeKXODedUJeD6CPPiGNiYtu4emC0k+Qf1g/RlLCAk8Hl94DuWo7
	qVT22lCl+dSViCGIqcbktBjtH6xH8bMi781mV0UwyZALma7h5CTPE4MZ1tgEtZGUi/po/fjElrEGq
	AF8WOqOlFxlUn8ScfyUe1mfeBuAEoauZGKZjDQ3edihOX8hFPNpNgLRvLY4n7wGUH+lrfWyVbYdFU
	Pe86VD9zK+EN927ubLJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjFTf-00000008r9a-0QD1;
	Fri, 23 Jan 2026 11:37:23 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjFTc-00000008r86-0aPo
	for linux-amlogic@lists.infradead.org;
	Fri, 23 Jan 2026 11:37:21 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1769168238;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I5Y2mY6Cv+HBbwUcIy8mBlx4YksTAUnqjMgEz3FoeqU=;
	b=HFvbAMH0Th2J1NOletGHPbs9P3Zrb7orBaP+xT9w3SFGu2KD1xIuoRW7Gwiqp5a69DarNs
	ZhIbznmDqinL7Ao4C62KGWzUc0Wo14IZ+BflU70z0PPwc+qcGc3u/eEdw3jseDM1uFBKjN
	bN8dZNP4/zj6VZDLm0glsL869qZwUEsmXOwZgtvt/1k+Z0PI9Tx2+txthQetlmgdDMRoeb
	0xF+ogCleu2o+8A+s6GXfgT/QVVVLCDH/4qqhfF1R0OjVx72FFNmGhxOYFesjteozCuoN1
	WApkITpex4NR7vJrRDvQsg5/ChQHDmXN8Ycn0G1u0c9CL4cLgBFwvRdyIazoJQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1769168238;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I5Y2mY6Cv+HBbwUcIy8mBlx4YksTAUnqjMgEz3FoeqU=;
	b=TL2boRjs4Jahyxe13RnYF5vB6LtjNWpivAhIPpkuT2DBVez0VyqZa/8jAKGzsi1iMdMtl7
	1S2Pq5GStMwXNWDQ==
To: linux-kernel@vger.kernel.org
Cc: linux-rt-devel@lists.linux.dev,
	Thomas Gleixner <tglx@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Yiting Deng <yiting.deng@amlogic.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-amlogic@lists.infradead.org,
	linux-rtc@vger.kernel.org
Subject: [PATCH 14/21] rtc: amlogic-a4: Remove IRQF_ONESHOT
Date: Fri, 23 Jan 2026 12:37:00 +0100
Message-ID: <20260123113708.416727-15-bigeasy@linutronix.de>
In-Reply-To: <20260123113708.416727-1-bigeasy@linutronix.de>
References: <20260123113708.416727-1-bigeasy@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_033720_315875_42B386DC 
X-CRM114-Status: GOOD (  10.30  )
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

Cc: Yiting Deng <yiting.deng@amlogic.com>
Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-amlogic@lists.infradead.org
Cc: linux-rtc@vger.kernel.org
Fixes: c89ac9182ee29 ("rtc: support for the Amlogic on-chip RTC")
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
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
