Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B44C7C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Feb 2022 13:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nl8tYY1kjgWnzugZ5o040JTyi4yC8rO4C5QRiTu1z6I=; b=xHXlwbBXSPcK0B
	+ZVrTJqTnXvE4ADRRrX5YI0PHtyTjvV8a9IgHe6QkN0DW5mA117yAleWanlz1U28p7cpQbUkmim9l
	Pxg3cCoTy38KenfbjT0jYsBhGWqiEgPN2kTSu2EuRK5y6zHjrwrHZDY8gUczSRIwcM7bYkMF6fiyU
	sBxpaB7RP4nW+nIlb9UhaZe/aT1DUwJNl7U8ECGeb3MaVOg9JVDdK6hr7+lCIFS0or52bYfpHkS+n
	8AgQnyfjsSLI3CQb+W14zyE5buMsySCOadJoTWhX80kwZFnQsWRWUkKmsCIF73yanmbuec2HI7Wf2
	0eRJl/3HEk+aDTKan+jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM8K2-005mMS-1M; Mon, 21 Feb 2022 13:01:46 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM7Uh-005Y4y-0E
 for linux-amlogic@lists.infradead.org; Mon, 21 Feb 2022 12:08:44 +0000
Received: by mail-wm1-x32f.google.com with SMTP id
 p184-20020a1c29c1000000b0037f76d8b484so1968585wmp.5
 for <linux-amlogic@lists.infradead.org>; Mon, 21 Feb 2022 04:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mrY/YH1b9s1O9jMerN3hmkMMZmwmjWK0cZUfx1sY+dQ=;
 b=EHxIl7XNaoQqifbAvm4pywi+Wi6IHmxkBODFSm+hpEkuqO2pcABRHVqZhfTEPj1C/x
 qh6elN871Df9GMwQuyaZdPJC3DxREktLEXIZvvlF0OV8gP3GwT0NsKoTwz65WJst/8T+
 Jc6I9zU5zpMgjdlDS5KnRSSt+Pqg+BmmfkewzG/0DiGhzUSgxV0HMYXTaOW8wULF3qPX
 ZlGHJKkX0klQhkX6VeZciYbt82ixAoV6ySkls8QVrWpDNVBDuSBnlgHxWIJO0XM0hqLG
 4CM/AUl9hfEj+n4UcteK6q2IVldLU4dmeJWbD1pH+2+6uaTjbF4hpUtFn66Vvd/UVwvy
 JWOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mrY/YH1b9s1O9jMerN3hmkMMZmwmjWK0cZUfx1sY+dQ=;
 b=7o7N+fqqs9YvQowptZKvnfMWVapND5RxvDqAKhoGRviyKmDSaccI2QVS2VrrbY/qfZ
 g3rXSObglsAlQQVz2Pcd6YhcZf/4Yf2mxAeChKWYg3J0Sz39Qw/BQJUVtjP6BD5lbTph
 ojgdDl65jf9KCyiIDj4x9baVu08OqPnkwjnBadbpqLxbVrmH+BcYFja0KwsKcdx2nNIl
 rKfIcyTiTs/TQmcoLEd16MQshs9t9pLI1YF7JXSFAES+I/V4slBI8Yl8MVx9R+aotMhN
 Ic0AtljUP1nn/D8iZtRHRb8lGmrE8/fHyDGCY5ULU0GGZXvA1HjR5zvbY0kKM7lpw6cj
 KkCw==
X-Gm-Message-State: AOAM532F018VFCSkDt+LBbkvYOTmhMpyXvKWsrm/seOEym4dEMy0Kyvu
 bJcDJEkOSyAO0k2uIybsGGaztA==
X-Google-Smtp-Source: ABdhPJxZOj3bAaqzQpMpwIZwq1rULq8jrXuaL/D3GX2+h/JhGdZn8tGDnxnawe+BhPseDP53wiUJlg==
X-Received: by 2002:a05:600c:1f16:b0:37b:c7f2:fbb4 with SMTP id
 bd22-20020a05600c1f1600b0037bc7f2fbb4mr20467582wmb.47.1645445321196; 
 Mon, 21 Feb 2022 04:08:41 -0800 (PST)
Received: from localhost.localdomain
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id a8sm11821546wra.0.2022.02.21.04.08.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 04:08:40 -0800 (PST)
From: Corentin Labbe <clabbe@baylibre.com>
To: herbert@gondor.apana.org.au, jernej.skrabec@gmail.com,
 linus.walleij@linaro.org, narmstrong@baylibre.com,
 ulli.kroll@googlemail.com, wens@csie.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH 1/5] crypto: sun8i-ss: call finalize with bh disabled
Date: Mon, 21 Feb 2022 12:08:29 +0000
Message-Id: <20220221120833.2618733-2-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220221120833.2618733-1-clabbe@baylibre.com>
References: <20220221120833.2618733-1-clabbe@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_040843_088970_063DC50C 
X-CRM114-Status: GOOD (  11.14  )
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

Fixes: f08fcced6d00 ("crypto: allwinner - Add sun8i-ss cryptographic offloader")
Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c | 3 +++
 drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c   | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c
index 9ef1c85c4aaa..554e400d41ca 100644
--- a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c
+++ b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c
@@ -11,6 +11,7 @@
  * You could find a link for the datasheet in Documentation/arm/sunxi.rst
  */
 
+#include <linux/bottom_half.h>
 #include <linux/crypto.h>
 #include <linux/dma-mapping.h>
 #include <linux/io.h>
@@ -274,7 +275,9 @@ static int sun8i_ss_handle_cipher_request(struct crypto_engine *engine, void *ar
 	struct skcipher_request *breq = container_of(areq, struct skcipher_request, base);
 
 	err = sun8i_ss_cipher(breq);
+	local_bh_disable();
 	crypto_finalize_skcipher_request(engine, breq, err);
+	local_bh_enable();
 
 	return 0;
 }
diff --git a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c
index d8c333fe5eb2..0c2ca296bede 100644
--- a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c
+++ b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c
@@ -9,6 +9,7 @@
  *
  * You could find the datasheet in Documentation/arm/sunxi.rst
  */
+#include <linux/bottom_half.h>
 #include <linux/dma-mapping.h>
 #include <linux/pm_runtime.h>
 #include <linux/scatterlist.h>
@@ -633,6 +634,8 @@ int sun8i_ss_hash_run(struct crypto_engine *engine, void *breq)
 
 	memcpy(areq->result, result, algt->alg.hash.halg.digestsize);
 theend:
+	local_bh_disable();
 	crypto_finalize_hash_request(engine, breq, err);
+	local_bh_enable();
 	return 0;
 }
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
