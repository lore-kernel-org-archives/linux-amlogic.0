Return-Path: <SRS0=Zj77=AG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8153FC433DF
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Jun 2020 12:45:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E569206BE
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Jun 2020 12:45:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jSGnMBlq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="K5OJzBeO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E569206BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BQCnR2PBnBz7C3qHjugMR0qdyc0fb3ZqoUAEPxd+VbA=; b=jSGnMBlqxKBU7F/OkKyV++mRt
	m4ThT8WmJf0OvLYo99GLElTiOI23ks+YDbgNH/9e5/7MoyXqwNHesNaJHcfLb8Coz70iyTtYw2cg5
	W2YHlqa3ojkEo+ozxVbGwgGIrVuOCYqJ11ahrYM3+tlpC5jrTbIjqwTfAzEvgFWpfX8KlyunVAlrU
	M+VGclYO0lkRlvYv+VmpsZoG6fAY/l4QOhx7Nkj4S32g184FlNsXxo6EavuB+lw+kMdA5aUdVFs3k
	dCccKAX9Gw9zdT8+NHslex9uucXeqOlGtv0ZAOP/LLlDlI7L9muQirLER0u5zyEoL9hygG4KZm2KZ
	d3cYaEJEw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1joRFJ-0005yu-IJ; Thu, 25 Jun 2020 12:44:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1joREW-0005Yi-Pz; Thu, 25 Jun 2020 12:44:01 +0000
