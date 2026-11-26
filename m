Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D274A606A327
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Nov 2026 19:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tbLNLdV1;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zE1cCYsk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1xiBVJaeNBpr6wKwy0N3F77X9RXzx6DWSF0s/oab0bE=; b=tbLNLdV1p/C/zUvNhE+mDcmhJx
	6oudZYD+69cgAQwsJk1tr1YPwdtpb+1yH1h9XFRa8IuzZn9BCcsqlGqcUpboJBnGR1WPrcQh19h85
	fOGlIOP5yYn3z5RLS0YTc0I6VAKHaAwylF0L4DX2ssX8o6t82ATM8unOCKnmouOuTR6MILKflZHQm
	fY8BzfnJw6UTN1Jcd8GclVI5EbJctY4q4JmDNTUSkcWEbvBLbXqjl53l/MVGv8O1n3Qb3Uu5+7H/W
	axAaSXro43gHb7rXDn/F15K5DR2uVFcC6AbONy3uuxWBPRWUApBwwrTsqs+vkgf7sfvGliib4UKfm
	2n8qptoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfDi-0000000EJjD-25fo;
	Thu, 26 Nov 2026 19:33:26 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfDR-0000000EJRf-2PUw
	for linux-amlogic@lists.infradead.org;
	Thu, 26 Nov 2026 19:33:10 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4bb85e07aadso90988775e9.1
        for <linux-amlogic@lists.infradead.org>; Thu, 26 Nov 2026 11:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795721588; x=1796326388; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6uthyLmx54eP91qPBkkIsXEHnEP4gw+2z/PB/gcG1vQ=;
        b=zE1cCYskKUdEQyys1vCFZKOig5lpDUXPQFr1WmbJvyyE+Ox32DMNHd4Q42+FfdAFxC
         r63Ew9OCew22wv1v5Ns9z/I5A7J0Ufp1E1W0dVKnYGSwaeN7a8b228WEhqTDRExJkZiE
         i+2GAHojbJIbkcZLl6H2EzW3k0rFNFAUiokdUeyUQqnItltZ5G4An1jiUcYF3nIK4MqY
         Mybn7oLYHIgeQuhcpWCwdO4JjCLRAmfk07O7HBF/BtFa1sTpfmYd1lp+Dz6t0MZyMQVZ
         gdYc3hxtJCtWMz0x2ysmTdhtsn+lpAqNW40E2oMc2pTVGDhtR+F7HDdlO5QzLfeLLolp
         HgxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795721588; x=1796326388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6uthyLmx54eP91qPBkkIsXEHnEP4gw+2z/PB/gcG1vQ=;
        b=OO4592mfi/VGyoSKrkwdo5L5PW/zLhQ9hS5ry+L2UBoGTYmd6ZAxUD58uSv4/ra7sA
         WZbubpwW+brSf5C5GF9Q5s1iLQhQX0KNkSUaYZZ2N617sjYM4eIJyWxz68PBtqp//DSb
         kdOR6Zu+kwYHVJLdg1THHXf/U+F33JB/QryvNRhQG+6CQquPn9uSIIOzLGUccB3M7IYR
         eZAyWhgbh1hBtTcMTRQNo/D/cQw1VmnR+OQWCj1grcN/mVPXKZq7zhAz68HZezWdULf+
         mmb+hjnGmDn8le/Zx+b7B8dQg/gEetxZ8bPkTSE3+corQq6ci9eq719zbB8tOdwNL7Na
         JqFQ==
X-Forwarded-Encrypted: i=1; AL+hErEW1ryqTFKdGUGHT7DlfuOCmL3/DCTmdb76jomoQH3m9BJ+weuRNYLMUvzd1kTH1p8COhN2ZKNLsoXd4d1c@lists.infradead.org
X-Gm-Message-State: APuU4Z8zctWVpbWXzQI0IXS/GER7sQ9F5zsCItwYxYY0XcAkKg6JwtEG
	oU725Jpk8IijvNbo5tA5rHL4Wry6voxvhx6LsBm7qJzME6D8zUX/SClW
X-Gm-Gg: AZFdTZcIWkuy8869r1zsAKNcVNghQma3acKL6jK2N+TukYJr3Lvho1FGUfNdZuH4oNp
	pYh+OpNJ6HKS7gY6lw4xS/ubzK50BVYvbs8O5Hho0A8/I/RNU7p1NT+TSsT9YyLgUPDD/kt+fwk
	Nzdzh2FHJXNKuFHcSkv5E+8aNZ6WnUh7hdvDpD4RxTvQkmfdKylNsgBGSe6/qCekRLCOJDBGtcI
	IOfn8LopxmO8Pk0WgbXP8zSpPV1PXeSitJZvc0Azo/4kQtXNECfvMHr+pKAzFquPKz3hhGABMzS
	vMYpIXerJ4Bra6y5+dnjHbm1XvkYSc3C/Rfhwgr0qkndqrKJURwCXGWttwktUkBLxPv+OnMLQcU
	5IeaNQNBsJQ6AOChpzkCzpWL3x47Z9HyO8cKdDjPyp+h2pv42klW/gbAg5DY1KkhXFRtidIdIt3
	tGrCKaX1Y31FEPu+yQfz+JYfM8Fm2bO6sZG6U/Y/Auh/K13elTw0ktOuQ3/mx42XVOnE0XF4xNA
	ln7fCC1fv/Vzjf7BgVXO4RRJnMFYQ8uSW6TlQa2N2AbKNafh0vgUlCQxwW53d/8Qkqt/CX+dR/6
	npVV/+t+cEuchLdM0mBU5flD1xnPrTLzcBrSltq1UEvldA==
X-Received: by 2002:a05:600c:4e0b:b0:49f:e772:6ddf with SMTP id 5b1f17b1804b1-4bb8881ae90mr457062975e9.32.1795721587613;
        Thu, 26 Nov 2026 11:33:07 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906cdcc1sm368287675e9.2.2026.11.26.11.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:33:05 -0800 (PST)
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
Subject: [PATCH v13 05/25] crypto: amlogic - Remove clock input
Date: Thu, 26 Nov 2026 20:32:21 +0100
Message-ID: <20261126193241.1471372-6-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_113309_629499_6653EF07 
X-CRM114-Status: GOOD (  13.58  )
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
