Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99D5CE732D0
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Sep 2023 10:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lIwNsKg+Lv+WJHafkUA+x9bJuXFgapG8158KmTYrC20=; b=5BTBYnQVFsJ/td
	q+D2WMh4LdN/K7HdEHsycA+DKoSSd8bgmcqGQG60ecDCXiLKn7hYA978g7tURj8D/2D5l6A8R07Im
	gjbfAaEW78xciVmzm3CXmVx7CvboG+TMh2U1DLVSUSjpRRYdIwc6eXY7oeRqUXAxoszi4VvRIwW99
	cyRAhrjkO2y05thebLCStUmKI5TMYc8m/XLCVgTvP9k1Lqw1SWtSfAvnZYY9GJV+gEP4Oanei8OUo
	RYNxgERTXQcVpQX1ddJ9TfLD7R2Q50/Xd1WcI300T1zXhBQoohFwchQyG4HR564eQmz7ikirpcQEw
	LB3ke21OCEeddpxbvTMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qmAl6-007Z2q-1h;
	Fri, 29 Sep 2023 10:30:08 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qmAl4-007YzV-00;
	Fri, 29 Sep 2023 10:30:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=02RgSRPHLOGMEHrDtoEfLEEz5FUki4ghJjru+SHAGro=; b=dSbUqedptZHU7WkQQxkkwfaJXC
	mPUj4rd8pCx4vaHSfG+0PBPQNVfz8ezQHvEoYky3qbZwzbOpUv7M35AZuZX7pnc8/xC/33ZmeUy5v
	/NjmSxS/JZ9ccnYcVNHQ9gFPCoqxpTzLyqQCnVLNOO41iq4EY4NMPAnwEqgaf8IC9DiqmOLSGNdPe
	g3t/fwVBRx1SshtSEMHKMYCZyrsqQmiKTSRbzPCNqqcmy4f/qK6jCVoCgWV7qQlHc5R72S3v1vETQ
	/vJOWTB1G6hf4SCU4OMOyYV7JkkGl5vr2fXc/0TLMisMNiSOt3t3qLwiUf214yHiD7eh1pcyTLEMc
	g6UVkQ1w==;
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qmAkw-008DCZ-L5; Fri, 29 Sep 2023 10:30:04 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id CF122100004;
	Fri, 29 Sep 2023 13:29:51 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru CF122100004
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1695983391;
	bh=02RgSRPHLOGMEHrDtoEfLEEz5FUki4ghJjru+SHAGro=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=SBP9ICdR7OYnGMVti7OwVZYhv9XoQskVjE6Ij4FkW2hBpunUMctJn9KcSgd15+8Ut
	 CqLox9lwbbGxTa5on5HqkzsFV+vrCW2qjaRL8QFkr7E5a7Er6Px1kYhY/tf4foLb/3
	 2ge/aue8vqb5EzfwVFBWvk/N5hbsezISbLG5tUFdc7ucdGCkMJRARTJ2no/Hc4cwAI
	 A4GcHGd9KBdaxJUAH+z2X4tAr4rMbAGNnjCqaroZ96ZGQ6DWy+ncYs18GBBNsB68YW
	 CasC9DhsMlwDfjj1a13MkbIjubWFK9QiHV5F2EoKeuUd/G0epXaMG1yY0+Jcyhn4OQ
	 vJoWmf+yT2CPQ==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Fri, 29 Sep 2023 13:29:51 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Fri, 29 Sep 2023 13:29:51 +0300
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
Subject: [PATCH v5 1/3] drivers: rng: meson: add support for S4
Date: Fri, 29 Sep 2023 13:29:36 +0300
Message-ID: <20230929102942.67985-2-avromanov@salutedevices.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230929102942.67985-1-avromanov@salutedevices.com>
References: <20230929102942.67985-1-avromanov@salutedevices.com>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 180231 [Sep 29 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: avromanov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 535 535 da804c0ea8918f802fc60e7a20ba49783d957ba2, {Tracking_from_domain_doesnt_match_to}, d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;100.64.160.123:7.1.2;p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1;127.0.0.199:7.1.2;salutedevices.com:7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/09/29 07:52:00 #22006267
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230929_112959_048490_7D1378D4 
X-CRM114-Status: GOOD (  16.25  )
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
index a4eb8e35f13d..75225eb9fef6 100644
--- a/drivers/char/hw_random/meson-rng.c
+++ b/drivers/char/hw_random/meson-rng.c
@@ -13,12 +13,23 @@
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
 };
 
 static int meson_rng_read(struct hwrng *rng, void *buf, size_t max, bool wait)
@@ -31,16 +42,62 @@ static int meson_rng_read(struct hwrng *rng, void *buf, size_t max, bool wait)
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
 	struct meson_rng_data *data;
 	struct clk *core_clk;
+	const struct meson_rng_priv *priv;
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 
+	priv = device_get_match_data(&pdev->dev);
+	if (!priv)
+		return -ENODEV;
+
 	data->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(data->base))
 		return PTR_ERR(data->base);
@@ -51,13 +108,30 @@ static int meson_rng_probe(struct platform_device *pdev)
 				     "Failed to get core clock\n");
 
 	data->rng.name = pdev->name;
-	data->rng.read = meson_rng_read;
+	data->rng.read = priv->read;
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
