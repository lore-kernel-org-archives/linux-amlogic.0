Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92250606A31C
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Nov 2026 12:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ln24Fm5k;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=TsSga4kn;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kzafw3HQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=boP4+mzTpw8x5WrWuq6lDGDiFqoBPA0DNwDh4v7majs=; b=Ln24Fm5kKfjj9ouFlLu89xIM/f
	1utluYMfu2CNes/wr1kZ10DutW/z5wRIXVZLTVCBpErdIXcMQmKyKpVnn+tnlRxEzOkxiBg+UmEMX
	8VERNQPZ1J1F8dkD0wGAAz24LhKyb1NFDeUJDa8hNEn1JvFrPkXJMW7XpytegCIj5TRm5Jn3UEbj2
	rxXAmPM63PbJABVaOqnbjce5QQ4NROAbZFPcmK8AC8I/HAu38UokKrS1UpFfzjHO36kvvrrB+8s42
	ht2pjr0JroNS8Z/jNay1A8QHiS3QXWzGi4Ejh8JKhQxRXEvUGP+ajYhViY7Cw44GcWj+P89kPBMv1
	4PsiIgdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWugL-0000000FyZf-1Acr;
	Fri, 27 Nov 2026 12:04:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWueh-0000000Fx8K-1ahC
	for linux-amlogic@bombadil.infradead.org;
	Fri, 27 Nov 2026 12:02:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ideFtYn4ffgnnNVgM+MGgEFjn8Xh17mg6POE0V0VRbw=; b=TsSga4knzIS+Dt5/26AXTehawi
	4Bx9EVl/994Q2okiIG0xsmwru2RNy5k+YJrB5c46nJ+mFsctMiR0kN97uB9Ku3tfsF8yrWCzhZQBJ
	60WWpFBS7meJCsKIsGftpagJp55rQRP8rBvnsxmtTEfO++1FezQSgcBlL98taFnT+GU3aMPJGTOEd
	IYofeykPvXwi4BoHxjoEJP/XbKo6Io8+lXA016+WnPv9r7KBUPQdse03A3e4+3OqGVojVfcxJFXwP
	vZluZ0eHxzoa3v6WhJYGw3HtW8XjOSTh4qa2pqKhuFq9gsQa4QZIZXAjSujgK7sDZCJFXYCoadPIJ
	6Pew30AQ==;
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWueb-00000007fkb-2PZk
	for linux-amlogic@lists.infradead.org;
	Fri, 27 Nov 2026 12:02:17 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso80964205e9.1
        for <linux-amlogic@lists.infradead.org>; Fri, 27 Nov 2026 04:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795780929; x=1796385729; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ideFtYn4ffgnnNVgM+MGgEFjn8Xh17mg6POE0V0VRbw=;
        b=kzafw3HQBDgZjKbmHd+xHOTtwM90yjEE/dWc8saLLrcj0IwxHzQN3d35283xEsjRS3
         BJbb1qN8YDAIXXipBBrRrIIDVTqtnw3rW4ur+9ApkSdxNAXXTyBi8dijsVTTHzbDCQ4z
         gEa0TwjAkIm+8kMCrfpWTuqolPGmcgcfPfkui5KMHn4gxFoOPA0YXhm+mTDHDMqkok8u
         G6l40BBNICgFwfRvJTlwA9audV7xGMMUpYWe68PmzfxKIZ1oIrtHtB2MWRDfaG5SzRkg
         q4ML1hG0KUq0EGwe9nMo+Kq1h6i2GnDpxKVSVl32QUm8AjDLBlCdOs/3Nz9k3lO6AW4o
         +hqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780929; x=1796385729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ideFtYn4ffgnnNVgM+MGgEFjn8Xh17mg6POE0V0VRbw=;
        b=TKGVeUb9nDw1O1xi1kwAYXHn/eWaVbPSGsTDvhWsUzUCG8VL3/0/xFY7xc5HMz2aEl
         8jbTKLtA16gPj04JJtOD1VzNSF78ppMLgyLc7aB4rkmTLd/Zl6piTKEvxdRQmPSBzqqa
         wIZDiUZT4KqfujJdeY9FeQZhK5aVlOWI48ULf72hTHWKgLrdke0QhgRufbQkZnv+N+g4
         ql8WXb5/k4eqRcR4rz6y86icWuwlFcG5ElDAFwXok9fkoRYRKAPiaYVknDD1zz0v0pYO
         /v3LawVJAM44VKKEOOj0tY457KBlQTCk4S1XASWmhQBrvHjz5mlXnQJnx9oUdqMM2n/2
         ao9Q==
