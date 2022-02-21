Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9063EC433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Feb 2022 13:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E5HTbp/4zUW/82brBd+u1sds/hQPQpg5Hav3lDkLmHM=; b=kQbHlZGtLQx33K
	ZL/VD6hgbbSZZDmRJ5DAvtrCN8abYW5184xMeGEmcA0gO4Z8AsAxYNmXmPXkhkA78koZ+PQ9P0txN
	O9mc0g5GKUdgYdBACmR5nu31yAuGkCQp/Jm5f7LO1v2sbQ986rFsWRE5zsg5rH65mD6AQx+7bnDgs
	VHi6Y3F2sXZ9jnN/ABZl0mOH0y9c2PoPGA6eFZpsAh/htVUKdX8CHkCBF3kIZqe410ed+hNN3CMZQ
	mQ6I1+ZFy3UzwuCq/+mSkFCfu44S/QAZy0zGAHp3qtfDiV2v9L+UGqLAa8giyYC023Tvhr80lr4nI
	RPUYty2Z/q0Tj0fkymmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM8K8-005mNU-Et; Mon, 21 Feb 2022 13:01:52 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM7Ui-005Y5o-5i
 for linux-amlogic@lists.infradead.org; Mon, 21 Feb 2022 12:08:45 +0000
Received: by mail-wm1-x32f.google.com with SMTP id
 j9-20020a05600c190900b0037bff8a24ebso13347535wmq.4
 for <linux-amlogic@lists.infradead.org>; Mon, 21 Feb 2022 04:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wZFWsyzx/jHMsWPxyPrQm5lf1ZD0aMT85ez0uftjp7E=;
 b=1PGtPPDp+XFtVSREdW90iUbBSR6N4gGIyYK9a0b8MHbK/Qkq1UH2wOhpNzD7hyTVtA
 6B0QWQnBoukyAnTHYkmmddBYf0sa26knc7O5Kx9X6uxs/H7QHr7zPA2/BzmboSv2pTh/
 GhZ8Q5dfBViX2AvCAPLUNbiRQuPHwq5tS0CrZwqj5Z8gpiSVq/rYF2MMveY7EIGO+JSz
 vEePq/DY+or1APvewtFco3JsmXAZbCmvzQHZ8hetzHBpaTvjqTXZrZc9Vy2gOlSElOq/
 9be2oV+LKSHqtwqJXl/m9+UIKdFVb44sEBA0HKyq+KNsl427a4yhdZEtb4/8jwnNkMsz
 9tmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wZFWsyzx/jHMsWPxyPrQm5lf1ZD0aMT85ez0uftjp7E=;
 b=HABXVWK8/bfB2SEVJ4egRZ16Vm915oRP5hpLahXArqGEwcvNTCMP3ZbDMZnry934Lu
 3HiRdwX39kd55X8yiOIsh+pOtSJt39BGuoABqgGfmrF9+ZWtfz73tkfbwvytxHiBTDY5
 otWzYHyJL3CtAtU2ZcVLUcd0DTpZ9DG/BcerwSe2IlD4nhH0HPb2GIOInCm5q/LMM62h
 drDZGLCWspramTlKpVAi5k3et32EhXiWb3+IBz3inJEqgDhwZDspgIhY4h6CMXX4tmO7
 JNZazavJevr3Vl6dNK7X4w8kx3xchBhw6OJb/l3KMOvuosXUos2htWxUXSEiCLvKEYUe
 nJVA==
X-Gm-Message-State: AOAM533C+uRLjaRWQIqI+K/LY8HE8BrJc/ZzsNVTgTk86yzYxunzpcC6
 uQLxLbcaZ3ZDTLndKgt357HuUg==
X-Google-Smtp-Source: ABdhPJyFGzoL8/nsVuES11PLDKB1Nir+e3TPvcagEp/HBZSmVCZxbZuibRi7efMk2RlWfpuAwsMcxw==
X-Received: by 2002:a05:600c:2b94:b0:355:1695:e8c5 with SMTP id
 j20-20020a05600c2b9400b003551695e8c5mr17921665wmc.142.1645445323024; 
 Mon, 21 Feb 2022 04:08:43 -0800 (PST)
Received: from localhost.localdomain
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id a8sm11821546wra.0.2022.02.21.04.08.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 04:08:42 -0800 (PST)
From: Corentin Labbe <clabbe@baylibre.com>
To: herbert@gondor.apana.org.au, jernej.skrabec@gmail.com,
 linus.walleij@linaro.org, narmstrong@baylibre.com,
 ulli.kroll@googlemail.com, wens@csie.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH 3/5] crypto: amlogic: call finalize with bh disabled
Date: Mon, 21 Feb 2022 12:08:31 +0000
Message-Id: <20220221120833.2618733-4-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220221120833.2618733-1-clabbe@baylibre.com>
References: <20220221120833.2618733-1-clabbe@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_040844_243227_AF5FCE22 
X-CRM114-Status: UNSURE (   9.60  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Doing ipsec produces a spinlock recursion warning.
This is due to not disabling BH during crypto completion function.

Fixes: 48fe583fe541 ("crypto: amlogic - Add crypto accelerator for amlogic GXL")
Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/crypto/amlogic/amlogic-gxl-cipher.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-cipher.c b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
index c6865cbd334b..e79514fce731 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-cipher.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
@@ -265,7 +265,9 @@ static int meson_handle_cipher_request(struct crypto_engine *engine,
 	struct skcipher_request *breq = container_of(areq, struct skcipher_request, base);
 
 	err = meson_cipher(breq);
+	local_bh_disable();
 	crypto_finalize_skcipher_request(engine, breq, err);
+	local_bh_enable();
 
 	return 0;
 }
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
