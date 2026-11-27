Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D05606A324
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Nov 2026 12:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=T2RsjzT0;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zKoupADa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=r4HCh93g5KUWC69uCvtDU7oJtQIA2IOg/WhKYGH5Z1g=; b=T2RsjzT0B/nUggsIE4G8SvlcMq
	XoNZymlhv7yUE2ipcviRvDPdj/CuwdTIwHh9HHaCzzEKOMr5wtlbrMX0lehkfjCxiOQjVn/x42rJZ
	FKTFgqjC7ykUpB1XUadGwZ+7T4hTbOAW6p9vP29GGxhkb2n37ggteYmqEhaE9CVFuCIlWUeQNsCmB
	PXoP5UDbyyRxrRRjmZV58ChJCSuE+T5Uk4r8iycVkQA112pGFPjdR8G81r9tn4xJvMTY1E8AFw+vI
	sdDqQSKwXA2PVxjFAYCAVPp2Ie7HNByKm503ulLsddy8LuQu1CvXgxS+rPbvSBDn53RHwt3fE0Lyf
	e+PEq59g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWueN-0000000FwfB-14xm;
	Fri, 27 Nov 2026 12:01:59 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWudx-0000000FwB3-2OzO
	for linux-amlogic@lists.infradead.org;
	Fri, 27 Nov 2026 12:01:34 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso74320365e9.0
        for <linux-amlogic@lists.infradead.org>; Fri, 27 Nov 2026 04:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795780891; x=1796385691; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IoF64jnw/OxIgULPI43O4WtliYquxuYl5hRwBwB9SZc=;
        b=zKoupADaQitkp2d64spKe4BUphYl5bOB7Od+goOy5Uvb+QBk3ZbuxSpQ5iqrsPiO+/
         qcZjPNyKfOrHN0r56mR/RGh5uKVsgqAJMNjEc4djSdAFXze7eWmWghVw4F1qLmCj/LJN
         qDXamoEa6lwI4yNDxp387/DpYx23oxHaDH24QXd7OPC0PZtT1FsQOk3oNaqN93QNXqBs
         SqZJ2TmMl8yJWZ0u9Nl4bQHV4DJdDnt1d7tPZQMqIY7SBEzLgGe5mbibM0bskvSeewfr
         xr13UtD2TM4BPFB1d6xUGbsg6JbpTrIGwQVKzbsnLuvu7UsvKD0k6rT9p124uAB8kj0V
         IPRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780891; x=1796385691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IoF64jnw/OxIgULPI43O4WtliYquxuYl5hRwBwB9SZc=;
        b=hdS4+qM01LElnlnInn+gsSCnVs4pXx3wtujJQ0jI5O5I/6zK4DjUYr1sH5XhbaxSGJ
         MlGY+T/0xiF2Q/nbrapC7oC7CvFc7/BMLYgf55Xmz7BiQy8mr0mvfv4sEZQuZzMIl5i0
         X9HE/ETEytph9gHB5AaxG9bEFrN1lEkH5jc5anioFu3c+7p17dSecvs+e7ecOU+Lmvn9
         iVamGT2Kya7++EX7e/Py3lpKElJ+65XCv0cghY4+S98c59VTLag8niRE8emk0c+wZBsu
         SYPOqFJNgEEa1o5t8iiAj9cI46JDBLln5cB10MKQdL/jnWmsn9sE+WDmnDFO8h+DoeWv
         GdYw==
X-Forwarded-Encrypted: i=1; AL+hErGYLMJ8nCz8xtZ1HPuAHv6FsCPMe/S6PLyEyeL4S1+Znq81EgyU7SJynmIvuQTddfhT8i1o6DjntRt8dNS+@lists.infradead.org
X-Gm-Message-State: APuU4Z/jxLfgxPnEIkLbVtnt5tZkl5oiGNSQS1XbrYAPLr80QFczGIdK
	hGkKXEufifZLQIOI7NMK+BvYeEPciQPArCnY4f3sOCrEnuT2TXFZatkT
X-Gm-Gg: AZFdTZeAsLOIWykh0NP4KLwTLkWVRl3CLiopfC9vRDNaM3mwPtPOIxzfKB/lUujXBXK
	O51+gAly4QpR3bZO9CbgVE8gqKvqkj4RgC8K91fXejSfHPC92KuT+Brp4sgIWdqj8H9NNN4EgyN
	Se3LQ7wMKzKOmQKp2ZnqBK+HnWOppuA4zTAd7zoQ1DeA3O4JvXF8L1tNzbgyM6f95RjWAotz8di
	mePjGXbULNwgb1rSKJVVjW1roecVxAbnDnL+u4i6Bx1R5PB6lP2l1L+19rA2tFXx2Qn0iMQpXoX
	nh0sSmF+hUzedKmcs0MZbI20aVRVUJSGq6AqBA82ou7mRepE+ojZ5Uiyt31jiRN/lIrpNfe1tiP
	mGgfIHvNHBQ1E2NXRBhosuq+8EhXEUu0jXpg1K2xUh62aGZDXEVsQQiCPLhUwYiysHKwXYwQshA
	kxRo0Bm9/m2WVp/aCB3zBFWJRHcG79Homskp1L7zYVT3nejZ0hflnWX/k11Q6YL2Jz1abSQB1xA
	s3aVoH/NDPmYjw9NB/5ilHMrj0Tcvt2MxWX6ZzfXjJHYpnmvIOS8/j4hT5XpT1r1a6tjlmOexEY
	X1cKgBHAqbGAuY9v0MKbuexkhDbER04acnB01eyRfoRLjEo=
