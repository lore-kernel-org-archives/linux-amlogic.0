Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10658606A31E
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Nov 2026 12:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ikLtXeNq;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rcR58Ngj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2WnS+ELjASw37tgcK+B6f71fR97kJabTT8zl+Wqx9FA=; b=ikLtXeNq3glWn0OE096Pfq0Hdd
	GNuB/Khl6dGxegXBp93qjiszOHTkcql94awc4m99yzQpxOw0S388FF3Whdj3kJP2Ogcx4yQZR9EFQ
	0X+TtAjxQ0xXnWCSzc5jqKxCxdT/9uH3iI4voMD2qvhsvdUqPIGUTjjpyng3Y0ONhZtVXGJm14qpN
	I2Kwjk0G6hN/1WiScfy0z8SY74uvFS1v0bkZ7haHSUkXJBinVgr2hwTBzN0q18bMR1dHQ7usaVMlG
	BVhsvcHBEPnzSL5ef4tXLTkFLSFE3jXLaOGAmvbl6rmhsvTOQB2R8Vl9EmSZOFH3xzLu6wyeXUteS
	JcnJh7VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWueC-0000000FwMb-2GMT;
	Fri, 27 Nov 2026 12:01:48 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWudk-0000000Fw24-0pCN
	for linux-amlogic@lists.infradead.org;
	Fri, 27 Nov 2026 12:01:25 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4bb85e07aadso98368485e9.1
        for <linux-amlogic@lists.infradead.org>; Fri, 27 Nov 2026 04:01:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795780878; x=1796385678; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NWye7nZFqyd09wjqBqg26yH/OXa66ZCjw/Hj8r91FQs=;
        b=rcR58NgjwBURvhDAE50fcwjJfX0wsX2fCuM+LHG9kKrCe0gXq0phmk2mNAPUtsn8bO
         3KVJomQ2pF4WenxVYPPGZXRGYgAgfHmgYQQJgm1KupGGxfiawhqukMjKd2opqto+M47q
         x00L39+n2jkLqfoy8K++BV537D4TvBFpKpYXD/w0phl7z533nOrxLpmRlTJgQ+y2gjiH
         UmVDQcy9iM8H94JaDdFrPugIV+2ss48x8yDtBZutTojCZG3ePe2kO68XaSGqZhUH7koy
         HCUDnqwc4w0eqeOTeUxDQpxGDtnCstLU2Y9MM6idxjbRTKjlOl6HPEWpkxfE8+pRaq8a
         L9HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780878; x=1796385678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NWye7nZFqyd09wjqBqg26yH/OXa66ZCjw/Hj8r91FQs=;
        b=OzZL7AIwhnaYgwNwnt4AoFRROsGb4tcRCwLOBXQy70UtS6N3VD1TNXei2uWxLolERF
         AHQB5PPD+WFpjQKfo6Y4uvUE+DVw40rCVe3sxGRZ5xqDodTuZqwiuXWs24dl76MZL5KO
         Hjtc0lMCORdXn/F9LjT+6efakQCLkDdZAj4xZ3Y1NNbeWZt4FcCyD3tG/Uv08jPm4u0w
         P5pTzC6fcrYxtAW+K6kE2bRrVHvPMSWLzyPoRaUAF1ZyObtb1oCFGjAevgT9KM6Zbfv3
         +YoRpmoEzLlLBf8pFqz3HiNjQ+urFJ96kVAn5DJ/tBDvVSj0mjapHO0xAAy93J6fyJTG
         7kPA==
X-Forwarded-Encrypted: i=1; AL+hErFNd8TyMFiViuCbNPkWvqjF4Tu3PpymQlPcFnj3TS0jryN0OXt3TsRpfUqx6fvC1nqzP4aL7ZOU0M0Qsstw@lists.infradead.org
X-Gm-Message-State: APuU4Z9sUCSYdYkQ1bi44aJD8fyg7nSU+vIHWkC/NlrD+XI+Lbhq8Fgf
	ZcZNDt8YrhSwM/SsxVayqneJnzIW+3/p0kLmjz5vXAiQdzvBatXadxUo
X-Gm-Gg: AZFdTZd4pbkfYUI2syBJfCL7ApNci+lGmvArHN6j5BYXogKE4VYHA+H7OuIMiddXIL4
	lhIJZ+2n7H+C2f9cEssGXydFmZbVrF/5lfF3Jk+Bhjzf2X/6kmgz7KH3lFWR/gTtkptNE1UPCap
	ZBW/qawlax79w41lYUmZeR/ql6k/pNh3naHr6HADGAvps9MOdJshEAw1gc4s/8b43ogzDJQh1di
	nu6zihyydGd/6xXtwRpPxNNaasLsKpcfWxf8NsHpuFVtrX5rUktsNIMST66r+lGCVavx+7ZMOOF
	FidrOezZd+5YTiYizo1krPrG5lAiy+bkniK/z5CCv2hPamHUKEDQrrwQEMo7LA1fFHNrfF7jGE4
	KVO6GSovjiAW9WTBSlY1YwNBbGPA+OYwxcTOiATBq7NOiOtPzjVg+cYJbN4okNo5EHQK/Zf6A+J
	6wVNjKS/jutuDqojwfqaHfg1yToAuQwF24AWETDiqGFNv67Azf0QkMzHre93ZSI+vNyQ+A06cOH
	sCkcRzUZV5oLsjtnUCHEF89FnQHd31vpuLAAYyckguZ0uY8UNwyOwfR2NdV3oQSscgppFtP89Qj
	54H2JFLHYbCVHn+x7Hgsrcbl9RQFsWUP0aCKL3AhbtwQ/ZA=
X-Received: by 2002:a05:600c:3ba3:b0:4bb:7571:5743 with SMTP id 5b1f17b1804b1-4bb88813444mr557829315e9.27.1795780877738;
        Fri, 27 Nov 2026 04:01:17 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm393684565e9.0.2026.11.27.04.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:01:17 -0800 (PST)
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
Subject: [PATCH v14 04/30] crypto: amlogic - Add platform data
Date: Fri, 27 Nov 2026 13:00:37 +0100
Message-ID: <20261127120103.1532882-5-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127120103.1532882-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
 <20261127120103.1532882-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_040120_361199_15F22F6E 
X-CRM114-Status: GOOD (  18.50  )
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
