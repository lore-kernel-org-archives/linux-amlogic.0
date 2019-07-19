Return-Path: <SRS0=5tt1=VQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DE3FC76188
	for <linux-amlogic@archiver.kernel.org>; Fri, 19 Jul 2019 03:59:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6781F218A3
	for <linux-amlogic@archiver.kernel.org>; Fri, 19 Jul 2019 03:59:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U0Ha/qYx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="aVRWS/+k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6781F218A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AmPrf9tUI8uMRAgEMoKSyCL4XMVU12em6vz7Blo9KKA=; b=U0Ha/qYx0resSd
	XwW0BmcpspcKtWyh6jL6mrNnewP0iUQotlTTq+8M7HGbQuwWDcIhVcXfSfqLjsB8/vZhtbiO0jEjv
	07YmcSCfMpYa8f0BoLF+LjnnGAjS6+dgcEY5R7Me0uafBzRuiPsSKzAWJvXtyyD/pJL1+RanYfE/y
	loAs6rr2ye0OBrSCPZDfKDErmwY8iqLeQkY4AgOjPhJOJ+dIy1UR6+hVP8wlRh4RnFSVvkdaM4yTp
	Ju3RBQx82mtFDtRJreoLioWUtQh26665nYw+1pmO/5mGGUiwYfRPuVUxCdn452yTQvThTmpWXPJDN
	Ej1pc1bjaLVIsVovA1vw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hoK3i-0004sX-Ro; Fri, 19 Jul 2019 03:59:50 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hoK3g-0004rW-BE
 for linux-amlogic@lists.infradead.org; Fri, 19 Jul 2019 03:59:49 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5487321873;
 Fri, 19 Jul 2019 03:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1563508788;
 bh=zf5ao4F8rb16M8OQVxdQOMg95lCMsO8s27tKgCZ4R9k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aVRWS/+kaZ1uJzlRd0q7G7DHiL8ukrmpvseeL4QvSAyNYHDiYT3EE6MXB+kspx0rc
 zug/n/xYFtlHmvYZeC0SC/hmW3AcGqAJivMpOPQxyr319JqrsL88AXZlZZ8NhuITHs
 xZWBZgjOFlKxgKgkGayabdE7LRl00HJJRdfHlhg0=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 088/171] phy: meson-g12a-usb3-pcie: disable
 locking for cr_regmap
Date: Thu, 18 Jul 2019 23:55:19 -0400
Message-Id: <20190719035643.14300-88-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190719035643.14300-1-sashal@kernel.org>
References: <20190719035643.14300-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190718_205948_403927_0FFC80DB 
X-CRM114-Status: GOOD (  12.38  )
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
Cc: Sasha Levin <sashal@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 linux-amlogic@lists.infradead.org, Kishon Vijay Abraham I <kishon@ti.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Neil Armstrong <narmstrong@baylibre.com>

[ Upstream commit 5fc2aa3ec9efad97dd7c316f3c8e4c6268bbed9b ]

Locking is not needed for the phy_g12a_usb3_pcie_cr_bus_read/write() and
currently it causes the following BUG because of the usage of the
regmap_read_poll_timeout() running in spinlock_irq, configured by regmap fast_io.

Simply disable locking in the cr_regmap config since it's only used from the
PHY init callback function.

BUG: sleeping function called from invalid context at drivers/phy/amlogic/phy-meson-g12a-usb3-pcie.c:85
in_atomic(): 1, irqs_disabled(): 128, pid: 60, name: kworker/3:1
[snip]
Workqueue: events deferred_probe_work_func
Call trace:
 dump_backtrace+0x0/0x190
 show_stack+0x14/0x20
 dump_stack+0x90/0xb4
 ___might_sleep+0xec/0x110
 __might_sleep+0x50/0x88
 phy_g12a_usb3_pcie_cr_bus_addr.isra.0+0x80/0x1a8
 phy_g12a_usb3_pcie_cr_bus_read+0x34/0x1d8
 _regmap_read+0x60/0xe0
 _regmap_update_bits+0xc4/0x110
 regmap_update_bits_base+0x60/0x90
 phy_g12a_usb3_pcie_init+0xdc/0x210
 phy_init+0x74/0xd0
 dwc3_meson_g12a_probe+0x2cc/0x4d0
 platform_drv_probe+0x50/0xa0
 really_probe+0x20c/0x3b8
 driver_probe_device+0x68/0x150
 __device_attach_driver+0xa8/0x170
 bus_for_each_drv+0x64/0xc8
 __device_attach+0xd8/0x158
 device_initial_probe+0x10/0x18
 bus_probe_device+0x90/0x98
 deferred_probe_work_func+0x94/0xe8
 process_one_work+0x1e0/0x338
 worker_thread+0x230/0x458
 kthread+0x134/0x138
 ret_from_fork+0x10/0x1c

Fixes: 36077e16c050 ("phy: amlogic: Add Amlogic G12A USB3 + PCIE Combo PHY Driver")
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Tested-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/phy/amlogic/phy-meson-g12a-usb3-pcie.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/amlogic/phy-meson-g12a-usb3-pcie.c b/drivers/phy/amlogic/phy-meson-g12a-usb3-pcie.c
index 6233a7979a93..ac322d643c7a 100644
--- a/drivers/phy/amlogic/phy-meson-g12a-usb3-pcie.c
+++ b/drivers/phy/amlogic/phy-meson-g12a-usb3-pcie.c
@@ -188,7 +188,7 @@ static const struct regmap_config phy_g12a_usb3_pcie_cr_regmap_conf = {
 	.reg_read = phy_g12a_usb3_pcie_cr_bus_read,
 	.reg_write = phy_g12a_usb3_pcie_cr_bus_write,
 	.max_register = 0xffff,
-	.fast_io = true,
+	.disable_locking = true,
 };
 
 static int phy_g12a_usb3_init(struct phy *phy)
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
