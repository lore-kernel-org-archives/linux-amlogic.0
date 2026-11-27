Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C920606A31E
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Nov 2026 12:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GZeyWJgj;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WIsBkSEJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=oI9dClJjm40U7Y4GEGT74KIfypDtUb2yHZGv0ZSkIQU=; b=GZeyWJgjAxzVMmhb/hcbOWnHz/
	oRrPp71I4xbSCkLc2w61O/67T8RImARlq6H+2CdJXT+/HoD2nDI358NFovajj7yOZUwhwpY7wQLYy
	9qu064vR46Txu7whKARbfgwIRrSbPeuTT4ZnAsksSqvUfmup4BQJvYonkBkENI/FE/ziG2hKrZRd2
	sxN+TKVQtvA61WAhf4aQ9oKZ5aX2r2xXD5/+5PDqFy01zvsBcAaAkkaAdqwROthC6q2Wzn+b4ayht
	E3qcHGp1lW8RmL221tO9aGmTVmLXz7orjQXbqrLuvW26sPsdYpz7oPorIbjFCuSad6P/Dcbml/5b6
	+o8eESdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWueX-0000000Fx1s-1nqy;
	Fri, 27 Nov 2026 12:02:09 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWueF-0000000FwQE-4AGg
	for linux-amlogic@lists.infradead.org;
	Fri, 27 Nov 2026 12:01:54 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so69870865e9.1
        for <linux-amlogic@lists.infradead.org>; Fri, 27 Nov 2026 04:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795780909; x=1796385709; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MZ3xsoglCFbUSUZhb0QwwHkubepyifev4aez9qIahDI=;
        b=WIsBkSEJH/MOU6uZdx3swVT8ZLA9ZVG801ecUWuFbcb3O7S2Yib6KVtAcBWh7nHEYm
         FYKAzQLHydIOwK8GfZE9yvxwHkv9osdn0rwTegKk7yjTonbWY2kngz0AliFjgAe8z7Jc
         4tElT2d9xjDzfrEIo3rBh7z8UlAplmx8O4E5Wm4C5ebCWHZIt5LsF5O3Dt71KEw9PqAP
         pZLjgHyRoU2bwbxCtWtOyDU7WKyf9a8+6RxZeMGVi2eRYWxME2M811I/EjzlFc0//nQA
         c1JroS429LTFYMtZytfsKLz6aRaXEac99tOzk0I8wHx9mGlSvMhOLJAsTQrb8QwW+QAn
         Byfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780909; x=1796385709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MZ3xsoglCFbUSUZhb0QwwHkubepyifev4aez9qIahDI=;
        b=i6xGENYM7VDmUYLGwM2zHuQQrS9NJ1z/Pno4sr0wGrmYwgJIIUCfMvErOFdhZ5szB6
         svLbvo9+bVWvjmRX6nlevujn9hXAsDO8ZHoY0U0iT/xzT975zcqUjmGi7kKKzlfpQgjh
         /ATqYU7gXpJnNBOyQ/rML6Qw+waWR8JyxbZK2DU6WW91TZzoLnxPTkh2bFH6mXQkPDCA
         Af04yQS1fgxfm4n2q/RnSjx7RW+nJOvh854mmd/gh3XOsEhSBu/0HXpWphsEiFmCMcWV
         3CgGY4EUMJ9SxwVJZCThtEKcO6oT8k1014Wj80GDO9XM/VvNkwrKQ5NQMGsU6BwvAyLh
         neNg==
X-Forwarded-Encrypted: i=1; AL+hErGEdeNSn5HnUoI3eK4KA7eQoX+NFvhmoecFUK7VdtRucWUAAvy1aCkw7GxuH6ymthaucDp9lWIC0mWSn/jB@lists.infradead.org
X-Gm-Message-State: APuU4Z/qiZHo0aC0sHMvEte3F3Yv/ziUH6heFQDrhjhjAkoNHTKF47a9
	LpL4KBLUeZnO5IXdCXrjK4e4t/m+dw8L+hgtfqQvIZIaCo5lLvjHPXHM
X-Gm-Gg: AZFdTZfcdk0C5yPCZfBXsX05VAdyZqwQDMVLmhRTUxo8rCNbNe+85M+hXYubpIsuX9h
	PVo8tSO0gPbcet0ONWgO2h4oEjwhGQEzac8gPrWo5k4riSrWBQ8/sdLMeEZXSa0XSQFBkqZHN/g
	bOn9r+o3t43tx4fuIpVsWPtXczYdrDtZ2LU80aL0Daz4GFC1AyARfjKnfHvlXVku/XagiA4PL/6
	MOABncAMzA2pxiy4af4TRTMSVkJrGOGH807pVqO0bakUWGMNeEREvknizbt6zP5x16QypWQXt31
	s+qL4sQW+p2lcoZMCnQdFES8aFaCk8An8H4mXNDRhQb8lS7tIp929c1aaWQKhZYVFF4koVGIID+
	vvRsJXFKPLykmwdF6ITFrs9gj3srgAhaHwWeFG2PEDMY2alTxpuuqwn5ls/QSGPtoQdj8xtqOwq
	1Bf4lXNWuj8IkwFIt/w14ac4ozEqEA0i7Lkeqn0ReIdIORBMmfEupE9QDQ1o6UCAvRllcQ6z6pl
	6MLQcl4fDJzOI3UvDHAgN01+vc2gBGzFSOARWYgcwt08aUU7F2KoGDDjKAHHj4kFoY9eK1j0s6N
	6D8/hIwGM7itJ5VQ00iU3eB7j8Ugn51sGlY0DKAy+Da3siM=
X-Received: by 2002:a05:600d:18:b0:4bb:9001:1aa with SMTP id 5b1f17b1804b1-4bb900102b8mr353975225e9.10.1795780901984;
        Fri, 27 Nov 2026 04:01:41 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm393684565e9.0.2026.11.27.04.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:01:41 -0800 (PST)
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
Subject: [PATCH v14 16/30] crypto: amlogic - Add support for AXG-series
Date: Fri, 27 Nov 2026 13:00:49 +0100
Message-ID: <20261127120103.1532882-17-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127120103.1532882-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
 <20261127120103.1532882-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_040152_201147_686B240F 
X-CRM114-Status: UNSURE (   9.63  )
X-CRM114-Notice: Please train this message.
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

Tested via tcrypt module and with custom tests.

Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
---
 drivers/crypto/amlogic/amlogic-gxl-core.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index 0fb0da20e06b..08d89db14788 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -290,6 +290,14 @@ static const struct meson_pdata meson_g12a_pdata = {
 	.support_192bit_key = false,
 };
 
+static const struct meson_pdata meson_axg_pdata = {
+	.descs_reg = 0x0,
+	.status_reg = 0x8,
+	.setup_desc_cnt = 3,
+	.hasher_supported = true,
+	.support_192bit_key = true,
+};
+
 static const struct of_device_id meson_crypto_of_match_table[] = {
 	{
 		.compatible = "amlogic,gxl-crypto",
@@ -299,6 +307,10 @@ static const struct of_device_id meson_crypto_of_match_table[] = {
 		.compatible = "amlogic,g12a-crypto",
 		.data = &meson_g12a_pdata,
 	},
+	{
+		.compatible = "amlogic,axg-crypto",
+		.data = &meson_axg_pdata,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, meson_crypto_of_match_table);
-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