X-Received: by 2002:a05:600c:1911:b0:4a2:150f:1607 with SMTP id 5b1f17b1804b1-4bb8880a584mr492741765e9.13.1795780891427;
        Fri, 27 Nov 2026 04:01:31 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm393684565e9.0.2026.11.27.04.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:01:29 -0800 (PST)
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
Subject: [PATCH v14 10/30] crypto: amlogic - Cleanup defines
Date: Fri, 27 Nov 2026 13:00:43 +0100
Message-ID: <20261127120103.1532882-11-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127120103.1532882-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
 <20261127120103.1532882-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_040133_684178_04051D68 
X-CRM114-Status: GOOD (  13.01  )
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

It is bad to use hardcoded values directly in the code.

Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/crypto/amlogic/amlogic-gxl-cipher.c | 24 ++++++++++-----------
 drivers/crypto/amlogic/amlogic-gxl.h        | 16 ++++++++------
 2 files changed, 21 insertions(+), 19 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-cipher.c b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
index 00d3247ebea1..c17ce5cc70a8 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-cipher.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
@@ -141,8 +141,8 @@ static int meson_cipher(struct skcipher_request *areq)
 						 ivsize, 0);
 		}
 	}
-	if (keyivlen == 24)
-		keyivlen = 32;
+	if (keyivlen == AES_KEYSIZE_192)
+		keyivlen = AES_MAX_KEY_SIZE;
 
 	phykeyiv = dma_map_single(mc->dev, bkeyiv, keyivlen,
 				  DMA_TO_DEVICE);
@@ -161,7 +161,7 @@ static int meson_cipher(struct skcipher_request *areq)
 		todo = min(keyivlen - eat, 16u);
 		desc->t_src = cpu_to_le32(phykeyiv + i * 16);
 		desc->t_dst = cpu_to_le32(i * 16);
-		v = (MODE_KEY << 20) | DESC_OWN | 16;
+		v = DESC_MODE_KEY | DESC_OWN | 16;
 		desc->t_status = cpu_to_le32(v);
 
 		eat += todo;
@@ -214,7 +214,7 @@ static int meson_cipher(struct skcipher_request *areq)
 		desc->t_src = cpu_to_le32(sg_dma_address(src_sg));
 		desc->t_dst = cpu_to_le32(sg_dma_address(dst_sg));
 		todo = min(len, sg_dma_len(src_sg));
-		v = (op->keymode << 20) | DESC_OWN | todo | (algt->blockmode << 26);
+		v = op->keymode | DESC_OWN | todo | algt->blockmode;
 		if (rctx->op_dir)
 			v |= DESC_ENCRYPTION;
 		len -= todo;
@@ -363,14 +363,14 @@ static int meson_aes_setkey(struct crypto_skcipher *tfm, const u8 *key,
 	struct meson_dev *mc = op->mc;
 
 	switch (keylen) {
-	case 128 / 8:
-		op->keymode = MODE_AES_128;
+	case AES_KEYSIZE_128:
+		op->keymode = DESC_MODE_AES_128;
 		break;
-	case 192 / 8:
-		op->keymode = MODE_AES_192;
+	case AES_KEYSIZE_192:
+		op->keymode = DESC_MODE_AES_192;
 		break;
-	case 256 / 8:
-		op->keymode = MODE_AES_256;
+	case AES_KEYSIZE_256:
+		op->keymode = DESC_MODE_AES_256;
 		break;
 	default:
 		dev_dbg(mc->dev, "ERROR: Invalid keylen %u\n", keylen);
@@ -388,7 +388,7 @@ static int meson_aes_setkey(struct crypto_skcipher *tfm, const u8 *key,
 static struct meson_alg_template algs[] = {
 {
 	.type = CRYPTO_ALG_TYPE_SKCIPHER,
-	.blockmode = MESON_OPMODE_CBC,
+	.blockmode = DESC_OPMODE_CBC,
 	.alg.skcipher.base = {
 		.base = {
 			.cra_name = "cbc(aes)",
@@ -417,7 +417,7 @@ static struct meson_alg_template algs[] = {
 },
 {
 	.type = CRYPTO_ALG_TYPE_SKCIPHER,
-	.blockmode = MESON_OPMODE_ECB,
+	.blockmode = DESC_OPMODE_ECB,
 	.alg.skcipher.base = {
 		.base = {
 			.cra_name = "ecb(aes)",
diff --git a/drivers/crypto/amlogic/amlogic-gxl.h b/drivers/crypto/amlogic/amlogic-gxl.h
index 608ce75f027a..15b4335942d5 100644
--- a/drivers/crypto/amlogic/amlogic-gxl.h
+++ b/drivers/crypto/amlogic/amlogic-gxl.h
@@ -11,19 +11,21 @@
 #include <linux/crypto.h>
 #include <linux/scatterlist.h>
 
-#define MODE_KEY 1
-#define MODE_AES_128 0x8
-#define MODE_AES_192 0x9
-#define MODE_AES_256 0xa
-
 #define MESON_DECRYPT 0
 #define MESON_ENCRYPT 1
 
-#define MESON_OPMODE_ECB 0
-#define MESON_OPMODE_CBC 1
+#define DESC_MODE_KEY (0x1 << 20)
+#define DESC_MODE_AES_128 (0x8 << 20)
+#define DESC_MODE_AES_192 (0x9 << 20)
+#define DESC_MODE_AES_256 (0xa << 20)
 
 #define MAXDESC 64
 
+#define DESC_OPMODE_ECB (0 << 26)
+#define DESC_OPMODE_CBC (1 << 26)
+
+#define DESC_MAXLEN GENMASK(16, 0)
+
 #define DESC_LAST BIT(18)
 #define DESC_ENCRYPTION BIT(28)
 #define DESC_OWN BIT(31)
-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