X-Forwarded-Encrypted: i=1; AL+hErHp69SQqnlHbDnMWnDMbAAq2VqwSOvL2eFESasu2iv51Ou1XRVTVDaC+ojqwsE+lllCUqUlYDricjuIDFFb@lists.infradead.org
X-Gm-Message-State: APuU4Z8kh4MSMnCVGlnjkxlIDkQweE+eMQaLxwRVHGEEWeoZ1YUHmSn/
	oxvNohXNXTOCqtOaiuXnBvB44AwlZJ1bihtzT80byYm8aMi2sM8MYf52
X-Gm-Gg: AZFdTZf75rMaibSBY9ix+uU/oi91NHd3TRgMs0P1sVCPWiA7yEkFyIZ24oFFNw62fja
	3pfjaPGjegSk9kYVwzVgHBq3YUcXfnZK+UqGBzfIuCnmCGLdbnD2/3SSIaakJY0ndeJ7XXcA6ix
	sDeGN60j/tBdvcdUXPr/+6g+SfJQXJ4xQzKkxROm9E9Cj4yWoHHwD8tOqgZit/4zlFd8NWlRBhV
	SjjV7DOtUUe3ReJD6Z14bSUcjv2t81Nvhag+khQ/ZxwIjMshxBYvDzD7hJtLsZgYdmoBzTop9Vm
	25JkLHH7B0xX3Ve7i5XuoiOH5q3UDhiDRsApAQvNtxNstq/IAUHj/uTesFZclhkqMP62NjUuBUW
	nO9Vzs3NFP2t5tx35v0LcZ01gaqfrWnOK1UJTCTU+u9aggKuP6ttkYkA96TZdomXpjOrE5ZIe7p
	0mn6X/sZhADCk37smM4nPkUQCf8e12dEY7Z08r8YhIsWAxquZNixnlj0NKs4TJAd+MPS/CJkU2j
	1JOdCcQgKD2sQn95TbMNYZq/eE36DMLQkLD0QRAiqAGYfcwTJbfdSadntliUc8RmN0y0bMMq4Fn
	pV8IORR3cyDqWVWGFUb269W4Wla3PGFlCdDKf0EEnmAykz4=
X-Received: by 2002:a05:600c:c8c:b0:4b7:6942:39bd with SMTP id 5b1f17b1804b1-4bb88820e06mr485025885e9.26.1795780928793;
        Fri, 27 Nov 2026 04:02:08 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm393684565e9.0.2026.11.27.04.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:02:08 -0800 (PST)
From: Jose Nieto <jnieto.alaber@gmail.com>
To: Corentin Labbe <clabbe@baylibre.com>,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jose Nieto <jnieto.alaber@gmail.com>
Subject: [PATCH v14 28/30] crypto: amlogic: fix setup descriptor lengths and CBC IV copy
Date: Fri, 27 Nov 2026 13:01:01 +0100
Message-ID: <20261127120103.1532882-29-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127120103.1532882-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
 <20261127120103.1532882-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_120213_577289_623D877B 
