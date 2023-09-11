Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C870AEEB57D
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Sep 2023 10:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t1xQO46GzbTklbrzAa8knc110Akwm/YATG6mf06EJLY=; b=linG7uvI5vS+l8
	6lvnSQudrYgPrw8N9gSZpP14WL/5WF/0bdVEH4OrqCNYxgfiGYyCdUKCjIsLtqKCid/VCDlWVjY42
	p74x3a9lB+VBqC4qwTdyfz0pC2tK7t4Pjk+jRsD31kmRrKoys3/lPo5gxivDU8bvwybSxIbPzltU+
	NXLuwgmAKQUYGV4E03+/MNaZmYZJIwXCviX4kCMRZis8hTRX/0mobNpPGZbBoImkp8z1cLXXnGtpf
	cqcL8/yQYEhDDbC5h3/83c8L4p7VdUgzqs5KnSfUufIOErlu2o5oOFdD/OGWHEmMCiNfPN9WjNjhx
	8Dr1a6F21tKvnpaTqiUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfdtY-0006Ub-2r;
	Mon, 11 Sep 2023 10:11:52 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfdtT-0006RW-0O;
	Mon, 11 Sep 2023 10:11:50 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 7DA8B12000D;
	Mon, 11 Sep 2023 13:11:40 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 7DA8B12000D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1694427100;
	bh=/zWi+Ev4PZp5gdRSiHVwOx5T2Q5lYL39HTOGFJdsJM0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=BNaWyKxWkIYWO101eFaqwtqhf5f0+gkiwjkdbd9X6QdImXqpL3SWZgvsAnH35MWIf
	 uETnLrPKe07AEDkjS+c+tlg8EpiRP/tDSHCZCOAqGcS3VSdqC4cRBhLtinJEqxt3uQ
	 saNAKptatAYWeM7T5EVLHje4NNEwmHRWMy2oyF6TbG19zHlxKxJxlcgljwMxhQS/eU
	 Dsdoy0L4DkJhrAbEnhJ+Tqkl8CKJzCDdsG5ApGpuCGe8qJatB74GB2wgcPVJ6bcOmq
	 q+ftE2rd1wziPZ7tEXOpiflnF0+5vWJjxBdqd1owonruWbfxSQJGTHS7zmML1sOm+T
	 nlCNH6toKqP4w==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Mon, 11 Sep 2023 13:11:40 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Mon, 11 Sep 2023 13:11:38 +0300
From: Alexey Romanov <avromanov@salutedevices.com>
To: <narmstrong@baylibre.com>, <neil.armstrong@linaro.org>,
	<olivia@selenic.com>, <herbert@gondor.apana.org.au>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<conor@kernel.org>, <khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <f.fainelli@gmail.com>,
	<hkallweit1@gmail.com>, <lists@kaiser.cx>
CC: <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
	<kernel@sberdevices.ru>, Alexey Romanov <avromanov@sberdevices.ru>
