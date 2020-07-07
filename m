Return-Path: <SRS0=38i7=AS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71FB8C433E0
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jul 2020 06:33:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3BA6C206DF
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jul 2020 06:33:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MLTEoGmb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="SKrdiHbD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3BA6C206DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tOtqIlylSKzAbUq4XNfpHB0IU4HM6gOuRtYmuI1KCUA=; b=MLTEoGmbXAcsRYQDnqp9d6O71a
	MHcuC0Z+xzn/Vvb6gh67I3atI41BcKCpanZYhU6swHLrwI+o8taSJV1r82KcnkUl4jPwjtp1yQO8W
	jolB8ZiZz40c5QWk6plbfqX2cF/gaI/E2pB4WPP+UbXizoTl1g8vp7+umWk+1YTBiw/7v/kyaEnKe
	asKurwFtIdYL1PxspTS9bvR133KA7KV2OXN1QOhZ1eW9U+zEm5FQFP5tOyD0U1ONADbOgvngQkvfY
	qbbOXUnmFOVJtZP30LO/2cDuRhRCNfqCtjk4KFWnPCekpSf1R7NAIyn9bGkqR28fd0VoSd5Fru/g1
	VUvFFJRA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jshAB-00023k-Ub; Tue, 07 Jul 2020 06:33:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jshA7-00021S-Qq; Tue, 07 Jul 2020 06:33:05 +0000
