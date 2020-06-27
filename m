Return-Path: <SRS0=1ECN=AI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF9B0C433E4
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Jun 2020 08:37:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6AFEA21473
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Jun 2020 08:37:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I3ET5Rij";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="m/ajGB07"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6AFEA21473
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iTy4n5EmW3t+DYyqvEd2TbnbiaVvI/65BKVJ6FAxKAQ=; b=I3ET5Rij3eMFD5IJnXBz226Mw
	lZJiGZIfEdwAwoIx0AAuAbRAnxiB7F+ml1hLbSYepe+VVK28zqTTth+O4QA673SFtrbpOuBK9yrsE
	dT0E+FMZez01iWo0TVMdDJYe76xi7GAXwtzoVY57vOk7y/Y0vn5FcrlmrBjGqEB0MK6e5hNf4Uq52
	xgvqfOTR70BZo02Pjp+eAbB1vJmE4K4WjIcgdPBGFwOwRaKxI5AaM+W56VzQ3BMfRe0PPNbFawISf
	6U/JOpTusGVzeyeHRGE3EtQBlUPOgZA3reyIIueJgLpXZJh8RklLuFL+TU/Ce1gu7EJLyo6N9ImJ8
	h++tQ9gbg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jp6KW-0007iU-Ua; Sat, 27 Jun 2020 08:36:57 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jp6KP-0007gy-Re; Sat, 27 Jun 2020 08:36:52 +0000
