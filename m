Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0F9FC5475B
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 Mar 2024 13:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UC5be/311+5ntkuoUkM5uZrZuBM9+AA5FKwDtBqRvDo=; b=1OchFdXwiBzrp6
	bCI3F0TnGPRuezsEtiliJtrS38tfPXN8lUOYttYxBnlRRGrI4H6k9JQXkt8f7rBjargWb1O+Vio8X
	OFKZsoTcIHhAA4fA1L/gp7BGFL3B20R32FuV4jyXwaaNCDMC6mBTz3mqAqMxRXLE5HN7w7hHJdk52
	14wczyG/xr9DRhYyve6QtCKNXLc9hGa3Arovq9Jk1is/VBv8wvXeFw29c69Lw6eJlmYJl5/0XDzP6
	beWehYGnRPG+lB2TbJEwa9kEQSgVMK6UI2Jv/MCXPPwI6iw34ZYSZoTW/WZm2dwURnwDyFnE0vnY6
	Fo3+grgZxGofoNFpAMnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg35S-00000000XLR-2PP3;
	Fri, 01 Mar 2024 13:38:06 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg2xh-00000000Sa0-3Ylj;
	Fri, 01 Mar 2024 13:30:09 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id BB1B21000DD;
	Fri,  1 Mar 2024 16:30:02 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru BB1B21000DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1709299802;
	bh=eriiuV0GykLlbuAXJSOmUH2Oy4ZLAtT7rwXfRbbGWeQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=ZLRXecQBGn6t21qq1TYiwvZySXeBYNqRN15RTRtH1S1K9YtTGZ3zDEtC2kCWvWdNS
	 5SphuhiXJZe8Jo8ItcNf+mvyjDl1CdGmdoD297Q88EDlHAhPhvz/MtdsDb72Fr5+ui
	 Qwwo4Gn46sDey0oFVk5/VqavZkXOw0qPfVn8NyjiOyWuanWR8bJx8F8lgfZkd1f8qq
	 6JXDEANMRtaC4Nu+DyO9nV707PdELBGBcJffIRkZoqfeLZmuFujs6tz9Cy3P8j4x34
	 aN8v0mu9zYoCqzOr0PN9+TR6iNOHdvUrmG0v90FUBbkfPwo3IJP4pumpT0Jcjwtg1r
	 T0A/sb6E06xEw==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Fri,  1 Mar 2024 16:30:02 +0300 (MSK)
Received: from user-A520M-DS3H.sigma.sbrf.ru (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 1 Mar 2024 16:30:01 +0300
From: Alexey Romanov <avromanov@salutedevices.com>
To: <neil.armstrong@linaro.org>, <clabbe@baylibre.com>,
	<herbert@gondor.apana.org.au>, <davem@davemloft.net>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <vadim.fedorenko@linux.dev>
CC: <linux-crypto@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <kernel@salutedevices.com>, Alexey
 Romanov <avromanov@salutedevices.com>
Subject: [PATCH v5 02/21] drviers: crypto: meson: add platform data
Date: Fri, 1 Mar 2024 16:29:17 +0300
Message-ID: <20240301132936.621238-3-avromanov@salutedevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240301132936.621238-1-avromanov@salutedevices.com>
References: <20240301132936.621238-1-avromanov@salutedevices.com>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 183875 [Feb 29 2024]
X-KSMG-AntiSpam-Version: 6.1.0.3
X-KSMG-AntiSpam-Envelope-From: avromanov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 7 0.3.7 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a, {Tracking_from_domain_doesnt_match_to}, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/02/29 19:21:00 #23899999
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_053006_253471_1D0A2224 
X-CRM114-Status: GOOD (  20.23  )
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
 drivers/crypto/amlogic/amlogic-gxl-core.c   | 22 +++++++++++++++++----
 drivers/crypto/amlogic/amlogic-gxl.h        | 11 +++++++++++
 3 files changed, 30 insertions(+), 5 deletions(-)

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
index 35ec64df5b3a..e9e733ed98e0 100644
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
@@ -254,6 +256,10 @@ static int meson_crypto_probe(struct platform_device *pdev)
 	if (!mc)
 		return -ENOMEM;
 
+	mc->pdata = of_device_get_match_data(&pdev->dev);
+	if (!mc->pdata)
+		return -EINVAL;
+
 	mc->dev = &pdev->dev;
 	platform_set_drvdata(pdev, mc);
 
@@ -319,9 +325,17 @@ static void meson_crypto_remove(struct platform_device *pdev)
 	clk_disable_unprepare(mc->busclk);
 }
 
+static const struct meson_pdata meson_gxl_pdata = {
+	.descs_reg = 0x0,
+	.status_reg = 0x4,
+};
+
 static const struct of_device_id meson_crypto_of_match_table[] = {
-	{ .compatible = "amlogic,gxl-crypto", },
-	{}
+	{
+		.compatible = "amlogic,gxl-crypto",
+		.data = &meson_gxl_pdata,
+	},
+	{},
 };
 MODULE_DEVICE_TABLE(of, meson_crypto_of_match_table);
 
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
