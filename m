Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE24C606A31C
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Nov 2026 19:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qTEfjQvg;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ov6wZJ1a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=b/DR5/M3Wbr6tPyrfr1qcsqctv34b+tlOgjC4LU5fw0=; b=qTEfjQvgAwMno79F4KI+iT1p+/
	Ww5/TJLt6LKQWEllnGi9TrebIfEeI8wPtFsr46Hl3X1gUaLFgY5XCrMjA2RWKypfTqOk4qRc1F1jk
	1ZH+fPHYOkVFYULkUp/GajaMXdriWuHb0K3YL74ibjh7sIDEilJKWBHnlt0+jjzYdCKRZvT4GNt+/
	ZmCzYgkUJ0UguHIn7QuuIJyiNF43VGWco11b+f56BS9fW1sJoj4Ezrwj58gPLCtQ4kOAr0E0N1lHg
	JN7/OUWVbcY7NJSVKsq3KjaT+Rrx9tXLC4NwL0YZpfjjqi7HEo9JRaI2YjnBx7bFr2CkoGNzC0FYM
	W6430RQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfE2-0000000EKN2-2GuB;
	Thu, 26 Nov 2026 19:33:46 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfDf-0000000EJdM-0UMO
	for linux-amlogic@lists.infradead.org;
	Thu, 26 Nov 2026 19:33:24 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so95242035e9.1
        for <linux-amlogic@lists.infradead.org>; Thu, 26 Nov 2026 11:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795721601; x=1796326401; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vH8KVarvy9c5js2zbRlKpUiINo+DHyvtWOK36pzfGps=;
        b=Ov6wZJ1aufj0GHpCE1qwW3pSoEqyiR0dO5y4Ntb5T58w/sJeoCuMVyGPSpLb3vqc/A
         gsawa+daAzbZMCQin4ZxIRTNdeSqETMaorVDGvtSb3ntLT7ZJNDYH06FVrQzkZMogKzr
         7zXj4zsuLeOBHzqVLHE76LlVo8dBoiauMXCGMTBd/WoQXBAsiB8uKs9ZmtMpeIUR4XU2
         2tqVG65c1LRLQbDAOMqkOxhgVdXcewSVOlWi7zPBa7AgSq57pqdSiaw/74mqNSlmXZ4M
         CuPOWCOWsfLHhq4M7ZAGhl+2NobWs1ghTk9E82qbt9zzvNVBCojIhIzdpZJ3z6me/N3L
         ZqiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795721601; x=1796326401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vH8KVarvy9c5js2zbRlKpUiINo+DHyvtWOK36pzfGps=;
        b=wux/ic9RdQ7u43v4uvprvBssa1o44p7XcdeDIn4GTEOkq7T+EVR4R07mZuAkBdKXuc
         2XosCPOzSFtnwUselrpYdhfWqG0lsA6ctbKA08BzIWjKgfV7OffwdWWMNz6IOS3rIFrP
         ZqBJnrKsIFqAN5fOvVLzt+wBv+hyAYHIFA1PXCFLowWoFpMD3MvvRaTw4Aqyv4eFqQDH
         /aTqbFiiZ9Yf2cy0f1jDncMpCXaiHpy/1IXhw4yoLxTvMVgpmi6fPWvAdAAYQkSCM2h9
         fomPqNcVED1f1Hds1oDB4XPc6MKoMJyWcy5XDpeUfRq2bet57XSggpKhi+OWGpRGIBgl
         bRMw==
X-Forwarded-Encrypted: i=1; AL+hErFLK7OtAq18Z2RYb67HOvbTjYgk69Y/WR/M1BT45rWHS/Uk/LPagCzJ6mzx9IjGUua2L1N2yRzK15toVFXn@lists.infradead.org
X-Gm-Message-State: APuU4Z84Jx2SMXeA8gQHSy33XSx/ZqRObKV99J7nIDoZaxF8fEfmYgU+
	L0NZ/hm7UJciz7mw0mwTvftOCyNxa7Gylr5tIIAHsnUPJKcP83Icv5vY
