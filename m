Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9F6606A31E
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Nov 2026 19:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sd7ADusm;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KNJGfuZU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2WnS+ELjASw37tgcK+B6f71fR97kJabTT8zl+Wqx9FA=; b=sd7ADusmsBNh9A0a/SeN/kq9Gz
	QjMw9VrLQOu1h3t/5zteBzCtEL//9lewLRFcx/DNqVKgrqS38a5lTeYGMBQ7OJd03JwpT/knD+0Wq
	4tPSqmg3JhDktBL3VT3+u9NJR/aVb3QD7uQgN+0yYNDdVHOM/Ey75TR+4Q7Grq5qYbimY913rho5A
	5R2KbrrLyTHLmcf1Mr9liuF3bioaANzXGQ1oVvnLaB80E+r3VaYCsr17vPlVD/tlxHPIj6zX1Wz3I
	nYKVsDRxiUrv9QSBpz7BoEv1kwoehTMzVTvEfy3Hb888MlKId0rO0HVBx+QUKSTJ31t1GqyLrWPiJ
	VIzYvYTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfDi-0000000EJj7-1o1e;
	Thu, 26 Nov 2026 19:33:26 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfDP-0000000EJQA-1DsD
	for linux-amlogic@lists.infradead.org;
	Thu, 26 Nov 2026 19:33:08 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso53574785e9.2
        for <linux-amlogic@lists.infradead.org>; Thu, 26 Nov 2026 11:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795721585; x=1796326385; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NWye7nZFqyd09wjqBqg26yH/OXa66ZCjw/Hj8r91FQs=;
        b=KNJGfuZURRkSXLD0+XXo9z8B/YDN2+/R7W+MuaRQsZrX+O1ohw2D//i+lMVKCl8BcR
         f2xI9Qb+dwykwGS+FBozX4Q2daxqux+Rj5E+dvMy0s8qHXzUpfLR9Rl5i3CEWwLhlOFc
         6SNkKUqW18HyUoNhgdXvX2P+zlmQ5ebW+yiFDINC8al/YjJ503Qg0lixN/2NITMI+geg
         1zD8NO5+BFCDb9wKlIqJwLkWRsrxyJt4DPSuIiySazWc5hgGvSvXG+klk3gG/YGYjcv/
         +1BncadeOP/AkSV93NQt4i7HGwl4Z9bDpTwWYIrRCiRYRuCVe1KWirBp1l2A+ovDtneO
         vzNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795721585; x=1796326385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NWye7nZFqyd09wjqBqg26yH/OXa66ZCjw/Hj8r91FQs=;
        b=mGSDVxU/yZr8qW3nA6+kTqDli2+NfT/DnGazCjwMxyNBHifErRQB2KiPzns2g80jxl
         hZqVL+7CUeb8qF3tDcaYwvjTEZuRDDpemQtttYfha/Qwf03blpLqZHmUTeBf35za0hAO
         Z+y9b9M/Tm3rgCL+IoQ/mTf/cuTZ5sPpmabDnl188ka9QIQ1nw+gHaKjrQBbiWcEnVjY
         gnAdG7lUzDabn8sOwtMVWd84179V7A1W1dEyVYA7ZVgy4CIZbT85SysywW3rjjVrORVU
         w5IUuEfPl/O/SNktqgnLsRFwdO+rHbyklWJxZFYZG/H/0zaKGqopmo8nxBL85y7iFAA+
         zDgw==
X-Forwarded-Encrypted: i=1; AL+hErE1gXIt7VaOO3g7kI4d1IhErvdgh/F2FaouDHQ+4LspPfn9swYafNcbcbyIkz44CTISRMu9HwsAyTx3NMb4@lists.infradead.org
X-Gm-Message-State: APuU4Z8LqxS7x4xXqhZ1HLufBwy2QZG4fQvJ0bzGDx7vNjK++pwUD3em
	J15bpgn8ETA8GRvJcaOk7Aeth9rJKhp6Klw+JqBAFG3KxJ3gEHl/iC4r
