Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F082606A31C
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Nov 2026 12:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Pj4lRbRv;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S5STYB/X
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xCopMac5EsFlMuFyeQUfJNemnvg2irra/kVTcqQ0fgs=; b=Pj4lRbRvVTX6aE96Dt6RzQ93FD
	KgHmdpVUmHqvdI6C1o5LKFaedmFX76KncbVUKo22+BG6VxK3052aJFcT30xDmh2/t7oqF8lrh35KU
	+nvYGdXHdfv+NTRgM/hFzMuOgYs+wAZ+GUrJsUu7PW11HnSdwRAhQlMVV2U3etBzqmGjHrm2E4E9L
	ML0W4iIAjgC6uAJyXxs2rHgTqNP7XdRi7y9sBf1S1PUQ2EWg57QINVevKvZZKdgA4TUzV29yLygzL
	G9bjKb5r77yO37L2LhuttGWEIVxOkuOcyeBeRJ+vhtr8cr/Aj26WSARz5pPeTi7lYhOafdKgAqcvs
	pGK4DhCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuf0-0000000FxgD-3u73;
	Fri, 27 Nov 2026 12:02:38 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWueI-0000000FwVW-0MbA
	for linux-amlogic@lists.infradead.org;
	Fri, 27 Nov 2026 12:02:01 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so73192675e9.1
        for <linux-amlogic@lists.infradead.org>; Fri, 27 Nov 2026 04:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795780912; x=1796385712; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6o5PkBcDr5mo9vn6AHRcwo7DgEVc20BXfKxW4pDcM60=;
        b=S5STYB/XKk2mjMZXkpQrCqe/0mf23s1eEy5E1PUTbLoMiovFJ9oj7PD+jDQIBMiWcq
         mbVAlZxXHuI/z29JV00VgJb74w1nmLAS9vV3FfMXQ4O72FmkL8cmuYncDMscJ74Fkxmz
         SuB2tzJptr3J4H3DQnYQHYpRryUt0mXgvMu87rFbSrO41w+eVaL+gVLHYAiNOBfAUdVW
         wRdjOnGXxyDyQk62RJdYi150XVXrNSdADUlVl9zlTCC3NydLxPMVMldPBl8NOiuiLQ7p
         byyYcdo5CgvTDx2n+C4KeRbdMksidBMIDrNyYo45dxnTltR5WDxid7FFLq5vMi99m09N
         Up4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780912; x=1796385712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6o5PkBcDr5mo9vn6AHRcwo7DgEVc20BXfKxW4pDcM60=;
        b=Qf6UvoOK23gkpbfSCisMY03CM9fJ9CQQlPO3ZKgLqqt3I2vvsGGdiN/DwnX+4RmTBs
         cA1idnuykTq3uHjAD6Wjl2dAuwMZiuDdg0YzJcgzcxiN336DqZUAHMWI+G+Lo2SM6Nvp
         drW7uCD1HtvkNKsU+9tyq215f1kBeZJgaTMHvdQ7g4iwk0QGA7apI+dKSQbgd6NqNUib
         EENhy2vBnfkdRy6t4Hw7yPrAhXnGF2PCXTBkn9D5cDmfOCMoXA9F/XsA6V9tmkXAjwNB
         FqGdMVL7k/mCdE/tLMQxzNuatV8bkD9sdXCKnTQatEt9VQyi+j5smHR6MEKOhT/yBIag
         9vMg==
X-Forwarded-Encrypted: i=1; AL+hErEMtYJDJKfpetdhh7UPAr8ILfQAUzpXXFjLw/4z8XIl0aMcK+/Ar3ynH4lELF+uXZKVqutOWukzwP6dnj+L@lists.infradead.org
X-Gm-Message-State: APuU4Z+aseqEPnusfTFVlNVFQ5OF6Jz0m7Yfd1OcXcVLn9HucNyYTTtx
	Qko2x0SWDm0xoIOvw3ICzDVvpkgZlRc79dO52a+g2bynKJd4kiDRnWEc
