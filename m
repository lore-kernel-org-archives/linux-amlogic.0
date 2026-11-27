Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD10606A31E
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Nov 2026 12:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CTttoD0P;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=SR2OhTzv;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YuNI/z8e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=t4xYqd/nR2nRFrKiT0U6jUXVoVVnnx65vb3zDLOq6ww=; b=CTttoD0P64Ww42BHaMDVs8ZsY+
	uaoTE/pwcUA4ixaRKllhJ6hqqOr3gSJeZOpWVnE7aWBUf1GF8MIPoO7trVM8smAwI7f12Mao7XBle
	dCG7zyhGdk/cCwRh9kywwYFv19mCazT4GGkletYHqH7Dw9sLrzUNhd0eTl6zD7SXytWMiiDQR6K+e
	KONTXOyuxkAVeszjC4U5fgy38kF5HGM7C8t4eAO7kIkrm3BLOzp9jdwxJqdYcAu5sXnwdnGbE8c2K
	qAfe78AnRSJH2s62t49N28zv+c0eWGwE41UECsKGXwncTqNJ5Z2do8A9u5rwlgeamwvKn2BjHpJ3L
	Vl8rQPYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWugS-0000000Fyd3-2Xlw;
	Fri, 27 Nov 2026 12:04:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuef-0000000Fx87-39SM
	for linux-amlogic@bombadil.infradead.org;
	Fri, 27 Nov 2026 12:02:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=XZeii/VW214rh0vsKwtrU2Ok4yszGoZRil5bEJfNkjY=; b=SR2OhTzv5yO3L0OenRUqfgb4R6
	f7y2X8HxrD4BLNlGYJjCvDRsAvmCesm2wBTxpUxAGU0MtV//DSRWccHNkGRJYkGXgfGaLliKMG3Lh
	95ZTljq9ukC3EaNP6aeEKj0ZwbwBjwRXN+d3IAbHrIBzszMlUVa4mmba3tfWbqsam9wYn9edf9c2p
	6YTNKvvClDyF/BT6wIP9s1g+G7gBAwWEUBddtLptLIcbET58fh2186iuzMmSZyI8Udy7ZtYJSCfyz
	tUfIunBFo9tC4sc2gW/nQur3TQxb4WDhVb0ox2ardpeWTUW9t0lfQ2fwRjmvhUEVrxv8CbgS4FaJm
	Z9DeLqSg==;
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWueb-00000007fkc-2Qdk
	for linux-amlogic@lists.infradead.org;
	Fri, 27 Nov 2026 12:02:16 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-491846221ffso7056891f8f.3
        for <linux-amlogic@lists.infradead.org>; Fri, 27 Nov 2026 04:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795780931; x=1796385731; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XZeii/VW214rh0vsKwtrU2Ok4yszGoZRil5bEJfNkjY=;
        b=YuNI/z8eEi4RvGbJ+12MAdYYP7fvsiWNdv9NZZ876onQXUdfzy48DGXgAnupaWde1y
         iZDgb1+a2T3uRfo8+ATMZEvcne+Cm1vmU67b/otNPAskPEzYYtk4iC6rz3jg3X+FGOAA
         Q6IunxTp3kMdPrgjay1YElqmaST3jtvZ8M6ArSiw3O9wUbn5dlLsuK3iFEr0TL9z1tlY
         +GuXokEwt4Oqedw2gODW8qeaP9jgiYibuSGRZyJqZ3/9sahpX8nNp11ctIYO3fPZU/0o
         /k4v74k+ZsX0oOfhZhF6ekOoD5cnnYkLHDRj1GRabCwvqjYHKu8xpCP2kcB8GZZFUXh5
         42Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780931; x=1796385731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XZeii/VW214rh0vsKwtrU2Ok4yszGoZRil5bEJfNkjY=;
        b=0sUE5xhW1JhpfiutcLp5VN+u3w8ypH/vigQFGYxpLzjdTV0I4QussqmkctlqbhyVun
         DPiG0mdLTLzkY+Sgsdp5s6dXcSmUR/oBjxS4yIWAnnix0OqbTENloAr2FYa1N3Qq7+Jt
         mvDc7wM8T0so+mzRbeagKqrHb+pQnrJ6wRmwW3LIlyWKTpbBRBXdUr8ng7gL6uasuIA5
         HHh/HotNiiHSLP3ie5Yzkv/+HmyO/NK1LIgDBJzerjDAhve87RDk55XZu+th4GoLRV77
         Nvh1ksKVY2ZA2LSMVeLEkbbGQ5g44MwASJgDyP/uC4iOJAi2/aF1x76UmI/dl6AVqpVr
         ln7Q==
