Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 949F4C636D4
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Feb 2023 11:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e4XZPc3sIC6oy+o2pYT01OVVhkdHFbpwZXhSHwV1Fww=; b=pC5hqJmMZeCwuN
	GU72sm9NCYlGmaCc1DkEVT10HQfN+ssNXO1LFlytg0hCZU13CHdNqnzi6D3yBKmgXQZQogRelhddg
	5zqUkG1psWhaTSWltbaw88oMXhUhz3BFzF0hOguLfLE8CnQLvN8a47G9o+GKEIdoO9yX+MWSBxQTR
	kpTXLjtJeZRM6TfAXbOhNzx2cqIQSgq/xkVNZeFjnPUQjxt7A0fbsw4Ow1I4x29b3RxOAO7/oQyVb
	YWjf9RCbrUkaK+wlr6NSfyMrvm0GTzJwPMW+oX2G6R1SOd0ings5uQR5rAhWL9a+CC6HrFQPKirkh
	K0OwEAoPNbZixUQNg/iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ5VY-001Obd-Ib; Thu, 09 Feb 2023 11:54:32 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ5VQ-001OXs-1B; Thu, 09 Feb 2023 11:54:25 +0000
Received: from droid01-xa.amlogic.com (10.88.11.200) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Thu, 9 Feb 2023
 19:54:12 +0800
From: Jiucheng Xu <jiucheng.xu@amlogic.com>
To: Jiucheng Xu <jiucheng.xu@amlogic.com>, Will Deacon <will@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: Jianxin Pan <jianxin.pan@amlogic.com>, Kelvin Zhang
	<kelvin.zhang@amlogic.com>, Chris Healy <cphealy@gmail.com>, Chris Healy
	<healych@amazon.com>, <linux-amlogic@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/3] perf/amlogic: Fix large number of counter issue
Date: Thu, 9 Feb 2023 19:54:02 +0800
Message-ID: <20230209115403.521868-2-jiucheng.xu@amlogic.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230209115403.521868-1-jiucheng.xu@amlogic.com>
References: <20230209115403.521868-1-jiucheng.xu@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.88.11.200]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_035424_093627_69DA7AE4 
X-CRM114-Status: GOOD (  12.91  )
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

When use 1ms interval, very large number of counter happens
once in a while as below:

25.968654513 281474976710655.84 MB meson_ddr_bw/chan_1_rw_bytes,arm=1/
26.118657346 281474976710655.88 MB meson_ddr_bw/chan_1_rw_bytes,arm=1/
26.180137180 281474976710655.66 MB meson_ddr_bw/chan_1_rw_bytes,arm=1/

Root cause is the race between irq handler
and pmu.read callback. Use spin lock to protect the sw&hw
counters.

Signed-off-by: Jiucheng Xu <jiucheng.xu@amlogic.com>
---
 drivers/perf/amlogic/meson_ddr_pmu_core.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/perf/amlogic/meson_ddr_pmu_core.c b/drivers/perf/amlogic/meson_ddr_pmu_core.c
index 0b24dee1ed3c..9b2e5d5c0626 100644
--- a/drivers/perf/amlogic/meson_ddr_pmu_core.c
+++ b/drivers/perf/amlogic/meson_ddr_pmu_core.c
@@ -14,6 +14,7 @@
 #include <linux/perf_event.h>
 #include <linux/platform_device.h>
 #include <linux/printk.h>
+#include <linux/spinlock.h>
 #include <linux/sysfs.h>
 #include <linux/types.h>
 
@@ -23,6 +24,7 @@ struct ddr_pmu {
 	struct pmu pmu;
 	struct dmc_info info;
 	struct dmc_counter counters;	/* save counters from hw */
+	spinlock_t lock;		/* protect hw/sw counter */
 	bool pmu_enabled;
 	struct device *dev;
 	char *name;
@@ -92,10 +94,12 @@ static void meson_ddr_perf_event_update(struct perf_event *event)
 	int idx;
 	int chann_nr = pmu->info.hw_info->chann_nr;
 
+	spin_lock(&pmu->lock);
 	/* get the remain counters in register. */
 	pmu->info.hw_info->get_counters(&pmu->info, &dc);
 
 	ddr_cnt_addition(&sum_dc, &pmu->counters, &dc, chann_nr);
+	spin_unlock(&pmu->lock);
 
 	switch (event->attr.config) {
 	case ALL_CHAN_COUNTER_ID:
@@ -355,6 +359,7 @@ static irqreturn_t dmc_irq_handler(int irq, void *dev_id)
 
 	pmu = dmc_info_to_pmu(info);
 
+	spin_lock(&pmu->lock);
 	if (info->hw_info->irq_handler(info, &counters) != 0)
 		goto out;
 
@@ -372,6 +377,8 @@ static irqreturn_t dmc_irq_handler(int irq, void *dev_id)
 		 * it in ISR to support continue mode.
 		 */
 		info->hw_info->enable(info);
+out:
+	spin_unlock(&pmu->lock);
 
 	dev_dbg(pmu->dev, "counts: %llu %llu %llu, %llu, %llu, %llu\t\t"
 			"sum: %llu %llu %llu, %llu, %llu, %llu\n",
@@ -388,7 +395,7 @@ static irqreturn_t dmc_irq_handler(int irq, void *dev_id)
 			pmu->counters.channel_cnt[1],
 			pmu->counters.channel_cnt[2],
 			pmu->counters.channel_cnt[3]);
-out:
+
 	return IRQ_HANDLED;
 }
 
@@ -539,6 +546,7 @@ int meson_ddr_pmu_create(struct platform_device *pdev)
 	pmu->name = name;
 	pmu->dev = &pdev->dev;
 	pmu->pmu_enabled = false;
+	spin_lock_init(&pmu->lock);
 
 	platform_set_drvdata(pdev, pmu);
 
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
