Return-Path: <SRS0=38i7=AS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE75BC433E0
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jul 2020 06:34:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1133206CD
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jul 2020 06:34:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DDjKGH4q";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="gFSYxowZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1133206CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q9zps0nSwtmHOQExM84xeku3R6l3Qx9ecrt9a5fhDCQ=; b=DDjKGH4qDpWP5zH+Iq6feLATrk
	jC5iXn4WiBX58y6ecwALx6ILrnZQOy5KmPxlbmJyvO8N0P1B2//HKOtBiNDYonCtjNcqpX/j+OfhB
	T05znmyuIzOUvWWtlptW6iPrFWPY1KYJGWKUZVuSMN94ZZb2bZbFy2em/TAyB7nKpR4FkM40BRgE9
	UhyFSdjv8Os1Qai3dSUuEvwOwgQfyF1NIktXagKNVN2ZbQKSIyO2OOhX43gcD5W0bZxb7jiCEQpMV
	iN7qoLOQqMgWxzbqwzLndj9eTF1zELJkqb+KVe4taxGYPSu7iqHLoE4NEqO3nHFU4eGGfutKDBlOu
	X8SJWsyA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jshBm-0002yy-6b; Tue, 07 Jul 2020 06:34:46 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jshB4-0002XN-5B; Tue, 07 Jul 2020 06:34:03 +0000
