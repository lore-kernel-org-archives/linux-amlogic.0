Return-Path: <SRS0=wdVM=UE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91459C282DE
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Jun 2019 09:02:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 677C12075C
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Jun 2019 09:02:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fEBMaoe1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="XKoGucDR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 677C12075C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IZVFV25w5RUKzRKvfpw8wWNfHM1A3AxNng805ngPTVg=; b=fEBMaoe1YTuwVm
	B0uUQFlFuzeIxgIit2meqkg9XHczvncwnJs6hzHAqnrybm4+Okup2YloxEjFyZtkKyxjT18/OgU+t
	TUU9w03ZHhSnmT9Gz/JeGDSkQSQYZwTz2CELKvMZ8FoiuSvu79KL26KjmFjbHxlGZ2cMEL3sPoAzw
	Rxyrl1F3npEuG4H2Eh1y7ViiLq/zz4QYcXBXFl63rfT6ahQ5pPZSKWcvzb0W8Xytb17rqCR1SbTIa
	ytk8kVSyKF944vwx3BV0HqP0IF5DmunimIOZQHsbykq0Zp0oTDUMPw+RIrJf3Ihd31vY78Zp8zIqs
	ilmaff6HU8LdaDSvaokw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hYRoM-0005hh-5n; Wed, 05 Jun 2019 09:02:22 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hYRoI-0005eb-RE
 for linux-amlogic@lists.infradead.org; Wed, 05 Jun 2019 09:02:20 +0000
Received: by mail-wr1-x442.google.com with SMTP id d18so18606348wrs.5
 for <linux-amlogic@lists.infradead.org>; Wed, 05 Jun 2019 02:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W0UkzujEUwohNcf3VeH5h/qlE6pjw3A5B8Q608W8mEU=;
 b=XKoGucDRE59ctdALi55KnuMB2pfY4g1Lt2zBA4dvnGGpwv8Z5gwHb05HCPJDTYlsbv
 5TEfJkhJycV628Z7tr8w84ThBaNxy//SPoHYuGOJ0VhosZmyjqvffKiCo1uNMfH2phSz
 4/Z+AWW56a/f6ql6qLBNzuywl75gEeAD102Rkce3ha+JURcmzY76hw5YCbVZat/ARTKv
 VjXv0W9LPviK5+3e65+wQ/+9r0PD/i6Wmq0HNSuHy4K90cwTLPxRfj32qo9BRccs76SB
 tVQbQBCNFgicGamR/5EkDT2QMolDsY0paIHmFUR1OewGP2Mvn3M1z7hZlsdU5/d8O5hX
 WKlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W0UkzujEUwohNcf3VeH5h/qlE6pjw3A5B8Q608W8mEU=;
 b=e5e9qcm3OEQoGafd0D6YpFbR3pkITs348yhx+3Kx6jJwGXnTQMgYrenjUhgl3VFIhB
 YELSvAsMxNKMAeUqbfVxHGf4iw4oWk90DdtO/WG8UKA18y17ea97M3GQysjBirpAJ8m4
 uwDamoj8hWlrBe6ihCDS1OcUC4x4HErDHIMR0AIL91u2lm5ywGpu4Gz+uE8sJ8KEzRcO
 Dxpb5CPsj8gyL0TRkmmv2b36O/YrTSl2GcCwxr1MybsRkibMVIayXqW60if44Pv/pBK2
 kQ7b9+RwE0sphXvhuWo1oyyRswTTxEORmveaFhpN9dEpjnXLTpP58olRK3DOmkn/He++
 eylQ==
X-Gm-Message-State: APjAAAVnQOdzaEqzls2C9yEvXRZhIUK7OLTmiToi0B3MgliJODpvo1Is
 2yoY/k3wH+Rf3WF7xqzLDMKrNg==
X-Google-Smtp-Source: APXvYqwa2RNAJJwxMJ6JTg0mjevN5vtgAE668gbRTlJwHBOWetytUnE20xaQcYxq0qE3ERpFLm+yug==
X-Received: by 2002:adf:fc87:: with SMTP id g7mr20918125wrr.229.1559725337237; 
 Wed, 05 Jun 2019 02:02:17 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id c129sm2697842wma.27.2019.06.05.02.02.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 05 Jun 2019 02:02:16 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: kishon@ti.com
Subject: [PATCH v2] phy: meson-g12a-usb3-pcie: disable locking for cr_regmap
Date: Wed,  5 Jun 2019 11:02:15 +0200
Message-Id: <20190605090215.29905-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190605_020218_936005_481BBBC3 
X-CRM114-Status: GOOD (  11.35  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

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
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
