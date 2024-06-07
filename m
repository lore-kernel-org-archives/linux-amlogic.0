Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE09BC27C53
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Jun 2024 14:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d5IjsxV6yGKUELVfSnRhNpqJVqFzHKbx7JnZ+1do3sM=; b=Np+xPO2jZ7Sv+s
	KvGwlKiijDFRhmf3rz+rbSbIkH2oM1Ng+QXWTlUxrgOrZaIKaSbBPogeMsBiP5iz3Nbnt3BZVt6yQ
	cYShSBHOwL5ckR7NKRnEL/njmxdKNHtpSzb9A/5PlVeQMbWvy6suIqcRMsT1ztO5Ubur+VnvtEybg
	uxKHShobSivo2GXl/OOBC7PDG2rN4Lrl9Zhr4x1lWiwxnEm/6NpQbEwxgkVBvS+dJ0MPVni/GdR7p
	pOGrDpAOltLfjj9VrLA5sf+6grm9boiYq8DvpIsyeF6+YLyzbWAKRQCMv4BuCKZAE9uZY/b4gK4QE
	KClYC9oLJDAlJGPK5K/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFaLJ-0000000EIse-2fDh;
	Fri, 07 Jun 2024 14:13:21 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFaL1-0000000EId7-0VXf;
	Fri, 07 Jun 2024 14:13:07 +0000
Received: from p-infra-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 5D346120002;
	Fri,  7 Jun 2024 17:12:56 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 5D346120002
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1717769576;
	bh=T4w8YmD8VWdxpwAM+qh0428tx6ubcLSqso0bV80y5tA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=vjGb6nX9IuL7hTHgktcHbhNLVUZX4DAjM95drtc86itDZzqHns13avyZWMvnTZdn+
	 XqabTxzwYlvBDCLhUc0RePHYzBnyc707+dJJKYnFntZJ1MhlPGf3CEqDTBuzeI4Gqo
	 N8b8EnxTuFmhTAgacTN3/f1HH0qCgE8jv8m1oGqdd+lmMSVIQOllzNqK3YrcMP7aAZ
	 LmibhFJhDCpUisFt08A4nVABuOeSltyO79CldTTNJbWctfpldvTvCV9YImkr+HGcrp
	 ioxO1YKyvSeNVc/iou/Qdk5CscrALBeb8ut4JvHMvd6bP+iGrKBuAaT1SjbnT/aGcM
	 EGsGkgUka8vwQ==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Fri,  7 Jun 2024 17:12:56 +0300 (MSK)
