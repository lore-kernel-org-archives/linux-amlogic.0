Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D698C6FD1F
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Mar 2024 15:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ebtQ7v3sKHHOtD35mLRRJheLBqIU8z15RQJBJylsKKk=; b=fRts1Kr3bq28NK
	UbBFjOP4uii/1/t54JC0fpF79ay3LwcP7PVzQhri3Rg/2Tj1tNxS+6S0Jkcu4pxTUTDKnjvnGlnuW
	hB2Nk1hBk9/671XJMVWxkUvMLcAxyLsE5cUZqsY8tsg42M4WyDoP3pfxlX+lUaqwy526QvGMzFIf9
	PHkeACm+TZzxNTiISSyAerQ837LJ6KpAtQtaAxBAmodd7ucc7/A9cbudyK6pyFlxrwnoF7eRLqOf7
	fxEd5o/qTi/wTve34SMRnuKalz5/j/zF6GhBkiLrmAdRlt0HR6XR5tI8rOVGBA4oX6L1ttUamzt9E
	JDgSqTDdJc/PKtcva4ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp8nn-00000005BlK-0MAj;
	Tue, 26 Mar 2024 15:33:27 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp8n6-00000005BHy-3rko;
	Tue, 26 Mar 2024 15:32:47 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 46251120002;
	Tue, 26 Mar 2024 18:32:43 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 46251120002
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1711467163;
	bh=dxL1grbTCp6PiIYYK+ilKoRvLvCjH07oZ/D2szuOUNc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=p9rFz/AZyWUtlYHiqZ55RuZ4hAnNxVSWglVi4YdcPPz/u3eEgqTKU1Wxyp04LlBb3
	 aQuyTdaHAGXCCbJBv6NouuaAMzuujGkVpewaI7v6br2cxQAAbNEx1vsEq3VAzopRNa
	 Tog/B86NJaXBfE9g3G0KEtGXPERxheHoabWJTp1xB9KJUAy4inVQMC417EKXWHa/O7
	 LS26I4r/GPR+ou8JaLBOnK9hua7XdnihYdHW1jo0zT+4qXoJoGvfwJ4gbYD/o9/sis
	 H9HImp6VBzTtNTOEE3JcLS0XZpnN3of07ho5FSXJ8EcFyZxUoB820GGGOzy2UxENo0
	 BSSFuEUUAHbFw==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Tue, 26 Mar 2024 18:32:43 +0300 (MSK)
Received: from user-A520M-DS3H.sigma.sbrf.ru (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 26 Mar 2024 18:32:41 +0300
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
Subject: [PATCH v6 06/23] drivers: crypto: meson: drop status field from meson_flow
Date: Tue, 26 Mar 2024 18:32:02 +0300
Message-ID: <20240326153219.2915080-7-avromanov@salutedevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240326153219.2915080-1-avromanov@salutedevices.com>
References: <20240326153219.2915080-1-avromanov@salutedevices.com>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 184425 [Mar 26 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: avromanov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 12 0.3.12 d1a01b14eb3fc102c904d35fe6c2622ed2d1c16e, {Tracking_from_domain_doesnt_match_to}, d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;smtp.sberdevices.ru:5.0.1,7.1.1;salutedevices.com:7.1.1;127.0.0.199:7.1.2;100.64.160.123:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/03/26 13:11:00 #24452135
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_083245_531870_2CC10727 
X-CRM114-Status: GOOD (  17.83  )
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

This field is used only to check for timeout. But there is more
convenient way to achive the same goal.

Signed-off-by: Alexey Romanov <avromanov@salutedevices.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/crypto/amlogic/amlogic-gxl-cipher.c | 13 +++++++++----
 drivers/crypto/amlogic/amlogic-gxl-core.c   |  1 -
 drivers/crypto/amlogic/amlogic-gxl.h        |  2 --
 3 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-cipher.c b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
index 422cbe5d0abb..1b9c0f586448 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-cipher.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
@@ -219,13 +219,18 @@ static int meson_cipher(struct skcipher_request *areq)
 	}
 
 	reinit_completion(&mc->chanlist[flow].complete);
-	mc->chanlist[flow].status = 0;
 	meson_dma_start(mc, flow);
-	wait_for_completion_interruptible_timeout(&mc->chanlist[flow].complete,
-						  msecs_to_jiffies(500));
-	if (mc->chanlist[flow].status == 0) {
+
+	err = wait_for_completion_interruptible_timeout(&mc->chanlist[flow].complete,
+							msecs_to_jiffies(500));
+	if (err == 0) {
 		dev_err(mc->dev, "DMA timeout for flow %d\n", flow);
 		err = -EINVAL;
+	} else if (err < 0) {
+		dev_err(mc->dev, "Waiting for DMA completion is failed (%d)\n", err);
+	} else {
+		/* No error */
+		err = 0;
 	}
 
 	dma_unmap_single(mc->dev, phykeyiv, keyivlen, DMA_TO_DEVICE);
diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index 52317f111c6c..4d04bb0ddc4e 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -53,7 +53,6 @@ static irqreturn_t meson_irq_handler(int irq, void *data)
 	for (flow = 0; flow < mc->flow_cnt; flow++) {
 		if (mc->chanlist[flow].irq == irq) {
 			if (meson_dma_ready(mc, flow)) {
-				mc->chanlist[flow].status = 1;
 				complete(&mc->chanlist[flow].complete);
 				return IRQ_HANDLED;
 			}
diff --git a/drivers/crypto/amlogic/amlogic-gxl.h b/drivers/crypto/amlogic/amlogic-gxl.h
index dc54bd533a2d..4d60a0cc2dca 100644
--- a/drivers/crypto/amlogic/amlogic-gxl.h
+++ b/drivers/crypto/amlogic/amlogic-gxl.h
@@ -59,7 +59,6 @@ struct meson_desc {
  * @engine:	ptr to the crypto_engine for this flow
  * @keylen:	keylen for this flow operation
  * @complete:	completion for the current task on this flow
- * @status:	set to 1 by interrupt if task is done
  * @irq:	IRQ number for amlogic-crypto
  * @t_phy:	Physical address of task
  * @tl:		pointer to the current ce_task for this flow
@@ -68,7 +67,6 @@ struct meson_desc {
 struct meson_flow {
 	struct crypto_engine *engine;
 	struct completion complete;
-	int status;
 	int irq;
 	unsigned int keylen;
 	dma_addr_t t_phy;
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
