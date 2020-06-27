Return-Path: <SRS0=1ECN=AI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFCFAC433DF
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Jun 2020 08:39:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83143207FC
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Jun 2020 08:39:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="S+8ERV57";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="tChlkpS2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83143207FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/22JntVhuW5TG7GnQQi3mh2OY1w4OglFpGDg+S7GgFk=; b=S+8ERV5762I7Ma0u5xALwekDM
	BAaKIcgDkTronMCn+mbJPHIAM6QCSukl3YYcMDHCRM0B/NYLVxH1aTvlCeH342GPjo2Gw1xgWORbE
	mbz9sgFmkL4GYLaVpomYM1itiFmfhKm+ELD4GxvLzq6lkrK+3PKvZ5Rh2xPoAhBjaVk0bnS5NaUOV
	hpOdfRyYLB3S2lMddmQIn1qJY2YxUkl+/LjOW8rl2Vw4sBvV7cUPhBWH2Kw6b235Tpx6dwSwXjg+l
	MbYQ/laYYWTTWcmEJ1gfuBuaDvZ8CvJLjvrRkXllsqFqT9IO6lVb00iB3R2mIgW2oxBZ/lrm0zljo
	GBbonvzmQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jp6Ma-00007z-8L; Sat, 27 Jun 2020 08:39:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jp6L8-0007ub-5H; Sat, 27 Jun 2020 08:37:35 +0000
