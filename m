Return-Path: <SRS0=38i7=AS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE169C433DF
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jul 2020 06:34:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 878F020720
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jul 2020 06:34:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y4MnjGLC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ERbNMRDb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 878F020720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5V06KUaZGO7KCaivSI8CTIHznXNDuiQ99MDMG270pKU=; b=Y4MnjGLCPwLYX9+CX//fK3PBbx
	tqYrix91pJnVI5C2G/laZ38i0p4kUhl9SZq7JY+9jMRbkZWBkaFwz2Zwm8cWT74mTqGNrwB/J6acz
	YDbYmvVaogBXxL0lzepaYDOTYDLT41ecw+zmqZxK9oFYTtNHW16tQa6/vk+nXUaYNvAENXEIwPQJQ
	qsazqY+ePOSKoDxs8af3kFd/Nkco0XcdvTlC61JKs6my/JN5mxpIczoOwlqn1p66922wfsNOk7hKg
	PMLTyo1/f17btWkvjwz8xM34K7qYZ3C2bK+indGZLLUup9q7/21G0XKzTxLWA02nDUpEXKPvb23Q3
	sYIop6CA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jshB4-0002X6-9q; Tue, 07 Jul 2020 06:34:02 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jshAe-0002Jd-Th; Tue, 07 Jul 2020 06:33:42 +0000