X-Gm-Gg: AZFdTZcAM24mgSEzeb2413qXWtryrdDemuBkS06zCjTrTFLcb9xs1kjm1b99ZMFHc/o
	9TE8y1WQM2rO/79jQ8LPZh9xroQs91CdR0wRiFTzgDgA6nRgmzyT/W7WnuPTJm8Y8zGaPkFK3lY
	qoxo0paoE3NORZS5bLNHEpYYKGK44i1rO2mte28Xk4LvGVG/LN4S3gbcqrKdZBW9greC7alctTO
	hvCwtraCO8NnDEhAdE+n3TS+NX+hEhH6R9u4gefcypAt+lIiXSqLlap0uu6CsYm8Zi9aNpN1m6Z
	byPSLluGiM/TjrayK/rZIHO1q8uiy3z0QqdpR6eZ4jZipVQajafXwA99bcxkvtbNVLkPscBi4KB
	8LgnCzD1Rhi1kIIEQhQmCKONWAwrTpV6Ra85KKsoezFGTtMu3HvrW/iPm1AnvwLLp7zAE7HceHo
	RviPjQoIyo8EED2diB1TXCAK4DvWU8ak5Twqdachs0L5uc/NRpWWBhYHMRsYO0byvU9FGJfxSFo
	aLKwbnTePl647NpKyELAzeyXbQHCwDTu5y0CDTWtKRGLMacGhwWDWv/JSdP5BqG0BSdp3DYV71L
	Pd4qRh8lVeICcQfRIpbiVknfuksY18nq3lMOYeTpTCJc9yJ2
X-Received: by 2002:a05:600c:a0b:b0:4b7:6a8b:9df2 with SMTP id 5b1f17b1804b1-4bb8882432bmr483859845e9.25.1795780911905;
        Fri, 27 Nov 2026 04:01:51 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm393684565e9.0.2026.11.27.04.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:01:51 -0800 (PST)
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
Subject: [PATCH v14 18/30] crypto: amlogic: g12: drop CRYPTO_ALG_ALLOCATES_MEMORY
Date: Fri, 27 Nov 2026 13:00:51 +0100
Message-ID: <20261127120103.1532882-19-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127120103.1532882-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
 <20261127120103.1532882-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_040157_681070_54D6ADA7 
X-CRM114-Status: GOOD (  11.01  )
X-Spam-Score: -2.1 (--)
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

The driver queues requests to a crypto_engine kthread and does not
allocate memory per request, so CRYPTO_ALG_ALLOCATES_MEMORY is stale.

dm-crypt allocates its skcipher with a mask that excludes
implementations carrying CRYPTO_ALG_ALLOCATES_MEMORY, which prevented
the hardware cipher from being selected.  Dropping the flag lets
dm-crypt bind to the engine.

Signed-off-by: Jose Nieto <jnieto.alaber@gmail.com>
---
 drivers/crypto/amlogic/amlogic-gxl-cipher.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-cipher.c b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
index 6070ee6b488e..72892fdcd55d 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-cipher.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
@@ -498,7 +498,7 @@ static struct meson_alg_template algs[] = {
 			.cra_priority = 400,
 			.cra_blocksize = AES_BLOCK_SIZE,
 			.cra_flags = CRYPTO_ALG_TYPE_SKCIPHER |
-				CRYPTO_ALG_ASYNC | CRYPTO_ALG_ALLOCATES_MEMORY |
+				CRYPTO_ALG_ASYNC |
 				CRYPTO_ALG_NEED_FALLBACK,
 			.cra_module = THIS_MODULE,
 			.cra_alignmask = 0xf,
@@ -526,7 +526,7 @@ static struct meson_alg_template algs[] = {
 			.cra_priority = 400,
 			.cra_blocksize = AES_BLOCK_SIZE,
 			.cra_flags = CRYPTO_ALG_TYPE_SKCIPHER |
-				CRYPTO_ALG_ASYNC | CRYPTO_ALG_ALLOCATES_MEMORY |
+				CRYPTO_ALG_ASYNC |
 				CRYPTO_ALG_NEED_FALLBACK,
 			.cra_module = THIS_MODULE,
 			.cra_alignmask = 0xf,
-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
