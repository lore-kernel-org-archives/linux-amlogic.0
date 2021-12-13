Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0C66C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Dec 2021 07:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uuOMst359YQe9Z35PJwxq3zRWqxl02q4UOuDiwX4W2k=; b=MmUGBKd6f2Es51
	vSdosAJOZZobI+uS3RTI6ZQOlw1tVYhuA0ka37afHnjrnDjhb/YSvvL2pV6+rQ5rnqSOg4OTj1P/6
	4XCaTFLSeJk9iyBW7xYfzMFKUIHi2+TqOM1vH6WgtM/mX7FKrVLkD8j5UKXJ8F1IJF4pkP6day014
	tbciXi4GrrdCF8wVyZRTHjXSCBeFe50ve0GeO7U3p3tq4qM4Z+LloxJRbXtwfopFdy1Xoe8i4EbTW
	BcxHCuTrT+86Q4okuxAVt8eKRP2eJPPfq9ObUzn3GV7GzoeZEch78+fcG9M3SlAjb5EUM2XEujxtL
	DZGjClCwH7iM8XILwyEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwfNI-0080jO-26; Mon, 13 Dec 2021 07:03:52 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwfN6-0080hp-5o; Mon, 13 Dec 2021 07:03:41 +0000
Received: from rd02-sz.amlogic.software (10.28.8.43) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server id 15.1.2176.2; Mon, 13 Dec 2021
 15:03:32 +0800
From: Rong Chen <rong.chen@amlogic.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Neil Armstrong
 <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, <--to=1131046452@qq.com>
CC: <45581586@qq.com>, <linux-mmc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, Rong Chen <rong.chen@amlogic.com>
Subject: [PATCH] mmc: meson: initial ocr available by default value
Date: Mon, 13 Dec 2021 15:03:30 +0800
Message-ID: <20211213070330.3351505-1-rong.chen@amlogic.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.28.8.43]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211212_230340_264685_0F295250 
X-CRM114-Status: UNSURE (   8.90  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The patch will add a value of ocr supported by the controller,
to specify some of voltage values are supported.

Ocr_avail should place an initial value to avoid uncertain
value for the platform that unsupport regulator such as S4.

Signed-off-by: Rong Chen <rong.chen@amlogic.com>
---
 drivers/mmc/host/meson-gx-mmc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index 8f36536cb1b6..c339e12d5516 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -4,6 +4,9 @@
  *
  * Copyright (c) 2016 BayLibre, SAS.
  * Author: Kevin Hilman <khilman@baylibre.com>
+ *
+ * Copyright (c) 2021 Amlogic, inc.
+ * Author: Rong Chen <Rong.Chen@amlogic.com>
  */
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -130,6 +133,7 @@
 #define SD_EMMC_DESC_CHAIN_MODE BIT(1)
 
 #define MUX_CLK_NUM_PARENTS 2
+#define SD_EMMC_OCR_AVAIL 0x200080
 
 struct meson_mmc_data {
 	unsigned int tx_delay_mask;
@@ -1150,6 +1154,7 @@ static int meson_mmc_probe(struct platform_device *pdev)
 	host->dram_access_quirk = device_property_read_bool(&pdev->dev,
 					"amlogic,dram-access-quirk");
 
+	mmc->ocr_avail = SD_EMMC_OCR_AVAIL;
 	/* Get regulators and the supported OCR mask */
 	host->vqmmc_enabled = false;
 	ret = mmc_regulator_get_supply(mmc);

base-commit: 141edd9e99eb91393e8a4d97742bd98328bff724
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