X-CRM114-Status: GOOD (  14.76  )
X-Spam-Score: -0.2 (/)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Fix the key/IV and SHA state setup descriptors and drop a duplicated CBC IV
copy, found during review:

  - meson_setup_keyiv_descs(): program the per-descriptor length as
    keyiv.len / setup_desc_cnt instead of the full keyiv.len, so SoCs with
    more than one setup descriptor do not read past the key/IV buffer.
  - meson_setup_state_descs(): use MESON_SHA_BUFFER_SIZE / setup_desc_cnt
    for
    the same reason.
  - Drop the CBC IV memcpy() + dma_sync_single_for_device() in
    meson_setup_keyiv_descs(); the IV is already copied and the buffer
    mapped
    once in meson_cipher().

Signed-off-by: Jose Nieto <jnieto.alaber@gmail.com>
---
 drivers/crypto/amlogic/amlogic-gxl-cipher.c | 15 +++------------
 drivers/crypto/amlogic/amlogic-gxl-hasher.c |  3 ++-
 2 files changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-cipher.c b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
index c11ccbaf920d..10815ffe3313 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-cipher.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
@@ -147,24 +147,13 @@ static void meson_setup_keyiv_descs(struct cipher_ctx *ctx)
 {
 	struct meson_cipher_req_ctx *rctx = skcipher_request_ctx(ctx->areq);
 	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(ctx->areq);
-	struct skcipher_alg *alg = crypto_skcipher_alg(tfm);
-	struct meson_alg_template *algt = container_of(alg,
-		struct meson_alg_template, alg.skcipher.base);
 	struct meson_cipher_tfm_ctx *op = crypto_skcipher_ctx_dma(tfm);
 	struct meson_dev *mc = op->mc;
-	unsigned int ivsize = crypto_skcipher_ivsize(tfm);
-	unsigned int blockmode = algt->blockmode;
 	int i;
 
 	if (ctx->tloffset)
 		return;
 
-	if (blockmode == DESC_OPMODE_CBC) {
-		memcpy(op->keyiv + AES_MAX_KEY_SIZE, ctx->areq->iv, ivsize);
-		dma_sync_single_for_device(mc->dev, ctx->keyiv.addr,
-					   ctx->keyiv.len, DMA_TO_DEVICE);
-	}
-
 	for (i = 0; i < mc->pdata->setup_desc_cnt; i++) {
 		struct meson_desc *desc =
 			&mc->chanlist[rctx->flow].tl[ctx->tloffset];
@@ -172,7 +161,9 @@ static void meson_setup_keyiv_descs(struct cipher_ctx *ctx)
 
 		desc->t_src = cpu_to_le32(ctx->keyiv.addr + offset);
 		desc->t_dst = cpu_to_le32(offset);
-		desc->t_status = cpu_to_le32(DESC_OWN | DESC_MODE_KEY | ctx->keyiv.len);
+		desc->t_status = cpu_to_le32(DESC_OWN | DESC_MODE_KEY |
+					     ctx->keyiv.len /
+					     mc->pdata->setup_desc_cnt);
 
 		ctx->tloffset++;
 	}
diff --git a/drivers/crypto/amlogic/amlogic-gxl-hasher.c b/drivers/crypto/amlogic/amlogic-gxl-hasher.c
index 978cdcd8a4f9..710dd413bd51 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-hasher.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-hasher.c
@@ -253,7 +253,8 @@ static void meson_setup_state_descs(struct hasher_ctx *ctx)
 		desc = &mc->chanlist[rctx->flow].tl[ctx->tloffset];
 		desc->t_src = cpu_to_le32(ctx->state_addr + offset);
 		desc->t_dst = cpu_to_le32(offset);
-		desc->t_status = cpu_to_le32(MESON_SHA_BUFFER_SIZE |
+		desc->t_status = cpu_to_le32(MESON_SHA_BUFFER_SIZE /
+					     mc->pdata->setup_desc_cnt |
 					     DESC_MODE_KEY | DESC_OWN);
 
 		ctx->tloffset++;
-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
