Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE707606A327
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Nov 2026 19:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=u/QQEW4h;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z13Wo8eH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1ts3juziLBqRkXWjipE0OAXu2tdkT6W6yGKdS7211d0=; b=u/QQEW4hI717y0mFbTuAOM74m4
	rlNxbt/hR6Y3CnXkZkuG5ze9NnzrH4JH5Q6tqx78p9+XGccW/wFceDf5B1Tv+SuZ/DErIjSMwleNX
	tD8yxNIhtowibsQEocuLAJP1pzYqLMBOCxYXhV0a8h9bEDINEZ82ieKx0ycDtMyb6SA1EYv6ImVsd
	6jC038ZXR954OUcMzqRuYwgTwOmWqisZJBdMWZguhhmyc17GLzqyPTEbelRL8jWM2OACJJPRN0NC5
	bCiZwBeLE0d75gyl/VfW2zlJniBe37Rb8RrpoQo4BAeFSt2AUIAxkhZADoB54AUadMA8166Bfmo0f
	MZhI/BzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfDj-0000000EJlT-0Hgw;
	Thu, 26 Nov 2026 19:33:27 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfDU-0000000EJTR-0RP0
	for linux-amlogic@lists.infradead.org;
	Thu, 26 Nov 2026 19:33:13 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so70892995e9.3
        for <linux-amlogic@lists.infradead.org>; Thu, 26 Nov 2026 11:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795721590; x=1796326390; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GbFTXgWz4qbUUEtYKh+mkh290tQbhLkX/pW25drgstk=;
        b=z13Wo8eH+CO0k6mux2qkmQc+2exHkhicrwhsrb0DMfkXrZbXoZAyRN5bBczfx36si8
         Gc+WlGtqvi07t5VTroM1eTUNRncsM/rz41cGUbY+gtcTDBKqUZY7TgpAbzzSykDb6YLM
         pMcBFlRVcItI3R+LvhJkH5NxM/gBeb6bVggrtwdq+Se4qf3rbKWrhCsZR4c15ZQZMLG8
         IWkcDw91HsKByRARlgvCDtl5fftJAtq3H+ggrQxB90rhpvqIHKtGpS/FoKMxEkyIonrg
         F6r1E5N5eus40KBVFmFuuahpDj4VFQAB7X5oRPDSYSNk5W9YUEHeJ4nvIJ2miL3Dgf4F
         h3eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795721590; x=1796326390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GbFTXgWz4qbUUEtYKh+mkh290tQbhLkX/pW25drgstk=;
        b=bexAriUh1Y8Hi1o68OmR2fmCYBH4GkeRp3kMiiinwQ/7ARvLU5e/KDpEJ5VsKCpjQ4
         dshU2Voig0VUbk52El7obO6PulQtlppwGbFMYJ5xkIjuHpgGtIk05mrXpAnCvmf2GYXp
         YcRdZNdFbCHecsjhHRx36k9dhHP/+zgX9mKrnB3Eb4qvEQiA8xKmbyfCKzfxTkJbQKNl
         1IwtwknLQE3BTSwa85ysGpeGCy0/Sj3YgCdPnvsMaU08YE4QmCRE+xMqEkmSmCVfvpjv
         TXN1s35qmKzNR8BH3j45o+rosys+FG4Cpa6ODO47ngv7lnrpjDU+ceVFToSy0H2tV+Qj
         LcZg==
X-Forwarded-Encrypted: i=1; AL+hErE77jetLO5y1gsS4ZCUGb9VEfno9ZOEnlRiP1abJO2X1UIlCnihcA2gF3xaCND4eUz9ERV6iMhzpnYLZNwo@lists.infradead.org
X-Gm-Message-State: APuU4Z/cqP2cJaEHfIet/7PyjDsiEhdj4uSl0x/a17ITeX//kpR0mSmB
	9B8fHC2/o/furQoRYk3Bdt57UiUg3tR1z3cnGN+3Wya0aCEsxLDOH3cm
