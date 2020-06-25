Return-Path: <SRS0=Zj77=AG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01B5DC433DF
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Jun 2020 12:44:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8C89206BE
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Jun 2020 12:44:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kRMZaUE0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="MmwesvC+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8C89206BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/q/rJTaqrRiEpNsDxralfZQln76f4wM4g0IKplguK38=; b=kRMZaUE0fWYU/PWKqoHlyPdFY
	5l/rOxmpmB6ORFMdUfCqoL7pQNkJ8to/PZup6NZpGSxq3vvfaWE422ZjBS8ijkWtTauq5aoHnmLNo
	xLGnKdeLMmpaDeHx9yVAJiQx45hlwprROFbdLY6932LoMrdIF67utnqOzCviSxq77lWZtUVLueDp6
	qw06YDFHiMoJYBTBaeBPixSqlCxv2vseKoQqYDhiikGPZLuyeG5WrLCxeNczeshE0+zfBqAYWVu3B
	VSkumw3Fq1V7IACT4rLpmnGP+YNd8uPRYJ4ctlh2Dk7zguPemi1MBbJChyFCVz5EAEf4ceiYVU33K
	QVbXjt5+g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1joREi-0005eh-LB; Thu, 25 Jun 2020 12:44:12 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1joREJ-0005T8-W7; Thu, 25 Jun 2020 12:43:49 +0000
