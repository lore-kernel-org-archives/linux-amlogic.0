Return-Path: <SRS0=Zj77=AG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31099C433E0
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Jun 2020 12:45:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0087F206BE
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Jun 2020 12:45:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bJ8P0rK7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="HcJIPIhJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0087F206BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oXshhcDDipPVdKGC48gpxaKbCby41P/r5z9MRaRtstg=; b=bJ8P0rK7crECCnRFwhGHCKuL7
	qcFHE4fwSv9NA0DCP9oN9TedE5fDDbYA/omtS8Fagj4dVbn+i9KbF5ptfaS4hSd8+aAB0GRk151AM
	gSIDO9QKM09vhQLCsXzd0yHaFJTy3w6k2sMQU5mrC0lGT8N3REg7aXeRyH8timh9Ys9iNDxyKgT++
	EGtUzifmeAh8h8mRH8yg+2aIOrpdNBnPdTQOIj5N87aM4g4PEcXeYs526GkZP6gIxW5696DjuTrbi
	tDLmRMyQPifUYs6UDXs9dY4054M8c4QRL7vkdTc6EnyOVCe1uepp1Nv9c1Rkw7XKspK8oc1TPrXc+
	ENqPoiRHQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1joRFi-0006Bw-Bw; Thu, 25 Jun 2020 12:45:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1joREa-0005ad-5t; Thu, 25 Jun 2020 12:44:05 +0000
Received: from localhost.localdomain (lfbn-nic-1-188-42.w2-15.abo.wanadoo.fr
 [2.15.37.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EF39B20720;
 Thu, 25 Jun 2020 12:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593089043;
 bh=SZYJbEe8mCowaOS/Sy7cfSLq4/DGTZWmD8C72wZYJ5s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HcJIPIhJS07N6knm3q/5jLrLdS+15P61eJyqq1jEhx3E47sdvDf7gPQJufxaGoW5A
 2UYcdrHwnhK7jwXrITIPjUTaDx815+QV4vd2gemXmMDF/lzKwitNEwMv8SRIKyyZlC
 Pt+3hk096uXRabjFRZ0jk0Rp3BV5VqCsB+qjtDg0=
From: Ard Biesheuvel <ardb@kernel.org>
To: linux-crypto@vger.kernel.org
Subject: [PATCH 11/12] crypto: qce - permit asynchronous skcipher as fallback
Date: Thu, 25 Jun 2020 14:42:52 +0200
Message-Id: <20200625124253.1906557-12-ardb@kernel.org>
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

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/crypto/qce/cipher.h   |  3 ++-
 drivers/crypto/qce/skcipher.c | 27 ++++++++++----------
 2 files changed, 16 insertions(+), 14 deletions(-)

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
index 9412433f3b21..265afae29901 100644
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
 
@@ -275,8 +274,10 @@ static int qce_skcipher_init_fallback(struct crypto_skcipher *tfm)
 	struct qce_cipher_ctx *ctx = crypto_skcipher_ctx(tfm);
 
 	qce_skcipher_init(tfm);
-	ctx->fallback = crypto_alloc_sync_skcipher(crypto_tfm_alg_name(&tfm->base),
+	ctx->fallback = crypto_alloc_skcipher(crypto_tfm_alg_name(&tfm->base),
 						   0, CRYPTO_ALG_NEED_FALLBACK);
+	crypto_skcipher_set_reqsize(tfm, sizeof(struct qce_cipher_reqctx) +
+					 crypto_skcipher_reqsize(ctx->fallback));
 	return PTR_ERR_OR_ZERO(ctx->fallback);
 }
 
@@ -284,7 +285,7 @@ static void qce_skcipher_exit(struct crypto_skcipher *tfm)
 {
 	struct qce_cipher_ctx *ctx = crypto_skcipher_ctx(tfm);
 
-	crypto_free_sync_skcipher(ctx->fallback);
+	crypto_free_skcipher(ctx->fallback);
 }
 
 struct qce_skcipher_def {
-- 
2.27.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