Received: from dogfood.home (lfbn-nic-1-188-42.w2-15.abo.wanadoo.fr
 [2.15.37.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1071F208C7;
 Sat, 27 Jun 2020 08:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593247009;
 bh=7g45QWyrYUg0An4TDCghUfvpEHV1X2Se+dPPjGObVdQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=m/ajGB074NYPLnbD44erR6c0f/YJu/AftljLUMwznn2XTvzylJ57vf9p77ozT+oMH
 LnD5P55AI7sAnQiCyMDNQOkzTrkruxcyc0jQAiYMgNHRmip/V38nDze6evPOeL1pLE
 IE0r1GnBuZ0T4ZicvAT81K/AIf0R2ONMInASwX58=
From: Ard Biesheuvel <ardb@kernel.org>
To: linux-crypto@vger.kernel.org
Subject: [PATCH v2 03/13] crypto: omap-aes - permit asynchronous skcipher as
 fallback
Date: Sat, 27 Jun 2020 10:36:13 +0200
Message-Id: <20200627083623.2428333-4-ardb@kernel.org>
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

Even though the omap-aes driver implements asynchronous versions of
ecb(aes), cbc(aes) and ctr(aes), the fallbacks it allocates are required
to be synchronous. Given that SIMD based software implementations are
usually asynchronous as well, even though they rarely complete
asynchronously (this typically only happens in cases where the request was
made from softirq context, while SIMD was already in use in the task
context that it interrupted), these implementations are disregarded, and
either the generic C version or another table based version implemented in
assembler is selected instead.

Since falling back to synchronous AES is not only a performance issue, but
potentially a security issue as well (due to the fact that table based AES
is not time invariant), let's fix this, by allocating an ordinary skcipher
as the fallback, and invoke it with the completion routine that was given
to the outer request.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/crypto/omap-aes.c | 35 ++++++++++----------
 drivers/crypto/omap-aes.h |  3 +-
 2 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/crypto/omap-aes.c b/drivers/crypto/omap-aes.c
index b5aff20c5900..25154b74dcc6 100644
--- a/drivers/crypto/omap-aes.c
+++ b/drivers/crypto/omap-aes.c
@@ -548,20 +548,18 @@ static int omap_aes_crypt(struct skcipher_request *req, unsigned long mode)
 		  !!(mode & FLAGS_CBC));
 
 	if (req->cryptlen < aes_fallback_sz) {
-		SYNC_SKCIPHER_REQUEST_ON_STACK(subreq, ctx->fallback);
-
-		skcipher_request_set_sync_tfm(subreq, ctx->fallback);
-		skcipher_request_set_callback(subreq, req->base.flags, NULL,
-					      NULL);
-		skcipher_request_set_crypt(subreq, req->src, req->dst,
-					   req->cryptlen, req->iv);
+		skcipher_request_set_tfm(&rctx->fallback_req, ctx->fallback);
+		skcipher_request_set_callback(&rctx->fallback_req,
+					      req->base.flags,
+					      req->base.complete,
+					      req->base.data);
+		skcipher_request_set_crypt(&rctx->fallback_req, req->src,
+					   req->dst, req->cryptlen, req->iv);
 
 		if (mode & FLAGS_ENCRYPT)
-			ret = crypto_skcipher_encrypt(subreq);
+			ret = crypto_skcipher_encrypt(&rctx->fallback_req);
 		else
-			ret = crypto_skcipher_decrypt(subreq);
-
-		skcipher_request_zero(subreq);
+			ret = crypto_skcipher_decrypt(&rctx->fallback_req);
 		return ret;
 	}
 	dd = omap_aes_find_dev(rctx);
@@ -590,11 +588,11 @@ static int omap_aes_setkey(struct crypto_skcipher *tfm, const u8 *key,
 	memcpy(ctx->key, key, keylen);
 	ctx->keylen = keylen;
 
-	crypto_sync_skcipher_clear_flags(ctx->fallback, CRYPTO_TFM_REQ_MASK);
-	crypto_sync_skcipher_set_flags(ctx->fallback, tfm->base.crt_flags &
+	crypto_skcipher_clear_flags(ctx->fallback, CRYPTO_TFM_REQ_MASK);
+	crypto_skcipher_set_flags(ctx->fallback, tfm->base.crt_flags &
 						 CRYPTO_TFM_REQ_MASK);
 
-	ret = crypto_sync_skcipher_setkey(ctx->fallback, key, keylen);
+	ret = crypto_skcipher_setkey(ctx->fallback, key, keylen);
 	if (!ret)
 		return 0;
 
@@ -640,15 +638,16 @@ static int omap_aes_init_tfm(struct crypto_skcipher *tfm)
 {
 	const char *name = crypto_tfm_alg_name(&tfm->base);
 	struct omap_aes_ctx *ctx = crypto_skcipher_ctx(tfm);
-	struct crypto_sync_skcipher *blk;
+	struct crypto_skcipher *blk;
 
-	blk = crypto_alloc_sync_skcipher(name, 0, CRYPTO_ALG_NEED_FALLBACK);
+	blk = crypto_alloc_skcipher(name, 0, CRYPTO_ALG_NEED_FALLBACK);
 	if (IS_ERR(blk))
 		return PTR_ERR(blk);
 
 	ctx->fallback = blk;
 
-	crypto_skcipher_set_reqsize(tfm, sizeof(struct omap_aes_reqctx));
+	crypto_skcipher_set_reqsize(tfm, sizeof(struct omap_aes_reqctx) +
+					 crypto_skcipher_reqsize(blk));
 
 	ctx->enginectx.op.prepare_request = omap_aes_prepare_req;
 	ctx->enginectx.op.unprepare_request = NULL;
@@ -662,7 +661,7 @@ static void omap_aes_exit_tfm(struct crypto_skcipher *tfm)
 	struct omap_aes_ctx *ctx = crypto_skcipher_ctx(tfm);
 
 	if (ctx->fallback)
-		crypto_free_sync_skcipher(ctx->fallback);
+		crypto_free_skcipher(ctx->fallback);
 
 	ctx->fallback = NULL;
 }
diff --git a/drivers/crypto/omap-aes.h b/drivers/crypto/omap-aes.h
index 2d111bf906e1..23d073e87bb8 100644
--- a/drivers/crypto/omap-aes.h
+++ b/drivers/crypto/omap-aes.h
@@ -97,7 +97,7 @@ struct omap_aes_ctx {
 	int		keylen;
 	u32		key[AES_KEYSIZE_256 / sizeof(u32)];
 	u8		nonce[4];
-	struct crypto_sync_skcipher	*fallback;
+	struct crypto_skcipher	*fallback;
 };
 
 struct omap_aes_gcm_ctx {
@@ -110,6 +110,7 @@ struct omap_aes_reqctx {
 	unsigned long mode;
 	u8 iv[AES_BLOCK_SIZE];
 	u32 auth_tag[AES_BLOCK_SIZE / sizeof(u32)];
+	struct skcipher_request fallback_req;	// keep at the end
 };
 
 #define OMAP_AES_QUEUE_LENGTH	1
-- 
2.27.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
