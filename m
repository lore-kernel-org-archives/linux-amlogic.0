Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FD7EC00140
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Aug 2022 02:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZQ+UxdLJ9yMFEEpSQ1H9yNCHwyXoO94Zj5CjRAD6Kiw=; b=RVzmAZOKZZgPyf
	wBLRDEZQBOKm9azdgjptt33pHna3e9q2bPtdjDI1XDu0Q7P041cM7ERJA99iVNOBUYwIICupdc4l8
	ThYqCqYHa1XsI3BmNEomQXqM3Rl+U0h/ZPWuwj9nbdmaSUxcptsputF5RkZa4axk0b3VSFjOVIx5q
	1Kql41zFdYlCHpubyxaJubvx+A3AfPiHbOBkt6bkJrKSpI+nS+2ytN+wwylTotL5nYbrmkKtQU3mc
	SJMVrGvI5Gz9+Bly9Csvb63rEzoxTMJcNtcdJo/RWNmc4/P+/tteqszSHRBzGqeoB7PFZ2xf3S1Mc
	HpspT1CkLwNP+1H+zpaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLEpT-000MeL-2o; Tue, 09 Aug 2022 02:18:47 +0000
Received: from [2400:dd01:100f:2:72e2:84ff:fe10:5f45] (helo=mail.nfschina.com)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLEpJ-000MXe-Bq; Tue, 09 Aug 2022 02:18:45 +0000
Received: from localhost (unknown [127.0.0.1])
	by mail.nfschina.com (Postfix) with ESMTP id 4C48B1E80CD2;
	Tue,  9 Aug 2022 10:16:47 +0800 (CST)
X-Virus-Scanned: amavisd-new at test.com
Received: from mail.nfschina.com ([127.0.0.1])
	by localhost (mail.nfschina.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kWPENbvXY606; Tue,  9 Aug 2022 10:16:44 +0800 (CST)
Received: from localhost.localdomain (unknown [219.141.250.2])
	(Authenticated sender: zeming@nfschina.com)
	by mail.nfschina.com (Postfix) with ESMTPA id 9F8F81E80CC5;
	Tue,  9 Aug 2022 10:16:44 +0800 (CST)
From: Li zeming <zeming@nfschina.com>
To: daniel.lezcano@linaro.org,
	tglx@linutronix.de,
	narmstrong@baylibre.com,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	Li zeming <zeming@nfschina.com>
Subject: [PATCH] clocksource: Remove unnecessary (void*) conversions
Date: Tue,  9 Aug 2022 10:18:21 +0800
Message-Id: <20220809021821.3266-1-zeming@nfschina.com>
X-Mailer: git-send-email 2.18.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220808_191837_628338_700D1CE0 
X-CRM114-Status: UNSURE (   7.81  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Remove unnecessary void* type castings.

Signed-off-by: Li zeming <zeming@nfschina.com>
---
 drivers/clocksource/timer-meson6.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-meson6.c b/drivers/clocksource/timer-meson6.c
index 99f5510a2b56..83dcd167e204 100644
--- a/drivers/clocksource/timer-meson6.c
+++ b/drivers/clocksource/timer-meson6.c
@@ -143,7 +143,7 @@ static struct clock_event_device meson6_clockevent = {
 
 static irqreturn_t meson6_timer_interrupt(int irq, void *dev_id)
 {
-	struct clock_event_device *evt = (struct clock_event_device *)dev_id;
+	struct clock_event_device *evt = dev_id;
 
 	evt->event_handler(evt);
 
-- 
2.18.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