Received: from localhost.localdomain (lfbn-nic-1-188-42.w2-15.abo.wanadoo.fr
 [2.15.37.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E74AF206BE;
 Thu, 25 Jun 2020 12:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593089039;
 bh=EGar2rBAa9p0EmyWbgXPPJUEijUxQLN5bxRPFqvMCTY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=K5OJzBeOcSUeDEjh1okj8bcq6cYB3aK/P15BeoB0ExprP8ihrPd4/QiHu2av34haO
 LGwjzQyxMbSVi+0oONIr1Y9J8CCRC+VnonTr2ZpX+Jx7RCbpw966/wF85BNNI45cba
 0AhJHLMGYhWrnW1LyTDga9/iRKcylC4lxBmDwPw4=
From: Ard Biesheuvel <ardb@kernel.org>
To: linux-crypto@vger.kernel.org
Subject: [PATCH 10/12] crypto: picoxcell - permit asynchronous skcipher as
 fallback
Date: Thu, 25 Jun 2020 14:42:51 +0200
Message-Id: <20200625124253.1906557-11-ardb@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200625124253.1906557-1-ardb@kernel.org>
References: <20200625124253.1906557-1-ardb@kernel.org>
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
Cc: Eric Biggers <ebiggers@google.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Jamie Iles <jamie@jamieiles.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 Rohit Maheshwari <rohitm@chelsio.com>, Fabio Estevam <festevam@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Vinay Kumar Yadav <vinay.yadav@chelsio.com>,
 Maxime Ripard <mripard@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Chen-Yu Tsai <wens@csie.org>, Corentin Labbe <clabbe.montjoie@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Ayush Sawal <ayush.sawal@chelsio.com>, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Even though the picoxcell driver implements asynchronous versions of
ecb(aes) and cbc(aes), the fallbacks it allocates are required to be
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
 drivers/crypto/picoxcell_crypto.c | 34 +++++++++++---------
 1 file changed, 19 insertions(+), 15 deletions(-)

diff --git a/drivers/crypto/picoxcell_crypto.c b/drivers/crypto/picoxcell_crypto.c
index 7384e91c8b32..eea75c7cbdf2 100644
--- a/drivers/crypto/picoxcell_crypto.c
+++ b/drivers/crypto/picoxcell_crypto.c
@@ -86,6 +86,7 @@ struct spacc_req {
 	dma_addr_t			src_addr, dst_addr;
 	struct spacc_ddt		*src_ddt, *dst_ddt;
 	void				(*complete)(struct spacc_req *req);
+	struct skcipher_request		fallback_req;	// keep at the end
 };
 
 struct spacc_aead {
@@ -158,7 +159,7 @@ struct spacc_ablk_ctx {
 	 * The fallback cipher. If the operation can't be done in hardware,
 	 * fallback to a software version.
 	 */
-	struct crypto_sync_skcipher	*sw_cipher;
+	struct crypto_skcipher		*sw_cipher;
 };
 
 /* AEAD cipher context. */
@@ -792,13 +793,13 @@ static int spacc_aes_setkey(struct crypto_skcipher *cipher, const u8 *key,
 		 * Set the fallback transform to use the same request flags as
 		 * the hardware transform.
 		 */
-		crypto_sync_skcipher_clear_flags(ctx->sw_cipher,
+		crypto_skcipher_clear_flags(ctx->sw_cipher,
 					    CRYPTO_TFM_REQ_MASK);
-		crypto_sync_skcipher_set_flags(ctx->sw_cipher,
+		crypto_skcipher_set_flags(ctx->sw_cipher,
 					  cipher->base.crt_flags &
 					  CRYPTO_TFM_REQ_MASK);
 
-		err = crypto_sync_skcipher_setkey(ctx->sw_cipher, key, len);
+		err = crypto_skcipher_setkey(ctx->sw_cipher, key, len);
 		if (err)
 			goto sw_setkey_failed;
 	}
@@ -900,7 +901,7 @@ static int spacc_ablk_do_fallback(struct skcipher_request *req,
 	struct crypto_tfm *old_tfm =
 	    crypto_skcipher_tfm(crypto_skcipher_reqtfm(req));
 	struct spacc_ablk_ctx *ctx = crypto_tfm_ctx(old_tfm);
-	SYNC_SKCIPHER_REQUEST_ON_STACK(subreq, ctx->sw_cipher);
+	struct spacc_req *dev_req = skcipher_request_ctx(req);
 	int err;
 
 	/*
@@ -908,13 +909,13 @@ static int spacc_ablk_do_fallback(struct skcipher_request *req,
 	 * the ciphering has completed, put the old transform back into the
 	 * request.
 	 */
-	skcipher_request_set_sync_tfm(subreq, ctx->sw_cipher);
-	skcipher_request_set_callback(subreq, req->base.flags, NULL, NULL);
-	skcipher_request_set_crypt(subreq, req->src, req->dst,
+	skcipher_request_set_tfm(&dev_req->fallback_req, ctx->sw_cipher);
+	skcipher_request_set_callback(&dev_req->fallback_req, req->base.flags,
+				      req->base.complete, req->base.data);
+	skcipher_request_set_crypt(&dev_req->fallback_req, req->src, req->dst,
 				   req->cryptlen, req->iv);
-	err = is_encrypt ? crypto_skcipher_encrypt(subreq) :
-			   crypto_skcipher_decrypt(subreq);
-	skcipher_request_zero(subreq);
+	err = is_encrypt ? crypto_skcipher_encrypt(&dev_req->fallback_req) :
+			   crypto_skcipher_decrypt(&dev_req->fallback_req);
 
 	return err;
 }
@@ -1007,19 +1008,22 @@ static int spacc_ablk_init_tfm(struct crypto_skcipher *tfm)
 	ctx->generic.flags = spacc_alg->type;
 	ctx->generic.engine = engine;
 	if (alg->base.cra_flags & CRYPTO_ALG_NEED_FALLBACK) {
-		ctx->sw_cipher = crypto_alloc_sync_skcipher(
+		ctx->sw_cipher = crypto_alloc_skcipher(
 			alg->base.cra_name, 0, CRYPTO_ALG_NEED_FALLBACK);
 		if (IS_ERR(ctx->sw_cipher)) {
 			dev_warn(engine->dev, "failed to allocate fallback for %s\n",
 				 alg->base.cra_name);
 			return PTR_ERR(ctx->sw_cipher);
 		}
+		crypto_skcipher_set_reqsize(tfm, sizeof(struct spacc_req) +
+						 crypto_skcipher_reqsize(ctx->sw_cipher));
+	} else {
+		crypto_skcipher_set_reqsize(tfm, sizeof(struct spacc_req));
 	}
+
 	ctx->generic.key_offs = spacc_alg->key_offs;
 	ctx->generic.iv_offs = spacc_alg->iv_offs;
 
-	crypto_skcipher_set_reqsize(tfm, sizeof(struct spacc_req));
-
 	return 0;
 }
 
@@ -1027,7 +1031,7 @@ static void spacc_ablk_exit_tfm(struct crypto_skcipher *tfm)
 {
 	struct spacc_ablk_ctx *ctx = crypto_skcipher_ctx(tfm);
 
-	crypto_free_sync_skcipher(ctx->sw_cipher);
+	crypto_free_skcipher(ctx->sw_cipher);
 }
 
 static int spacc_ablk_encrypt(struct skcipher_request *req)
-- 
2.27.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