X-Gm-Gg: AZFdTZdvL+W3v+Zcy3rTVcrIzDDEudYH+hJzRAH1PxUZXtvstM9gdrSybA5bjLcniUA
	iT6TX7MehuGbYyr3dwcOt4kAghyAPwvuE8szdb1OB3Vd4JonRwpMQ44oOG5FecKb8QtsTbenU8a
	qw1uUXKNHRXiifmeU+z1GMcij8mjBs5jbr6iH5YcguGTJ05pJEfJVvsXOMgqhujJLfV4rbdzoMz
	WoDDxDxwpp+qU/7p3Mk5TC0HzxahVrpGvLGvdtw1IIUxuNDBwzI32coewNpPy5tg16WolK6QqeO
	3SbPgStqO3JPP2UBulLE3SXHh3z58vKosY4psHVXHGrFNQP2TTb+0AweM6FuWj0OqWkogF2CWAo
	vrnvQ2pYDjpn7lT2+qbiYZEJKD8I9r7+0OYlHbH9Rvd2K+yqXm69LyLOcM/pG2eprj04Z7CypeZ
	jZM/yElMpmxJvw1BVv/0WJRwGbBVRNU/KaavHT6DbeMs1szjNiYVzq6NmRefIhKlDEj9PrMOjr3
	m5hcvMuC5U6VLPwtCntx4GZrlEyqHopS8EZweoAp9TmjIMntwtCJfofzVV6Mbn2S/hbUv6ha5qL
	dzEe+s87IzCsNtBc8IasOMm3S5e4eCx+6fg6dgfhi6atOVSQ4B++ufw9ULAnxMZPqPk=
X-Received: by 2002:a05:600c:4f16:b0:4a2:47:b79c with SMTP id 5b1f17b1804b1-4bb8882a66emr495180995e9.32.1795721585086;
        Thu, 26 Nov 2026 11:33:05 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906cdcc1sm368287675e9.2.2026.11.26.11.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:33:04 -0800 (PST)
From: Jose Nieto <jnieto.alaber@gmail.com>
To: Corentin Labbe <clabbe@baylibre.com>,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexey Romanov <romanov.alexey2000@gmail.com>
Subject: [PATCH v13 04/25] crypto: amlogic - Add platform data
Date: Thu, 26 Nov 2026 20:32:20 +0100
Message-ID: <20261126193241.1471372-5-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_113307_398812_EA7A9845 
X-CRM114-Status: GOOD (  18.91  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Alexey Romanov <romanov.alexey2000@gmail.com>

To support other Amlogic SoC's we have to
use platform data: descriptors and status registers
offsets are individual for each SoC series.

Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
---
 drivers/crypto/amlogic/amlogic-gxl-cipher.c |  2 +-
 drivers/crypto/amlogic/amlogic-gxl-core.c   | 22 +++++++++++++++++----
 drivers/crypto/amlogic/amlogic-gxl.h        | 11 +++++++++++
 3 files changed, 30 insertions(+), 5 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-cipher.c b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
index bcaed2f413d3..c458548f29b2 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-cipher.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
@@ -234,7 +234,7 @@ static int meson_cipher(struct skcipher_request *areq)
 
 	reinit_completion(&mc->chanlist[flow].complete);
 	mc->chanlist[flow].status = 0;
-	writel(mc->chanlist[flow].t_phy | 2, mc->base + (flow << 2));
+	writel(mc->chanlist[flow].t_phy | 2, mc->base + ((mc->pdata->descs_reg + flow) << 2));
 	wait_for_completion_interruptible_timeout(&mc->chanlist[flow].complete,
 						  msecs_to_jiffies(500));
 	if (mc->chanlist[flow].status == 0) {
diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index b6933be39a37..24ef7d5a5607 100644
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
 
@@ -307,9 +313,17 @@ static void meson_crypto_remove(struct platform_device *pdev)
 	meson_free_chanlist(mc, mc->flow_cnt - 1);
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
index 9f1ef87333ae..e0bc5c39bf2c 100644
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
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
