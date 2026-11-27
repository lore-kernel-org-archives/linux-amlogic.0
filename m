Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87C1606A31E
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Nov 2026 12:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tspXZ2/K;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SuHgiyv2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1ts3juziLBqRkXWjipE0OAXu2tdkT6W6yGKdS7211d0=; b=tspXZ2/KJe3DYGXDV4/EHLV/tL
	5xE1Ir7mhuzB7EtMw4AH/QaF3s8Bbs7stiZj1mmmTGavIHaNF31lFJGWgAYPc5WXFaBoHmcptnb2y
	VTp4EA115CvI5qu19CInqeYY/lM0giSLkiyf8O6GlhaPfGatoW7eRw5lC65hDw3VHKAGj81tVCA/9
	+D+4VpBoVlpRbJOqCiYf7llQsCo86wDA+6LNgoSl5+d29+lHs4zDRZRv13Di4w7H997lXqLJeWdvS
	kavAvmCYafXygK8qkqMrkXaLJmo5ZNbMQuSxFvumtlsjHVHsbVr2barfUDDTDHkxW1M4FxcMhzykn
	ORM/1RRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWueF-0000000FwRz-1wMW;
	Fri, 27 Nov 2026 12:01:51 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWudp-0000000Fw4Y-12oE
	for linux-amlogic@lists.infradead.org;
	Fri, 27 Nov 2026 12:01:27 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so62456525e9.2
        for <linux-amlogic@lists.infradead.org>; Fri, 27 Nov 2026 04:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795780883; x=1796385683; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GbFTXgWz4qbUUEtYKh+mkh290tQbhLkX/pW25drgstk=;
        b=SuHgiyv2cJ21sz3EWxmWIakZJQFi8k6dCThjA4hcKq9KoUkL65vAjv5pAuqHrSUwmp
         4SCvl3WEbxshX+2FhK+KuiZSwGy6J7sHYaqwvK0NKiSI7Cb2NvqwpIkam9MvedAYzoSx
         tUYq9W9uzHFwYeN8qDu0mvcJLozPC4DRRVpq5wWlyhV5Pfw/jahkujHZkL9eliym9TSA
         YCl2/eiWCfY4voWNkMLa+ayM7QrzTAr6Xgz21TxAu7AWnBw4X9YovqUFq46kj51Prud5
         AgmMRRWKYvrCEr2ULEtOsPdutIOuYjEl9s0LVaOff4nzt80m61BKx9MPSq7tpWxbyjsQ
         HE9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780883; x=1796385683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GbFTXgWz4qbUUEtYKh+mkh290tQbhLkX/pW25drgstk=;
        b=hIUobDsesdIXF61JbfY3JSjqDzQX3lVTnD651VvUy+jyHu8x2Uj613cBDld0TBMPAa
         BYvzjA9Ino0nlVBIvxOHPLJELUn/wvWV4ZEk6gyCzs6CfABqSzjfML4WT2Kg7u8BPrN7
         mqfP1PyIWhBcEPoYD8mwzUFwwU476an0AOIFheLI/em790pzwrWPYjMeyTw61W0IhMND
         4FajoZTIvyeh9+KqHyyrtwnfG7lF6bJdQjZGElgaMkq3QGF/5bGFFu23t49b+l+BIiaS
         ukWZQ/n6BCGTXO/7xO0vnwmW8W6m5u9nqEOwtz+icFGpv0ioaHzM/id1E+Xvac8BulQq
         qISg==
X-Forwarded-Encrypted: i=1; AL+hErEhFGBTtulzUaKN2FQW1PvJKEdEmA0xWXlpKoq9M/gyFuD1lw5KzqlgUUjaVTwzFTXr+gDO71w8rZd8bD+h@lists.infradead.org
X-Gm-Message-State: APuU4Z8bWxWmU+JfrJ7dgOiRm4N/iR1rlWgF2qycbeP24KcYs5uDHYhX
	5zTqawyiYZ1Ktz0QP8Nz6aibYl03B/OCmGNZPexJnoyvWuuieP1TrCQH