X-Gm-Gg: AZFdTZdBOfEIodzscL3ZNu1J2q16F9xUa58KZaLzQSOLniob2qOFIUvB12BzwUu3ONT
	c3PUVtnKEnSh+RZfZN6FmIp6cr7vOyjxW8oJ81kQusO3Nsj5dFPgLQk4cl0ct/Y2AOFZs9Fmi5p
	8iIq29xoqmDMNi4JTbOcUM6qEjPwDgBMOV7vZCxUmq1A/nSjgusXZ+fHXXeMxzzquP5mra5zjS6
	bfaPQv+ZhniMqA5W3izU3jAJAlU18Zqq7N39B/pce9+EQfawABe9RSlorVn01LiTXq8AMDFqdk2
	mRYxtPv1zIrmFG3Xvdfeb52jPtUPc0UPWCKbDl9eaKyGLBz77QfSvNA20KUEjVS+s65eeUGqcr5
	14Y9RorS9XJdm1pNlrtZb/apPL/YYmjTAgsPjVuyqNTxlDzNDltYNGkJayZEz2cqfw/7irW2KY+
	XeKqdw2MCqw1g2+aihcF+9Qut5Tvj7aYgkBiMoGXNHrW1/qPOQUi72TLoWCkoMbYiM3klV5twqk
	zcAm8OXv7JdZGCyNSj28zf3RKwv923G1VCPdiKOUHVVEJaKZ2fwVezOd1boP6lQrucMlSJDnzh7
	BVsbQPu7aiZkOByjJ6zmI0siSS5Uvw/CXo6jLLqenRWzMIKK//nWghUFWTTgpaqu4FU=
X-Received: by 2002:a05:600c:1d09:b0:4bb:66fd:ad68 with SMTP id 5b1f17b1804b1-4bb888160cdmr471718395e9.14.1795721601329;
        Thu, 26 Nov 2026 11:33:21 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906cdcc1sm368287675e9.2.2026.11.26.11.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:33:20 -0800 (PST)
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
Subject: [PATCH v13 14/25] crypto: amlogic - Use fallback for 192-bit keys
Date: Thu, 26 Nov 2026 20:32:30 +0100
Message-ID: <20261126193241.1471372-15-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_113323_222405_D6FD3AF4 
X-CRM114-Status: GOOD (  13.52  )
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

Unforunately, not all Amlogic SoC's have a 192-bit key
support for AES algo. In this case, use fallback.

Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
---
 drivers/crypto/amlogic/amlogic-gxl-cipher.c | 7 +++++++
 drivers/crypto/amlogic/amlogic-gxl-core.c   | 1 +
 drivers/crypto/amlogic/amlogic-gxl.h        | 2 ++
 3 files changed, 10 insertions(+)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-cipher.c b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
index df42940f1112..6070ee6b488e 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-cipher.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
@@ -41,6 +41,13 @@ static bool meson_cipher_need_fallback_sg(struct skcipher_request *areq,
 
 static bool meson_cipher_need_fallback(struct skcipher_request *areq)
 {
+	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(areq);
+	struct meson_cipher_tfm_ctx *op = crypto_skcipher_ctx_dma(tfm);
+	struct meson_dev *mc = op->mc;
+
+	if (op->keymode == DESC_MODE_AES_192 && !mc->pdata->support_192bit_key)
+		return true;
+
 	if (areq->cryptlen == 0)
 		return true;
 
diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index 9676b86a5089..f530e238812e 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -279,6 +279,7 @@ static const struct meson_pdata meson_gxl_pdata = {
 	.status_reg = 0x4,
 	.setup_desc_cnt = 3,
 	.hasher_supported = false,
+	.support_192bit_key = true,
 };
 
 static const struct of_device_id meson_crypto_of_match_table[] = {
diff --git a/drivers/crypto/amlogic/amlogic-gxl.h b/drivers/crypto/amlogic/amlogic-gxl.h
index b092d0c89cd8..a44290fcf3a0 100644
--- a/drivers/crypto/amlogic/amlogic-gxl.h
+++ b/drivers/crypto/amlogic/amlogic-gxl.h
@@ -94,12 +94,14 @@ struct meson_flow {
  * @reg_status:	offset to status register
  * @setup_desc_cnt:	number of setup descriptor to configure.
  * @hasher_supported:	indecates whether hasher is supported.
+ * @support_192bit_key:	indicates whether platform support AES 192-bit key
  */
 struct meson_pdata {
 	u32 descs_reg;
 	u32 status_reg;
 	u32 setup_desc_cnt;
 	bool hasher_supported;
+	bool support_192bit_key;
 };
 
 /*
-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
