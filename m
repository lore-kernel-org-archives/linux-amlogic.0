Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5134606A327
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Nov 2026 19:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YAyeRKZ3;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LcudpX05
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1RdOzkaoJJlEoNEUTzIN7BFkczRrBjRvfHgEqRo4GyY=; b=YAyeRKZ3MtYggrcXS3p/na28PR
	fACElIy8z9Pvf7NrhnMJ7cv0pk8LoHCWH6p7UraoowmjHYNscVdJf+nkK5I57XuOSgdoYnDA58jyG
	KJesxiICHDa2QsY3Q3Ou2+D4WZ3n83WfUkg+A/do08NYN7TkSBKAKyHckqDO04qO3YTr7OdMbKhug
	6zxn7RmFAKSPVGkDnpvGY70N78km2tWc35jhSxaB4A/n5zkcNm3kzCscHupnBCbJIMsPpYt7xMps7
	sJH+sixHKYqJVcSJ+P0r5l5HA0v/TLgzbGrllO87DC5qd/dh1t5mIZdtLQIid8zs9xILEMJNhG2EL
	M+NIwg+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfDl-0000000EJri-34Pl;
	Thu, 26 Nov 2026 19:33:32 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfDV-0000000EJUa-2Q9k
	for linux-amlogic@lists.infradead.org;
	Thu, 26 Nov 2026 19:33:15 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so74410345e9.2
        for <linux-amlogic@lists.infradead.org>; Thu, 26 Nov 2026 11:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795721592; x=1796326392; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KMyqFUlA/AvT12hLb9IrqwnM+Bo9I2ifCE4zJcXn8o8=;
        b=LcudpX054MoWMWyTMD7mOEpFQp1yOlYiHfzj/aTiNMojfFY/Xx82HpJqCz5RSuV+DS
         Awx2ljixjYCED6BogERTqRCNP1vhXxkxUZh6MF+t7oWl+3j32OYQ9jqlQeJYhI6MYKbd
         ocxkDFejq+wmWYEEY+9SXIvJ83cSpu16cJU3PK1/GjqB+3fZtlaYdlkoGfi2CTjIR+Oh
         jFZ48Xfk/Jc5Camq+/6F/UTqLwUUuIuBtLA8v2tzn2o4SCou0OynfL+tLoxj8Kgq2W5T
         olQxc13WZy1A/ZYnCeWcfUo4uSyqWKBLkK9DymGv4QzjqmzXg2EkMe4iKRrIqQC3b4qQ
         AwCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795721592; x=1796326392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KMyqFUlA/AvT12hLb9IrqwnM+Bo9I2ifCE4zJcXn8o8=;
        b=lz39aD+OHM/iBDo1l1yJtjoZJJWn+P3z5FMgiMPRIpLYChPnK8HraZDKn1RIrXIGuP
         K6Fujnk/8mxMNArLTRNmnEBVQ/iZqqisaUMA/ZfQAAImFVs2r6hmHe+bTxGXvwtArpD+
         J4mqdUkG/zA8esHaZtdVZPWfZs3e6OUluTe9u1ISHlMHrKpBd/8PCUIoI/gjN4k8ea6h
         VP+G1gPwAZF234Cfe8obD3Yjz9Sb66O7vgRun5z6P6yiUIzAmHdhsFjeGY+FkVC5hyqK
         7sT+/7oTOddc/6zBd0i+ajrYi5590ss21zD9+GsTL5Bu00pRutDRkwgMzEBabcwrvbmE
         Z5bA==
X-Forwarded-Encrypted: i=1; AL+hErGsnzYhYeMc/BUFHIXFkE8iGrF1T/VtRP5bHNYAb7y7OeLNGyM/J4sJIGTlEkUBzqhO/5CHQ5JqaPrrNgi2@lists.infradead.org
X-Gm-Message-State: APuU4Z+YC94H0nnjsyBrOjxFR/BE/o53S4Qkrj/KZ5VB+8ejGddlpMTh
	JZeI53zt8IDMtGO/KLRoxfAH7aUEq4YR8vFCNXGaEXQv5BKPmGukMPnR
X-Gm-Gg: AZFdTZcbaDIMHXsOJVhId3Ee3+30o4m9ppniKhCoIaJ/RnBAf7UPJVmK90TtKbGV0cP
	utKsfUODAs+XRR9aeoJ+9jRlkL8qk9RHSyCWBB4XoVmMSSHYChwOUzqKTs2hAGuPvpWa3Fdlk67
	GXJkkrcZCvB31vfzOrry234rJBWMBsnHsqrNYD7S95oS0iFaDZitHZNKe0tcVJaNV/+Lzw89vDR
	ucUfKPj0EPfLV8JWN6GgtqOxsSs33LKdKx3lEYcZFCaouzG/vATxfhdfio8vyvRxcOzkfnlFv18
	I5pcGMcPv1KGXidIAd9qoOYQ3m5U+hfcUW4np86OY3eZXzyTMncyUwrMdIdWkxBmDaRjbbThu/j
	hcyGjmqzB0dG1+5e5fsPsJYyUvmKs4RYKgO8BwY2LOg+XuoEbxhXREoqYMbEosEE2Ilnwsb2nim
	OZ9lFDOHO7fmbLoIKPY/AZlCPoKCQOhOzK/olVXeDVYlWpsPV1a6VANQTX6SdbZMp+9fjxx77du
	QBbSBQgRIU8kUu58eRPZ22dHkjY1QZltVsbXXU7uGrna6jcxd5PeBCiSw+eI4x5AuZ9KXnGbWV5
	OQGTYNyJe4AaFZHG8OYTOQRrl+yxVeEhC1KKOBwPxem3Eg==
X-Received: by 2002:a05:600c:4e16:b0:4bb:6f77:1e35 with SMTP id 5b1f17b1804b1-4bb88810991mr475888005e9.21.1795721591813;
        Thu, 26 Nov 2026 11:33:11 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906cdcc1sm368287675e9.2.2026.11.26.11.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:33:11 -0800 (PST)
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
Subject: [PATCH v13 08/25] crypto: amlogic - Drop status field from meson_flow
Date: Thu, 26 Nov 2026 20:32:24 +0100
Message-ID: <20261126193241.1471372-9-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_113313_633641_F46906BE 
X-CRM114-Status: GOOD (  16.64  )
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

This field is used only to check for timeout. But there is more
convenient way to achive the same goal.

Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/crypto/amlogic/amlogic-gxl-cipher.c | 13 +++++++++----
 drivers/crypto/amlogic/amlogic-gxl-core.c   |  1 -
 drivers/crypto/amlogic/amlogic-gxl.h        |  2 --
 3 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-cipher.c b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
index f6c13d8fcb47..cd94296e4d9a 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-cipher.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
@@ -228,13 +228,18 @@ static int meson_cipher(struct skcipher_request *areq)
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
index 58d56f352dd6..81d0e8731ab1 100644
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
index e14cd5021add..cf07c5fbc5bf 100644
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
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