Received: from e123331-lin.nice.arm.com (adsl-70.109.242.21.tellas.gr
 [109.242.21.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 42DD7206DF;
 Tue,  7 Jul 2020 06:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594103583;
 bh=LdErV8UmJNeAWlJWKqw54lJi1yiq9FCVDD++JL44/T8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SKrdiHbDM08Exk1M9WTdPuoSO5plrrBq88lZvd1S3z/RgtoCYMkIzXplKhFZn5qWj
 JsrhYwgCMr2mCF/sD9MOMawdy+6BYodSaXBfa6yND3ElRVsBZxtPpwKuc87eHWOFJ3
 T1Skm8r8+3MX28cYrATcEbrM85YqhlJcK1/oaLKo=
From: Ard Biesheuvel <ardb@kernel.org>
To: linux-crypto@vger.kernel.org
Subject: [PATCH v4 04/13] crypto: sun4i - permit asynchronous skcipher as
 fallback
Date: Tue,  7 Jul 2020 09:31:54 +0300
Message-Id: <20200707063203.5018-5-ardb@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200707063203.5018-1-ardb@kernel.org>
References: <20200707063203.5018-1-ardb@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_023304_012102_2198560D 
X-CRM114-Status: GOOD (  16.57  )
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

Even though the sun4i driver implements asynchronous versions of ecb(aes)
and cbc(aes), the fallbacks it allocates are required to be synchronous.
Given that SIMD based software implementations are usually asynchronous
as well, even though they rarely complete asynchronously (this typically
only happens in cases where the request was made from softirq context,
while SIMD was already in use in the task context that it interrupted),
these implementations are disregarded, and either the generic C version
or another table based version implemented in assembler is selected
instead.

Since falling back to synchronous AES is not only a performance issue, but
potentially a security issue as well (due to the fact that table based AES
is not time invariant), let's fix this, by allocating an ordinary skcipher
as the fallback, and invoke it with the completion routine that was given
to the outer request.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
Tested-by: Corentin Labbe <clabbe.montjoie@gmail.com>
---
 drivers/crypto/allwinner/sun4i-ss/sun4i-ss-cipher.c | 46 ++++++++++----------
 drivers/crypto/allwinner/sun4i-ss/sun4i-ss.h        |  3 +-
 2 files changed, 25 insertions(+), 24 deletions(-)

diff --git a/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-cipher.c b/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-cipher.c
index 7f22d305178e..b72de8939497 100644
--- a/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-cipher.c
+++ b/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-cipher.c
@@ -122,19 +122,17 @@ static int noinline_for_stack sun4i_ss_cipher_poll_fallback(struct skcipher_requ
 	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(areq);
 	struct sun4i_tfm_ctx *op = crypto_skcipher_ctx(tfm);
 	struct sun4i_cipher_req_ctx *ctx = skcipher_request_ctx(areq);
-	SYNC_SKCIPHER_REQUEST_ON_STACK(subreq, op->fallback_tfm);
 	int err;
 
-	skcipher_request_set_sync_tfm(subreq, op->fallback_tfm);
-	skcipher_request_set_callback(subreq, areq->base.flags, NULL,
-				      NULL);
-	skcipher_request_set_crypt(subreq, areq->src, areq->dst,
+	skcipher_request_set_tfm(&ctx->fallback_req, op->fallback_tfm);
+	skcipher_request_set_callback(&ctx->fallback_req, areq->base.flags,
+				      areq->base.complete, areq->base.data);
+	skcipher_request_set_crypt(&ctx->fallback_req, areq->src, areq->dst,
 				   areq->cryptlen, areq->iv);
 	if (ctx->mode & SS_DECRYPTION)
-		err = crypto_skcipher_decrypt(subreq);
+		err = crypto_skcipher_decrypt(&ctx->fallback_req);
 	else
-		err = crypto_skcipher_encrypt(subreq);
-	skcipher_request_zero(subreq);
+		err = crypto_skcipher_encrypt(&ctx->fallback_req);
 
 	return err;
 }
@@ -494,23 +492,25 @@ int sun4i_ss_cipher_init(struct crypto_tfm *tfm)
 			    alg.crypto.base);
 	op->ss = algt->ss;
 
-	crypto_skcipher_set_reqsize(__crypto_skcipher_cast(tfm),
-				    sizeof(struct sun4i_cipher_req_ctx));
-
-	op->fallback_tfm = crypto_alloc_sync_skcipher(name, 0, CRYPTO_ALG_NEED_FALLBACK);
+	op->fallback_tfm = crypto_alloc_skcipher(name, 0, CRYPTO_ALG_NEED_FALLBACK);
 	if (IS_ERR(op->fallback_tfm)) {
 		dev_err(op->ss->dev, "ERROR: Cannot allocate fallback for %s %ld\n",
 			name, PTR_ERR(op->fallback_tfm));
 		return PTR_ERR(op->fallback_tfm);
 	}
 
+	crypto_skcipher_set_reqsize(__crypto_skcipher_cast(tfm),
+				    sizeof(struct sun4i_cipher_req_ctx) +
+				    crypto_skcipher_reqsize(op->fallback_tfm));
+
+
 	err = pm_runtime_get_sync(op->ss->dev);
 	if (err < 0)
 		goto error_pm;
 
 	return 0;
 error_pm:
-	crypto_free_sync_skcipher(op->fallback_tfm);
+	crypto_free_skcipher(op->fallback_tfm);
 	return err;
 }
 
@@ -518,7 +518,7 @@ void sun4i_ss_cipher_exit(struct crypto_tfm *tfm)
 {
 	struct sun4i_tfm_ctx *op = crypto_tfm_ctx(tfm);
 
-	crypto_free_sync_skcipher(op->fallback_tfm);
+	crypto_free_skcipher(op->fallback_tfm);
 	pm_runtime_put(op->ss->dev);
 }
 
@@ -546,10 +546,10 @@ int sun4i_ss_aes_setkey(struct crypto_skcipher *tfm, const u8 *key,
 	op->keylen = keylen;
 	memcpy(op->key, key, keylen);
 
-	crypto_sync_skcipher_clear_flags(op->fallback_tfm, CRYPTO_TFM_REQ_MASK);
-	crypto_sync_skcipher_set_flags(op->fallback_tfm, tfm->base.crt_flags & CRYPTO_TFM_REQ_MASK);
+	crypto_skcipher_clear_flags(op->fallback_tfm, CRYPTO_TFM_REQ_MASK);
+	crypto_skcipher_set_flags(op->fallback_tfm, tfm->base.crt_flags & CRYPTO_TFM_REQ_MASK);
 
-	return crypto_sync_skcipher_setkey(op->fallback_tfm, key, keylen);
+	return crypto_skcipher_setkey(op->fallback_tfm, key, keylen);
 }
 
 /* check and set the DES key, prepare the mode to be used */
@@ -566,10 +566,10 @@ int sun4i_ss_des_setkey(struct crypto_skcipher *tfm, const u8 *key,
 	op->keylen = keylen;
 	memcpy(op->key, key, keylen);
 
-	crypto_sync_skcipher_clear_flags(op->fallback_tfm, CRYPTO_TFM_REQ_MASK);
-	crypto_sync_skcipher_set_flags(op->fallback_tfm, tfm->base.crt_flags & CRYPTO_TFM_REQ_MASK);
+	crypto_skcipher_clear_flags(op->fallback_tfm, CRYPTO_TFM_REQ_MASK);
+	crypto_skcipher_set_flags(op->fallback_tfm, tfm->base.crt_flags & CRYPTO_TFM_REQ_MASK);
 
-	return crypto_sync_skcipher_setkey(op->fallback_tfm, key, keylen);
+	return crypto_skcipher_setkey(op->fallback_tfm, key, keylen);
 }
 
 /* check and set the 3DES key, prepare the mode to be used */
@@ -586,9 +586,9 @@ int sun4i_ss_des3_setkey(struct crypto_skcipher *tfm, const u8 *key,
 	op->keylen = keylen;
 	memcpy(op->key, key, keylen);
 
-	crypto_sync_skcipher_clear_flags(op->fallback_tfm, CRYPTO_TFM_REQ_MASK);
-	crypto_sync_skcipher_set_flags(op->fallback_tfm, tfm->base.crt_flags & CRYPTO_TFM_REQ_MASK);
+	crypto_skcipher_clear_flags(op->fallback_tfm, CRYPTO_TFM_REQ_MASK);
+	crypto_skcipher_set_flags(op->fallback_tfm, tfm->base.crt_flags & CRYPTO_TFM_REQ_MASK);
 
-	return crypto_sync_skcipher_setkey(op->fallback_tfm, key, keylen);
+	return crypto_skcipher_setkey(op->fallback_tfm, key, keylen);
 
 }
diff --git a/drivers/crypto/allwinner/sun4i-ss/sun4i-ss.h b/drivers/crypto/allwinner/sun4i-ss/sun4i-ss.h
index 2b4c6333eb67..163962f9e284 100644
--- a/drivers/crypto/allwinner/sun4i-ss/sun4i-ss.h
+++ b/drivers/crypto/allwinner/sun4i-ss/sun4i-ss.h
@@ -170,11 +170,12 @@ struct sun4i_tfm_ctx {
 	u32 keylen;
 	u32 keymode;
 	struct sun4i_ss_ctx *ss;
-	struct crypto_sync_skcipher *fallback_tfm;
+	struct crypto_skcipher *fallback_tfm;
 };
 
 struct sun4i_cipher_req_ctx {
 	u32 mode;
+	struct skcipher_request fallback_req;   // keep at the end
 };
 
 struct sun4i_req_ctx {
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