Received: from e123331-lin.nice.arm.com (adsl-70.109.242.21.tellas.gr
 [109.242.21.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 91B132073E;
 Tue,  7 Jul 2020 06:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594103616;
 bh=5ijrrjpzgo0WG8TY0By4td30EhV6ZdQkXPkiQ7w/484=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ERbNMRDbiFoPlosxQPdL9ZFYCAgpUDy/dPbddOSPfeuLoRNcG6l/AsdZQDEzxeOlE
 R5P3Iyldn2i46eqcMx4NebAgg6/BgA/pE4L8qDJG7exNLCZd01tGMNws1lTnirKRCd
 Y2BdVQ3qQ2vw9l5tKEkEqHh74I64VKjhGGPxZ0zM=
From: Ard Biesheuvel <ardb@kernel.org>
To: linux-crypto@vger.kernel.org
Subject: [PATCH v4 08/13] crypto: chelsio - permit asynchronous skcipher as
 fallback
Date: Tue,  7 Jul 2020 09:31:58 +0300
Message-Id: <20200707063203.5018-9-ardb@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200707063203.5018-1-ardb@kernel.org>
References: <20200707063203.5018-1-ardb@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_023337_323076_3986D99F 
X-CRM114-Status: GOOD (  16.16  )
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
 =?UTF-8?q?Horia=20Geant=C4=83?= <horia.geanta@nxp.com>,
 Rohit Maheshwari <rohitm@chelsio.com>, Chen-Yu Tsai <wens@csie.org>,
 Corentin Labbe <clabbe@baylibre.com>, NXP Linux Team <linux-imx@nxp.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Vinay Kumar Yadav <vinay.yadav@chelsio.com>,
 Maxime Ripard <mripard@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, John Allen <john.allen@amd.com>,
 Tero Kristo <t-kristo@ti.com>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Even though the chelsio driver implements asynchronous versions of
cbc(aes) and xts(aes), the fallbacks it allocates are required to be
synchronous. Given that SIMD based software implementations are usually
asynchronous as well, even though they rarely complete asynchronously
(this typically only happens in cases where the request was made from
softirq context, while SIMD was already in use in the task context that
it interrupted), these implementations are disregarded, and either the
generic C version or another table based version implemented in assembler
is selected instead.

Since falling back to synchronous AES is not only a performance issue, but
potentially a security issue as well (due to the fact that table based AES
is not time invariant), let's fix this, by allocating an ordinary skcipher
as the fallback, and invoke it with the completion routine that was given
to the outer request.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/crypto/chelsio/chcr_algo.c   | 57 ++++++++------------
 drivers/crypto/chelsio/chcr_crypto.h |  3 +-
 2 files changed, 25 insertions(+), 35 deletions(-)

diff --git a/drivers/crypto/chelsio/chcr_algo.c b/drivers/crypto/chelsio/chcr_algo.c
index 4c2553672b6f..a6625b90fb1a 100644
--- a/drivers/crypto/chelsio/chcr_algo.c
+++ b/drivers/crypto/chelsio/chcr_algo.c
@@ -690,26 +690,22 @@ static int chcr_sg_ent_in_wr(struct scatterlist *src,
 	return min(srclen, dstlen);
 }
 
-static int chcr_cipher_fallback(struct crypto_sync_skcipher *cipher,
-				u32 flags,
-				struct scatterlist *src,
-				struct scatterlist *dst,
-				unsigned int nbytes,
+static int chcr_cipher_fallback(struct crypto_skcipher *cipher,
+				struct skcipher_request *req,
 				u8 *iv,
 				unsigned short op_type)
 {
+	struct chcr_skcipher_req_ctx *reqctx = skcipher_request_ctx(req);
 	int err;
 
-	SYNC_SKCIPHER_REQUEST_ON_STACK(subreq, cipher);
-
-	skcipher_request_set_sync_tfm(subreq, cipher);
-	skcipher_request_set_callback(subreq, flags, NULL, NULL);
-	skcipher_request_set_crypt(subreq, src, dst,
-				   nbytes, iv);
+	skcipher_request_set_tfm(&reqctx->fallback_req, cipher);
+	skcipher_request_set_callback(&reqctx->fallback_req, req->base.flags,
+				      req->base.complete, req->base.data);
+	skcipher_request_set_crypt(&reqctx->fallback_req, req->src, req->dst,
+				   req->cryptlen, iv);
 
-	err = op_type ? crypto_skcipher_decrypt(subreq) :
-		crypto_skcipher_encrypt(subreq);
-	skcipher_request_zero(subreq);
+	err = op_type ? crypto_skcipher_decrypt(&reqctx->fallback_req) :
+			crypto_skcipher_encrypt(&reqctx->fallback_req);
 
 	return err;
 
@@ -924,11 +920,11 @@ static int chcr_cipher_fallback_setkey(struct crypto_skcipher *cipher,
 {
 	struct ablk_ctx *ablkctx = ABLK_CTX(c_ctx(cipher));
 
-	crypto_sync_skcipher_clear_flags(ablkctx->sw_cipher,
+	crypto_skcipher_clear_flags(ablkctx->sw_cipher,
 				CRYPTO_TFM_REQ_MASK);
-	crypto_sync_skcipher_set_flags(ablkctx->sw_cipher,
+	crypto_skcipher_set_flags(ablkctx->sw_cipher,
 				cipher->base.crt_flags & CRYPTO_TFM_REQ_MASK);
-	return crypto_sync_skcipher_setkey(ablkctx->sw_cipher, key, keylen);
+	return crypto_skcipher_setkey(ablkctx->sw_cipher, key, keylen);
 }
 
 static int chcr_aes_cbc_setkey(struct crypto_skcipher *cipher,
@@ -1206,13 +1202,8 @@ static int chcr_handle_cipher_resp(struct skcipher_request *req,
 				      req);
 		memcpy(req->iv, reqctx->init_iv, IV);
 		atomic_inc(&adap->chcr_stats.fallback);
-		err = chcr_cipher_fallback(ablkctx->sw_cipher,
-				     req->base.flags,
-				     req->src,
-				     req->dst,
-				     req->cryptlen,
-				     req->iv,
-				     reqctx->op);
+		err = chcr_cipher_fallback(ablkctx->sw_cipher, req, req->iv,
+					   reqctx->op);
 		goto complete;
 	}
 
@@ -1341,11 +1332,7 @@ static int process_cipher(struct skcipher_request *req,
 		chcr_cipher_dma_unmap(&ULD_CTX(c_ctx(tfm))->lldi.pdev->dev,
 				      req);
 fallback:       atomic_inc(&adap->chcr_stats.fallback);
-		err = chcr_cipher_fallback(ablkctx->sw_cipher,
-					   req->base.flags,
-					   req->src,
-					   req->dst,
-					   req->cryptlen,
+		err = chcr_cipher_fallback(ablkctx->sw_cipher, req,
 					   subtype ==
 					   CRYPTO_ALG_SUB_TYPE_CTR_RFC3686 ?
 					   reqctx->iv : req->iv,
@@ -1486,14 +1473,15 @@ static int chcr_init_tfm(struct crypto_skcipher *tfm)
 	struct chcr_context *ctx = crypto_skcipher_ctx(tfm);
 	struct ablk_ctx *ablkctx = ABLK_CTX(ctx);
 
-	ablkctx->sw_cipher = crypto_alloc_sync_skcipher(alg->base.cra_name, 0,
+	ablkctx->sw_cipher = crypto_alloc_skcipher(alg->base.cra_name, 0,
 				CRYPTO_ALG_NEED_FALLBACK);
 	if (IS_ERR(ablkctx->sw_cipher)) {
 		pr_err("failed to allocate fallback for %s\n", alg->base.cra_name);
 		return PTR_ERR(ablkctx->sw_cipher);
 	}
 	init_completion(&ctx->cbc_aes_aio_done);
-	crypto_skcipher_set_reqsize(tfm, sizeof(struct chcr_skcipher_req_ctx));
+	crypto_skcipher_set_reqsize(tfm, sizeof(struct chcr_skcipher_req_ctx) +
+					 crypto_skcipher_reqsize(ablkctx->sw_cipher));
 
 	return chcr_device_init(ctx);
 }
@@ -1507,13 +1495,14 @@ static int chcr_rfc3686_init(struct crypto_skcipher *tfm)
 	/*RFC3686 initialises IV counter value to 1, rfc3686(ctr(aes))
 	 * cannot be used as fallback in chcr_handle_cipher_response
 	 */
-	ablkctx->sw_cipher = crypto_alloc_sync_skcipher("ctr(aes)", 0,
+	ablkctx->sw_cipher = crypto_alloc_skcipher("ctr(aes)", 0,
 				CRYPTO_ALG_NEED_FALLBACK);
 	if (IS_ERR(ablkctx->sw_cipher)) {
 		pr_err("failed to allocate fallback for %s\n", alg->base.cra_name);
 		return PTR_ERR(ablkctx->sw_cipher);
 	}
-	crypto_skcipher_set_reqsize(tfm, sizeof(struct chcr_skcipher_req_ctx));
+	crypto_skcipher_set_reqsize(tfm, sizeof(struct chcr_skcipher_req_ctx) +
+				    crypto_skcipher_reqsize(ablkctx->sw_cipher));
 	return chcr_device_init(ctx);
 }
 
@@ -1523,7 +1512,7 @@ static void chcr_exit_tfm(struct crypto_skcipher *tfm)
 	struct chcr_context *ctx = crypto_skcipher_ctx(tfm);
 	struct ablk_ctx *ablkctx = ABLK_CTX(ctx);
 
-	crypto_free_sync_skcipher(ablkctx->sw_cipher);
+	crypto_free_skcipher(ablkctx->sw_cipher);
 }
 
 static int get_alg_config(struct algo_param *params,
diff --git a/drivers/crypto/chelsio/chcr_crypto.h b/drivers/crypto/chelsio/chcr_crypto.h
index b3fdbdc25acb..55a6631cdbee 100644
--- a/drivers/crypto/chelsio/chcr_crypto.h
+++ b/drivers/crypto/chelsio/chcr_crypto.h
@@ -171,7 +171,7 @@ static inline struct chcr_context *h_ctx(struct crypto_ahash *tfm)
 }
 
 struct ablk_ctx {
-	struct crypto_sync_skcipher *sw_cipher;
+	struct crypto_skcipher *sw_cipher;
 	__be32 key_ctx_hdr;
 	unsigned int enckey_len;
 	unsigned char ciph_mode;
@@ -305,6 +305,7 @@ struct chcr_skcipher_req_ctx {
 	u8 init_iv[CHCR_MAX_CRYPTO_IV_LEN];
 	u16 txqidx;
 	u16 rxqidx;
+	struct skcipher_request fallback_req;	// keep at the end
 };
 
 struct chcr_alg_template {
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
