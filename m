Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B239606A31C
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Nov 2026 12:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lkxPJRe2;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v1f6qtE5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1xiBVJaeNBpr6wKwy0N3F77X9RXzx6DWSF0s/oab0bE=; b=lkxPJRe2mo2lisd0WUiwRCWb0v
	DwDMBHKXtv1HdPvG+wJ6bSd1VvD3IlqxfgJ0CahUpJzAj8p6WpxkctU+rF4JMbRv9zPMzl0eK+2Bu
	qXcjpyJbcN9sKworStQzCEQxKspUdO/bmSEaJB9P2gAXaoUwBvMg30mXkjNYp4MOLrq6Fe9oINl8+
	049DZSs6TWqFvkwkwLfarRKKFsjEMrJTrAiDCKMtR2z5bvcLhI0V8evwUrgXHqdomtMfJ4d9rHexi
	wBqQxwY0WCy1Kc7uUfl9VpPYuU9wuoHXSzqE0QwHriUjIjGxiwbbQ4o+6ZQqUT7LHciXlIPOySH8o
	9x2jYQYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWueD-0000000FwOt-2CX2;
	Fri, 27 Nov 2026 12:01:49 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWudl-0000000Fw3B-22c6
	for linux-amlogic@lists.infradead.org;
	Fri, 27 Nov 2026 12:01:26 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4bb61185057so51393335e9.1
        for <linux-amlogic@lists.infradead.org>; Fri, 27 Nov 2026 04:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795780879; x=1796385679; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6uthyLmx54eP91qPBkkIsXEHnEP4gw+2z/PB/gcG1vQ=;
        b=v1f6qtE5a33/PbICvOpycNujYhJtV2Xf1AB7OoFyI9OldXAHEqUFYYJB6RNQMj5DC9
         bd+zsPX9+ToYWI3JhrOlndsWflherr41GRtcSYjH2XnzLqcgkFyNeu/OEg/9OMda2NFK
         /6680eI3j4Yb0CL5U6rsEmiNB2XWN556RnRqda2bFMZ6RXEIw9T0ve1qmccOCwVTv7Qh
         1soPLbLUvYNC7IZ2sEjcuhOiVQY74Ykvq6mcQ29CPRUm2r4Svh6HOUMANfpLa+cHhCqF
         fN6WUBSh2XNNYSdOgsDG3vy36P2EA3KBimnmsYtabbcI/FLAtjrZW3kL7rPUJqXhXXn5
         mY9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780879; x=1796385679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6uthyLmx54eP91qPBkkIsXEHnEP4gw+2z/PB/gcG1vQ=;
        b=LpUr1FoMyt2I6gTr8/vOqmbGRXw9o496jl1dEUfDVUjOldOJujQk1Sk+OzrGgRSl3C
         fmgxW3qPw4xmB/nLyWRzv25qZGYyaJQ61eeN74iJIC5RlqQQUEVbdRlgQCd9NuPQUSvo
         WlKK5GGbreFAyrcKbJD4OuHoFHs3sxGzq+yOZ2u6K7TpGwiToPkpoZwqfRW8Ofx61ixy
         vJKfZsg8Fw/aUqt9PhyiIpJotexu/R+kVKglUsisEOQ3lH+BmgZBV+RmYKFuPehrwTLG
         V5n6N8sBKceKbUn0s3mYI8F1xSI1Tz8v75QZfwNBo0SOyiuOx3zhgpMdETWV2WpuibHd
         OLSw==
X-Forwarded-Encrypted: i=1; AL+hErGx75CZfnWGazgAF2zPOquvUNu2L/100KLFcHRv1J26EjES1MOO46jV9bTTSkb9h5DWQ0qv9aA1TP2l7Aqm@lists.infradead.org
X-Gm-Message-State: APuU4Z/6dOv8TO01yDNQ1lFN1CsWIIaZCAaTOPhchON1xIpSEI9sTegk
	itbiyFhxw6JRZek1hvOOh/U33JwZnMxvq4OuiykQ4AdLbl66nArWPLo9
