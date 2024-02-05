Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 175C1C4829A
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Feb 2024 15:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yv2j0L1yestP0zLmUtHV4eN716DvAQxIL7MVnVQUEg8=; b=ypEAvPS7/FnRTO
	8xHM4TAUrCwf+N1VcGTiN+7nc36q0v8ciEznpicVXPIezLZUS0WVscGEz2NsWegwHTGRAmLUvNtwk
	DXf0N73E01lsAc70Jjib8tL/wVZ4yTHe5jwecE3vu2jwIs0KBvdPfmfdSslhrPEZ8rAsP1ohUvpOg
	0FAgFyOB/M71w8byNr05aeH6nDe4t6PdX7AG2pyn1CU1h40OwiwmRE4yhL25nwlv/+mkfAhf89Lbg
	gnbCJkj/Io6lY5JLCliP4qKD6JHWgzKKY0QP9hz/nRzYyzj/o6ceqXqYhSaDZ6DJ41s2ES+mlCWU+
	uBB3RkBL+nhgFiFcPeqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX1K0-00000003sjF-46Lr;
	Mon, 05 Feb 2024 15:55:48 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX1Ju-00000003seh-01ay;
	Mon, 05 Feb 2024 15:55:44 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id C9680100013;
	Mon,  5 Feb 2024 18:55:38 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru C9680100013
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1707148538;
	bh=Kggh0mx1qq/xwtSS+ahNNuEm9ZI5KGYt1FdkI7ZDCCI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=BKfXSJe3z9ea/dKXmKn+tiHd8la94RB0xriks2thDoNIQzkkdrXg8d5t270BUG1Ok
	 KfhJipYOvrXAZmdWEnLELK4lOn0+7StXvPGyxYHOGutt1SBpcWt8+jOe9cNO3rSns7
	 7Ns0ZL2UI4C7Y5GCA689PGzvG4Ei7HumvfbBcAlPxtT5amsIhz0sCdTuFC5boEa6Ia
	 AcSZjngOFOxq7RHCxNg2vYPCJ84uAlMeXxC9V1Yc186R0QjfOHIvKhdSLGx6XJqoTv
	 5M1B9AWVvvPQZy0lXbxH8Z4ahQwU2VePgzdtqBFvF69lO5W6f8qOf6Xd3670R5dVhc
	 HB0O4tZyMk2Ig==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Mon,  5 Feb 2024 18:55:38 +0300 (MSK)
Received: from user-A520M-DS3H.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 5 Feb 2024 18:55:37 +0300
From: Alexey Romanov <avromanov@salutedevices.com>
To: <neil.armstrong@linaro.org>, <clabbe@baylibre.com>,
	<herbert@gondor.apana.org.au>, <davem@davemloft.net>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>
CC: <linux-crypto@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <kernel@salutedevices.com>, Alexey
 Romanov <avromanov@salutedevices.com>
Subject: [PATCH v3 02/20] drviers: crypto: meson: add platform data
Date: Mon, 5 Feb 2024 18:55:03 +0300
Message-ID: <20240205155521.1795552-3-avromanov@salutedevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240205155521.1795552-1-avromanov@salutedevices.com>
References: <20240205155521.1795552-1-avromanov@salutedevices.com>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 183204 [Feb 05 2024]
X-KSMG-AntiSpam-Version: 6.1.0.3
X-KSMG-AntiSpam-Envelope-From: avromanov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 7 0.3.7 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;salutedevices.com:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;smtp.sberdevices.ru:7.1.1,5.0.1;100.64.160.123:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/02/05 10:19:00 #23362212
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_075542_426836_210B2A01 
X-CRM114-Status: GOOD (  20.80  )
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

To support other Amlogic SoC's we have to
use platform data: descriptors and status registers
offsets are individual for each SoC series.

Signed-off-by: Alexey Romanov <avromanov@salutedevices.com>
---
 drivers/crypto/amlogic/amlogic-gxl-cipher.c |  2 +-
 drivers/crypto/amlogic/amlogic-gxl-core.c   | 32 +++++++++++++++------
 drivers/crypto/amlogic/amlogic-gxl.h        | 11 +++++++
 3 files changed, 36 insertions(+), 9 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-cipher.c b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