Received: from localhost.localdomain (lfbn-nic-1-188-42.w2-15.abo.wanadoo.fr
 [2.15.37.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CD956206BE;
 Thu, 25 Jun 2020 12:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593089027;
 bh=wGffz0ZawEaorm/Ljcec1lJrVUrfVxGLZbekPHv2K80=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MmwesvC+7kD10YqfQO/nPFbYUFpC7XeU11gAUcw3j/N/E6Ffqnx/faL0B/oJyiqoq
 UzW7VOQjL9KDjDU8aCn/pE2m18ZVENw0zuOGBIJ+2sVy4wdjXUdEeX6EQPphXhnaiK
 YjosleV9OLAFL1GVLhL77uJ8LvDbm00pVMqh6YRk=
From: Ard Biesheuvel <ardb@kernel.org>
To: linux-crypto@vger.kernel.org
Subject: [PATCH 07/12] crypto: ccp - permit asynchronous skcipher as fallback
Date: Thu, 25 Jun 2020 14:42:48 +0200
Message-Id: <20200625124253.1906557-8-ardb@kernel.org>
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

Even though the ccp driver implements an asynchronous version of xts(aes),
the fallback it allocates is required to be synchronous. Given that SIMD
based software implementations are usually asynchronous as well, even
though they rarely complete asynchronously (this typically only happens
in cases where the request was made from softirq context, while SIMD was
already in use in the task context that it interrupted), these
implementations are disregarded, and either the generic C version or
another table based version implemented in assembler is selected instead.

Since falling back to synchronous AES is not only a performance issue, but
potentially a security issue as well (due to the fact that table based AES
is not time invariant), let's fix this, by allocating an ordinary skcipher
as the fallback, and invoke it with the completion routine that was given
to the outer request.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/crypto/ccp/ccp-crypto-aes-xts.c | 31 ++++++++++----------
 drivers/crypto/ccp/ccp-crypto.h         |  4 ++-
 2 files changed, 18 insertions(+), 17 deletions(-)

diff --git a/drivers/crypto/ccp/ccp-crypto-aes-xts.c b/drivers/crypto/ccp/ccp-crypto-aes-xts.c
index 04b2517df955..e0fb4e8f22fb 100644
--- a/drivers/crypto/ccp/ccp-crypto-aes-xts.c
+++ b/drivers/crypto/ccp/ccp-crypto-aes-xts.c
@@ -98,7 +98,7 @@ static int ccp_aes_xts_setkey(struct crypto_skcipher *tfm, const u8 *key,
 	ctx->u.aes.key_len = key_len / 2;
 	sg_init_one(&ctx->u.aes.key_sg, ctx->u.aes.key, key_len);
 
-	return crypto_sync_skcipher_setkey(ctx->u.aes.tfm_skcipher, key, key_len);
+	return crypto_skcipher_setkey(ctx->u.aes.tfm_skcipher, key, key_len);
 }
 
 static int ccp_aes_xts_crypt(struct skcipher_request *req,
@@ -145,20 +145,19 @@ static int ccp_aes_xts_crypt(struct skcipher_request *req,
 	    (ctx->u.aes.key_len != AES_KEYSIZE_256))
 		fallback = 1;
 	if (fallback) {
-		SYNC_SKCIPHER_REQUEST_ON_STACK(subreq,
-					       ctx->u.aes.tfm_skcipher);
-
 		/* Use the fallback to process the request for any
 		 * unsupported unit sizes or key sizes
 		 */
-		skcipher_request_set_sync_tfm(subreq, ctx->u.aes.tfm_skcipher);
-		skcipher_request_set_callback(subreq, req->base.flags,
-					      NULL, NULL);
-		skcipher_request_set_crypt(subreq, req->src, req->dst,
-					   req->cryptlen, req->iv);
-		ret = encrypt ? crypto_skcipher_encrypt(subreq) :
-				crypto_skcipher_decrypt(subreq);
-		skcipher_request_zero(subreq);
+		skcipher_request_set_tfm(&rctx->fallback_req,
+					 ctx->u.aes.tfm_skcipher);
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
 
@@ -198,13 +197,12 @@ static int ccp_aes_xts_decrypt(struct skcipher_request *req)
 static int ccp_aes_xts_init_tfm(struct crypto_skcipher *tfm)
 {
 	struct ccp_ctx *ctx = crypto_skcipher_ctx(tfm);
-	struct crypto_sync_skcipher *fallback_tfm;
+	struct crypto_skcipher *fallback_tfm;
 
 	ctx->complete = ccp_aes_xts_complete;
 	ctx->u.aes.key_len = 0;
 
-	fallback_tfm = crypto_alloc_sync_skcipher("xts(aes)", 0,
-					     CRYPTO_ALG_ASYNC |
+	fallback_tfm = crypto_alloc_skcipher("xts(aes)", 0,
 					     CRYPTO_ALG_NEED_FALLBACK);
 	if (IS_ERR(fallback_tfm)) {
 		pr_warn("could not load fallback driver xts(aes)\n");
@@ -212,7 +210,8 @@ static int ccp_aes_xts_init_tfm(struct crypto_skcipher *tfm)
 	}
 	ctx->u.aes.tfm_skcipher = fallback_tfm;
 
-	crypto_skcipher_set_reqsize(tfm, sizeof(struct ccp_aes_req_ctx));
+	crypto_skcipher_set_reqsize(tfm, sizeof(struct ccp_aes_req_ctx) +
+					 crypto_skcipher_reqsize(fallback_tfm));
 
 	return 0;
 }
diff --git a/drivers/crypto/ccp/ccp-crypto.h b/drivers/crypto/ccp/ccp-crypto.h
index 90a009e6b5c1..aed3d2192d01 100644
--- a/drivers/crypto/ccp/ccp-crypto.h
+++ b/drivers/crypto/ccp/ccp-crypto.h
@@ -89,7 +89,7 @@ static inline struct ccp_crypto_ahash_alg *
 /***** AES related defines *****/
 struct ccp_aes_ctx {
 	/* Fallback cipher for XTS with unsupported unit sizes */
-	struct crypto_sync_skcipher *tfm_skcipher;
+	struct crypto_skcipher *tfm_skcipher;
 
 	enum ccp_engine engine;
 	enum ccp_aes_type type;
@@ -121,6 +121,8 @@ struct ccp_aes_req_ctx {
 	u8 rfc3686_iv[AES_BLOCK_SIZE];
 
 	struct ccp_cmd cmd;
+
+	struct skcipher_request fallback_req;	// keep at the end
 };
 
 struct ccp_aes_cmac_req_ctx {
-- 
2.27.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