X-Gm-Gg: AZFdTZeVbMPGmw1UMrpL0Hh2B1DRsF5sX2y8x8TONr2oCSAiETUb9GGoop2VPqywpvr
	TJzTTboN+RWkDa9pgAAxfy8ArOcJx+EAYXPWwLh25W+nXTCBXlHvHmCRaKFKdIjy0/tVqHtx3om
	pTxd4S0OW97pD5yH6CbfFKDXsySwv8yIIUB4JoCWsogPIECL5vMZhknmDynlRPx2IPawkuuG11d
	jO8Lsr9z5F9b9tO3Zuy2p1GeVfUfvliwJx9AT/LTo4ACvF4hdRXBbPbqyJybpszr8aMF6NYKMqs
	ySQ9Nu+Bt+WZo3zJMazVvCeIwkof05jnh8iFxqnOuMkS6QcqgLVnZcUpPDtuVkt2gtpaswJctjF
	riBKtf7wbyP1dHuFVX78L2qHUfCScTAvUu29ezYpdwUEWA0xc+sJzTBJZn/U+COLEnEvhMn+7x6
	+Mux4a5BbKDPrFDocUyDBu6ycDWXTFbZCZKpcIP6Madib537TQdrEu6xh6noGEAUy7sxhEDAn8M
	zv7X9lHuoj6kG3kBaXm+hJyj3DZbuxuiNjcX5zHBDNFE/WFVgnivD4n2h094fPZ/v9ruBzQhYvY
	R9I5rt99T3pCkXJT4TENs8ccFhM3NTsYMhA660+Xz3k6rlBilcy0ljT3TnV6WlZGhFQ=
X-Received: by 2002:a05:600c:3ba9:b0:4a2:1050:aff with SMTP id 5b1f17b1804b1-4bb8881c741mr514973795e9.6.1795721590419;
        Thu, 26 Nov 2026 11:33:10 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906cdcc1sm368287675e9.2.2026.11.26.11.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:33:09 -0800 (PST)
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
	Alexey Romanov <romanov.alexey2000@gmail.com>
Subject: [PATCH v13 07/25] crypto: amlogic - Move get_engine_number()
Date: Thu, 26 Nov 2026 20:32:23 +0100
Message-ID: <20261126193241.1471372-8-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_113312_169472_29DEA8F5 
X-CRM114-Status: GOOD (  10.45  )
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

From: Alexey Romanov <romanov.alexey2000@gmail.com>

Move get_engine_number() function from cipher.c to core.c

Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/crypto/amlogic/amlogic-gxl-cipher.c | 9 ++-------
 drivers/crypto/amlogic/amlogic-gxl-core.c   | 5 +++++
 drivers/crypto/amlogic/amlogic-gxl.h        | 2 ++
 3 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-cipher.c b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
index 62aa82e1cb5d..f6c13d8fcb47 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-cipher.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
@@ -17,11 +17,6 @@
 #include <crypto/internal/skcipher.h>
 #include "amlogic-gxl.h"
 
-static int get_engine_number(struct meson_dev *mc)
-{
-	return atomic_inc_return(&mc->flow) % mc->flow_cnt;
-}
-
 static bool meson_cipher_need_fallback(struct skcipher_request *areq)
 {
 	struct scatterlist *src_sg = areq->src;
@@ -297,7 +292,7 @@ int meson_skdecrypt(struct skcipher_request *areq)
 	rctx->op_dir = MESON_DECRYPT;
 	if (meson_cipher_need_fallback(areq))
 		return meson_cipher_do_fallback(areq);
-	e = get_engine_number(op->mc);
+	e = meson_get_engine_number(op->mc);
 	engine = op->mc->chanlist[e].engine;
 	rctx->flow = e;
 
@@ -315,7 +310,7 @@ int meson_skencrypt(struct skcipher_request *areq)
 	rctx->op_dir = MESON_ENCRYPT;
 	if (meson_cipher_need_fallback(areq))
 		return meson_cipher_do_fallback(areq);
-	e = get_engine_number(op->mc);
+	e = meson_get_engine_number(op->mc);
 	engine = op->mc->chanlist[e].engine;
 	rctx->flow = e;
 
diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index b972df44e8b5..58d56f352dd6 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -22,6 +22,11 @@
 
 #include "amlogic-gxl.h"
 
+int meson_get_engine_number(struct meson_dev *mc)
+{
+	return atomic_inc_return(&mc->flow) % mc->flow_cnt;
+}
+
 void meson_dma_start(struct meson_dev *mc, int flow)
 {
 	u32 offset = (mc->pdata->descs_reg + flow) << 2;
diff --git a/drivers/crypto/amlogic/amlogic-gxl.h b/drivers/crypto/amlogic/amlogic-gxl.h
index 64f2f0e63f12..e14cd5021add 100644
--- a/drivers/crypto/amlogic/amlogic-gxl.h
+++ b/drivers/crypto/amlogic/amlogic-gxl.h
@@ -159,6 +159,8 @@ struct meson_alg_template {
 #endif
 };
 
+int meson_get_engine_number(struct meson_dev *mc);
+
 void meson_dma_start(struct meson_dev *mc, int flow);
 
 int meson_aes_setkey(struct crypto_skcipher *tfm, const u8 *key,
-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
