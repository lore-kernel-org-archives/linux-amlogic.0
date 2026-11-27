Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49437606A31C
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Nov 2026 12:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ojRFpzza;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=Cj+d8itc;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EaFT/xPk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SrVmqTAYEv3ekVC6h56EVk9w2PMv/aazl5vRMulBP9g=; b=ojRFpzza62DjAO0Ex3UhqnyGFb
	wZIT+JeyWS5AbVYPU6vUuIcWz2rFNEEkGqeUhUZfEuA6pSNauBAZoxlkNX3JgDR/pOUS1xTj+zB7r
	YcklZ5pYdPH0iqN5ojPv0JAndM0gQKs8Pkoan2n1AW/gp6gZLMNp0IqD6xX19YpZVYrQoQQUf8I0G
	zvoD3shI0xAuVwMG+h8IR6f00mCoWTYToA0fXXlccwOR9pjXbHxFmSomxclDNgsF9OWansPFp+An/
	vX+6iIeMzzkwYZRZJ+UMC7svpsD+ZaKOW1tFxDSaTvbomonF49eC291glYiE8daeIZPyTdYFrZF7C
	HogrCP/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWugo-0000000Fyr1-45R1;
	Fri, 27 Nov 2026 12:04:30 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuef-0000000Fx83-1cjy
	for linux-amlogic@bombadil.infradead.org;
	Fri, 27 Nov 2026 12:02:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=X5YVvV6vHMcU5kHSKr3HyFQG5tHJwE0SH4iS9jSSmfI=; b=Cj+d8itca8LDSvu8d25uQzBK4G
	6CQIiw+ps/KAjrZLhJHiqsIby06ACAJsDzO07TZUof281qn+ndCj6YuGz9+63sXEv4+EDBNbW2yx3
	MlxR07lIJDhvxnTCLzwhbmbcQkEh9dBXpAE1VyKYZQ5ocZe7dZ9a62wzoyAJ1uM63n1YDTJRZpZQ2
	8OkYQL7a/AzMUtZ0gAl+chgXRjHvaJrJqLOEaGM7eytDRxYcx4QTz4TbnjrjV/8mMAQku7UKsb0Ms
	wkdyh7LZlsUpADcme/R3i6pUVKxjYUFrVJt6OXcFjDmfsKk46DAHWuk4OW3rhbJkZrHtbNn1/kMPU
	dCr5fhOA==;
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuec-0000000C9Sd-0UtQ
	for linux-amlogic@lists.infradead.org;
	Fri, 27 Nov 2026 12:02:16 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so5432445f8f.3
        for <linux-amlogic@lists.infradead.org>; Fri, 27 Nov 2026 04:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795780928; x=1796385728; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X5YVvV6vHMcU5kHSKr3HyFQG5tHJwE0SH4iS9jSSmfI=;
        b=EaFT/xPk/RRm3z8b6IDh30R5hEisv0kUbZuzSwoCvVt2VPsdDVgR0xQLGiRnwtjWIH
         03YdhLkDowJLj9hChwUH0qN1JeJxMh8jDtFCxm8URUeDqZUMW+Ytq0amFFedkjQSDsIK
         JmJP5A6Zio0FkdPmRsjNhweGd7Yo0oMe1pW4kPSXv50FLK48YJLm0Vg2HjfIzgIpQFAx
         xq9pfBATRiwOhhoaRrj+wPgV8Z4ihqXOd+GLcAbW6R70hEZCXsaUqCUFlsJwi+zEX8vc
         OiDqhxltEAv5QZwkIkFaLsQja2Q4f3RfAL+GcbWybH0mnqgDFTYz9+JwKnxDjtdDZnH6
         tRcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780928; x=1796385728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X5YVvV6vHMcU5kHSKr3HyFQG5tHJwE0SH4iS9jSSmfI=;
        b=amZwjUaqmMGCL7GhxnQ1t/EJr5arTKAc3chxK/XlTQUM+AS2Pms7W3TzGggtqoZ6KP
         SnnWcG6Gh4dgQayWGXIwnRFd7MxaXIs3U4ur3ovII6YK4SET1sEHw5ETzuR7gkxECH0x
         Dv67dHgz2SyvMd0xgAyt+BwpJqpZrVTC2GxL2qjDOKTSpkzP80DUK02jWMjgbbl59bl4
         DhsLDzObHSsdO2RUIY8rVkOWrjAV0+QNuNbshdZiCpBZKRFz9zMbQwFAioLnXQ78nDuK
         9FNzTlmZtI9YcEj8eMg2ufsDnKIzp01UNbcahxGRgqjsoZrXPtaBge3jYoz2pDs9ZJh0
         /XfQ==
X-Forwarded-Encrypted: i=1; AL+hErH8KPKrJDnyiRjLjpa4jMCF/RML1rYoI8twGTDfODnRIQ/kmlllN4UQMUEsvjQGdH2kgNvExfR6VSutqu2r@lists.infradead.org
X-Gm-Message-State: APuU4Z+dd7cs4TKsRVgOW8nrBRRVriEfxhQB7JEpXNfblKUp6ccjILOG
	rni52O3QFIAA5XAL4Yop64ntd3L9O4xTObsiQB57NrIOQQ4wxQLUOf0w
