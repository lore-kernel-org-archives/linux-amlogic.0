Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD069CD11DD
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Mar 2024 15:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IbciTk6gJv8ngX5y/foX29wGFDh4ETFF1ATwrn3rvbA=; b=I9WB+/zc+6feR5
	nS1I43RCiHaw+eaNoQ2/FTO2wbGWrQvrSHRJCPdg0eGMHEIUu7f7i3MZhgkOOp2nKHR2kl71vkhTw
	TuAVFEJIMBofDxtOi0j4UeO9TxoI+gLm8o0o0KY4FpRtLOcMNq2p0WLDSZvg2riiurFL9Z4R5fw8p
	dpo2yZhQpw4GQ/3gu6QbpbNMFwn0UqSaHanXNDKGY0ZtDWN3XofOOgZpDX0iDMgoMOJEuCX2h6W3U
	lN+XavJOCmJPOyNjsQPeLQBrhb/3/oxEReZ0fbR8aqdHtrJWf6Bfaz68PV6K4XO26fj1xhMI8Q/gM
	LISLtU2Mj/C5vESxl2LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp8oC-00000005C0t-0gMb;
	Tue, 26 Mar 2024 15:33:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp8nE-00000005BPS-2Z9U;
	Tue, 26 Mar 2024 15:32:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=w17gH1oRV6Qg3mPD1/yYHI6CN3MIlXWSBSlnp80fF3o=; b=f5UNZ5YdqcUVCe0C7gPtWVA8ua
	u0+bY52xS1ceSmwVAW0xAlqC/3PD2aQ6tRHdj8P3At4BbjW1gMHDKAlZIZxMT943ToKabp6lWCIY1
	1CRGGsm99YZzTvaPs1r/gwjynXNNfdzoovx154dxB0Xqoc/e9K+DRnZzR2ywmm22hqORL+E4gLtQA
	f9jkPCidKaRyqfBayr4zdPkKSKhwH0bBPFKRo6l9LZcVpGWqP5GhtGb3jg8sdM26ZlRYxR/is6UlD
	PXW8mzaf6Z851pqSI8vEq32YJ8G81sOKdNKkNHnWgh0diFrhEKwhBVQPmsAPeEgISCIAlqXovyJ8l
	skXbxBlQ==;
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp8nB-0000000HGYW-1YlS;
	Tue, 26 Mar 2024 15:32:51 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 239B012000E;
	Tue, 26 Mar 2024 18:32:48 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 239B012000E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1711467168;
	bh=w17gH1oRV6Qg3mPD1/yYHI6CN3MIlXWSBSlnp80fF3o=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=UZVor3Vdx2td/Yv8XeSMmRFaGBBr6qe8SHVYhr3R9O4WqHZPfuL5S+FDcjYDAdxgs
	 L5pokNvS7s8poBGghLTaMM3JuEqGHL8L7Ed0CR6Dq99fiB+EqVX/c5iJbQV7dUHjDm
	 f6s+Pmp1xhf97SerHbzJz9Kt+/lr21UUxt2fEL9F3PKnyqQEfvQdzS1RLygvxvABWL
	 fMrjDreUdMPnhTl3tZA35hFk79OewyvgDorl98FAB9mfc5PrOY5P0w0ppyN3oodPko
	 SMgi2xMupLQXL1en6orFWIWHmTC5tee3Ujt+cQRFsK677mqjfZJcHFm/5vGJEQEvl/
	 ZCk6KsPmpykQg==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Tue, 26 Mar 2024 18:32:47 +0300 (MSK)
