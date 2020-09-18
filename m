Return-Path: <SRS0=O93K=C3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9F5EC43464
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Sep 2020 18:13:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B3FC208DB
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Sep 2020 18:13:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wUuN7iBy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Hm/XXSZm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B3FC208DB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HRzlKv6ysUh7vUNc1FkjsnXpV1/5Hnm7mHANkYBJL60=; b=wUuN7iBykKy+a1G/748ah/gFC7
	DNtpTgYXSIeHxktui2fioVpye/Ho5eBrn32COfatsI6WkDSHjoZ06UjVFrZ+gNsn2OzhfUIQWMVOc
	7N374sfcyrj47VKqxRsChpc6HegDBidevYdY7gtBzhmObbEf1HSyHojy5k2wNUue7lgPEUs+/bCo3
	Di8zrRL5f2HpwsEg5RASzchPm/4KUufl9YdFHW7oiU3pYGzS1+FguZAZW0/KRz4Cay/aGny0GouzA
	sgnEY3LPg/29aFuqxVheJkZ3WbhTIKqQqIqcJg++eedCF3m8SrGKqJqNaxjkdmQHqMASerNlySH8F
	PFFChHHw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJKsU-000417-TH; Fri, 18 Sep 2020 18:12:58 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJKsS-00040C-AD
 for linux-amlogic@lists.infradead.org; Fri, 18 Sep 2020 18:12:57 +0000
Received: by mail-pl1-x644.google.com with SMTP id m15so3395133pls.8
 for <linux-amlogic@lists.infradead.org>; Fri, 18 Sep 2020 11:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rE4BZJp0q9zDr8kKMiT4zLrTffXmD+rm19TjujnN1Vk=;
 b=Hm/XXSZmisiU6T6tNygou89zb4Ycs1lwy/6SoTmGc4hdMUZFBJNje4cBnYK/LR54S5
 JGyuoXInxA9zBYd8nDTr0Qu5P8uH+/vXWhdoT4Mmzgt1sim6TjopH6EKXrimtqXHoOHI
 rgWh7lGZz7y2Ae0mWVtAVQc91B1BzHSO4ZBYbJgCCc5XfiTQxGZA5988w/5j2ddwt+9h
 mAqiEV06sdg8dIodDRfkXuY3jjZv9B6M7r1Ra/nwrvSzt5S9JtNQm9zHr9D7xpBPFuCT
 SWex+b0QE5KrgqLz2uo9OfqZ6IdcAj5+pQZffqvsLf1HzIY4fKRt0qQKpRxi8F1nPnsx
 X0SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rE4BZJp0q9zDr8kKMiT4zLrTffXmD+rm19TjujnN1Vk=;
 b=Z3P0FSk/a6RzYXAYT/0pgDJEOb7u8Iq6s1O716sl4ACUZq/82q3eJTbX2Rq+AsowaA
 UdyhU1sp19mKyZvmOhO2ROsdHDOGttNevnZeFidfVeoXWsABtHPAz8pb79EQeEbIMs0a
 csgb6PD2BWjodecnkbaJyRHvCMoJry3jfdJHMfuvRcppf4NWWHkENYt3VcK9dmbJEvie
 VD9FgVoDDzjHgktnlObdic3Rl2ouTyrDNfzGwmJC2t+of53FHDeXdF1RyOekFF6mQEx2
 wYDbG3wIiKOYLzInMQUQhNht0KDn60Pn0v4j0iB1BVtv3TmWNWQ0uki6OmOlUl2OdCtO
 RpEg==
X-Gm-Message-State: AOAM531rhJTPs+9a0pVj5Is0EJ3ZA11SPSGS+oLmpdn9VV4NzwtJG7qr
 RK8JpwlGqLj+NHu4+lryQc0ZWg==
X-Google-Smtp-Source: ABdhPJwfrxGeVpYY+o0j8pr1eIsjuqfOXri4PFS+X0KVtN+hxvJwc1QM8JFwnSj5/PyhFV0mZRVNNg==
X-Received: by 2002:a17:90b:e01:: with SMTP id
 ge1mr13566751pjb.187.1600452772658; 
 Fri, 18 Sep 2020 11:12:52 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id l1sm3847426pgo.11.2020.09.18.11.12.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2020 11:12:52 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: linux-pci@vger.kernel.org
Subject: [PATCH] pci: meson: build as module by default
Date: Fri, 18 Sep 2020 11:12:51 -0700
Message-Id: <20200918181251.32423-1-khilman@baylibre.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200918_141256_371884_A2B809B4 
X-CRM114-Status: GOOD (  12.36  )
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
Cc: linux-amlogic@lists.infradead.org, Yue Wang <yue.wang@amlogic.com>,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Enable pci-meson to build as a module whenever ARCH_MESON is enabled.

Cc: Yue Wang <yue.wang@amlogic.com>
Signed-off-by: Kevin Hilman <khilman@baylibre.com>
---
Tested on Khadas VIM3 and Khadas VIM3 using NVMe SSD devices.

 drivers/pci/controller/dwc/Kconfig     | 3 ++-
 drivers/pci/controller/dwc/pci-meson.c | 8 +++++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
index 044a3761c44f..bc049865f8e0 100644
--- a/drivers/pci/controller/dwc/Kconfig
+++ b/drivers/pci/controller/dwc/Kconfig
@@ -237,8 +237,9 @@ config PCIE_HISI_STB
 	  Say Y here if you want PCIe controller support on HiSilicon STB SoCs
 
 config PCI_MESON
-	bool "MESON PCIe controller"
+	tristate "MESON PCIe controller"
 	depends on PCI_MSI_IRQ_DOMAIN
+	default m if ARCH_MESON
 	select PCIE_DW_HOST
 	help
 	  Say Y here if you want to enable PCI controller support on Amlogic
diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
index 4f183b96afbb..7a1fb55ee44a 100644
--- a/drivers/pci/controller/dwc/pci-meson.c
+++ b/drivers/pci/controller/dwc/pci-meson.c
@@ -17,6 +17,7 @@
 #include <linux/resource.h>
 #include <linux/types.h>
 #include <linux/phy/phy.h>
+#include <linux/module.h>
 
 #include "pcie-designware.h"
 
@@ -589,6 +590,7 @@ static const struct of_device_id meson_pcie_of_match[] = {
 	},
 	{},
 };
+MODULE_DEVICE_TABLE(of, meson_pcie_of_match);
 
 static struct platform_driver meson_pcie_driver = {
 	.probe = meson_pcie_probe,
@@ -598,4 +600,8 @@ static struct platform_driver meson_pcie_driver = {
 	},
 };
 
-builtin_platform_driver(meson_pcie_driver);
+module_platform_driver(meson_pcie_driver);
+
+MODULE_AUTHOR("Yue Wang <yue.wang@amlogic.com>");
+MODULE_DESCRIPTION("Amlogic PCIe Controller driver");
+MODULE_LICENSE("Dual BSD/GPL");
-- 
2.28.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
