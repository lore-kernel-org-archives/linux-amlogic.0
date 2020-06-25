Return-Path: <SRS0=Zj77=AG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B51DC433E1
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Jun 2020 12:44:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F3FF206BE
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Jun 2020 12:44:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fpxgTAej";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="fSa0m+ge"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F3FF206BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tDacVEroQNuSEc3Kqy0/nQeG2dAuHuhhY76+q7eSj5Q=; b=fpxgTAej+1s5xfantU3p6JQFW
	aJClbc6Sll47pnXq6kaPXaL+BtYeogAO/6F11syw+ue74bvOCAR47h4JNb3YpoWcau4WmRuIrtYJD
	px0dsGZlNFCqtmu0JfyTMpUB2f3Ptt7KaUIi1cd/zwvnzJgdgHcrDowN9RCr8o8f/CWZ2ECk/J5uD
	ADT2xVlXNd3LwHG09TdMqYZNpm+uVjBQ/4C2KXdlE+scDvi+OSGdidMU5RwwqOk7j4aytaMg97USt
	49Z12Vc7LoJ3InuPZCOuC16RszuvGqMpmHvBc9Bg2ZwEDs+tTHZUk65mVhH9W2d3Ls1+aNFORSO+d
	w9mS8l2Fw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1joREw-0005ma-10; Thu, 25 Jun 2020 12:44:26 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1joRES-0005Wk-6o; Thu, 25 Jun 2020 12:43:57 +0000
Received: from localhost.localdomain (lfbn-nic-1-188-42.w2-15.abo.wanadoo.fr
 [2.15.37.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E006C20724;
 Thu, 25 Jun 2020 12:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593089035;
 bh=mJ44RN1Ax7UO5kUEhNQNsOxr9UMAVZrtpGUzPdPjV5w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fSa0m+genEQoHZRSnzLuXGzBji6ZPg9bb3YkrnePsj99vW84ULC56q+FgTopfKnI8
 vQAU4erv7QryNTjNwiCdGr6HsqA4hb7br2jW+tamvgaWVDhQeQDZ/UHGDBZ4QBy9jq
 vK+kAK/fLUw4f7Bwx6LRgAXL8G9mU5wNMktVPh3s=
From: Ard Biesheuvel <ardb@kernel.org>
To: linux-crypto@vger.kernel.org
Subject: [PATCH 09/12] crypto: mxs-dcp - permit asynchronous skcipher as
 fallback
Date: Thu, 25 Jun 2020 14:42:50 +0200
Message-Id: <20200625124253.1906557-10-ardb@kernel.org>
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

Even though the mxs-dcp driver implements asynchronous versions of
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
 drivers/crypto/mxs-dcp.c | 33 ++++++++++----------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/drivers/crypto/mxs-dcp.c b/drivers/crypto/mxs-dcp.c
index d84530293036..909a7eb748e3 100644
--- a/drivers/crypto/mxs-dcp.c
+++ b/drivers/crypto/mxs-dcp.c
@@ -97,7 +97,7 @@ struct dcp_async_ctx {
 	unsigned int			hot:1;
 
 	/* Crypto-specific context */
-	struct crypto_sync_skcipher	*fallback;
+	struct crypto_skcipher		*fallback;
 	unsigned int			key_len;
 	uint8_t				key[AES_KEYSIZE_128];
 };
@@ -105,6 +105,7 @@ struct dcp_async_ctx {
 struct dcp_aes_req_ctx {
 	unsigned int	enc:1;
 	unsigned int	ecb:1;
+	struct skcipher_request fallback_req;	// keep at the end
 };
 
 struct dcp_sha_req_ctx {
@@ -426,21 +427,20 @@ static int dcp_chan_thread_aes(void *data)
 static int mxs_dcp_block_fallback(struct skcipher_request *req, int enc)
 {
 	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
+	struct dcp_aes_req_ctx *rctx = skcipher_request_ctx(req);
 	struct dcp_async_ctx *ctx = crypto_skcipher_ctx(tfm);
-	SYNC_SKCIPHER_REQUEST_ON_STACK(subreq, ctx->fallback);
 	int ret;
 
-	skcipher_request_set_sync_tfm(subreq, ctx->fallback);
-	skcipher_request_set_callback(subreq, req->base.flags, NULL, NULL);
-	skcipher_request_set_crypt(subreq, req->src, req->dst,
+	skcipher_request_set_tfm(&rctx->fallback_req, ctx->fallback);
+	skcipher_request_set_callback(&rctx->fallback_req, req->base.flags,
+				      req->base.complete, req->base.data);
+	skcipher_request_set_crypt(&rctx->fallback_req, req->src, req->dst,
 				   req->cryptlen, req->iv);
 
 	if (enc)
-		ret = crypto_skcipher_encrypt(subreq);
+		ret = crypto_skcipher_encrypt(&rctx->fallback_req);
 	else
-		ret = crypto_skcipher_decrypt(subreq);
-
-	skcipher_request_zero(subreq);
+		ret = crypto_skcipher_decrypt(&rctx->fallback_req);
 
 	return ret;
 }
@@ -510,24 +510,25 @@ static int mxs_dcp_aes_setkey(struct crypto_skcipher *tfm, const u8 *key,
 	 * but is supported by in-kernel software implementation, we use
 	 * software fallback.
 	 */
-	crypto_sync_skcipher_clear_flags(actx->fallback, CRYPTO_TFM_REQ_MASK);
-	crypto_sync_skcipher_set_flags(actx->fallback,
+	crypto_skcipher_clear_flags(actx->fallback, CRYPTO_TFM_REQ_MASK);
+	crypto_skcipher_set_flags(actx->fallback,
 				  tfm->base.crt_flags & CRYPTO_TFM_REQ_MASK);
-	return crypto_sync_skcipher_setkey(actx->fallback, key, len);
+	return crypto_skcipher_setkey(actx->fallback, key, len);
 }
 
 static int mxs_dcp_aes_fallback_init_tfm(struct crypto_skcipher *tfm)
 {
 	const char *name = crypto_tfm_alg_name(crypto_skcipher_tfm(tfm));
 	struct dcp_async_ctx *actx = crypto_skcipher_ctx(tfm);
-	struct crypto_sync_skcipher *blk;
+	struct crypto_skcipher *blk;
 
-	blk = crypto_alloc_sync_skcipher(name, 0, CRYPTO_ALG_NEED_FALLBACK);
+	blk = crypto_alloc_skcipher(name, 0, CRYPTO_ALG_NEED_FALLBACK);
 	if (IS_ERR(blk))
 		return PTR_ERR(blk);
 
 	actx->fallback = blk;
-	crypto_skcipher_set_reqsize(tfm, sizeof(struct dcp_aes_req_ctx));
+	crypto_skcipher_set_reqsize(tfm, sizeof(struct dcp_aes_req_ctx) +
+					 crypto_skcipher_reqsize(blk));
 	return 0;
 }
 
@@ -535,7 +536,7 @@ static void mxs_dcp_aes_fallback_exit_tfm(struct crypto_skcipher *tfm)
 {
 	struct dcp_async_ctx *actx = crypto_skcipher_ctx(tfm);
 
-	crypto_free_sync_skcipher(actx->fallback);
+	crypto_free_skcipher(actx->fallback);
 }
 
 /*
-- 
2.27.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
