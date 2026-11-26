Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EFBB606A329
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Nov 2026 19:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bsv1Je/f;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nCWo6mh5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ysATyzAxfG/7EQE9CLlB5Pj3T6X7Gd9Mh/FXQrhZTPY=; b=bsv1Je/fbmt7iEaTQpXBNTz9Lk
	lq9Vno/EYE2+A/3ORIAjrlrpRmrg1Q+a0XaQN78078B9gLsDSU2oR35gYAsxfanJYZTnYN4zcSLF9
	noilR6hgRcym4JMDDKr2sce1+EHItFRHmP3nMdeJ1KVF1/t0o4EKDFFGCKLfyCsnaiJguY9i+nXDp
	cNYde4WVjTY+kyA4JsHj7tbipXkaXJOS4aRWNkVruseLBSLMX3GWEYJKp/EUNRDe02x957xVrfN20
	5iWmLjVaQRfsD5ZBU0flSlToq+uzOJbP6mUA60BPFc47lHXvumKn1c8iHzo8SKYE9uN1Kyv+7r+Wt
	uQ8GGkwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfDi-0000000EJkN-32ja;
	Thu, 26 Nov 2026 19:33:26 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfDS-0000000EJSY-3FMx
	for linux-amlogic@lists.infradead.org;
	Thu, 26 Nov 2026 19:33:11 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso57792235e9.0
        for <linux-amlogic@lists.infradead.org>; Thu, 26 Nov 2026 11:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795721589; x=1796326389; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4dPCbEZZdSDry+u4vUWC6GFpLLhoS8x3SOrFseRsQ00=;
        b=nCWo6mh5K7sIv1J5FE6pvao1MQQC4mcBwYz0t+BgAbgq+MqSBYDtV4LE5LT5AWHeKM
         nCb+vbIrQX7AqJXQV7CQRdmROqdVbWQh5VHhTGK3CCSRraFAln773OeUb0PisVg9Pr5+
         tXfNuSPGWrU3UdvSYpmou/D07dN8vSEMiRbdprtVyY8cdtXNU5VEOc0hvwmNbAsWsWiM
         7HNgUbNCvKiUbyhCZAfBOZYOx5jrdikdvImZznglUefKhDRJcxxj9B3osbHpv79j5FNd
         Wn2xXGJKlPAU9z0YbweeFtCzRp7J69Lq8/KsBLwVON0bKwAncN8eQ6Sn3Sg7XGI0DOGY
         YjNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795721589; x=1796326389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4dPCbEZZdSDry+u4vUWC6GFpLLhoS8x3SOrFseRsQ00=;
        b=yqdzcHosqbRX6kUvL66zd1ve0OHfMeTbCbEr9dsiyvZKKzk1S8y3+TlcSoZu4ICZYG
         cp+CZLH3q0ztLYdNEjFGrtqYG59OB3Gxuo8zrv9b8B2u+uRn7dvDPs6h9gNArqwKViZO
         TqZJ7U4BYq1BY/6bhR7G68BvkUI0QdEs0PQy/KVFsOKhEwO3s4Oe50dFyh3r7aaQiS43
         Y+qWBY3RLDq6ZlEIQF1Q00L7Ks5LrChDnGx4tzXiIwkdgiUM5YJTc45m0QnVqdgv3j8l
         ZF1TUjoM18OeNBFK96mBX3AppdcduCTWzdd6DsTbuD3342lhss0reMxpDrAIWWvTeEvl
         PfUg==
X-Forwarded-Encrypted: i=1; AL+hErHeO6J8bKn8R3/olRXLDUAFyy8Hj0zvTAVSwjF4P3AV95TV8+ZHS5IcOf37n4EjV9gZ29nMFBqf32Mgn9iC@lists.infradead.org
X-Gm-Message-State: APuU4Z8mFF5XZWDFnD7BwT0F487h5mw4m+eBiP4FUFjjMQpzOizGDNL1
	tyFdn/HKCF/J+WfZqHV9k2b3dV3oMTlpGuIKZC29+xQHs6Z4TMYEb4Iy