Subject: [PATCH v3 1/3] drivers: rng: meson: add support for S4
Date: Mon, 11 Sep 2023 13:11:27 +0300
Message-ID: <20230911101129.10604-2-avromanov@salutedevices.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20230911101129.10604-1-avromanov@salutedevices.com>
References: <20230911101129.10604-1-avromanov@salutedevices.com>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 179766 [Sep 11 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: avromanov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 530 530 ecb1547b3f72d1df4c71c0b60e67ba6b4aea5432, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1;100.64.160.123:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;salutedevices.com:7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/09/11 06:02:00 #21866861
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_031147_802463_8ABABEA0 
X-CRM114-Status: GOOD (  18.55  )
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

From: Alexey Romanov <avromanov@sberdevices.ru>

For some Amlogic SOC's, mechanism to obtain random number
has been changed. For example, S4 now uses status bit waiting algo.

Signed-off-by: Alexey Romanov <avromanov@sberdevices.ru>
---
 drivers/char/hw_random/meson-rng.c | 80 ++++++++++++++++++++++++++++--
 1 file changed, 77 insertions(+), 3 deletions(-)

diff --git a/drivers/char/hw_random/meson-rng.c b/drivers/char/hw_random/meson-rng.c
index a4eb8e35f13d..5e1dee659866 100644
--- a/drivers/char/hw_random/meson-rng.c
+++ b/drivers/char/hw_random/meson-rng.c
@@ -13,12 +13,24 @@
 #include <linux/types.h>
 #include <linux/of.h>
 #include <linux/clk.h>
+#include <linux/iopoll.h>
 
-#define RNG_DATA 0x00
+#define RNG_DATA	0x00
+#define RNG_S4_DATA	0x08
+#define RNG_S4_CFG	0x00
+
+#define RUN_BIT		BIT(0)
+#define SEED_READY_STS_BIT	BIT(31)
+
+struct meson_rng_priv {
+	int (*read)(struct hwrng *rng, void *buf, size_t max, bool wait);
+};
 
 struct meson_rng_data {
 	void __iomem *base;
 	struct hwrng rng;
+	struct device *dev;
+	const struct meson_rng_priv *priv;
 };
 
 static int meson_rng_read(struct hwrng *rng, void *buf, size_t max, bool wait)
@@ -31,6 +43,47 @@ static int meson_rng_read(struct hwrng *rng, void *buf, size_t max, bool wait)
 	return sizeof(u32);
 }
 
+static int meson_rng_wait_status(void __iomem *cfg_addr, int bit)
+{
+	u32 status = 0;
+	int ret;
+
+	ret = readl_relaxed_poll_timeout_atomic(cfg_addr,
+						status, !(status & bit),
+						10, 10000);
+	if (ret)
+		return -EBUSY;
+
+	return 0;
+}
+
+static int meson_s4_rng_read(struct hwrng *rng, void *buf, size_t max, bool wait)
+{
+	struct meson_rng_data *data =
+			container_of(rng, struct meson_rng_data, rng);
+
+	void __iomem *cfg_addr = data->base + RNG_S4_CFG;
+	int err;
+
+	writel_relaxed(readl_relaxed(cfg_addr) | SEED_READY_STS_BIT, cfg_addr);
+
+	err = meson_rng_wait_status(cfg_addr, SEED_READY_STS_BIT);
+	if (err) {
+		dev_err(data->dev, "Seed isn't ready, try again\n");
+		return err;
+	}
+
+	err = meson_rng_wait_status(cfg_addr, RUN_BIT);
+	if (err) {
+		dev_err(data->dev, "Can't get random number, try again\n");
+		return err;
+	}
+
+	*(u32 *)buf = readl_relaxed(data->base + RNG_S4_DATA);
+
+	return sizeof(u32);
+}
+
 static int meson_rng_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -41,6 +94,10 @@ static int meson_rng_probe(struct platform_device *pdev)
 	if (!data)
 		return -ENOMEM;
 
+	data->priv = device_get_match_data(&pdev->dev);
+	if (!data->priv)
+		return -ENODEV;
+
 	data->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(data->base))
 		return PTR_ERR(data->base);
@@ -51,13 +108,30 @@ static int meson_rng_probe(struct platform_device *pdev)
 				     "Failed to get core clock\n");
 
 	data->rng.name = pdev->name;
-	data->rng.read = meson_rng_read;
+	data->rng.read = data->priv->read;
+
+	data->dev = &pdev->dev;
 
 	return devm_hwrng_register(dev, &data->rng);
 }
 
+static const struct meson_rng_priv meson_rng_priv = {
+	.read = meson_rng_read,
+};
+
+static const struct meson_rng_priv meson_rng_priv_s4 = {
+	.read = meson_s4_rng_read,
+};
+
 static const struct of_device_id meson_rng_of_match[] = {
-	{ .compatible = "amlogic,meson-rng", },
+	{
+		.compatible = "amlogic,meson-rng",
+		.data = (void *)&meson_rng_priv,
+	},
+	{
+		.compatible = "amlogic,meson-s4-rng",
+		.data = (void *)&meson_rng_priv_s4,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, meson_rng_of_match);
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