X-Gm-Gg: AZFdTZfk6RdIW6KS/tNXwCXlNV/MfD20+mdobQ6AaAP9rvbsUIXQ2l+phdR+lPoLEOn
	OUfPvDxSGKMYqfZDPYl8Tl4ydGk3H+eW5UfcNmzR1Izr4mZmR/4XzhNFlEvhptYIIPFTOdvhe3f
	SRlXpZEurx9bmCW9YY9h9zQDGQR3loGduseoHBJ3vYr/aHJbXXRGnjQxOxA2s0LhemsYmpe30GD
	SdzXnFA3wJLsjJ16i37sEIFU5fce04F0TqyKR4PX2uthnBfpDie4fcnEfssZlM+JGOITV9nyILS
	rkr9YRvBqUdIjJcAZoB/bzpJpBGsOHOXqlZ1pF+WjMlkkNrSjR9JGI+LrnegN1GR/+R+ABUkwG/
	7mUajHPZNoec/sQCnXqE/N6P9zYC8AE+b659lRNLTeRpq6n12L4oL+Umqd3VVZqzs8VlU2E0T9U
	+8Rk7PLt9oSApwhZ3iiS7WnOMukCUcEonBACbaIOXEYKq10EP6gZcrhAn1XY6/DEZiiNBpi6AhM
	14jFZssdpDUgPjE3mNOA5C/DVSCqjliB1u7oLhepMAn8lFMuNmvuTlpOQZzITzG10knTPwhaXRu
	l3CC00TWByH63a9CvVu3HVf4QIwjNFOAEWBEPtEdnYuJi88=
X-Received: by 2002:a05:600c:848a:b0:4a1:fbd2:f689 with SMTP id 5b1f17b1804b1-4bb8880993amr464473645e9.7.1795780927493;
        Fri, 27 Nov 2026 04:02:07 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm393684565e9.0.2026.11.27.04.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:02:06 -0800 (PST)
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
	Jose Nieto <jnieto.alaber@gmail.com>
Subject: [PATCH v14 27/30] crypto: amlogic: fix probe and algorithm registration error paths
Date: Fri, 27 Nov 2026 13:01:00 +0100
Message-ID: <20261127120103.1532882-28-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127120103.1532882-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
 <20261127120103.1532882-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_120214_225047_1B1EEB5A 
X-CRM114-Status: GOOD (  11.82  )
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

Fix error-path issues found during review:

  - meson_allocate_chanlist(): propagate a negative platform_irq_count()
    (e.g. -EPROBE_DEFER) instead of replacing it with -ENODEV, and unwind
    the
    channels already allocated when getting or requesting an IRQ fails.
  - meson_register_algs(): clear algs[i].mc before calling
    meson_unregister_algs(), so the entry that just failed to register is
    not
    unregistered again.

Signed-off-by: Jose Nieto <jnieto.alaber@gmail.com>
---
 drivers/crypto/amlogic/amlogic-gxl-core.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index 8ce3f6640753..c11d7d8250ea 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -106,7 +106,9 @@ static int meson_allocate_chanlist(struct meson_dev *mc)
 	int i, err;
 
 	mc->flow_cnt = platform_irq_count(pdev);
-	if (mc->flow_cnt <= 0) {
+	if (mc->flow_cnt < 0)
+		return mc->flow_cnt;
+	if (mc->flow_cnt == 0) {
 		dev_err(mc->dev, "No IRQs defined\n");
 		return -ENODEV;
 	}
@@ -117,14 +119,18 @@ static int meson_allocate_chanlist(struct meson_dev *mc)
 
 	for (i = 0; i < mc->flow_cnt; i++) {
 		mc->chanlist[i].irq = platform_get_irq(pdev, i);
-		if (mc->chanlist[i].irq < 0)
-			return mc->chanlist[i].irq;
+		if (mc->chanlist[i].irq < 0) {
+			err = mc->chanlist[i].irq;
+			i--;
+			goto error_engine;
+		}
 
 		err = devm_request_irq(mc->dev, mc->chanlist[i].irq,
 				       meson_irq_handler, 0, "aml-crypto", mc);
 		if (err < 0) {
 			dev_err(mc->dev, "Cannot request IRQ for flow %d\n", i);
-			return err;
+			i--;
+			goto error_engine;
 		}
 
 		init_completion(&mc->chanlist[i].complete);
@@ -169,6 +175,7 @@ int meson_register_algs(struct meson_dev *mc, struct meson_alg_template *algs,
 			if (err) {
 				dev_err(mc->dev, "Fail to register %s\n",
 					algs[i].alg.skcipher.base.base.cra_name);
+				algs[i].mc = NULL;
 				meson_unregister_algs(mc, algs, count);
 				return err;
 			}
@@ -178,6 +185,7 @@ int meson_register_algs(struct meson_dev *mc, struct meson_alg_template *algs,
 			if (err) {
 				dev_err(mc->dev, "Fail to register %s\n",
 					algs[i].alg.ahash.base.halg.base.cra_name);
+				algs[i].mc = NULL;
 				meson_unregister_algs(mc, algs, count);
 				return err;
 			}
-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