Received: from user-A520M-DS3H.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 7 Jun 2024 17:12:55 +0300
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
Subject: [PATCH v8 01/23] drivers: crypto: meson: don't hardcode IRQ count
Date: Fri, 7 Jun 2024 17:12:20 +0300
Message-ID: <20240607141242.2616580-2-avromanov@salutedevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240607141242.2616580-1-avromanov@salutedevices.com>
References: <20240607141242.2616580-1-avromanov@salutedevices.com>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 185803 [Jun 07 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: avromanov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 20 0.3.20 743589a8af6ec90b529f2124c2bbfc3ce1d2f20f, {Tracking_from_domain_doesnt_match_to}, d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;100.64.160.123:7.1.2;smtp.sberdevices.ru:7.1.1,5.0.1;salutedevices.com:7.1.1;127.0.0.199:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/06/07 12:12:00 #25491508
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_071303_601750_8F04700D 
X-CRM114-Status: GOOD (  22.61  )
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

IRQ count is no longer hardcoded, and make it part of
struct meson_flow. We need this for extend driver support for
other Amlogic SoC's.

Signed-off-by: Alexey Romanov <avromanov@salutedevices.com>
---
 drivers/crypto/amlogic/amlogic-gxl-cipher.c |  2 +-
 drivers/crypto/amlogic/amlogic-gxl-core.c   | 47 ++++++++++++---------
 drivers/crypto/amlogic/amlogic-gxl.h        |  8 ++--
 3 files changed, 31 insertions(+), 26 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-cipher.c b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
index 29048da6f50a..b19032f92415 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-cipher.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
@@ -19,7 +19,7 @@
 
 static int get_engine_number(struct meson_dev *mc)
 {
-	return atomic_inc_return(&mc->flow) % MAXFLOW;
+	return atomic_inc_return(&mc->flow) % mc->flow_cnt;
 }
 
 static bool meson_cipher_need_fallback(struct skcipher_request *areq)
diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index f54ab0d0b1e8..35ec64df5b3a 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -28,8 +28,8 @@ static irqreturn_t meson_irq_handler(int irq, void *data)
 	int flow;
 	u32 p;
 
-	for (flow = 0; flow < MAXFLOW; flow++) {
-		if (mc->irqs[flow] == irq) {
+	for (flow = 0; flow < mc->flow_cnt; flow++) {
+		if (mc->chanlist[flow].irq == irq) {
 			p = readl(mc->base + ((0x04 + flow) << 2));
 			if (p) {
 				writel_relaxed(0xF, mc->base + ((0x4 + flow) << 2));
@@ -110,7 +110,7 @@ static int meson_debugfs_show(struct seq_file *seq, void *v)
 	struct meson_dev *mc __maybe_unused = seq->private;
 	int i;
 
-	for (i = 0; i < MAXFLOW; i++)
+	for (i = 0; i < mc->flow_cnt; i++)
 		seq_printf(seq, "Channel %d: nreq %lu\n", i,
 #ifdef CONFIG_CRYPTO_DEV_AMLOGIC_GXL_DEBUG
 			   mc->chanlist[i].stat_req);
@@ -153,14 +153,32 @@ static void meson_free_chanlist(struct meson_dev *mc, int i)
  */
 static int meson_allocate_chanlist(struct meson_dev *mc)
 {
+	struct platform_device *pdev = to_platform_device(mc->dev);
 	int i, err;
 
-	mc->chanlist = devm_kcalloc(mc->dev, MAXFLOW,
+	mc->flow_cnt = platform_irq_count(pdev);
+	if (mc->flow_cnt <= 0) {
+		dev_err(mc->dev, "No IRQs defined\n");
+		return -ENODEV;
+	}
+
+	mc->chanlist = devm_kcalloc(mc->dev, mc->flow_cnt,
 				    sizeof(struct meson_flow), GFP_KERNEL);
 	if (!mc->chanlist)
 		return -ENOMEM;
 
-	for (i = 0; i < MAXFLOW; i++) {
+	for (i = 0; i < mc->flow_cnt; i++) {
+		mc->chanlist[i].irq = platform_get_irq(pdev, i);
+		if (mc->chanlist[i].irq < 0)
+			return mc->chanlist[i].irq;
+
+		err = devm_request_irq(mc->dev, mc->chanlist[i].irq,
+				       meson_irq_handler, 0, "aml-crypto", mc);
+		if (err < 0) {
+			dev_err(mc->dev, "Cannot request IRQ for flow %d\n", i);
+			return err;
+		}
+
 		init_completion(&mc->chanlist[i].complete);
 
 		mc->chanlist[i].engine = crypto_engine_alloc_init(mc->dev, true);
@@ -230,7 +248,7 @@ static void meson_unregister_algs(struct meson_dev *mc)
 static int meson_crypto_probe(struct platform_device *pdev)
 {
 	struct meson_dev *mc;
-	int err, i;
+	int err;
 
 	mc = devm_kzalloc(&pdev->dev, sizeof(*mc), GFP_KERNEL);
 	if (!mc)
@@ -252,19 +270,6 @@ static int meson_crypto_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	for (i = 0; i < MAXFLOW; i++) {
-		mc->irqs[i] = platform_get_irq(pdev, i);
-		if (mc->irqs[i] < 0)
-			return mc->irqs[i];
-
-		err = devm_request_irq(&pdev->dev, mc->irqs[i], meson_irq_handler, 0,
-				       "gxl-crypto", mc);
-		if (err < 0) {
-			dev_err(mc->dev, "Cannot request IRQ for flow %d\n", i);
-			return err;
-		}
-	}
-
 	err = clk_prepare_enable(mc->busclk);
 	if (err != 0) {
 		dev_err(&pdev->dev, "Cannot prepare_enable busclk\n");
@@ -294,7 +299,7 @@ static int meson_crypto_probe(struct platform_device *pdev)
 error_alg:
 	meson_unregister_algs(mc);
 error_flow:
-	meson_free_chanlist(mc, MAXFLOW - 1);
+	meson_free_chanlist(mc, mc->flow_cnt - 1);
 	clk_disable_unprepare(mc->busclk);
 	return err;
 }
@@ -309,7 +314,7 @@ static void meson_crypto_remove(struct platform_device *pdev)
 
 	meson_unregister_algs(mc);
 
-	meson_free_chanlist(mc, MAXFLOW - 1);
+	meson_free_chanlist(mc, mc->flow_cnt - 1);
 
 	clk_disable_unprepare(mc->busclk);
 }
diff --git a/drivers/crypto/amlogic/amlogic-gxl.h b/drivers/crypto/amlogic/amlogic-gxl.h
index 1013a666c932..79177cfa8b88 100644
--- a/drivers/crypto/amlogic/amlogic-gxl.h
+++ b/drivers/crypto/amlogic/amlogic-gxl.h
@@ -22,8 +22,6 @@
 #define MESON_OPMODE_ECB 0
 #define MESON_OPMODE_CBC 1
 
-#define MAXFLOW 2
-
 #define MAXDESC 64
 
 #define DESC_LAST BIT(18)
@@ -62,6 +60,7 @@ struct meson_desc {
  * @keylen:	keylen for this flow operation
  * @complete:	completion for the current task on this flow
  * @status:	set to 1 by interrupt if task is done
+ * @irq:	IRQ number for amlogic-crypto
  * @t_phy:	Physical address of task
  * @tl:		pointer to the current ce_task for this flow
  * @stat_req:	number of request done by this flow
@@ -70,6 +69,7 @@ struct meson_flow {
 	struct crypto_engine *engine;
 	struct completion complete;
 	int status;
+	int irq;
 	unsigned int keylen;
 	dma_addr_t t_phy;
 	struct meson_desc *tl;
@@ -85,7 +85,7 @@ struct meson_flow {
  * @dev:	the platform device
  * @chanlist:	array of all flow
  * @flow:	flow to use in next request
- * @irqs:	IRQ numbers for amlogic-crypto
+ * @flow_cnt:	flow count for amlogic-crypto
  * @dbgfs_dir:	Debugfs dentry for statistic directory
  * @dbgfs_stats: Debugfs dentry for statistic counters
  */
@@ -95,7 +95,7 @@ struct meson_dev {
 	struct device *dev;
 	struct meson_flow *chanlist;
 	atomic_t flow;
-	int irqs[MAXFLOW];
+	int flow_cnt;
 #ifdef CONFIG_CRYPTO_DEV_AMLOGIC_GXL_DEBUG
 	struct dentry *dbgfs_dir;
 #endif
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
