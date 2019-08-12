Return-Path: <SRS0=Dn2N=WI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7788FC31E40
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Aug 2019 23:29:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4724D20665
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Aug 2019 23:29:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aS0ixZ6l";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="0+YYfz1z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4724D20665
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hR7nn+l+5yUq5LJgzQtPrIK9J3B4fNxhzWGFb2Kq8vk=; b=aS0ixZ6lrYcUsT
	izoazKmV7ezG6vz4HGXgfoyfuBNu1YG3S46FJDUzIIjL+zW9S2hN5LPppfFbS90KgrU7u0KStTbAt
	dRFNVKcPyqq1ugmYJnbnOULCfQUcTCFGY/+RSTZ3pGlj42lnJsfLJkHpJxPNVcakUSDmLuOKAgPGD
	3yU1QJxEViLFOMDdPoXTBbkW9p33SD6OiADTDzerdZCSUQx4UhAh22LwjKHDH6tP3YNuOJXWNIJOU
	C/W/Yu7hZT+1DHpJvTkXMc9lLDz2dpWJdV6E8tTpKOzm3Q7FkoZMIsZdKkFywQx8H5ISEKD6ffcUt
	tU/+O7mJ+xT/OBWXRvdg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxJkp-0003wL-E9; Mon, 12 Aug 2019 23:29:31 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxJkI-0003F3-1o; Mon, 12 Aug 2019 23:28:59 +0000
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net
 [71.197.186.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ABD3B2070C;
 Mon, 12 Aug 2019 23:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565652537;
 bh=8DGYsZ2vpwHRKpuHggefj6/H5D3EzUYWO9120Yp/h0k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=0+YYfz1zJ/m+zWzz8czp4mTt82CPqhqbRI6XkD2KzPKeYZOdwBxgshULUS5KciOsH
 78VMjZJKurXfvGNjIFQ0b71bmk6t/mwNreR5SspAmP3Dupc39G75CGTQKEJTpML6qJ
 PkatQ8DCC+v9alprNV2+EldgGAytz5c2ptn+7qd4=
From: Kevin Hilman <khilman@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-rtc@vger.kernel.org
Subject: [PATCH v3 2/2] rtc: Add Amlogic Virtual Wake RTC
Date: Mon, 12 Aug 2019 16:28:50 -0700
Message-Id: <20190812232850.8016-3-khilman@kernel.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190812232850.8016-1-khilman@kernel.org>
References: <20190812232850.8016-1-khilman@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190812_162858_198070_900E10EB 
X-CRM114-Status: GOOD (  18.32  )
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
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Neil Armstrong <narmstrong@baylibre.com>

The Amlogic Meson GX SoCs uses a special register to store the
time in seconds to wakeup after a system suspend.

In order to be able to reuse the RTC wakealarm feature, this
driver implements a fake RTC device which uses the system time
to deduce a suspend delay.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
[khilman: rebase to v5.3-rc, rework and modernization]
Signed-off-by: Kevin Hilman <khilman@baylibre.com>
---
 MAINTAINERS                  |   1 +
 drivers/rtc/Kconfig          |  11 +++
 drivers/rtc/Makefile         |   1 +
 drivers/rtc/rtc-meson-vrtc.c | 156 +++++++++++++++++++++++++++++++++++
 4 files changed, 169 insertions(+)
 create mode 100644 drivers/rtc/rtc-meson-vrtc.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 783569e3c4b4..2ae83e1acb05 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1443,6 +1443,7 @@ F:	arch/arm64/boot/dts/amlogic/
 F:	drivers/pinctrl/meson/
 F:	drivers/mmc/host/meson*
 F:	drivers/soc/amlogic/
+F:	drivers/rtc/rtc-meson*
 N:	meson
 
 ARM/Amlogic Meson SoC Sound Drivers
diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index e72f65b61176..7cd325ecc10b 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -373,6 +373,17 @@ config RTC_DRV_MAX77686
 	  This driver can also be built as a module. If so, the module
 	  will be called rtc-max77686.
 
+config RTC_DRV_MESON_VRTC
+	tristate "Amlogic Meson Virtual RTC"
+	depends on ARCH_MESON || COMPILE_TEST
+	default m if ARCH_MESON
+	help
+	  If you say yes here you will get support for the
+	  Virtual RTC of Amlogic SoCs.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called rtc-meson-vrtc.
+
 config RTC_DRV_RK808
 	tristate "Rockchip RK805/RK808/RK809/RK817/RK818 RTC"
 	depends on MFD_RK808
diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
index 6b09c21dc1b6..b50fd3aa81b3 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -102,6 +102,7 @@ obj-$(CONFIG_RTC_DRV_MAX8907)	+= rtc-max8907.o
 obj-$(CONFIG_RTC_DRV_MAX8925)	+= rtc-max8925.o
 obj-$(CONFIG_RTC_DRV_MAX8997)	+= rtc-max8997.o
 obj-$(CONFIG_RTC_DRV_MAX8998)	+= rtc-max8998.o
+obj-$(CONFIG_RTC_DRV_MESON_VRTC)+= rtc-meson-vrtc.o
 obj-$(CONFIG_RTC_DRV_MC13XXX)	+= rtc-mc13xxx.o
 obj-$(CONFIG_RTC_DRV_MCP795)	+= rtc-mcp795.o
 obj-$(CONFIG_RTC_DRV_MESON)	+= rtc-meson.o
diff --git a/drivers/rtc/rtc-meson-vrtc.c b/drivers/rtc/rtc-meson-vrtc.c
new file mode 100644
index 000000000000..4621a4715179
--- /dev/null
+++ b/drivers/rtc/rtc-meson-vrtc.c
@@ -0,0 +1,156 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2019 BayLibre, SAS
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ * Copyright (C) 2015 Amlogic, Inc. All rights reserved.
+ */
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/rtc.h>
+#include <linux/io.h>
+#include <linux/of.h>
+#include <linux/time64.h>
+
+struct meson_vrtc_data {
+	void __iomem *io_alarm;
+	struct rtc_device *rtc;
+	unsigned long alarm_time;
+	bool enabled;
+};
+
+static int meson_vrtc_read_time(struct device *dev, struct rtc_time *tm)
+{
+	struct timespec64 time;
+
+	dev_dbg(dev, "%s\n", __func__);
+	ktime_get_raw_ts64(&time);
+	rtc_time64_to_tm(time.tv_sec, tm);
+
+	return 0;
+}
+
+static void meson_vrtc_set_wakeup_time(struct meson_vrtc_data *vrtc,
+				       unsigned long time)
+{
+	writel_relaxed(time, vrtc->io_alarm);
+}
+
+static int meson_vrtc_set_alarm(struct device *dev, struct rtc_wkalrm *alarm)
+{
+	struct meson_vrtc_data *vrtc = dev_get_drvdata(dev);
+
+	dev_dbg(dev, "%s: alarm->enabled=%d\n", __func__, alarm->enabled);
+	if (alarm->enabled)
+		vrtc->alarm_time = rtc_tm_to_time64(&alarm->time);
+	else
+		vrtc->alarm_time = 0;
+
+	return 0;
+}
+
+static int meson_vrtc_alarm_irq_enable(struct device *dev, unsigned int enabled)
+{
+	struct meson_vrtc_data *vrtc = dev_get_drvdata(dev);
+
+	vrtc->enabled = enabled;
+	return 0;
+}
+
+static const struct rtc_class_ops meson_vrtc_ops = {
+	.read_time = meson_vrtc_read_time,
+	.set_alarm = meson_vrtc_set_alarm,
+	.alarm_irq_enable = meson_vrtc_alarm_irq_enable,
+};
+
+static int meson_vrtc_probe(struct platform_device *pdev)
+{
+	struct meson_vrtc_data *vrtc;
+	int ret;
+
+	vrtc = devm_kzalloc(&pdev->dev, sizeof(*vrtc), GFP_KERNEL);
+	if (!vrtc)
+		return -ENOMEM;
+
+	vrtc->io_alarm = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(vrtc->io_alarm))
+		return PTR_ERR(vrtc->io_alarm);
+
+	device_init_wakeup(&pdev->dev, 1);
+
+	platform_set_drvdata(pdev, vrtc);
+
+	vrtc->rtc = devm_rtc_allocate_device(&pdev->dev);
+	if (IS_ERR(vrtc->rtc))
+		return PTR_ERR(vrtc->rtc);
+
+	vrtc->rtc->ops = &meson_vrtc_ops;
+	ret = rtc_register_device(vrtc->rtc);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+#ifdef CONFIG_PM_SLEEP
+static int meson_vrtc_suspend(struct device *dev)
+{
+	struct meson_vrtc_data *vrtc = dev_get_drvdata(dev);
+
+	dev_dbg(dev, "%s\n", __func__);
+	if (vrtc->alarm_time) {
+		unsigned long local_time;
+		long alarm_secs;
+		struct timespec64 time;
+
+		ktime_get_raw_ts64(&time);
+		local_time = time.tv_sec;
+
+		dev_dbg(dev, "alarm_time = %lus, local_time=%lus\n",
+			vrtc->alarm_time, local_time);
+		alarm_secs = vrtc->alarm_time - local_time;
+		if (alarm_secs > 0) {
+			meson_vrtc_set_wakeup_time(vrtc, alarm_secs);
+			dev_dbg(dev, "system will wakeup in %lds.\n",
+				alarm_secs);
+		} else {
+			dev_err(dev, "alarm time already passed: %lds.\n",
+				alarm_secs);
+		}
+	}
+
+	return 0;
+}
+
+static int meson_vrtc_resume(struct device *dev)
+{
+	struct meson_vrtc_data *vrtc = dev_get_drvdata(dev);
+
+	dev_dbg(dev, "%s\n", __func__);
+
+	vrtc->alarm_time = 0;
+	meson_vrtc_set_wakeup_time(vrtc, 0);
+	return 0;
+}
+#endif
+static SIMPLE_DEV_PM_OPS(meson_vrtc_pm_ops,
+			 meson_vrtc_suspend, meson_vrtc_resume);
+
+static const struct of_device_id meson_vrtc_dt_match[] = {
+	{ .compatible = "amlogic,meson-vrtc"},
+	{},
+};
+MODULE_DEVICE_TABLE(of, meson_vrtc_dt_match);
+
+static struct platform_driver meson_vrtc_driver = {
+	.probe = meson_vrtc_probe,
+	.driver = {
+		.name = "meson-vrtc",
+		.of_match_table = meson_vrtc_dt_match,
+		.pm = &meson_vrtc_pm_ops,
+	},
+};
+
+module_platform_driver(meson_vrtc_driver);
+
+MODULE_DESCRIPTION("Amlogic Virtual Wakeup RTC Timer driver");
+MODULE_LICENSE("GPL");
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
