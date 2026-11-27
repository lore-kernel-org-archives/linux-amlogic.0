Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A26606A31F
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Nov 2026 12:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JgC548Fj;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wcUOzkQh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ysATyzAxfG/7EQE9CLlB5Pj3T6X7Gd9Mh/FXQrhZTPY=; b=JgC548FjgipSn96Y8uddFGg9KM
	YpSdVOcnFzuTBxWdQfgmCNM2/lPQg7w4kdMLTMygGaihvkuTcjsbq5jldRb73b/Y42TaVD279dUl9
	kfz+T5Actl6MEvVGF3+4zgRvCR/rJOZLgMyqG7fl+f3gvrdPw9E1gMNEvwVJgB3ffYPNNP91manCM
	EgaPo5GXTJDXEcchHZ1/+9jahE3WH0VKO3q/bHy97//0bGt9YeMwwp/P5e7s2ewXNIByoUOTo2Lu6
	4JiTFTZRT6tS1rRnGKA4ZaPuejdUuwj+P1Z6B4Oc8dsK0sqdYBzB32oJmvwmMRrkIXCbikNDSRHoC
	GTDf3/AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWueC-0000000FwNT-3Vu0;
	Fri, 27 Nov 2026 12:01:48 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWudm-0000000Fw4T-2UVs
	for linux-amlogic@lists.infradead.org;
	Fri, 27 Nov 2026 12:01:25 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so102597075e9.1
        for <linux-amlogic@lists.infradead.org>; Fri, 27 Nov 2026 04:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795780881; x=1796385681; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4dPCbEZZdSDry+u4vUWC6GFpLLhoS8x3SOrFseRsQ00=;
        b=wcUOzkQhEQSHRpfCNtLMMEpvMxmfHkMtN2SwzJ8WwANr2DNtFefOv6oyNCS/TAZTKy
         ykaP8o+uM+jLKD3w8ryJxwqeWV5j24ztwvCGgyRyEeH5KpkHT5EbEvelwqx0YgN4uXcP
         HHMh38DxiQju0f1GsDwOgrLAK/miI1GCZ+lt/JYZk7Kps9MIz9Dt0ggjaIdurc5I8Kps
         LWcC/G4VhasOkjeqmAG7D0uebZz0vnePMfd/QLJ0yWGKFklVdFBzlnMnXMbzr+2NaHdc
         C+7rcbn7RCo5mPwziOl5wvYgrDTxgDSL45fEG4so3doEP6oxAHKCO8I85hKm7+0dlxLB
         0nuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780881; x=1796385681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4dPCbEZZdSDry+u4vUWC6GFpLLhoS8x3SOrFseRsQ00=;
        b=iiLa/TpJskVfBNeKt0PqphQ3zn4PpObkLkK6LAIXxDcLokP1WPxa7Je6wJyrX5xre4
         1kVjpj//Bt1bovUQptFNiPZwTJHYj6cJClLfBKycXyfrTCjaax4UpAJlF8ockJNz2qt/
         dF09SnD3T1mZ+70KxpB88dd+QPZZiFWcq9hedZmM1iQbIigdhgpM6LNXREHcIEnwVpVJ
         o37z6U2ivdGLjWftj7Ov1VckpOdYKULMNXyERxX2TThLMUfO9d5zDTAYeYiqhSBbhAfR
         yuFxOJGF8+FCbaKLNblhup4HdyaIcAKGAZW6vIdV2LnYkDPM8ShAP8p5G+UER6j21OWE
         cXZw==
X-Forwarded-Encrypted: i=1; AL+hErGE/TKg/n07mjO2pLSVlk+4ZEGk82QrtKqGCn4gKU3VBomEiaLKcYX5C23mHKnbEM7UHlNyvTtnqy/h8Fh8@lists.infradead.org
X-Gm-Message-State: APuU4Z9UjSa/e+jdpRo2yJKoNH2yFbnoE64gW7P1vHuDk3xLCPW/cAvZ
	1tiG14HsAWtnzqqSnzjqBrM2vQvyMv+4Pnrgmu3IpiSD90sZndiTLb6E
X-Gm-Gg: AZFdTZcNpWM8jVTdFUfZNiTV0mPEMCx5ol6aJOms8RWXtp18l+334wf7tAoheSRIkUJ
	GleMhYKsa+rtxOC7am11SApUCsGdwjErKM9MLf83kzJ4vIwD6j/z7yy6VjVfpEizMG0+PVQMBYn
	BoiG7pAKug4ckExF1wyh37BSDeweqQ8RuPq2NNlezoJX82ghZIL5VSLlaUH1RSiC0QZ5mCnPcg/
	YYLwZjdN10VxuWeVhz8bllTz53tmOge3EP/Ld6ATO+olJ3KbbnME1VF5mkHsWv7R5gX3LBZSwA8
	8+Hn5JfP0X5YkMb8yFDSugmwhxrEb0dwW+9MS1TzU2O0l1lpyRA7EoxMf2U9ybfv4s3vbK6Adbm
	MtwbFskFBtAkHbpBWZaYal06nLBdNpLNke1Xq9HFt1/iliGXS0KUwL3ma2VmXw4aA0ZDW9dAFrG
	F+CvnEU3W8oGg3PBgQiMyzVFtTYP2Y9GFD08PeVHDlp+D74WSmlsXZA+/w1ZaU3nwceN9Lsnf73
	TOoPMvSewFEo8LW7J4txqFQwrcQ1r/2O4izKTKI7wdxR91kFj7fxVwTlR4Al7jEfoE11IEa0UWD
	me1url120TpW3nPCKpDn8mBECJq4LwggTgFBw8QoREirJAf6QYV6GW17ZO7Xy8JrHWfy
X-Received: by 2002:a05:600c:e553:b0:4bb:9457:3c93 with SMTP id 5b1f17b1804b1-4bb94573c9amr293754675e9.2.1795780880469;
        Fri, 27 Nov 2026 04:01:20 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm393684565e9.0.2026.11.27.04.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:01:19 -0800 (PST)
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
Subject: [PATCH v14 06/30] crypto: amlogic - Add MMIO helpers
Date: Fri, 27 Nov 2026 13:00:39 +0100
Message-ID: <20261127120103.1532882-7-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127120103.1532882-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
 <20261127120103.1532882-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_040124_230802_B8C14B3E 
X-CRM114-Status: GOOD (  13.79  )
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
