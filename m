Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 895E4C5478C
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 Mar 2024 13:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EaDEHuSJ8OOoeEqwSMaW9U71wWRLxgSyGegV33lwF9Y=; b=15obmePcKxXSEf
	nkb9Mo+FLZe3wwYATXd9VgDK5vwIX/udZNguCOJoPUGt7TIsLPmWH2cAhDe74cb9PD/8DOWEFW7XG
	rfQYmeENqbpLDsMYOrAUnpxEjCjFV1q2WEpB9ExpQGbEeEop0RdtdKY4fNvWVwuv03lljlhizRTjY
	B+nVuOfPGlJPFzq9H7snfEekaNwxf6d6BmW8hxsHgDqnaRrKbhM2b+cMi857Vu9DJ5P7GFFAzMqII
	deIFevipBsKN13r+2de0PcTz1aWdjQyCYeFhsfcbgoezEVvfe3PjvWdvicn/DAKKQu52jI24M+F0S
	t8QrGkLGjVbFrZObjZOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg36D-00000000Xy7-1maz;
	Fri, 01 Mar 2024 13:38:53 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg2xr-00000000Sj5-3qCp;
	Fri, 01 Mar 2024 13:30:18 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 881251200EB;
	Fri,  1 Mar 2024 16:30:14 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 881251200EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1709299814;
	bh=dQ01oRVGfEJqjYNQJh4GaJxFBVkR+Mts0Li2EykQaT4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=MaeG1M5RB3C5ETXnwOxpdm2KY5Hk9cOXhwAo8Sq8NngzP23pGUVv5x1+Z/ITAgR2G
	 74lDtm2CfOm7LdNHXpqwkJYOyQz84bNjm4xTcn6+rfnZyd4e/H9T64FGu0qYel5256
	 vgIq2UHh4LoHAzO/+KI6s4ifAR4eVXlBxVBP37MA6aywYdZYD7jbMuIRrHMqYDthCZ
	 1rAJ2KOvK0S6YzPBifKtYxmjaWKEY9T7ctqIB5R/8EcpYJMz6ApLKfqpOGSEa6FPJA
	 6ig9gc3dYUR9vwHlWw/qLodKiWEQHpQhoulpJBMtnpnVFCoaFHkYBNUi09z0FLSeNg
	 TJaxRkJkRxqNw==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Fri,  1 Mar 2024 16:30:14 +0300 (MSK)
Received: from user-A520M-DS3H.sigma.sbrf.ru (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 1 Mar 2024 16:30:13 +0300
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
Subject: [PATCH v5 10/21] drivers: crypto: meson: avoid kzalloc in engine thread
Date: Fri, 1 Mar 2024 16:29:25 +0300
Message-ID: <20240301132936.621238-11-avromanov@salutedevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240301132936.621238-1-avromanov@salutedevices.com>
References: <20240301132936.621238-1-avromanov@salutedevices.com>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 183875 [Feb 29 2024]
X-KSMG-AntiSpam-Version: 6.1.0.3
X-KSMG-AntiSpam-Envelope-From: avromanov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 7 0.3.7 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a, {Tracking_from_domain_doesnt_match_to}, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/02/29 19:21:00 #23899999
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_053016_389791_3638BB19 
X-CRM114-Status: GOOD (  16.21  )
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
 drivers/crypto/amlogic/amlogic-gxl-cipher.c | 26 ++++++++-------------
 drivers/crypto/amlogic/amlogic-gxl.h        |  6 ++---
 2 files changed, 13 insertions(+), 19 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-cipher.c b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
index a71b133a9e9a..8b8f79f08d6e 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-cipher.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
@@ -91,7 +91,6 @@ struct cipher_ctx {
 	struct skcipher_request *areq;
 	struct scatterlist *src_sg;
 	struct scatterlist *dst_sg;
-	void *bkeyiv;
 
 	unsigned int src_offset;
 	unsigned int dst_offset;
@@ -156,8 +155,7 @@ static void meson_setup_keyiv_descs(struct cipher_ctx *ctx)
 		return;
 
 	if (blockmode == DESC_OPMODE_CBC) {
-		memcpy(ctx->bkeyiv + AES_MAX_KEY_SIZE, ctx->areq->iv, ivsize);
-		ctx->keyiv.len = AES_MAX_KEY_SIZE + ivsize;
+		memcpy(op->keyiv + AES_MAX_KEY_SIZE, ctx->areq->iv, ivsize);
 		dma_sync_single_for_device(mc->dev, ctx->keyiv.addr,
 					   ctx->keyiv.len, DMA_TO_DEVICE);
 	}
@@ -304,6 +302,7 @@ static int meson_cipher(struct skcipher_request *areq)
 		.dst_sg = areq->dst,
 		.cryptlen = areq->cryptlen,
 	};
+	unsigned int ivsize = crypto_skcipher_ivsize(tfm);
 	int err;
 
 	dev_dbg(mc->dev, "%s %s %u %x IV(%u) key=%u ctx.flow=%d\n", __func__,
@@ -319,16 +318,16 @@ static int meson_cipher(struct skcipher_request *areq)
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
@@ -366,8 +365,6 @@ static int meson_cipher(struct skcipher_request *areq)
 	meson_unmap_scatterlist(areq, mc);
 
 theend:
-	kfree_sensitive(ctx.bkeyiv);
-
 	return err;
 }
 
@@ -450,7 +447,6 @@ static void meson_cipher_exit(struct crypto_tfm *tfm)
 {
 	struct meson_cipher_tfm_ctx *op = crypto_tfm_ctx(tfm);
 
-	kfree_sensitive(op->key);
 	crypto_free_skcipher(op->fallback_tfm);
 }
 
@@ -474,11 +470,9 @@ static int meson_aes_setkey(struct crypto_skcipher *tfm, const u8 *key,
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
