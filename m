Return-Path: <SRS0=Zj77=AG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B2E0C433E0
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Jun 2020 12:43:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED84A20720
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Jun 2020 12:43:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hUXYclXF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mdi3f4DJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED84A20720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vi8ZUNsr0bMLFkgRRnmrhCShkArfJ1KVhQaGLTWYP64=; b=hUXYclXFyy3FHHiJ9Cu1NWzf+
	VYmooz/UcjOCtQPqCIaqK7jhgSQiV3a53azuWuMooBSMdP1QK6bVdfc4jkR8Xky08oDlcL1ckitc0
	ycI5V3WEhMcym+BFeLCbHYK+XKw9NWRScw5k9OqA8qhcgX3nYYg8iXpWxYo7X1fJAv/z+BAQ0EVmH
	dD1AxEqn9FZSlxXZJcL8R/p+nBuzf7+BKySbjJlVtEMZM1DTb1LNeIUrSdS2VTQvXdsB0v02i+LhD
	gXl/D98mqLbTj/QbCxs4a/g5zLN5Jt5WXJgqugB/8cZtEJ+I/WrvkkgT4YF+ZvvA1NYfnrsw8VTRl
	+8MVBHNFQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1joRE2-0005MN-KU; Thu, 25 Jun 2020 12:43:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1joRDz-0005LU-RS; Thu, 25 Jun 2020 12:43:29 +0000
