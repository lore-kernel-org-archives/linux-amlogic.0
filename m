Return-Path: <SRS0=38i7=AS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AD32C433E0
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jul 2020 06:33:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 659BA206DF
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jul 2020 06:33:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yv27XBL/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ssj155OC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 659BA206DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QOYTMtCVR5uV2pFgDz5nt33awhvBY5u821gmkXKJl3Y=; b=yv27XBL/MWNJmYbVsU5fWCbEN2
	AqoOzqXDjTGakmbWFQKkgbHJDw0C0A6rqisIboyzTd727M/Ta6JXhy/+wMf2KfdiWJi+zVavzXfGI
	Fj3yEyVGwrUR8TFLMUDNWLG/26WI2wHwyMSNeX710lrl1iMuC8uURZDETYUvkU9f3A9/DOp2s/NZI
	D3SQ3VgJYnU7pP5gEKCFLfV5+qQgTS3/4hx255ElMdOJyobvtvyWTrY54ZXwBB1TYKlaw1QNBl8ua
	IUDXqQ2ELuR7M1HdhiH/64jtO/rkrsfwtUHOPHj27B0yNddB+h+a0u5ohTffXeb6vFUY6eYJlOZC2
	sxgadk4Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jshAJ-000282-Kk; Tue, 07 Jul 2020 06:33:15 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jshAG-00025i-8D; Tue, 07 Jul 2020 06:33:13 +0000
Received: from e123331-lin.nice.arm.com (adsl-70.109.242.21.tellas.gr
 [109.242.21.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BD0A820720;
 Tue,  7 Jul 2020 06:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594103591;
 bh=lz8NavAuEPdVYmmIwhE81dNDtMflzJhIAth+kpnPQes=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ssj155OCW7y2qhTOupfl/bgeM55aCC3QhLJkROCqd6Jl7R0IdkDVGLjoa4ulpo4vk
 alBLh3EgBNi8ET7Q7jQCBUa9zevtblDEejFTHphMIYxmjqPwrDLg0Zi7kOCZynT1FV
 n6o9GvMg1aHWj08JzNi4ohi5AOG0JSyZOqo05REs=
From: Ard Biesheuvel <ardb@kernel.org>
To: linux-crypto@vger.kernel.org
Subject: [PATCH v4 05/13] crypto: sun8i-ce - permit asynchronous skcipher as
 fallback
Date: Tue,  7 Jul 2020 09:31:55 +0300
Message-Id: <20200707063203.5018-6-ardb@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200707063203.5018-1-ardb@kernel.org>
References: <20200707063203.5018-1-ardb@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_023312_452613_3FE2C52A 
X-CRM114-Status: GOOD (  16.68  )
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

Even though the sun8i-ce driver implements asynchronous versions of
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
Acked-by: Corentin Labbe <clabbe.montjoie@gmail.com>
---
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c | 41 ++++++++++----------
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h        |  8 ++--
 2 files changed, 25 insertions(+), 24 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
index 3665a0a2038f..1e4f9a58bb24 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
@@ -58,23 +58,20 @@ static int sun8i_ce_cipher_fallback(struct skcipher_request *areq)
 #ifdef CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG
 	struct skcipher_alg *alg = crypto_skcipher_alg(tfm);
 	struct sun8i_ce_alg_template *algt;
-#endif
-	SYNC_SKCIPHER_REQUEST_ON_STACK(subreq, op->fallback_tfm);
 
-#ifdef CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG
 	algt = container_of(alg, struct sun8i_ce_alg_template, alg.skcipher);
 	algt->stat_fb++;
 #endif
 
-	skcipher_request_set_sync_tfm(subreq, op->fallback_tfm);
-	skcipher_request_set_callback(subreq, areq->base.flags, NULL, NULL);
-	skcipher_request_set_crypt(subreq, areq->src, areq->dst,
+	skcipher_request_set_tfm(&rctx->fallback_req, op->fallback_tfm);
+	skcipher_request_set_callback(&rctx->fallback_req, areq->base.flags,
+				      areq->base.complete, areq->base.data);
+	skcipher_request_set_crypt(&rctx->fallback_req, areq->src, areq->dst,
 				   areq->cryptlen, areq->iv);
 	if (rctx->op_dir & CE_DECRYPTION)
-		err = crypto_skcipher_decrypt(subreq);
+		err = crypto_skcipher_decrypt(&rctx->fallback_req);
 	else
-		err = crypto_skcipher_encrypt(subreq);
-	skcipher_request_zero(subreq);
+		err = crypto_skcipher_encrypt(&rctx->fallback_req);
 	return err;
 }
 
@@ -335,18 +332,20 @@ int sun8i_ce_cipher_init(struct crypto_tfm *tfm)
 	algt = container_of(alg, struct sun8i_ce_alg_template, alg.skcipher);
 	op->ce = algt->ce;
 
-	sktfm->reqsize = sizeof(struct sun8i_cipher_req_ctx);
-
-	op->fallback_tfm = crypto_alloc_sync_skcipher(name, 0, CRYPTO_ALG_NEED_FALLBACK);
+	op->fallback_tfm = crypto_alloc_skcipher(name, 0, CRYPTO_ALG_NEED_FALLBACK);
 	if (IS_ERR(op->fallback_tfm)) {
 		dev_err(op->ce->dev, "ERROR: Cannot allocate fallback for %s %ld\n",
 			name, PTR_ERR(op->fallback_tfm));
 		return PTR_ERR(op->fallback_tfm);
 	}
 
+	sktfm->reqsize = sizeof(struct sun8i_cipher_req_ctx) +
+			 crypto_skcipher_reqsize(op->fallback_tfm);
+
+
 	dev_info(op->ce->dev, "Fallback for %s is %s\n",
 		 crypto_tfm_alg_driver_name(&sktfm->base),
-		 crypto_tfm_alg_driver_name(crypto_skcipher_tfm(&op->fallback_tfm->base)));
+		 crypto_tfm_alg_driver_name(crypto_skcipher_tfm(op->fallback_tfm)));
 
 	op->enginectx.op.do_one_request = sun8i_ce_handle_cipher_request;
 	op->enginectx.op.prepare_request = NULL;
@@ -359,7 +358,7 @@ int sun8i_ce_cipher_init(struct crypto_tfm *tfm)
 	return 0;
 error_pm:
 	pm_runtime_put_noidle(op->ce->dev);
-	crypto_free_sync_skcipher(op->fallback_tfm);
+	crypto_free_skcipher(op->fallback_tfm);
 	return err;
 }
 