Received: from e123331-lin.nice.arm.com (adsl-70.109.242.21.tellas.gr
 [109.242.21.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6A35F206DF;
 Tue,  7 Jul 2020 06:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594103641;
 bh=xtNbkebtMctQdpvkm5ZhZR31pleEX5efnRbSCp2ZF4o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gFSYxowZEHOLyY+Ipf7RU3fgh0E92aOYIxLyhqK/3TYSbTj0CttxfdLuSh7MmgFlW
 PWkJ01ls+bBokuC51UUu9ghub1utZK4OQEsS4U6IpjfYy7KudQxcOnIdoPD6nrx2TK
 DIF3pCBAXWJ9fv1KSbkhVc5wDApltgKvBmM1ySac=
From: Ard Biesheuvel <ardb@kernel.org>
To: linux-crypto@vger.kernel.org
Subject: [PATCH v4 11/13] crypto: qce - permit asynchronous skcipher as
 fallback
Date: Tue,  7 Jul 2020 09:32:01 +0300
Message-Id: <20200707063203.5018-12-ardb@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200707063203.5018-1-ardb@kernel.org>
References: <20200707063203.5018-1-ardb@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_023402_385479_2758611F 
X-CRM114-Status: GOOD (  17.41  )
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

Even though the qce driver implements asynchronous versions of ecb(aes),
cbc(aes)and xts(aes), the fallbacks it allocates are required to be
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

While at it, remove the pointless memset() from qce_skcipher_init(), and
remove the call to it qce_skcipher_init_fallback().

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/crypto/qce/cipher.h   |  3 +-
 drivers/crypto/qce/skcipher.c | 42 ++++++++++----------
 2 files changed, 24 insertions(+), 21 deletions(-)

diff --git a/drivers/crypto/qce/cipher.h b/drivers/crypto/qce/cipher.h
index 7770660bc853..cffa9fc628ff 100644
--- a/drivers/crypto/qce/cipher.h
+++ b/drivers/crypto/qce/cipher.h
@@ -14,7 +14,7 @@
 struct qce_cipher_ctx {
 	u8 enc_key[QCE_MAX_KEY_SIZE];
 	unsigned int enc_keylen;
-	struct crypto_sync_skcipher *fallback;
+	struct crypto_skcipher *fallback;
 };
 
 /**
@@ -43,6 +43,7 @@ struct qce_cipher_reqctx {
 	struct sg_table src_tbl;
 	struct scatterlist *src_sg;
 	unsigned int cryptlen;
+	struct skcipher_request fallback_req;	// keep at the end
 };
 
 static inline struct qce_alg_template *to_cipher_tmpl(struct crypto_skcipher *tfm)
diff --git a/drivers/crypto/qce/skcipher.c b/drivers/crypto/qce/skcipher.c
index 9412433f3b21..a8147381b774 100644
--- a/drivers/crypto/qce/skcipher.c
+++ b/drivers/crypto/qce/skcipher.c
@@ -178,7 +178,7 @@ static int qce_skcipher_setkey(struct crypto_skcipher *ablk, const u8 *key,
 		break;
 	}
 
-	ret = crypto_sync_skcipher_setkey(ctx->fallback, key, keylen);
+	ret = crypto_skcipher_setkey(ctx->fallback, key, keylen);
 	if (!ret)
 		ctx->enc_keylen = keylen;
 	return ret;
@@ -235,16 +235,15 @@ static int qce_skcipher_crypt(struct skcipher_request *req, int encrypt)
 	      req->cryptlen <= aes_sw_max_len) ||
 	     (IS_XTS(rctx->flags) && req->cryptlen > QCE_SECTOR_SIZE &&
 	      req->cryptlen % QCE_SECTOR_SIZE))) {
-		SYNC_SKCIPHER_REQUEST_ON_STACK(subreq, ctx->fallback);
-
-		skcipher_request_set_sync_tfm(subreq, ctx->fallback);
-		skcipher_request_set_callback(subreq, req->base.flags,
-					      NULL, NULL);
-		skcipher_request_set_crypt(subreq, req->src, req->dst,
-					   req->cryptlen, req->iv);
-		ret = encrypt ? crypto_skcipher_encrypt(subreq) :
-				crypto_skcipher_decrypt(subreq);
-		skcipher_request_zero(subreq);
+		skcipher_request_set_tfm(&rctx->fallback_req, ctx->fallback);
+		skcipher_request_set_callback(&rctx->fallback_req,
+					      req->base.flags,
+					      req->base.complete,
+					      req->base.data);
+		skcipher_request_set_crypt(&rctx->fallback_req, req->src,
+					   req->dst, req->cryptlen, req->iv);
+		ret = encrypt ? crypto_skcipher_encrypt(&rctx->fallback_req) :
+				crypto_skcipher_decrypt(&rctx->fallback_req);
 		return ret;
 	}
 
@@ -263,10 +262,9 @@ static int qce_skcipher_decrypt(struct skcipher_request *req)
 
 static int qce_skcipher_init(struct crypto_skcipher *tfm)
 {
-	struct qce_cipher_ctx *ctx = crypto_skcipher_ctx(tfm);
-
-	memset(ctx, 0, sizeof(*ctx));
-	crypto_skcipher_set_reqsize(tfm, sizeof(struct qce_cipher_reqctx));
+	/* take the size without the fallback skcipher_request at the end */
+	crypto_skcipher_set_reqsize(tfm, offsetof(struct qce_cipher_reqctx,
+						  fallback_req));
 	return 0;
 }
 
@@ -274,17 +272,21 @@ static int qce_skcipher_init_fallback(struct crypto_skcipher *tfm)
 {
 	struct qce_cipher_ctx *ctx = crypto_skcipher_ctx(tfm);
 
-	qce_skcipher_init(tfm);
-	ctx->fallback = crypto_alloc_sync_skcipher(crypto_tfm_alg_name(&tfm->base),
-						   0, CRYPTO_ALG_NEED_FALLBACK);
-	return PTR_ERR_OR_ZERO(ctx->fallback);
+	ctx->fallback = crypto_alloc_skcipher(crypto_tfm_alg_name(&tfm->base),
+					      0, CRYPTO_ALG_NEED_FALLBACK);
+	if (IS_ERR(ctx->fallback))
+		return PTR_ERR(ctx->fallback);
+
+	crypto_skcipher_set_reqsize(tfm, sizeof(struct qce_cipher_reqctx) +
+					 crypto_skcipher_reqsize(ctx->fallback));
+	return 0;
 }
 
 static void qce_skcipher_exit(struct crypto_skcipher *tfm)
 {
 	struct qce_cipher_ctx *ctx = crypto_skcipher_ctx(tfm);
 
-	crypto_free_sync_skcipher(ctx->fallback);
+	crypto_free_skcipher(ctx->fallback);
 }
 
 struct qce_skcipher_def {
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