X-Gm-Gg: AZFdTZf+Ndc2Xwp5pLKd57OE9f/0bt2is8qeCFBoDEKwwaDtcBl0tkp1hlfoZwhAoDH
	i7coCb6OwnXpBpQICF0sEYFBukPCUUzXoOxSIzRoDjxRbtZpainlkCIXBdGUv/Us7jGJT7b+NKq
	wlXwXyRsZdAdLD63hx6q7JVx0bd1Fka3jzyI3/jPZ+QPN9I/B+1NLJY4QKtz37Vrfev6gVXpAwm
	TB6kWtplFoYy3u86OMg51UJBan9kkWJlIHB/X5NMbWeK/SdeiMqFS9hCDwFmJPKnExzzm0JcCr/
	mdeyQi6/gwUXkHBhGlrnNlT7eEQuzvP3Gen0qQO8F5xPCqWMRXXMrRvEuncPfABP3dKadxOsA8m
	NzwayKvkDTmi6qxxT5Y8O1B+4y2OEeUvhpDYKYTYtCuclBEAekaj2fpcQ1x1lOKbTF3mA9djIO2
	X6xaEWooF+Zm+cA61SXsvjlKilqHjRyvF4XSSl11fD0W6vuSkyXlhlpIrNrbBN055pNTXT8tS67
	B4CESDPsfdIWMtg2j+B3jtFdPsxF8HvpuYs3GOSiiwKQecaDpS75xMmFugfSvEIWGFsXI5DNhYG
	f/z6x0Nu5KT4vNyFE8KQFNDcbIThLlziq8HVl9/8n6QKLA==
X-Received: by 2002:a05:600c:6219:b0:4bb:60b1:4409 with SMTP id 5b1f17b1804b1-4bb88816525mr432560755e9.19.1795721589007;
        Thu, 26 Nov 2026 11:33:09 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906cdcc1sm368287675e9.2.2026.11.26.11.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:33:08 -0800 (PST)
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
Subject: [PATCH v13 06/25] crypto: amlogic - Add MMIO helpers
Date: Thu, 26 Nov 2026 20:32:22 +0100
Message-ID: <20261126193241.1471372-7-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_113310_831385_B98557DA 
X-CRM114-Status: GOOD (  14.20  )
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

Add MMIO access helpers: meson_dma_start() and meson_dma_ready().

Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/crypto/amlogic/amlogic-gxl-cipher.c |  2 +-
 drivers/crypto/amlogic/amlogic-gxl-core.c   | 24 ++++++++++++++++-----
 drivers/crypto/amlogic/amlogic-gxl.h        |  2 ++
 3 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-cipher.c b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
index c458548f29b2..62aa82e1cb5d 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-cipher.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
@@ -234,7 +234,7 @@ static int meson_cipher(struct skcipher_request *areq)
 
 	reinit_completion(&mc->chanlist[flow].complete);
 	mc->chanlist[flow].status = 0;
-	writel(mc->chanlist[flow].t_phy | 2, mc->base + ((mc->pdata->descs_reg + flow) << 2));
+	meson_dma_start(mc, flow);
 	wait_for_completion_interruptible_timeout(&mc->chanlist[flow].complete,
 						  msecs_to_jiffies(500));
 	if (mc->chanlist[flow].status == 0) {
diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index 37224d75edfb..b972df44e8b5 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -22,18 +22,32 @@
 
 #include "amlogic-gxl.h"
 
+void meson_dma_start(struct meson_dev *mc, int flow)
+{
+	u32 offset = (mc->pdata->descs_reg + flow) << 2;
+
+	writel(mc->chanlist[flow].t_phy | 2, mc->base + offset);
+}
+
+static bool meson_dma_ready(struct meson_dev *mc, int flow)
+{
+	u32 offset = (mc->pdata->status_reg + flow) << 2;
+	u32 data = readl(mc->base + offset);
+
+	if (data)
+		writel_relaxed(0xF, mc->base + offset);
+
+	return data;
+}
+
 static irqreturn_t meson_irq_handler(int irq, void *data)
 {
 	struct meson_dev *mc = (struct meson_dev *)data;
 	int flow;
-	u32 p;
 
 	for (flow = 0; flow < mc->flow_cnt; flow++) {
 		if (mc->chanlist[flow].irq == irq) {
-			p = readl(mc->base + ((mc->pdata->status_reg + flow) << 2));
-			if (p) {
-				writel_relaxed(0xF, mc->base +
-					      ((mc->pdata->status_reg + flow) << 2));
+			if (meson_dma_ready(mc, flow)) {
 				mc->chanlist[flow].status = 1;
 				complete(&mc->chanlist[flow].complete);
 				return IRQ_HANDLED;
diff --git a/drivers/crypto/amlogic/amlogic-gxl.h b/drivers/crypto/amlogic/amlogic-gxl.h
index 5149dc6e9f60..64f2f0e63f12 100644
--- a/drivers/crypto/amlogic/amlogic-gxl.h
+++ b/drivers/crypto/amlogic/amlogic-gxl.h
@@ -159,6 +159,8 @@ struct meson_alg_template {
 #endif
 };
 
+void meson_dma_start(struct meson_dev *mc, int flow);
+
 int meson_aes_setkey(struct crypto_skcipher *tfm, const u8 *key,
 		     unsigned int keylen);
 int meson_cipher_init(struct crypto_tfm *tfm);
-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