@@ -371,7 +370,7 @@ void sun8i_ce_cipher_exit(struct crypto_tfm *tfm)
 		memzero_explicit(op->key, op->keylen);
 		kfree(op->key);
 	}
-	crypto_free_sync_skcipher(op->fallback_tfm);
+	crypto_free_skcipher(op->fallback_tfm);
 	pm_runtime_put_sync_suspend(op->ce->dev);
 }
 
@@ -401,10 +400,10 @@ int sun8i_ce_aes_setkey(struct crypto_skcipher *tfm, const u8 *key,
 	if (!op->key)
 		return -ENOMEM;
 
-	crypto_sync_skcipher_clear_flags(op->fallback_tfm, CRYPTO_TFM_REQ_MASK);
-	crypto_sync_skcipher_set_flags(op->fallback_tfm, tfm->base.crt_flags & CRYPTO_TFM_REQ_MASK);
+	crypto_skcipher_clear_flags(op->fallback_tfm, CRYPTO_TFM_REQ_MASK);
+	crypto_skcipher_set_flags(op->fallback_tfm, tfm->base.crt_flags & CRYPTO_TFM_REQ_MASK);
 
-	return crypto_sync_skcipher_setkey(op->fallback_tfm, key, keylen);
+	return crypto_skcipher_setkey(op->fallback_tfm, key, keylen);
 }
 
 int sun8i_ce_des3_setkey(struct crypto_skcipher *tfm, const u8 *key,
@@ -426,8 +425,8 @@ int sun8i_ce_des3_setkey(struct crypto_skcipher *tfm, const u8 *key,
 	if (!op->key)
 		return -ENOMEM;
 
-	crypto_sync_skcipher_clear_flags(op->fallback_tfm, CRYPTO_TFM_REQ_MASK);
-	crypto_sync_skcipher_set_flags(op->fallback_tfm, tfm->base.crt_flags & CRYPTO_TFM_REQ_MASK);
+	crypto_skcipher_clear_flags(op->fallback_tfm, CRYPTO_TFM_REQ_MASK);
+	crypto_skcipher_set_flags(op->fallback_tfm, tfm->base.crt_flags & CRYPTO_TFM_REQ_MASK);
 
-	return crypto_sync_skcipher_setkey(op->fallback_tfm, key, keylen);
+	return crypto_skcipher_setkey(op->fallback_tfm, key, keylen);
 }
diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h
index 0e9eac397e1b..963645fe4adb 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h
@@ -181,12 +181,14 @@ struct sun8i_ce_dev {
 
 /*
  * struct sun8i_cipher_req_ctx - context for a skcipher request
- * @op_dir:	direction (encrypt vs decrypt) for this request
- * @flow:	the flow to use for this request
+ * @op_dir:		direction (encrypt vs decrypt) for this request
+ * @flow:		the flow to use for this request
+ * @fallback_req:	request struct for invoking the fallback skcipher TFM
  */
 struct sun8i_cipher_req_ctx {
 	u32 op_dir;
 	int flow;
+	struct skcipher_request fallback_req;   // keep at the end
 };
 
 /*
@@ -202,7 +204,7 @@ struct sun8i_cipher_tfm_ctx {
 	u32 *key;
 	u32 keylen;
 	struct sun8i_ce_dev *ce;
-	struct crypto_sync_skcipher *fallback_tfm;
+	struct crypto_skcipher *fallback_tfm;
 };
 
 /*
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