Received: from user-A520M-DS3H.sigma.sbrf.ru (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 26 Mar 2024 18:32:47 +0300
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
Subject: [PATCH v6 10/23] drivers: crypto: meson: avoid kzalloc in engine thread
Date: Tue, 26 Mar 2024 18:32:06 +0300
Message-ID: <20240326153219.2915080-11-avromanov@salutedevices.com>
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
X-CRM114-CacheID: sfid-20240326_153249_671265_A0F9BC6D 
X-CRM114-Status: GOOD (  16.26  )
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

It makes no sense to allocate memory via kzalloc, we
can use static buffer, speedup data processing and
don't think about kfree() calls.

Signed-off-by: Alexey Romanov <avromanov@salutedevices.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/crypto/amlogic/amlogic-gxl-cipher.c | 28 ++++++++-------------
 drivers/crypto/amlogic/amlogic-gxl.h        |  6 ++---
 2 files changed, 14 insertions(+), 20 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-cipher.c b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
index 075be767ad06..62944190451a 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-cipher.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
@@ -91,7 +91,6 @@ struct cipher_ctx {
 	struct skcipher_request *areq;
 	struct scatterlist *src_sg;
 	struct scatterlist *dst_sg;
-	void *bkeyiv;
 
 	unsigned int src_offset;
 	unsigned int dst_offset;
@@ -157,7 +156,7 @@ static void meson_setup_keyiv_descs(struct cipher_ctx *ctx)
 		return;
 
 	if (blockmode == DESC_OPMODE_CBC) {
-		memcpy(ctx->bkeyiv + AES_MAX_KEY_SIZE, ctx->areq->iv, ivsize);
+		memcpy(op->keyiv + AES_MAX_KEY_SIZE, ctx->areq->iv, ivsize);
 		dma_sync_single_for_device(mc->dev, ctx->keyiv.addr,
 					   ctx->keyiv.len, DMA_TO_DEVICE);
 	}
@@ -304,6 +303,7 @@ static int meson_cipher(struct skcipher_request *areq)
 		.dst_sg = areq->dst,
 		.cryptlen = areq->cryptlen,
 	};
+	unsigned int ivsize = crypto_skcipher_ivsize(tfm);
 	int err;
 
 	dev_dbg(mc->dev, "%s %s %u %x IV(%u) key=%u ctx.flow=%d\n", __func__,
@@ -319,21 +319,21 @@ static int meson_cipher(struct skcipher_request *areq)
 	mc->chanlist[rctx->flow].stat_req++;
 #endif
 
-	ctx.bkeyiv = kzalloc(48, GFP_KERNEL | GFP_DMA);
-	if (!ctx.bkeyiv)
-		return -ENOMEM;
-
-	memcpy(ctx.bkeyiv, op->key, op->keylen);
 	ctx.keyiv.len = op->keylen;
 	if (ctx.keyiv.len == AES_KEYSIZE_192)
 		ctx.keyiv.len = AES_MAX_KEY_SIZE;
 
-	ctx.keyiv.addr = dma_map_single(mc->dev, ctx.bkeyiv, ctx.keyiv.len,
+	if (algt->blockmode == DESC_OPMODE_CBC) {
+		memcpy(op->keyiv + AES_MAX_KEY_SIZE, areq->iv, ivsize);
+		ctx.keyiv.len = AES_MAX_KEY_SIZE + ivsize;
+	}
+
+	ctx.keyiv.addr = dma_map_single(mc->dev, op->keyiv, ctx.keyiv.len,
 					DMA_TO_DEVICE);
 	err = dma_mapping_error(mc->dev, ctx.keyiv.addr);
 	if (err) {
 		dev_err(mc->dev, "Cannot DMA MAP KEY IV\n");
-		goto free_keyiv;
+		return err;
 	}
 
 	err = meson_map_scatterlist(areq, mc);
@@ -367,9 +367,6 @@ static int meson_cipher(struct skcipher_request *areq)
 unmap_keyiv:
 	dma_unmap_single(mc->dev, ctx.keyiv.addr, ctx.keyiv.len, DMA_TO_DEVICE);
 
-free_keyiv:
-	kfree_sensitive(ctx.bkeyiv);
-
 	return err;
 }
 
@@ -452,7 +449,6 @@ static void meson_cipher_exit(struct crypto_tfm *tfm)
 {
 	struct meson_cipher_tfm_ctx *op = crypto_tfm_ctx(tfm);
 
-	kfree_sensitive(op->key);
 	crypto_free_skcipher(op->fallback_tfm);
 }
 
@@ -476,11 +472,9 @@ static int meson_aes_setkey(struct crypto_skcipher *tfm, const u8 *key,
 		dev_dbg(mc->dev, "ERROR: Invalid keylen %u\n", keylen);
 		return -EINVAL;
 	}
-	kfree_sensitive(op->key);
+
+	memcpy(op->keyiv, key, keylen);
 	op->keylen = keylen;
-	op->key = kmemdup(key, keylen, GFP_KERNEL | GFP_DMA);
-	if (!op->key)
-		return -ENOMEM;
 
 	return crypto_skcipher_setkey(op->fallback_tfm, key, keylen);
 }
diff --git a/drivers/crypto/amlogic/amlogic-gxl.h b/drivers/crypto/amlogic/amlogic-gxl.h
index f3455babb52a..dc5218064f99 100644
--- a/drivers/crypto/amlogic/amlogic-gxl.h
+++ b/drivers/crypto/amlogic/amlogic-gxl.h
@@ -127,15 +127,15 @@ struct meson_cipher_req_ctx {
 
 /*
  * struct meson_cipher_tfm_ctx - context for a skcipher TFM
- * @key:		pointer to key data
+ * @keyiv:		key data
  * @keylen:		len of the key
  * @keymode:		The keymode(type and size of key) associated with this TFM
  * @mc:			pointer to the private data of driver handling this TFM
  * @fallback_tfm:	pointer to the fallback TFM
  */
 struct meson_cipher_tfm_ctx {
-	u32 *key;
-	u32 keylen;
+	u8 keyiv[AES_MAX_KEY_SIZE + AES_BLOCK_SIZE] ____cacheline_aligned;
+	u32 keylen ____cacheline_aligned;
 	u32 keymode;
 	struct meson_dev *mc;
 	struct crypto_skcipher *fallback_tfm;
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