Received: from dogfood.home (lfbn-nic-1-188-42.w2-15.abo.wanadoo.fr
 [2.15.37.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7A1202088E;
 Sat, 27 Jun 2020 08:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593247053;
 bh=zjbLkDlwCXNIbtATEiNU0StbDpQpMVzWqLK75QxxG/c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tChlkpS2IZp2KSfyxBkAGl1w2bjXvp7Og3a2jpgn2f0cYCmTNe5yV02fWcVAsYGqd
 8d6NLDuF1hX8C0c4eBP9z4LwQWazC9hHpHLzU9a6mJ7nNfhyRzhXi6Hpq0fW4/mChO
 C8VEqFA/cNoH6xF2wul2e05fVmZQcU8aCN1kIT5E=
From: Ard Biesheuvel <ardb@kernel.org>
To: linux-crypto@vger.kernel.org
Subject: [PATCH v2 13/13] crypto: mediatek - use AES library for GCM key
 derivation
Date: Sat, 27 Jun 2020 10:36:23 +0200
Message-Id: <20200627083623.2428333-14-ardb@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200627083623.2428333-1-ardb@kernel.org>
References: <20200627083623.2428333-1-ardb@kernel.org>
MIME-Version: 1.0
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Eric Biggers <ebiggers@google.com>,
 Corentin Labbe <clabbe.montjoie@gmail.com>,
 Ayush Sawal <ayush.sawal@chelsio.com>, Jamie Iles <jamie@jamieiles.com>,
 Fabio Estevam <festevam@gmail.com>, Ard Biesheuvel <ardb@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Rohit Maheshwari <rohitm@chelsio.com>, Chen-Yu Tsai <wens@csie.org>,
 NXP Linux Team <linux-imx@nxp.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Vinay Kumar Yadav <vinay.yadav@chelsio.com>,
 Maxime Ripard <mripard@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Tero Kristo <t-kristo@ti.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Mediatek accelerator driver calls into a dynamically allocated
skcipher of the ctr(aes) variety to perform GCM key derivation, which
involves AES encryption of a single block consisting of NUL bytes.

There is no point in using the skcipher API for this, so use the AES
library interface instead.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/crypto/Kconfig            |  3 +-
 drivers/crypto/mediatek/mtk-aes.c | 63 +++-----------------
 2 files changed, 9 insertions(+), 57 deletions(-)

diff --git a/drivers/crypto/Kconfig b/drivers/crypto/Kconfig
index 802b9ada4e9e..c8c3ebb248f8 100644
--- a/drivers/crypto/Kconfig
+++ b/drivers/crypto/Kconfig
@@ -756,10 +756,9 @@ config CRYPTO_DEV_ZYNQMP_AES
 config CRYPTO_DEV_MEDIATEK
 	tristate "MediaTek's EIP97 Cryptographic Engine driver"
 	depends on (ARM && ARCH_MEDIATEK) || COMPILE_TEST
-	select CRYPTO_AES
+	select CRYPTO_LIB_AES
 	select CRYPTO_AEAD
 	select CRYPTO_SKCIPHER
-	select CRYPTO_CTR
 	select CRYPTO_SHA1
 	select CRYPTO_SHA256
 	select CRYPTO_SHA512
diff --git a/drivers/crypto/mediatek/mtk-aes.c b/drivers/crypto/mediatek/mtk-aes.c
index 78d660d963e2..4ad3571ab6af 100644
--- a/drivers/crypto/mediatek/mtk-aes.c
+++ b/drivers/crypto/mediatek/mtk-aes.c
@@ -137,8 +137,6 @@ struct mtk_aes_gcm_ctx {
 
 	u32 authsize;
 	size_t textlen;
-
-	struct crypto_skcipher *ctr;
 };
 
 struct mtk_aes_drv {
@@ -996,17 +994,8 @@ static int mtk_aes_gcm_setkey(struct crypto_aead *aead, const u8 *key,
 			      u32 keylen)
 {
 	struct mtk_aes_base_ctx *ctx = crypto_aead_ctx(aead);
-	struct mtk_aes_gcm_ctx *gctx = mtk_aes_gcm_ctx_cast(ctx);
-	struct crypto_skcipher *ctr = gctx->ctr;
-	struct {
-		u32 hash[4];
-		u8 iv[8];
-
-		struct crypto_wait wait;
-
-		struct scatterlist sg[1];
-		struct skcipher_request req;
-	} *data;
+	u8 hash[AES_BLOCK_SIZE] __aligned(4) = {};
+	struct crypto_aes_ctx aes_ctx;
 	int err;
 
 	switch (keylen) {
@@ -1026,39 +1015,18 @@ static int mtk_aes_gcm_setkey(struct crypto_aead *aead, const u8 *key,
 
 	ctx->keylen = SIZE_IN_WORDS(keylen);
 
-	/* Same as crypto_gcm_setkey() from crypto/gcm.c */
-	crypto_skcipher_clear_flags(ctr, CRYPTO_TFM_REQ_MASK);
-	crypto_skcipher_set_flags(ctr, crypto_aead_get_flags(aead) &
-				  CRYPTO_TFM_REQ_MASK);
-	err = crypto_skcipher_setkey(ctr, key, keylen);
+	err = aes_expandkey(&aes_ctx, key, keylen);
 	if (err)
 		return err;
 
-	data = kzalloc(sizeof(*data) + crypto_skcipher_reqsize(ctr),
-		       GFP_KERNEL);
-	if (!data)
-		return -ENOMEM;
-
-	crypto_init_wait(&data->wait);
-	sg_init_one(data->sg, &data->hash, AES_BLOCK_SIZE);
-	skcipher_request_set_tfm(&data->req, ctr);
-	skcipher_request_set_callback(&data->req, CRYPTO_TFM_REQ_MAY_SLEEP |
-				      CRYPTO_TFM_REQ_MAY_BACKLOG,
-				      crypto_req_done, &data->wait);
-	skcipher_request_set_crypt(&data->req, data->sg, data->sg,
-				   AES_BLOCK_SIZE, data->iv);
-
-	err = crypto_wait_req(crypto_skcipher_encrypt(&data->req),
-			      &data->wait);
-	if (err)
-		goto out;
+	aes_encrypt(&aes_ctx, hash, hash);
+	memzero_explicit(&aes_ctx, sizeof(aes_ctx));
 
 	mtk_aes_write_state_le(ctx->key, (const u32 *)key, keylen);
-	mtk_aes_write_state_be(ctx->key + ctx->keylen, data->hash,
+	mtk_aes_write_state_be(ctx->key + ctx->keylen, (const u32 *)hash,
 			       AES_BLOCK_SIZE);
-out:
-	kzfree(data);
-	return err;
+
+	return 0;
 }
 
 static int mtk_aes_gcm_setauthsize(struct crypto_aead *aead,
@@ -1095,32 +1063,17 @@ static int mtk_aes_gcm_init(struct crypto_aead *aead)
 {
 	struct mtk_aes_gcm_ctx *ctx = crypto_aead_ctx(aead);
 
-	ctx->ctr = crypto_alloc_skcipher("ctr(aes)", 0,
-					 CRYPTO_ALG_ASYNC);
-	if (IS_ERR(ctx->ctr)) {
-		pr_err("Error allocating ctr(aes)\n");
-		return PTR_ERR(ctx->ctr);
-	}
-
 	crypto_aead_set_reqsize(aead, sizeof(struct mtk_aes_reqctx));
 	ctx->base.start = mtk_aes_gcm_start;
 	return 0;
 }
 
-static void mtk_aes_gcm_exit(struct crypto_aead *aead)
-{
-	struct mtk_aes_gcm_ctx *ctx = crypto_aead_ctx(aead);
-
-	crypto_free_skcipher(ctx->ctr);
-}
-
 static struct aead_alg aes_gcm_alg = {
 	.setkey		= mtk_aes_gcm_setkey,
 	.setauthsize	= mtk_aes_gcm_setauthsize,
 	.encrypt	= mtk_aes_gcm_encrypt,
 	.decrypt	= mtk_aes_gcm_decrypt,
 	.init		= mtk_aes_gcm_init,
-	.exit		= mtk_aes_gcm_exit,
 	.ivsize		= GCM_AES_IV_SIZE,
 	.maxauthsize	= AES_BLOCK_SIZE,
 
-- 
2.27.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