X-Forwarded-Encrypted: i=1; AL+hErEJavg3Hi+wZGI6HwBhWrXJ48HG7gklqODfcXjgNrwAcx7rb3X1zAtDbRQtnUfPMBkmmThvwsO8AK8XMpSb@lists.infradead.org
X-Gm-Message-State: APuU4Z/MLINShKolDCNOL+e3omg/UYCYip+tL0Bf8hUmeNc7nH+E7Chx
	t5yYTq3n3ctpLfTGwMykubF3PTr44hGyFWvi9YFBXQuVdgh1GKX1b1V9
X-Gm-Gg: AZFdTZchO5fAAO+7nZlLu1eNiALTU3AN2JmEYTcWVnfqMbngVGMxOPZNQhTA3RAJFhu
	huxesITC4tTE2d7YzTTpcCWQzrD5e7IL1J9cOrsXdbKZvCd2ZNDS+4TEzQCSAmMbHrD29YNtGz3
	FSQYTA3DQx72Lje3JWnxYpUtDHXTdeZsySzU47cHjsud6vE6pNovttQh0IbchWI5JLnotPNMwUI
	fT9k4zARKwI7lXKxo1NB2fx5dr0KQagnDZC/ODKAs4igCEed8fe2GvoSz/RkTnesWxEzH4GUL/j
	j6OZQtylYnIaRUbcmSVRT/PCRySSqTRIUJxHwOF1hKaBc9YrqYJDpo+E5fHWjMPbCl35mNCkPnO
	TOCNLbZJdfQpFxQ3DUHk7oc9FKO+xZ7OvobLA6bEXg+gCQm81MPmfSibDXdw8WqX9UyRFz9ZVbY
	5SgI7lJ5OJpBmnP39kSRiB9PJwDuU02QIwf+BC98eNV99hi63Z2C2b7Xh4CsDUDjGFV+2HhdCdN
	vo0Htg3qNTgktL11AdwZgn0xrBV9fzFfgYQUNIb5jxuthYf6P0oIoIPa7arsFKjXOEk2ysUo3yT
	k8tGbQCy1lEYrPmHJRC3wU3N70+gRJ7kHVVvu+ZzJjT/vecxcLCODJremX10/ecnRX6G
X-Received: by 2002:a05:600c:c173:b0:4a1:813f:2a60 with SMTP id 5b1f17b1804b1-4bb88800134mr467671145e9.11.1795780931338;
        Fri, 27 Nov 2026 04:02:11 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm393684565e9.0.2026.11.27.04.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:02:10 -0800 (PST)
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
Subject: [PATCH v14 29/30] crypto: amlogic: drop redundant A1 platform data
Date: Fri, 27 Nov 2026 13:01:02 +0100
Message-ID: <20261127120103.1532882-30-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127120103.1532882-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
 <20261127120103.1532882-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_120213_535061_37B70646 
X-CRM114-Status: GOOD (  10.43  )
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

meson_a1_pdata is identical to meson_g12a_pdata; drop the duplicate and
reuse
meson_g12a_pdata for the A1 and S4 match entries.

Signed-off-by: Jose Nieto <jnieto.alaber@gmail.com>
---
 drivers/crypto/amlogic/amlogic-gxl-core.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index c11d7d8250ea..d11319425d5f 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -305,14 +305,6 @@ static const struct meson_pdata meson_axg_pdata = {
 	.support_192bit_key = true,
 };
 
-static const struct meson_pdata meson_a1_pdata = {
-	.descs_reg = 0x0,
-	.status_reg = 0x8,
-	.setup_desc_cnt = 1,
-	.hasher_supported = true,
-	.support_192bit_key = false,
-};
-
 static const struct of_device_id meson_crypto_of_match_table[] = {
 	{
 		.compatible = "amlogic,gxl-crypto",
@@ -328,11 +320,11 @@ static const struct of_device_id meson_crypto_of_match_table[] = {
 	},
 	{
 		.compatible = "amlogic,a1-crypto",
-		.data = &meson_a1_pdata,
+		.data = &meson_g12a_pdata,
 	},
 	{
 		.compatible = "amlogic,s4-crypto",
-		.data = &meson_a1_pdata,
+		.data = &meson_g12a_pdata,
 	},
 	{},
 };
-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