X-Gm-Gg: AZFdTZc+5TfW91bZzoYDlC2NPgB+8M5FsbFE4yRbzPar5+Aq9RUs4pg18f7STwcjvQL
	CGoAFKOndCV4GIatqqlIrH9gcRLfbT5Obl7eca7R4bPG42Ny3/W4alwVdL1FIU+YJk3GKR5HRXc
	ztfy+MipVY7X+CBN7kExeV2vvw5/kmvuMC7f7mwsVyX3wPWR0rphM+RGbmBc776wfU/YkhupP4F
	2YupnJgtbyaDKKzSUfVGTBeThw+1XmqEWS2TMXAjUyZATlKeoyKGWOyjb5q+cKRjEyUk6LEpv9f
	7FBPzA/lnxXcVEudYGiVuYVMauz9pZfHvLwCIqIWLkKFwTHB2MKoyWDlG6ZulPRHDb3a6mFNOxL
	UEzmlN7Lrx2wn4AmnwPxZ3EuxmgjJ8iZaKRCgJW65TmdFSIZeABQ3shlp8G7vCd1YCynF38PIGg
	NElL6ZlQ1CbBwmUQu3MSVBEYUknvDSvDQpUUjTZf7RDJveZk6yTbvm5iLG39QgT5ufJvAhukV//
	gf8w9ksuluu9bcg5Vr9A1nh64XgzInzm0DfJWiU4RwEaQmDf4KZJbTu1djxIcPTArVmkUoudGKP
	/lcz5uEIoqRwklnQmX0LMLMYhu/xMVhpGUpiwC1mkJAl91g=
X-Received: by 2002:a05:600d:18:b0:4bb:9001:1aa with SMTP id 5b1f17b1804b1-4bb900102b8mr353961815e9.10.1795780882841;
        Fri, 27 Nov 2026 04:01:22 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm393684565e9.0.2026.11.27.04.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:01:21 -0800 (PST)
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
Subject: [PATCH v14 07/30] crypto: amlogic - Move get_engine_number()
Date: Fri, 27 Nov 2026 13:00:40 +0100
Message-ID: <20261127120103.1532882-8-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127120103.1532882-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
 <20261127120103.1532882-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_040125_309158_D1FC0A41 
X-CRM114-Status: GOOD (  10.22  )
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

Move get_engine_number() function from cipher.c to core.c

Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/crypto/amlogic/amlogic-gxl-cipher.c | 9 ++-------
 drivers/crypto/amlogic/amlogic-gxl-core.c   | 5 +++++
 drivers/crypto/amlogic/amlogic-gxl.h        | 2 ++
 3 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-cipher.c b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
index 62aa82e1cb5d..f6c13d8fcb47 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-cipher.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
@@ -17,11 +17,6 @@
 #include <crypto/internal/skcipher.h>
 #include "amlogic-gxl.h"
 
-static int get_engine_number(struct meson_dev *mc)
-{
-	return atomic_inc_return(&mc->flow) % mc->flow_cnt;
-}
-
 static bool meson_cipher_need_fallback(struct skcipher_request *areq)
 {
 	struct scatterlist *src_sg = areq->src;
@@ -297,7 +292,7 @@ int meson_skdecrypt(struct skcipher_request *areq)
 	rctx->op_dir = MESON_DECRYPT;
 	if (meson_cipher_need_fallback(areq))
 		return meson_cipher_do_fallback(areq);
-	e = get_engine_number(op->mc);
+	e = meson_get_engine_number(op->mc);
 	engine = op->mc->chanlist[e].engine;
 	rctx->flow = e;
 
@@ -315,7 +310,7 @@ int meson_skencrypt(struct skcipher_request *areq)
 	rctx->op_dir = MESON_ENCRYPT;
 	if (meson_cipher_need_fallback(areq))
 		return meson_cipher_do_fallback(areq);
-	e = get_engine_number(op->mc);
+	e = meson_get_engine_number(op->mc);
 	engine = op->mc->chanlist[e].engine;
 	rctx->flow = e;
 
diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index b972df44e8b5..58d56f352dd6 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -22,6 +22,11 @@
 
 #include "amlogic-gxl.h"
 
+int meson_get_engine_number(struct meson_dev *mc)
+{
+	return atomic_inc_return(&mc->flow) % mc->flow_cnt;
+}
+
 void meson_dma_start(struct meson_dev *mc, int flow)
 {
 	u32 offset = (mc->pdata->descs_reg + flow) << 2;
diff --git a/drivers/crypto/amlogic/amlogic-gxl.h b/drivers/crypto/amlogic/amlogic-gxl.h
index 64f2f0e63f12..e14cd5021add 100644
--- a/drivers/crypto/amlogic/amlogic-gxl.h
+++ b/drivers/crypto/amlogic/amlogic-gxl.h
@@ -159,6 +159,8 @@ struct meson_alg_template {
 #endif
 };
 
+int meson_get_engine_number(struct meson_dev *mc);
+
 void meson_dma_start(struct meson_dev *mc, int flow);
 
 int meson_aes_setkey(struct crypto_skcipher *tfm, const u8 *key,
-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