Received: from localhost.localdomain (lfbn-nic-1-188-42.w2-15.abo.wanadoo.fr
 [2.15.37.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9B7BF20720;
 Thu, 25 Jun 2020 12:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593089007;
 bh=DOov/VzevH5sYOijwCFcdKlJxFMfsKQgVxpnIqtZ1KY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Mdi3f4DJwlCShMLNjVw/YISKiTF/bsVsClqi46r889TBYamhsHsUV5ZRijSdXc2KA
 iyLZyrlP3Z2H+NCyCL+XBbiQj1JZ+leALX5PLS8QNefnNwAh/v2kPpaB3dGSEfvEAC
 aHng0adVku9Rub+q43ZoNl6258gR5mLd7TtdPS+k=
From: Ard Biesheuvel <ardb@kernel.org>
To: linux-crypto@vger.kernel.org
Subject: [PATCH 02/12] crypto: amlogic-gxl - permit async skcipher as fallback
Date: Thu, 25 Jun 2020 14:42:43 +0200
Message-Id: <20200625124253.1906557-3-ardb@kernel.org>
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

Even though the amlogic-gxl driver implements asynchronous versions of
ecb(aes) and cbc(aes), the fallbacks it allocates are required to be
synchronous. Given that SIMD based software implementations are usually
asynchronous as well, even though they rarely complete asynchronously
(this typically only happens in cases where the request was made from
softirq context, while SIMD was already in use in the task context that
it interrupted), these implementations are disregarded, and either the
generic C version or another table based version implemented in assembler
is selected instead.

Since falling back to synchronous AES is not only a performance issue,
but potentially a security issue as well (due to the fact that table
based AES is not time invariant), let's fix this, by allocating an
ordinary skcipher as the fallback, and invoke it with the completion
routine that was given to the outer request.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/crypto/amlogic/amlogic-gxl-cipher.c | 27 ++++++++++----------
 drivers/crypto/amlogic/amlogic-gxl.h        |  3 ++-
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-cipher.c b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
index 9819dd50fbad..5880b94dcb32 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-cipher.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
@@ -64,22 +64,20 @@ static int meson_cipher_do_fallback(struct skcipher_request *areq)
 #ifdef CONFIG_CRYPTO_DEV_AMLOGIC_GXL_DEBUG
 	struct skcipher_alg *alg = crypto_skcipher_alg(tfm);
 	struct meson_alg_template *algt;
-#endif
-	SYNC_SKCIPHER_REQUEST_ON_STACK(req, op->fallback_tfm);
 
-#ifdef CONFIG_CRYPTO_DEV_AMLOGIC_GXL_DEBUG
 	algt = container_of(alg, struct meson_alg_template, alg.skcipher);
 	algt->stat_fb++;
 #endif
-	skcipher_request_set_sync_tfm(req, op->fallback_tfm);
-	skcipher_request_set_callback(req, areq->base.flags, NULL, NULL);
-	skcipher_request_set_crypt(req, areq->src, areq->dst,
+	skcipher_request_set_tfm(&rctx->fallback_req, op->fallback_tfm);
+	skcipher_request_set_callback(&rctx->fallback_req, areq->base.flags,
+				      areq->base.complete, areq->base.data);
+	skcipher_request_set_crypt(&rctx->fallback_req, areq->src, areq->dst,
 				   areq->cryptlen, areq->iv);
+
 	if (rctx->op_dir == MESON_DECRYPT)
-		err = crypto_skcipher_decrypt(req);
+		err = crypto_skcipher_decrypt(&rctx->fallback_req);
 	else
-		err = crypto_skcipher_encrypt(req);
-	skcipher_request_zero(req);
+		err = crypto_skcipher_encrypt(&rctx->fallback_req);
 	return err;
 }
 
@@ -321,15 +319,16 @@ int meson_cipher_init(struct crypto_tfm *tfm)
 	algt = container_of(alg, struct meson_alg_template, alg.skcipher);
 	op->mc = algt->mc;
 
-	sktfm->reqsize = sizeof(struct meson_cipher_req_ctx);
-
-	op->fallback_tfm = crypto_alloc_sync_skcipher(name, 0, CRYPTO_ALG_NEED_FALLBACK);
+	op->fallback_tfm = crypto_alloc_skcipher(name, 0, CRYPTO_ALG_NEED_FALLBACK);
 	if (IS_ERR(op->fallback_tfm)) {
 		dev_err(op->mc->dev, "ERROR: Cannot allocate fallback for %s %ld\n",
 			name, PTR_ERR(op->fallback_tfm));
 		return PTR_ERR(op->fallback_tfm);
 	}
 
+	sktfm->reqsize = sizeof(struct meson_cipher_req_ctx) +
+			 crypto_skcipher_reqsize(op->fallback_tfm);
+
 	op->enginectx.op.do_one_request = meson_handle_cipher_request;
 	op->enginectx.op.prepare_request = NULL;
 	op->enginectx.op.unprepare_request = NULL;
@@ -345,7 +344,7 @@ void meson_cipher_exit(struct crypto_tfm *tfm)
 		memzero_explicit(op->key, op->keylen);
 		kfree(op->key);
 	}
-	crypto_free_sync_skcipher(op->fallback_tfm);
+	crypto_free_skcipher(op->fallback_tfm);
 }
 
 int meson_aes_setkey(struct crypto_skcipher *tfm, const u8 *key,
@@ -377,5 +376,5 @@ int meson_aes_setkey(struct crypto_skcipher *tfm, const u8 *key,
 	if (!op->key)
 		return -ENOMEM;
 
-	return crypto_sync_skcipher_setkey(op->fallback_tfm, key, keylen);
+	return crypto_skcipher_setkey(op->fallback_tfm, key, keylen);
 }
diff --git a/drivers/crypto/amlogic/amlogic-gxl.h b/drivers/crypto/amlogic/amlogic-gxl.h
index b7f2de91ab76..dc0f142324a3 100644
--- a/drivers/crypto/amlogic/amlogic-gxl.h
+++ b/drivers/crypto/amlogic/amlogic-gxl.h
@@ -109,6 +109,7 @@ struct meson_dev {
 struct meson_cipher_req_ctx {
 	u32 op_dir;
 	int flow;
+	struct skcipher_request fallback_req;	// keep at the end
 };
 
 /*
@@ -126,7 +127,7 @@ struct meson_cipher_tfm_ctx {
 	u32 keylen;
 	u32 keymode;
 	struct meson_dev *mc;
-	struct crypto_sync_skcipher *fallback_tfm;
+	struct crypto_skcipher *fallback_tfm;
 };
 
 /*
-- 
2.27.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