index b19032f92415..7eff3ae7356f 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-cipher.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
@@ -225,7 +225,7 @@ static int meson_cipher(struct skcipher_request *areq)
 
 	reinit_completion(&mc->chanlist[flow].complete);
 	mc->chanlist[flow].status = 0;
-	writel(mc->chanlist[flow].t_phy | 2, mc->base + (flow << 2));
+	writel(mc->chanlist[flow].t_phy | 2, mc->base + ((mc->pdata->descs_reg + flow) << 2));
 	wait_for_completion_interruptible_timeout(&mc->chanlist[flow].complete,
 						  msecs_to_jiffies(500));
 	if (mc->chanlist[flow].status == 0) {
diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index 35ec64df5b3a..4d1b1d5b7a54 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -18,6 +18,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
 
 #include "amlogic-gxl.h"
@@ -30,9 +31,10 @@ static irqreturn_t meson_irq_handler(int irq, void *data)
 
 	for (flow = 0; flow < mc->flow_cnt; flow++) {
 		if (mc->chanlist[flow].irq == irq) {
-			p = readl(mc->base + ((0x04 + flow) << 2));
+			p = readl(mc->base + ((mc->pdata->status_reg + flow) << 2));
 			if (p) {
-				writel_relaxed(0xF, mc->base + ((0x4 + flow) << 2));
+				writel_relaxed(0xF, mc->base +
+					      ((mc->pdata->status_reg + flow) << 2));
 				mc->chanlist[flow].status = 1;
 				complete(&mc->chanlist[flow].complete);
 				return IRQ_HANDLED;
@@ -245,15 +247,35 @@ static void meson_unregister_algs(struct meson_dev *mc)
 	}
 }
 
+static const struct meson_pdata meson_gxl_pdata = {
+	.descs_reg = 0x0,
+	.status_reg = 0x4,
+};
+
+static const struct of_device_id meson_crypto_of_match_table[] = {
+	{
+		.compatible = "amlogic,gxl-crypto",
+		.data = &meson_gxl_pdata,
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(of, meson_crypto_of_match_table);
+
 static int meson_crypto_probe(struct platform_device *pdev)
 {
+	const struct of_device_id *match;
 	struct meson_dev *mc;
 	int err;
 
+	match = of_match_device(meson_crypto_of_match_table, &pdev->dev);
+	if (!match)
+		return -EINVAL;
+
 	mc = devm_kzalloc(&pdev->dev, sizeof(*mc), GFP_KERNEL);
 	if (!mc)
 		return -ENOMEM;
 
+	mc->pdata = match->data;
 	mc->dev = &pdev->dev;
 	platform_set_drvdata(pdev, mc);
 
@@ -319,12 +341,6 @@ static void meson_crypto_remove(struct platform_device *pdev)
 	clk_disable_unprepare(mc->busclk);
 }
 
-static const struct of_device_id meson_crypto_of_match_table[] = {
-	{ .compatible = "amlogic,gxl-crypto", },
-	{}
-};
-MODULE_DEVICE_TABLE(of, meson_crypto_of_match_table);
-
 static struct platform_driver meson_crypto_driver = {
 	.probe		 = meson_crypto_probe,
 	.remove_new	 = meson_crypto_remove,
diff --git a/drivers/crypto/amlogic/amlogic-gxl.h b/drivers/crypto/amlogic/amlogic-gxl.h
index 79177cfa8b88..9ad75da214ff 100644
--- a/drivers/crypto/amlogic/amlogic-gxl.h
+++ b/drivers/crypto/amlogic/amlogic-gxl.h
@@ -78,6 +78,16 @@ struct meson_flow {
 #endif
 };
 
+/*
+ * struct meson_pdata - SoC series dependent data.
+ * @reg_descs:	offset to descriptors register
+ * @reg_status:	offset to status register
+ */
+struct meson_pdata {
+	u32 descs_reg;
+	u32 status_reg;
+};
+
 /*
  * struct meson_dev - main container for all this driver information
  * @base:	base address of amlogic-crypto
@@ -93,6 +103,7 @@ struct meson_dev {
 	void __iomem *base;
 	struct clk *busclk;
 	struct device *dev;
+	const struct meson_pdata *pdata;
 	struct meson_flow *chanlist;
 	atomic_t flow;
 	int flow_cnt;
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