X-Gm-Gg: AZFdTZe/L1kamcNUaNEy3V1jJXOYJKmk5lJnRH8N/30osGYB861JLY+rPOufqfjEA3W
	SMT8etYb3kVvuewnHQev1pkoMYVWfiAaSr28M4wON2lORTipp0qjlt1k5uoGSm4nU3cQf5RnB1Y
	YnKxf6iNsaxfLXOCWer0UfzvX4Kxh0dNe/QV3GlO/QYNKSn8XDUrL+7WGUtPmf5QTdFKqpIVDvA
	AyBO36EMdwNVvFmiDAsvLxl/g5owvXo3QiMUyRmNTJHnqjqTgAJLZPfy7PoGjnD1USDRgPQgUa1
	8gjod408hoD98mMB2Ht8Iz7o51dZG3CZWgezfAPGVgc2MKfqFVhpyWxsY9go0ddyDF9Gqj/p455
	hjdO0+NQAfRs+3eguy4kv7oConuFv8ewzuAXPSLL87TseFTiEXADaWYaTvOFsOaqcyHnQAat1bu
	jnRnF5TKY9VvalUYEfj1LoYMlZxwp42zmP4ca11OeXvFooiWOrve+Pk2A1/6u9eX0WNP6cUdxiI
	k5MlBt+R/+exb1FEv8n0uHX6rHfub+Wxvf3SLhAQGEz6ecFoCpywlLl8rAuT9NDpG6vAEWXUTwb
	Frt2EOJy4uKXT5JDdPRhk29LMc92pPJhZZdO8snmsysv8Cc=
X-Received: by 2002:a05:600c:4f10:b0:4bb:60bd:5398 with SMTP id 5b1f17b1804b1-4bb88804d35mr550669735e9.10.1795780879108;
        Fri, 27 Nov 2026 04:01:19 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm393684565e9.0.2026.11.27.04.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:01:18 -0800 (PST)
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
Subject: [PATCH v14 05/30] crypto: amlogic - Remove clock input
Date: Fri, 27 Nov 2026 13:00:38 +0100
Message-ID: <20261127120103.1532882-6-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127120103.1532882-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
 <20261127120103.1532882-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_040124_275192_6CC3FD1E 
X-CRM114-Status: GOOD (  13.26  )
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

Amlogic crypto IP, which uses DMA crypto engine,
doesn't take a clock input.

Fixes: 48fe583fe541 ("crypto: amlogic - Add crypto accelerator for amlogic GXL")
Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
---
 drivers/crypto/amlogic/amlogic-gxl-core.c | 8 --------
 drivers/crypto/amlogic/amlogic-gxl.h      | 2 --
 2 files changed, 10 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index 24ef7d5a5607..37224d75edfb 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -9,7 +9,6 @@
 
 #include <crypto/engine.h>
 #include <crypto/internal/skcipher.h>
-#include <linux/clk.h>
 #include <linux/dma-mapping.h>
 #include <linux/err.h>
 #include <linux/interrupt.h>
@@ -267,13 +266,6 @@ static int meson_crypto_probe(struct platform_device *pdev)
 	if (IS_ERR(mc->base))
 		return PTR_ERR(mc->base);
 
-	mc->busclk = devm_clk_get_enabled(&pdev->dev, "blkmv");
-	if (IS_ERR(mc->busclk)) {
-		err = PTR_ERR(mc->busclk);
-		dev_err(&pdev->dev, "Cannot get/enable core clock err=%d\n", err);
-		return err;
-	}
-
 	err = meson_allocate_chanlist(mc);
 	if (err)
 		return err;
diff --git a/drivers/crypto/amlogic/amlogic-gxl.h b/drivers/crypto/amlogic/amlogic-gxl.h
index e0bc5c39bf2c..5149dc6e9f60 100644
--- a/drivers/crypto/amlogic/amlogic-gxl.h
+++ b/drivers/crypto/amlogic/amlogic-gxl.h
@@ -91,7 +91,6 @@ struct meson_pdata {
 /*
  * struct meson_dev - main container for all this driver information
  * @base:	base address of amlogic-crypto
- * @busclk:	bus clock for amlogic-crypto
  * @dev:	the platform device
  * @chanlist:	array of all flow
  * @flow:	flow to use in next request
@@ -101,7 +100,6 @@ struct meson_pdata {
  */
 struct meson_dev {
 	void __iomem *base;
-	struct clk *busclk;
 	struct device *dev;
 	const struct meson_pdata *pdata;
 	struct meson_flow *chanlist;
-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
