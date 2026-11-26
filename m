Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6589606A31C
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Nov 2026 19:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xTqHf530;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r5wVIiro
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xCopMac5EsFlMuFyeQUfJNemnvg2irra/kVTcqQ0fgs=; b=xTqHf530D+Q4ZtSAXThkgTTV0/
	K5WdSqgiy/XP4sPVbLzg8aYbQAKjAL95aGqEvU5/8EQjgG3OR8SoT7K8Uko3/w84OFE/bu7DNLQ7V
	MVHc+fOO1BDVDCrlr18iG2U7FUwrp3oOmMNTLcRxVA/NA2rc51YAJnGNB8hSozCAEh1WW5doErgRW
	qYuNyvKt9SgXynmVUPHoBPohwMijyMOYRcv53LTSaPwYqTVB6c+JAGkRo2vq+dCEyXXHlXycceuWq
	lpD4X6Sh2qnxSkNzIoGG5DnhpYqk1VjfypzTrFlmFa84+oO6Ql6edM/H3MJLZfc8qhjUOmjZDeCrU
	Cioi2Yzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfEN-0000000EKyH-0Ilq;
	Thu, 26 Nov 2026 19:34:07 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfDn-0000000EJsb-3Zj9
	for linux-amlogic@lists.infradead.org;
	Thu, 26 Nov 2026 19:33:37 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4bb72b44a97so63242095e9.0
        for <linux-amlogic@lists.infradead.org>; Thu, 26 Nov 2026 11:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795721610; x=1796326410; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6o5PkBcDr5mo9vn6AHRcwo7DgEVc20BXfKxW4pDcM60=;
        b=r5wVIiroWzifwWNlrfKbDiaGW3E/JXngCnAorfxkFpb3HwKDA4OfRy3u17K2F21lUf
         p0MgUKIF3BEgDgYmqj2OX/fEZgkHabeWCE3QxvDaahj7OoiADFD3v7THr9F6YBzSKFtn
         tZulA9aiugz4wwj1LBu+q9b0nabd7JEdNZesRiRoe9/SqD9kuT20pC4kpP+6ArDXbXI2
         IN1QCh/K05m8Pg/iGACdz8gLxHHp5CDFYBvLcZGgNw60Tl+Hw5TdZIA6wlVOGG6sDklB
         T97Rt+O/dbMv056Vbqg5R/0EFIQLRrTMdQBLhVudpSf3MYXQYRbBy2DSAXQtZ4YoWOlD
         83cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795721610; x=1796326410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6o5PkBcDr5mo9vn6AHRcwo7DgEVc20BXfKxW4pDcM60=;
        b=2rjX4nBocuvUyql98qeQFX07/FnUbQ+VDnUsh/fo+hdYku8UIsVr4EtY5ETV/mwTCf
         y96Z9DUdDjwxGMecpUCh4RQMwD0mujoWuHxhEtPDbXQy68FzLzc/pqIDIgb9cP9iqlty
         S8dPzdKExHJnqw7khtiFlrO6hbx+Rzu4NaaXZqBwUgBKKv2ypOd9FV9NCvflfSaLuMzz
         4RCMj/nWGGG8yFafSWxzc83LpXknHsXQ61RIlm3LE7ehXcEyB/T0gRl1K9tJASDr9fqd
         +Th3j4kifTIoL4SpRuSfPWfZQbUZVtrESSgY8okczoaYghLpk2PMPC6KhpJ7M6pvlR0R
         XH8w==
X-Forwarded-Encrypted: i=1; AL+hErHRLLlEa+ukB4DjTQScFS1r8qrJqOs+SGWWOIhuXAb0jAnenPbCP1bnIBdcf2vbvbxychVx1seras/NucdJ@lists.infradead.org
X-Gm-Message-State: APuU4Z94Reom1Rz+qY20vLwhzUfBmMjinexsVaYtRK6CKgu1j8jvSQci
	yGasrUyOsp/pO57WmzKhQcAwE214FEeyAfWHH15X6SAA0nMPJbF8wE7g
X-Gm-Gg: AZFdTZfiguOOvkncdf17EXgF1fllndr9R0fo2tsUXlIvy81YGtmKhVO191w2OfKTNqX
	2h7tK9cox8xorKp/XmtIjJrrQJc/rNiisoAfUMY415i3cSekq7s1gOj3lxGKlLZGIQuATekJcok
	rfI97gKgtgpGdSEjc1S8HH8xyOEUcbKmqSULG/SdHR0GqmXdyBMIhhZ6VRJC+QEsz+Q4fkXrW8R
	pgTG1r+r2XQ15aMa0xqJ4EgttJsmgMOI1uY70BUwhrVRp4G+0ljXY0ad4MwNIJDxn/7C0rxDoKc
	+3R68QDzG1+7yX+sRvksuc+jC4MhGX7z3ZNsCoeX6Wpx6jwKM6rjD+RgmDxhbDK+DGLLzU2ZNmS
	V4LWjgt9lvSO1wS9LD6X4dgxCxjyaqXtMced95WL4/r5meLLsV+PmSkKl1EBM+s3sswHNEE3Uw3
	YO0h97alsKudWsEmDCMUnazVmEz7htulD2aDrYZCYqosgwyPjVYseV2tGFBnslj/MHwrhRQciGz
	3HuW8wEtfzdzvRJ3MJ0wZutEd1lJdImqjGOTqkPqnpI19jyMC2CGOf9i4kzS3mLmTMVVH190lVp
	1Dr24dKavXkPk5jvzTs2MwUI1HYXhsZr49uYwxbIPxe3zA==
X-Received: by 2002:a05:600c:4504:b0:4a1:9078:911 with SMTP id 5b1f17b1804b1-4bb888284d7mr463782755e9.31.1795721610174;
        Thu, 26 Nov 2026 11:33:30 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906cdcc1sm368287675e9.2.2026.11.26.11.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:33:28 -0800 (PST)
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
Subject: [PATCH v13 18/25] crypto: amlogic: g12: drop CRYPTO_ALG_ALLOCATES_MEMORY
Date: Thu, 26 Nov 2026 20:32:34 +0100
Message-ID: <20261126193241.1471372-19-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_113333_190665_A4D126C3 
X-CRM114-Status: GOOD (  11.23  )
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
